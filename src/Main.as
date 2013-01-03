package
{
	import com.greensock.*;
	import com.greensock.plugins.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import gui.Button;
	import gui.MyTextField;
	
	import utils.XMLLoader;
	import gui.Form;
	
	[SWF(width="500", height="350", frameRate="24", backgroundColor="0x005500")]
	
	public class Main extends Sprite
	{
		private var _form:Form;
		private var _saveButton:Button;
		private var _okButton:Button;
		private var _saga:Saga;
		
		private var _xmlLoader:XMLLoader;
		private var _header:String;
		private var _body:String;
		
		private var _inputName:String='';
		private var _inputNoun:String='';
		private var _inputAdjective:String='';
		private var _inputVerb:String='';
		
		private var _inputNameArr:Array;
		private var _inputNounArr:Array;
		private var _inputAdjectiveArr:Array;
		private var _inputVerbArr:Array;
		
		public function Main()
		{		
			_xmlLoader = new XMLLoader('../assets/saga.xml');
			_xmlLoader.addEventListener(XMLLoader.LOADED, onXMLLoaded_parseXML);		
			
			_form=new Form();
			addChild(_form);
			_form.y=30;
			_form.x=45;
			_form.activate();

			_saveButton=new Button('Save');
			addChild(_saveButton);
			_saveButton.x=stage.stageWidth-_saveButton.width-55;
			_saveButton.y=stage.stageHeight-65;
			_saveButton.activate();
			TweenPlugin.activate([TintPlugin]);
			
			_saveButton.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDownSaveWords);
			
			_okButton=new Button('Ok');
			addChild(_okButton);
			_okButton.x=stage.stageWidth-_okButton.width-55;
			_okButton.y=stage.stageHeight-65;
			_okButton.deactivate();
		}
       //läsa xml fil		
		private function onXMLLoaded_parseXML(e:Event):void
		{	
			var xmlList:XMLList = new XMLList( _xmlLoader.xml.saga.mysaga ); 
			for each (var mysaga:XML in xmlList) 
			{				
				_header= mysaga.header;
				_body= mysaga.body;
				
				while (_body.indexOf('\r')>=0) 
					_body = _body.replace('\r', ' ');
				
				while (_body.indexOf('\n')>=0) 
					_body = _body.replace('\n', ' ');
				
				trace(_body);
			}
		}
		//ändra mallen på orden som skrivs i form ock visa saga
		public function onButtonDownSaveWords(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xA7A700});
			
			_inputName=_form.txtfl_name;
			_inputNoun=_form.txtfl_noun;
			_inputAdjective=_form.txtfl_adjective;
			_inputVerb=_form.txtfl_verb;
			
			_inputNameArr=onParseSaveWords(_inputNameArr,_inputName);
			_inputNounArr=onParseSaveWords(_inputNounArr, _inputNoun);
			_inputAdjectiveArr=onParseSaveWords(_inputAdjectiveArr, _inputAdjective);
			_inputVerbArr=onParseSaveWords(_inputVerbArr, _inputVerb);
			
			changeBody();
			addSaga();
		}
		private function addSaga():void
		{
			_saga=new Saga(_header, _body);
			addChild(_saga);
			_saga.activate();
			
			_form.deactivate();
			_saveButton.deactivate();
			_saveButton.removeEventListener(MouseEvent.MOUSE_DOWN, onButtonDownSaveWords);
			
			_okButton.activate();
    		_okButton.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDownShowForm);
		}
       private function  onButtonDownShowForm(e:MouseEvent):void
      {
		   TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xA7A700});
		   
		   _form.activate();
		   _form.clear();
		   _saveButton.activate();
		   
		   _saga.deactivate();
		   _okButton.deactivate();
		   
		   _okButton.removeEventListener(MouseEvent.MOUSE_DOWN, onButtonDownShowForm);
		   
		   _saveButton.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDownSaveWords);
       }
		//skapar en array av ord som skrevs i en enda rad
		private function onParseSaveWords(arr:Array, str:String):Array
		{
			var str:String=str;
			var ind:int;
			var subString:String;
			var arr:Array=new Array();
			
			for (var i:int = 0; i <str.length; i++) 
			{
				ind=str.search(',');	
				if (ind==-1)
				{
					arr.push(str);
					break;
				}
				else
				{
					arr.push(str.slice(0, ind));
					str=str.substring(ind+1, str.length);
				}
			}
			//du se _____ om det är inte ord i rad
			if (str.length==0)
			{arr=['___'];}
			return arr;
		}
		//ändra mallen på orden som skrivs i form 
		private function changeBody():void
		{
			_body=replaceOnePattern('{NAME}', _inputNameArr);
			_body=replaceOnePattern('{NOUN}',  _inputNounArr);
			_body=replaceOnePattern('{ADJECTIVE}', _inputAdjectiveArr);
			_body=replaceOnePattern('{VERB}', _inputVerbArr);
			trace(_body);
		}
		
		private function replaceOnePattern(pattern:String,  arr:Array):String
		{
			//att hitta hur många gånger delsträng i strängen			
			var ind:int;
			var count:int=0;
			var newbody:String=_body;
			ind=newbody.search(pattern);	
			
			while (newbody.length>0)
			{
				newbody=newbody.substring(ind+1+pattern.length, newbody.length);
				count=count+1;
			}
			arr=arr;
            //ändra mallen			
			for (var i:int = 0; i < count; i++) 				
			{
				var myPattern:String = pattern; 
				var rand:uint=Math.random()*arr.length;
				_body =_body.replace(myPattern, arr[rand]);  					
			}
			return _body;
		}
	}
}
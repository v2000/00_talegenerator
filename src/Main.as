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
		private var _getDataFromForm:GetDataFromForm;
		
		private var _xmlLoader:XMLLoader;
		private var _header:String;
		private var _body:String;
		
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
			}
		}
		//ändra mallen på orden som skrivs i form ock visa saga
		public function onButtonDownSaveWords(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xA7A700});
			
			_getDataFromForm=new GetDataFromForm(_form.txtfl_name, _form.txtfl_noun, _form.txtfl_adjective, _form.txtfl_verb, _body);
			
			addSaga();
		}
		private function addSaga():void
		{
			_saga=new Saga(_header, _getDataFromForm.bodyFromGetData);
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
	}
}
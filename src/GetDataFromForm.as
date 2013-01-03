package
{
	import flash.display.Sprite;
	
	public class GetDataFromForm extends Sprite
	{		
		private var _inputName:String;
		private var _inputNoun:String;
		private var _inputAdjective:String;
		private var _inputVerb:String;
		private var _body:String;
		
		private var _inputNameArr:Array;
		private var _inputNounArr:Array;
		private var _inputAdjectiveArr:Array;
		private var _inputVerbArr:Array;
		
		public function GetDataFromForm(myname:String, noun:String, adjective:String, verb:String, body:String)
		{			
			_inputName=myname;
			_inputNoun=noun;
			_inputAdjective=adjective;
			_inputVerb=verb;
			_body=body;
		
			_inputNameArr=onParseSaveWords(_inputNameArr,_inputName);
			_inputNounArr=onParseSaveWords(_inputNounArr, _inputNoun);
			_inputAdjectiveArr=onParseSaveWords(_inputAdjectiveArr, _inputAdjective);
			_inputVerbArr=onParseSaveWords(_inputVerbArr, _inputVerb);
			
			changeBody();
		}
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
		public function get bodyFromGetData(): String
		{
			return _body;
		}
	}
}
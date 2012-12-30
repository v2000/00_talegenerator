package
{
	import com.greensock.*;
	import com.greensock.plugins.*;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import gui.Button;
	import gui.MyTextField;
	
	[SWF(width="500", height="350", frameRate="24", backgroundColor="0x005500")]
	
	public class Main extends Sprite
	{
		private var _form:Form;
		private var _saveButton:Button;
		
		private var _body:String='';
		
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
			_form=new Form();
			addChild(_form);
			_form.y=30;
			_form.x=45;
			_form.activate();
			
			_saveButton=new Button('Save');
			addChild(_saveButton);
			_saveButton.x=(stage.stageWidth-_saveButton.width)*0.5+50;
			_saveButton.y=280;
			_saveButton.activate();
			TweenPlugin.activate([TintPlugin]);
			
			_saveButton.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDownSaveWords);
		}

		public function onButtonDownSaveWords(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xA7A700});
			
			_inputName=_form.txtfl_name;
			_inputNoun=_form.txtfl_noun;
			_inputAdjective=_form.txtfl_adjective;
			_inputVerb=_form.txtfl_verb;
		
			trace(_inputName);
			trace(_inputNoun);
			trace(_inputAdjective);
			trace(_inputVerb);
		}
	}
}
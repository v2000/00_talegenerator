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
		public function Main()
		{
			_form=new Form();
			addChild(_form);
			_form.y=30;
			_form.x=45;
			
			_saveButton=new Button('Save');
			addChild(_saveButton);
			_saveButton.x=(stage.stageWidth-_saveButton.width)*0.5+50;
			_saveButton.y=280;
			TweenPlugin.activate([TintPlugin]);
			
			_saveButton.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDownSaveWords);
		}
		public function onButtonDownSaveWords(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xA7A700});
		}
	}
}
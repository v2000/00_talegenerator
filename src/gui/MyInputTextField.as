package gui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	//textrutan var du skriver text
	public class MyInputTextField extends Sprite
	{
		private var _txtFormat:TextFormat;
		private var _txtField:TextField;
		
		public function MyInputTextField()
		{			
			_txtFormat = new TextFormat();
			_txtFormat.color = 0x000000;
			_txtFormat.size = 16;
			_txtFormat.font = 'Verdana';
			_txtFormat.align = TextFormatAlign.LEFT;			
			
			_txtField = new TextField();			
			addChild(_txtField);
			
			_txtField.border = true;
			_txtField.borderColor = 0x000033;
			_txtField.background = true;
			_txtField.backgroundColor =0xBFCBB6;
			_txtField.width = 300;
			_txtField.height = 25;
			_txtField.type = "input";
			_txtField.multiline = false;
			_txtField.selectable = false;
			
			_txtField.defaultTextFormat = _txtFormat;
			
		}
		public function get txtField():TextField
		{
			return _txtField;
		}
	}
}
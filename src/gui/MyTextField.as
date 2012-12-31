package gui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
//textrutan
	public class MyTextField extends Sprite
	{
		private var _txtFormat:TextFormat;
		private var _txtField:TextField;
		
		public function MyTextField(size:uint, width:uint, height:uint, color:uint, myString:String)
		{
			_txtFormat = new TextFormat();
			_txtFormat.color = color;
			_txtFormat.size = size;
			_txtFormat.font = 'Verdana';
			_txtFormat.align = TextFormatAlign.LEFT;			
			
			_txtField = new TextField();			

			_txtField.border = false;
			_txtField.background = false;
			_txtField.width = width;
			_txtField.height = height;
			_txtField.multiline = true;
			_txtField.selectable = false;
			_txtField.type=TextFieldType.DYNAMIC;
				
			_txtField.defaultTextFormat = _txtFormat;
			_txtField.text=myString;
			addChild(_txtField);		
		}
	}
}
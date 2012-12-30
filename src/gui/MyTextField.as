package gui
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
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
			
			/*	 var txtFmt:TextFormat = new TextFormat();
			txtFmt.font = "Verdana";
			txtFmt.color = 0xFFFFFF;
			txtFmt.size = 20;
			
			var txtFld:TextField = new TextField();
			txtFld.x = txtFld.y = 0;
			txtFld.width = 100;
			txtFld.border = txtFld.background = false;
			txtFld.multiline = txtFld.wordWrap = false;
			txtFld.autoSize = TextFieldAutoSize.LEFT;
			txtFld.defaultTextFormat = txtFmt;
			
			txtFld.appendText(myString);
			
			addChild(txtFld);*/
			
		}
		
	}
}
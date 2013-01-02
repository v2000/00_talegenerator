package
{
	import flash.display.Sprite;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.text.TextFormatAlign;
	
	import gui.MyTextField;
	
	public class Saga extends Sprite
	{
		private var _header:MyTextField;
		private var _body:MyTextField;
		
		public function Saga(header:String, body:String)
		{
			_header=new MyTextField(TextFormatAlign.CENTER,30,300,40, 0xBDBE57, header);
			addChild(_header);
			_header.x=(500-_header.width)*0.5;
			_header.y=30;
			_header.filters = [ new DropShadowFilter(4,45,0,.5), 
				new BevelFilter(4,45,0xffffff,.3,0,.4)];
			
			_body=new MyTextField(TextFormatAlign.LEFT,16, 400,150,0xFFFFFF,body);
			addChild(_body);
			_body.x=50;
			_body.y=100;
		}
		public function activate(): void
		{
			this.visible = true;
		}
		
		public function deactivate(): void
		{
			this.visible = false;
		}
	}
}
package gui
{
	import com.greensock.*;
	import com.greensock.plugins.*;
	
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.text.*;
	import flash.display.GradientType;
	import flash.geom.Matrix;
	import flash.events.MouseEvent;

	//skapa en knappen
	public class Button extends Sprite
	{
		private var _col:uint;
		private var _txtCol:uint;
		private var _txt:String;
		
		public var rect:Sprite;
		public var rectGradient:Sprite;
		public var border:Sprite;
		
		public function Button(txt:String)
		{			
			_txt = txt;

			//skapa en knappen
			createRoundRect();
			
			//skapa en text på knappen
			var labl:TextField = createLabel();
			addChild(labl);
			labl.mouseEnabled = false;		
			
			addEventListener(MouseEvent.MOUSE_UP, onButtonUp);
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver_changeColor);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut_changeColor);
		}
		private function createRoundRect():void 
		{ 
            //skapa en rektangel med rundade hörn och övertoningsfyllning			
			rect=new Sprite();
			addChild(rect);
			rect.graphics.lineStyle(1, 0xFFFFFF);
			rect.graphics.beginFill(0xBFCBB6,1);
			rect.graphics.drawRoundRect(0, 0, 100, 30, 15);
			rect. graphics.endFill();
			
			var gradType:String = GradientType.LINEAR;
			var matr:Matrix = new Matrix();
			matr.createGradientBox(100, 30,Math.PI/2, 0, 30/8);
			var colors:Array = [0xFFFFFF, 0xFFFFFF,0xFFFFFF];
			var alphas:Array = [0.6, 0, 0.6];
			var ratios:Array = [0, 125,255];
			rectGradient=new Sprite();
			addChild(rectGradient);
			rectGradient.graphics.beginGradientFill(gradType, colors, alphas, ratios,matr);
			rectGradient.graphics.drawRoundRect(0, 0, 100, 30, 15);
			rectGradient. graphics.endFill();

            //skapa en rektangel med rundade hörn och ingen fylla
			border=new Sprite();
			addChild(border);
			border.graphics.lineStyle(1, 0x999900);
			border.graphics.drawRoundRect(0, 0, 100, 30, 15);
		}
		private function createLabel():TextField {
			var txt:TextField = new TextField();
			txt.width = 100;
			txt.height = 30;
			txt.y=5;
			
			var format:TextFormat = new TextFormat();
			format.font = "Verdana";
			format.color = 0x003300;
			format.size = 16;
			format.bold = true;
			format.align = TextFormatAlign.CENTER;
			
			txt.defaultTextFormat = format;
			txt.text = _txt;
			txt.selectable = false;
			
			return txt;
		}
		//ändra färg på en knapp när musen förflyttas
		public function onMouseOut_changeColor(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xBDBE57});
			TweenLite.to(e.currentTarget.border, 0.3, {tint:0x999900});
		}		
		public function onMouseOver_changeColor(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xCBCD00});
			TweenLite.to(e.currentTarget.border, 0.3, {tint:0xFFFFFF});
		}
		public function onButtonUp(e:MouseEvent):void
		{
			TweenLite.to(e.currentTarget.rect, 0.3, {tint:0xBDBE57});
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
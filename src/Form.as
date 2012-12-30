package
{
	import flash.display.Sprite;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.events.Event;
	
	import gui.MyInputTextField;
	import gui.MyTextField;
	
	public class Form extends Sprite
	{
		private var _header:MyTextField;
		
		private var _txtfl_name:MyInputTextField;
		private var _txtfl_noun:MyInputTextField;
		private var _txtfl_adjective:MyInputTextField;
		private var _txtfl_verb:MyInputTextField;
		
		private var _name:MyTextField;
		private var _noun:MyTextField;
		private var _adjective:MyTextField;
		private var _verb:MyTextField;
		
		private var _instruction:MyTextField;
		
		public function Form()
		{
			if(stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);	
		}
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_header=new MyTextField(30,250,40, 0xBDBE57,  'Skriv din saga');
			addChild(_header);
			_header.x=140;
			_header.y=0;
			_header.filters = [ new DropShadowFilter(4,45,0,.5), 
				new BevelFilter(4,45,0xffffff,.3,0,.4)];
			
			_txtfl_name=new MyInputTextField();
			addChild(_txtfl_name);
			_txtfl_name.x=100;
			_txtfl_name.y=_header.y+60;
			_txtfl_name.txtField.stage.focus = _txtfl_name.txtField;
			
			_txtfl_noun=new MyInputTextField();
			addChild(_txtfl_noun);
			_txtfl_noun.x=_txtfl_name.x;
			_txtfl_noun.y=_txtfl_name.y + 35;
			
			_txtfl_adjective=new MyInputTextField();
			addChild(_txtfl_adjective);
			_txtfl_adjective.x=_txtfl_name.x;
			_txtfl_adjective.y=_txtfl_noun.y + 35;
			
			_txtfl_verb=new MyInputTextField();
			addChild(_txtfl_verb);
			_txtfl_verb.x=_txtfl_name.x;
			_txtfl_verb.y=_txtfl_adjective.y + 35;
			
			
			_name=new MyTextField(16,100, 25, 0xFFFFFF,  'Name');
			addChild(_name);
			_name.y=_header.y+60;
			
			_noun=new MyTextField(16,100, 25, 0xFFFFFF, 'Noun');
			addChild(_noun);
			_noun.y=_txtfl_name.y + 35;
			
			_adjective=new MyTextField(16,100, 25, 0xFFFFFF, 'Adjective');
			addChild(_adjective);
			_adjective.y=_txtfl_noun.y + 35;
			
			_verb=new MyTextField(16,100, 25, 0xFFFFFF, 'Verb');
			addChild(_verb);
			_verb.y=_txtfl_adjective.y + 35;
			
			_instruction=new MyTextField(12,300,25, 0xBDBE57, 'Ange ord, de separerades med kommatecken');
			addChild(_instruction);
			_instruction.x=100;
			_instruction.y=_verb.y+35;
		}
		
		public function set txtfl_name( name:String ): void
		{
			_txtfl_name.txtField.text = name;
		}
		
		public function get txtfl_name(): String
		{
			return _txtfl_name.txtField.text;
		}	
		public function set txtfl_noun( noun:String ): void
		{
			_txtfl_noun.txtField.text = noun;
		}
		
		public function get txtfl_noun(): String
		{
			return _txtfl_noun.txtField.text;
		}
		
		public function set txtfl_adjective( adjective:String ): void
		{
			_txtfl_adjective.txtField.text = adjective;
		}
		
		public function get txtfl_adjective(): String
		{
			return _txtfl_adjective.txtField.text;
		}	
		
		public function set txtfl_verb( verb:String ): void
		{
			_txtfl_verb.txtField.text = verb;
		}
		
		public function get txtfl_verb(): String
		{
			return _txtfl_verb.txtField.text;
		}
		
		public function clear(): void
		{
			_txtfl_name.txtField.text = '';
			_txtfl_noun.txtField.text = '';
			_txtfl_adjective.txtField.text = '';
			_txtfl_verb.txtField.text = '';
		}
	}
}
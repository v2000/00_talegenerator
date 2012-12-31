package utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLLoader extends EventDispatcher
	{
		public static const LOADED	:String = 'loaded';
		
		private var _xml :XML;
		
		public function XMLLoader(xmlUrl:String )
		{
			var urlLoader:URLLoader=new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			urlLoader.load(new URLRequest(xmlUrl));
		}
		private function onComplete(e:Event):void
		{
			e.target.removeEventListener(Event.COMPLETE, onComplete);
			e.target.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			_xml = XML( e.target.data );	
			
			dispatchEvent( new Event(LOADED));		
		}
		private function  onIOError(e:IOErrorEvent):void
		{
			e.target.removeEventListener(Event.COMPLETE, onComplete);
			e.target.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			trace('IO Error:', e.text);
		}
		public function get xml():XML
		{
			return _xml;
		}
	}
}
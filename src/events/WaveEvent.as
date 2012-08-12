package events {
	
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class WaveEvent extends Event {
		
		public static const COMPLETE:String = "complete";
		private var _name:String;
		
		public function WaveEvent(type:String, name:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
			_name = name;
		} 
		
		public override function clone():Event { 
			return new WaveEvent(type, name, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("WaveEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get name():String {
			return _name;
		}
	}	
}
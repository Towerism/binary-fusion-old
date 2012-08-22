package enemies.waves {

	import events.WaveEvent;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import net.flashpunk.*;
	import worlds.GameWorld;
	
	import enemies.formations.*;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Wave extends Entity {

		private var _spawned:Vector.<Boolean> = new Vector.<Boolean>;
		private var _forms:Vector.<Formation> = new Vector.<Formation>;
		private var _times:Vector.<Number> = new Vector.<Number>;
		private var _pos:Vector.<Point> = new Vector.<Point>;
		private var _start:Boolean = false;
		
		private var _name:String = "";
		private var _timer:Number = 0;
		private var _dispatch:EventDispatcher = new EventDispatcher();
		
		public function Wave() {
		}
		
		public function setName(name:String):void {
			_name = name;
		}
		
		public function add(form:Formation, point:Point, time:Number):void {
			_forms.push(form);
			_pos.push(point);
			_times.push(time);
			_spawned.push(false);
		}
		
		public function start():void {
			FP.world.add(this);
			_start = true;
			_timer = 0;
			for (var i:int; i < _spawned.length; i++) {
				_spawned[i] = false;
			}
			trace("wave started");
		}
		
		private function spawn(f:Formation):void {
		}
		
		override public function update():void {
			if (_start) {
				_timer += FP.elapsed;
				var len:int = _forms.length - 1;
				for (var i:int; i < _forms.length; i++) {
					if (_timer >= _times[i] && !_spawned[i]) {
						_forms[i].spawn(_pos[i].x, _pos[i].y);
						_spawned[i] = true;
					}
				}			
				if (FP.world.typeCount(GC.TYPE_ENEMY) == 0 && _timer > 1) complete();
			}
		}
		
		internal function complete():void {
			trace("wave completed");
			_start = false;
			_dispatch.dispatchEvent(new WaveEvent(WaveEvent.COMPLETE, _name));
		}
		
		public function get dispatch():EventDispatcher {
			return _dispatch;
		}
	}
}
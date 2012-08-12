package enemies.waves {
	
	import enemies.formations.Formations;
	import events.WaveEvent;
	import flash.events.*;
	import net.flashpunk.*;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class WaveController extends Entity {
		
		private var _nextWave:Boolean = true;
		private var _active:Boolean = false;
		private var _interval:Number = 5;
		private var _timer:Number = 1;
		private var _waves:Vector.<Wave> = new Vector.<Wave>;
		
		public function WaveController() {
			add(GV.WAVES.WAVE_3Bas_2Bm);
		}
		
		private function add(w:Wave):void {
			_waves.push(w);
			_waves[_waves.length - 1].dispatch.addEventListener(WaveEvent.COMPLETE, onComplete);
		}
		
		public function nextWave():void {
			_waves[0].start();
			_nextWave = false;
			_active = true;
			_timer = 0;
		}
		
		override public function added():void {
			trace(GV.FORMATIONS);
			world.add(GV.FORMATIONS);
			world.add(GV.WAVES);
		}
		
		override public function update():void {
			if (_nextWave && !_active) {
				_timer -= FP.elapsed;
				if (_timer <= 0) {
					nextWave();
				}
			}
		}
		
		private function onComplete(e:WaveEvent):void {
			_timer = _interval;
			_active = false;
			_nextWave = true;
		}
	}
}
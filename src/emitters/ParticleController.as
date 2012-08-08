package emitters {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;

	/**
	 * { Description of Explosion.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class ParticleController extends Entity {

		private var _explosionEmitter:Emitter;
		public var _amount:Array = new Array;

		//parameters are variables that allow you to scale the entire particle system
		public function ParticleController(multiplyDistance:int = 2, addRangeDistance:int = 1, divideDuration:int = 25, divideRangeDuration:int = 100) {
			_explosionEmitter = new Emitter(new BitmapData(2, 2), 2, 2);
			_explosionEmitter.scrollX = 0;
			_explosionEmitter.scrollY = 0;
			
			//player explosions
			
			_amount[GC.EXP_LARGE_W] = 50;
			_amount[GC.EXP_LARGE_B] = _amount[GC.EXP_LARGE_W];
			_explosionEmitter.newType(GC.EXP_LARGE_W, [0]);
			_explosionEmitter.setAlpha(GC.EXP_LARGE_W, 1, 0, Ease.quadIn);
			_explosionEmitter.setColor(GC.EXP_LARGE_W, 0xffffff, 0xffffff);
			_explosionEmitter.setMotion(GC.EXP_LARGE_W, 0, _amount[GC.EXP_LARGE_W] * multiplyDistance, _amount[GC.EXP_LARGE_W] / divideDuration, 360, -_amount[GC.EXP_LARGE_W] * multiplyDistance + addRangeDistance, _amount[GC.EXP_LARGE_W] / divideRangeDuration, Ease.quadOut);
			
			_explosionEmitter.newType(GC.EXP_LARGE_B, [0]);
			_explosionEmitter.setAlpha(GC.EXP_LARGE_B, 1, 0, Ease.quadIn);
			_explosionEmitter.setColor(GC.EXP_LARGE_B, 0x0, 0x0);
			_explosionEmitter.setMotion(GC.EXP_LARGE_B, 0, _amount[GC.EXP_LARGE_B] * multiplyDistance, _amount[GC.EXP_LARGE_B] / divideDuration, 360, -_amount[GC.EXP_LARGE_B] * multiplyDistance + addRangeDistance, _amount[GC.EXP_LARGE_B] / divideRangeDuration, Ease.quadOut);
			
			//enemy explosions
			_amount[GC.EXP_SMALL_W] = 20;
			_amount[GC.EXP_SMALL_B] = _amount[GC.EXP_SMALL_W];
			_explosionEmitter.newType(GC.EXP_SMALL_W, [0]);
			_explosionEmitter.setAlpha(GC.EXP_SMALL_W, 1, 0, Ease.quadIn);
			_explosionEmitter.setColor(GC.EXP_SMALL_W, 0xffffff, 0xffffff);
			_explosionEmitter.setMotion(GC.EXP_SMALL_W, 0, _amount[GC.EXP_SMALL_W] * multiplyDistance, _amount[GC.EXP_SMALL_W] / divideDuration, 360, -_amount[GC.EXP_SMALL_W] * multiplyDistance + addRangeDistance, _amount[GC.EXP_SMALL_W] / divideRangeDuration, Ease.quadOut);
			
			_explosionEmitter.newType(GC.EXP_SMALL_B, [0]);
			_explosionEmitter.setAlpha(GC.EXP_SMALL_B, 1, 0, Ease.quadIn);
			_explosionEmitter.setColor(GC.EXP_SMALL_B, 0x0, 0x0);
			_explosionEmitter.setMotion(GC.EXP_SMALL_B, 0, _amount[GC.EXP_SMALL_B] * multiplyDistance, _amount[GC.EXP_SMALL_B] / divideDuration, 360, -_amount[GC.EXP_SMALL_B] * multiplyDistance + addRangeDistance, _amount[GC.EXP_SMALL_B] / divideRangeDuration, Ease.quadOut);
			
			_explosionEmitter.relative = false;
			graphic = _explosionEmitter;
		}
		
		public function explode(_type:String, posx:Number, posy:Number, amount:int):void {
			for (var i:int; i < amount; i++) {
				_explosionEmitter.emit(_type, posx, posy);
			}
		}
		
		public function explodeStandard(posx:Number, posy:Number, type:String):void {
			this.explode(type, posx, posy, _amount[type]);
		}

		public function destroy():void {
			this.world.remove(this);
		}
		
		public function get particleCount():uint {
			return _explosionEmitter.particleCount;
		}
	}
}

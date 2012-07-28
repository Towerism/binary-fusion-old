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

		private var particleEmitter:Emitter;
		public var amount:Array = new Array;

		public function ParticleController(_addRangeDistance:int = 1, _divideDuration:int = 25, _divideRangeDuration:int = 100) {
			particleEmitter = new Emitter(new BitmapData(1, 1), 1, 1);
			
			//scaleable variables
			var addRangeDistance:int = _addRangeDistance;
			var divideDuration:int = _divideDuration;
			var divideRangeDuration:int = _divideRangeDuration;
			
			//player explosions
			
			particleEmitter.newType("test", [0]);
			particleEmitter.setAlpha("test", 1, 0, Ease.quadIn);
			particleEmitter.setColor("test", 0xffffff, 0xffffff);
			particleEmitter.setMotion("test", 0, 50, 2, 360, -50 + 1, 0.5 , Ease.quadOut);
			
			amount[GC.EXP_PLAYER_W] = 50;
			amount[GC.EXP_PLAYER_B] = amount[GC.EXP_PLAYER_W];
			particleEmitter.newType(GC.EXP_PLAYER_W, [0]);
			particleEmitter.setAlpha(GC.EXP_PLAYER_W, 1, 0, Ease.quadIn);
			particleEmitter.setColor(GC.EXP_PLAYER_W, 0xffffff, 0xffffff);
			particleEmitter.setMotion(GC.EXP_PLAYER_W, 0, amount[GC.EXP_PLAYER_W], amount[GC.EXP_PLAYER_W] / divideDuration, 360, -amount[GC.EXP_PLAYER_W] + addRangeDistance, amount[GC.EXP_PLAYER_W] / divideRangeDuration, Ease.quadOut);
			
			particleEmitter.newType(GC.EXP_PLAYER_B, [0]);
			particleEmitter.setAlpha(GC.EXP_PLAYER_B, 1, 0, Ease.quadIn);
			particleEmitter.setColor(GC.EXP_PLAYER_B, 0x0, 0x0);
			particleEmitter.setMotion(GC.EXP_PLAYER_B, 0, amount[GC.EXP_PLAYER_W], amount[GC.EXP_PLAYER_W] / divideDuration, 360, -amount[GC.EXP_PLAYER_W] + addRangeDistance, amount[GC.EXP_PLAYER_W] / divideRangeDuration, Ease.quadOut);
			
			//enemy explosions
			amount[GC.EXP_ENEMY_W] = 20;
			amount[GC.EXP_ENEMY_B] = amount[GC.EXP_ENEMY_W];
			particleEmitter.newType(GC.EXP_ENEMY_W, [0]);
			particleEmitter.setAlpha(GC.EXP_ENEMY_W, 1, 0, Ease.quadIn);
			particleEmitter.setColor(GC.EXP_ENEMY_W, 0xffffff, 0xffffff);
			particleEmitter.setMotion(GC.EXP_ENEMY_W, 0, amount[GC.EXP_ENEMY_W], amount[GC.EXP_ENEMY_W] / divideDuration, 360, -amount[GC.EXP_ENEMY_W] + addRangeDistance, amount[GC.EXP_ENEMY_W] / divideRangeDuration, Ease.quadOut);
			
			particleEmitter.newType(GC.EXP_ENEMY_B, [0]);
			particleEmitter.setAlpha(GC.EXP_ENEMY_B, 1, 0, Ease.quadIn);
			particleEmitter.setColor(GC.EXP_ENEMY_B, 0x0, 0x0);
			particleEmitter.setMotion(GC.EXP_ENEMY_B, 0, amount[GC.EXP_ENEMY_W], amount[GC.EXP_ENEMY_W] / divideDuration, 360, -amount[GC.EXP_ENEMY_W] + addRangeDistance, amount[GC.EXP_ENEMY_W] / divideRangeDuration, Ease.quadOut);
			
			particleEmitter.relative = false;
			graphic = particleEmitter;
		}
		
		public function explode(_type:String, _x:Number, _y:Number, _amount:int):void {
			for (var i:int; i < _amount; i++) {
				particleEmitter.emit(_type, _x, _y);
				trace(i);
			}
		}
		
		public function explodeStandard(_x:Number, _y:Number, _type:String):void {
			this.explode(_type, _x, _y, amount[_type]);
		}

		public function destroy():void {
			this.world.remove(this);
		}
	}
}

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

		private var _particleEmitter:Emitter;
		public var _amount:Array = new Array;

		public function ParticleController(_addRangeDistance:int = 1, _divideDuration:int = 25, _divideRangeDuration:int = 100) {
			_particleEmitter = new Emitter(new BitmapData(1, 1), 1, 1);
			_particleEmitter.scrollX = 0;
			_particleEmitter.scrollY = 0;
			
			//scaleable variables
			var addRangeDistance:int = _addRangeDistance;
			var divideDuration:int = _divideDuration;
			var divideRangeDuration:int = _divideRangeDuration;
			
			//player explosions
			_particleEmitter.newType("test", [0]);
			_particleEmitter.setAlpha("test", 1, 0, Ease.quadIn);
			_particleEmitter.setColor("test", 0xffffff, 0xffffff);
			_particleEmitter.setMotion("test", 0, 50, 2, 360, -50 + 1, 0.5 , Ease.quadOut);
			
			_amount[GC.EXP_PLAYER_W] = 50;
			_amount[GC.EXP_PLAYER_B] = _amount[GC.EXP_PLAYER_W];
			_particleEmitter.newType(GC.EXP_PLAYER_W, [0]);
			_particleEmitter.setAlpha(GC.EXP_PLAYER_W, 1, 0, Ease.quadIn);
			_particleEmitter.setColor(GC.EXP_PLAYER_W, 0xffffff, 0xffffff);
			_particleEmitter.setMotion(GC.EXP_PLAYER_W, 0, _amount[GC.EXP_PLAYER_W], _amount[GC.EXP_PLAYER_W] / divideDuration, 360, -_amount[GC.EXP_PLAYER_W] + addRangeDistance, _amount[GC.EXP_PLAYER_W] / divideRangeDuration, Ease.quadOut);
			
			_particleEmitter.newType(GC.EXP_PLAYER_B, [0]);
			_particleEmitter.setAlpha(GC.EXP_PLAYER_B, 1, 0, Ease.quadIn);
			_particleEmitter.setColor(GC.EXP_PLAYER_B, 0x0, 0x0);
			_particleEmitter.setMotion(GC.EXP_PLAYER_B, 0, _amount[GC.EXP_PLAYER_W], _amount[GC.EXP_PLAYER_W] / divideDuration, 360, -_amount[GC.EXP_PLAYER_W] + addRangeDistance, _amount[GC.EXP_PLAYER_W] / divideRangeDuration, Ease.quadOut);
			
			//enemy explosions
			_amount[GC.EXP_ENEMY_W] = 20;
			_amount[GC.EXP_ENEMY_B] = _amount[GC.EXP_ENEMY_W];
			_particleEmitter.newType(GC.EXP_ENEMY_W, [0]);
			_particleEmitter.setAlpha(GC.EXP_ENEMY_W, 1, 0, Ease.quadIn);
			_particleEmitter.setColor(GC.EXP_ENEMY_W, 0xffffff, 0xffffff);
			_particleEmitter.setMotion(GC.EXP_ENEMY_W, 0, _amount[GC.EXP_ENEMY_W], _amount[GC.EXP_ENEMY_W] / divideDuration, 360, -_amount[GC.EXP_ENEMY_W] + addRangeDistance, _amount[GC.EXP_ENEMY_W] / divideRangeDuration, Ease.quadOut);
			
			_particleEmitter.newType(GC.EXP_ENEMY_B, [0]);
			_particleEmitter.setAlpha(GC.EXP_ENEMY_B, 1, 0, Ease.quadIn);
			_particleEmitter.setColor(GC.EXP_ENEMY_B, 0x0, 0x0);
			_particleEmitter.setMotion(GC.EXP_ENEMY_B, 0, _amount[GC.EXP_ENEMY_W], _amount[GC.EXP_ENEMY_W] / divideDuration, 360, -_amount[GC.EXP_ENEMY_W] + addRangeDistance, _amount[GC.EXP_ENEMY_W] / divideRangeDuration, Ease.quadOut);
			
			_particleEmitter.relative = false;
			graphic = _particleEmitter;
		}
		
		public function explode(_type:String, posx:Number, posy:Number, amount:int):void {
			for (var i:int; i < amount; i++) {
				_particleEmitter.emit(_type, posx, posy);
			}
		}
		
		public function explodeStandard(posx:Number, posy:Number, type:String):void {
			this.explode(type, posx, posy, _amount[type]);
		}

		public function destroy():void {
			this.world.remove(this);
		}
		
		public function get particleCount():uint {
			return _particleEmitter.particleCount;
		}
	}
}

package enemies.types {
	
	import bullets.Bullet;
	import bullets.enemy.BulletBomb;
	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	
	import enemies.Enemy;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class EnemyBomb extends Enemy {
		
		private var _gfx:Image = new Image(Assets.GFX_ENEMY_BASIC);
		private var _rotationSpeed:Number = 270;
		
		private var _detonateWait:Number = 1;
		private var _detonateTimer:Number = 0;
		private var _detonate:Boolean = false;
		
		public function EnemyBomb(x:Number = 0, y:Number = 0, endY:Number = 300) {
			super(_gfx, Enemy.SMALL);
			
			speed = 0;
			value = GC.ENEMY_BOMB_VALUE;
			Tween.to(this, 3 , { y:endY }, onPosition, Ease.quadOut);
		}
		
		override public function update():void {
			super.update();
			_gfx.angle-= _rotationSpeed * FP.elapsed;
			
			if (_detonate) {
				_detonateTimer += FP.elapsed;
				if (_detonateTimer >= _detonateWait) {
					destroy(Enemy.DETONATE)
				}
			}
		}
		
		private function onPosition():void {
			_detonate = true;
		}
		
		override protected function onDetonate():void {
			var color:uint = (myColor == Enemy.WHITE) ? 0xffffff : 0x0;
			for (var i:int; i < 360; i += 20) {
				world.add(new BulletBomb(color, x, y, i));
			}
		}
	}
}
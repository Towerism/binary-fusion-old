package enemies.types {

	import bullets.enemy.BulletEnemy;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	import bullets.*;
	import enemies.Enemy;

	/**
	 * { Description of Enemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class EnemyBasic extends Enemy {

		private var _gfx:Image = new Image(Assets.GFX_ENEMY_BASIC);
		private var _rotationSpeed:Number = 180;

		public function EnemyBasic(x:Number = 0, y:Number = 0) {
			super(_gfx, Enemy.SMALL);
			value = GC.ENEMY_BASIC_VALUE;
			speed = GC.ENEMY_BASIC_SPEED;
		}

		override public function update():void {
			super.update();
			if (Math.random() < GC.ENEMY_BASIC_SHOOT_CHANCE) {
				var angle:Number = FP.angle(x, y, GV.PLAYER.x, GV.PLAYER.y);
				world.add(new BulletEnemy(x, y, angle));
				trace(angle);
			}
			_gfx.angle += _rotationSpeed * FP.elapsed;
		}
	}
}

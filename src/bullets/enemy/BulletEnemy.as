package bullets.enemy {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	
	import bullets.Bullet;

	/**
	 * { Description of Bullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BulletEnemy extends Bullet {
		
		private var _gfx:Image = new Image(new BitmapData(6, 6, false, 0xffffff));

		public function BulletEnemy(x:Number = 0, y:Number = 0, dir:Number = 270) {
			graphic = _gfx;
			super(x, y, dir);
			
			type = GC.TYPE_ENEMY_BULLET;
			speed = GC.ENEMY_BULLET_SPEED;
		}
	}
}

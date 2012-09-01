package bullets.player {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	
	import bullets.Bullet;

	/**
	 * { Description of Bullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BulletPlayer extends Bullet {
		
		private var _gfx:Image = new Image(new BitmapData(4, 7, false, 0xffffff));

		public function BulletPlayer(x:Number = 0, y:Number = 0, dir:Number = 90) {
			graphic = _gfx;
			super(x, y, dir);
			
			speed = GC.PLAYER_BULLET_SPEED;
		}
	}
}

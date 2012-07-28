package bullets {

	import net.flashpunk.graphics.Image;

	/**
	 * { Description of BlackBullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BlackBullet extends Bullet {
		public function BlackBullet(x:Number = 0, y:Number = 0) {
			super(x, y);
			this.type = GC.TYPE_BLACK_BULLET;
			Image(graphic).color = 0;
		}
	}
}

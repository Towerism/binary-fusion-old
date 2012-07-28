package bullets {

	/**
	 * { Description of WhiteBullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class WhiteBullet extends Bullet {
		public function WhiteBullet(x:Number = 0, y:Number = 0) {
			super(x, y);
			this.type = GC.TYPE_WHITE_BULLET;
		}
	}
}

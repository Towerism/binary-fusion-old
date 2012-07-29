package enemies {

	import net.flashpunk.graphics.Image;

	import bullets.*;

	/**
	 * { Description of BlackEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BlackEnemy extends Enemy {
		public function BlackEnemy() {
			super();
			myColor = Enemy.BLACK;
		}

		override protected function hit(b:Bullet):void {
			if (b.type == GC.TYPE_WHITE_BULLET) {
				destroy(Enemy.DEATH);
			}
			super.hit(b);
		}
	}
}

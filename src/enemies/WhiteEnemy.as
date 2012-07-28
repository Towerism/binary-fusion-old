package enemies {

	import bullets.*;

	/**
	 * { Description of WhiteEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class WhiteEnemy extends Enemy {
		public function WhiteEnemy() {
			super();
			myColor = Enemy.WHITE;
		}

		override protected function hit(b:Bullet):void {
			if (b.type == GC.TYPE_BLACK_BULLET) {
				doScore();
				destroy(Enemy.DEATH);
			}
			super.hit(b);
		}
	}
}

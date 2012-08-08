package enemies.types {

	import bullets.*;
	import enemies.Enemy;

	/**
	 * { Description of WhiteEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class WhiteBasic extends EnemyBasic {
		public function WhiteBasic() {
			super();
			myColor = Enemy.WHITE;
		}

		override protected function hit(b:Bullet):void {
			if (b.type == GC.TYPE_BLACK_BULLET) {
				destroy(Enemy.DEATH);
			}
			super.hit(b);
		}
	}
}

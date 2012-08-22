package enemies.types.color {

	import bullets.*;
	import enemies.Enemy;
	import enemies.types.EnemyBasic;

	/**
	 * { Description of WhiteEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BasicWhite extends EnemyBasic {
		public function BasicWhite() {
			super();
			myColor = Enemy.WHITE;
		}

		override protected function hit(b:Bullet):void {
			if (b.type == GC.TYPE_BLACK_BULLET_P) {
				destroy(Enemy.DEATH);
				GV.color_killed(myColor);
			}
			super.hit(b);
		}
	}
}

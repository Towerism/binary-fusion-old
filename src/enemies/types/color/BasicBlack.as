package enemies.types.color {

	import net.flashpunk.graphics.Image;

	import bullets.*;
	import enemies.Enemy;
	import enemies.types.EnemyBasic;

	/**
	 * { Description of BlackEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BasicBlack extends EnemyBasic {
		public function BasicBlack() {
			super();
			myColor = Enemy.BLACK;
		}

		override protected function hit(b:Bullet):void {
			if (b.type == GC.TYPE_WHITE_BULLET_P) {
				destroy(Enemy.DEATH);
			}
			super.hit(b);
		}
	}
}

package enemies.types.color {

	import net.flashpunk.graphics.Image;

	import bullets.*;
	import enemies.Enemy;
	import enemies.types.EnemyBomb;

	/**
	 * { Description of BlackEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BombBlack extends EnemyBomb {
		public function BombBlack() {
			super();
			myColor = Enemy.BLACK;
			trace(this);
		}

		override protected function hit(b:Bullet):void {
			if (b.type == GC.TYPE_WHITE_BULLET_P) {
				destroy(Enemy.DEATH);
			}
			super.hit(b);
		}
	}
}

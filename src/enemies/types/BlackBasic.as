package enemies.types {

	import net.flashpunk.graphics.Image;

	import bullets.*;
	import enemies.Enemy;

	/**
	 * { Description of BlackEnemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class BlackBasic extends EnemyBasic {
		public function BlackBasic() {
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

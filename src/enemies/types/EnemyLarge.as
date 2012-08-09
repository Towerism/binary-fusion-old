package enemies.types {

	import net.flashpunk.*;
	import net.flashpunk.graphics.Anim;
	import net.flashpunk.graphics.Spritemap;

	import bullets.*;
	import enemies.Enemy;

	/**
	 * { Description of Enemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class EnemyLarge extends Enemy {
		
		private var _gfx:Spritemap = new Spritemap(Assets.GFX_ENEMY_LARGE, 30, 20);
		private var _dual:Anim = new Anim("dual", [0], 1, true);
		private var _notdual:Anim = new Anim("notdual", [1], 1, true);
		private var _isDual:Boolean = true;
		private var _bulletKillType:String = "";

		public function EnemyLarge(x:Number = 0, y:Number = 0) {			
			super(_gfx, Enemy.LARGE);
			_gfx.add("dual", [0], 1, true);
			_gfx.add("notdual", [1], 1, true);
			_gfx.play("dual");
			myColor = Enemy.WHITE;
			
			value = GC.ENEMY_LARGE_VALUE;
			speed = GC.ENEMY_LARGE_SPEED;
		}
		
		override protected function hit(b:Bullet):void {
			super.hit(b);
			if (_isDual) {
				if (b.type == GC.TYPE_WHITE_BULLET_P) {
					explode(GC.EXP_SMALL_B);
					myColor = Enemy.WHITE;
					_bulletKillType = GC.TYPE_BLACK_BULLET_P;
				} else {
					explode(GC.EXP_SMALL_W);
					myColor = Enemy.BLACK;
					_bulletKillType = GC.TYPE_WHITE_BULLET_P;
				}
				_gfx.play("notdual");
				_isDual = false;
			} else {
				if (b.type == _bulletKillType) {
					this.destroy(Enemy.DEATH);
				}
			}
		}
	}
}

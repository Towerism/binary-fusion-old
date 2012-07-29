package enemies {

	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	import bullets.*;

	/**
	 * { Description of Enemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Enemy extends Entity {

		protected static const WHITE:String = "white";
		protected static const NONE:String = "white"; //creating a default value
		protected static const BLACK:String = "black";

		protected static const OUT_OF_BOUNDS:String = "outofbounds";
		protected static const DEATH:String = "death";
		
		private var _explosionType:String;
		private var _gfx:Image = new Image(Assets.GFX_ENEMY);

		public function Enemy(x:Number = 0, y:Number = 0) {
			super(x, y);
			_gfx.centerOO();
			this.graphic = _gfx;
			
			_gfx.scrollX = 0;
			_gfx.scrollY = 0;
			
			this.setHitbox(10, 8, _gfx.width / 2, _gfx.height / 2 - 1);
			this.type = GC.TYPE_ENEMY;
			layer = GC.LAYER_ENEMY;

			myColor = NONE; //use default value
		}

		override public function update():void {
			y += FP.elapsed * GC.ENEMY_SPEED;
			if (y > FP.screen.height + 5)
				destroy(OUT_OF_BOUNDS);
			var b:Bullet = this.collideTypes([GC.TYPE_WHITE_BULLET, GC.TYPE_BLACK_BULLET], x, y) as Bullet;
			if (b != null) {
				hit(b);
			}
		}

		protected function hit(b:Bullet):void {
			//Stub for children
			b.world.remove(b);
		}

		public function destroy(reason:String):void {
			if (reason == DEATH) {
				GV.SCORE += GC.ENEMY_VALUE;
				GV.CURRENT_GUI.updateScore();
				GV.PARTICLE_CONTROLLER.explodeStandard(x, y, _explosionType);
			}
			this.world.recycle(this);
		}

		protected function set myColor(s:String):void {
			Image(graphic).color = (s == WHITE) ? 0xffffff : 0x0;
			this._explosionType = (s == WHITE) ? GC.EXP_ENEMY_W : GC.EXP_ENEMY_B;
		}
	}
}

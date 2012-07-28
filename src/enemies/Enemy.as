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
		
		private var explosionType:String;
		private var gfx:Image = new Image(Assets.GFX_ENEMY);

		public function Enemy() {
			super(FP.clamp(FP.rand(FP.screen.width - GC.GFX_ENEMY_W), GC.GFX_ENEMY_W, FP.screen.width - 2 * GC.GFX_ENEMY_W), -10);
			this.graphic = gfx;
			gfx.centerOO();
			this.setHitbox(10, 8, gfx.width / 2, gfx.height / 2 - 1);
			this.type = GC.TYPE_ENEMY;

			myColor = NONE; //use default value
		}

		override public function update():void {
			y += FP.elapsed * GC.ENEMY_SPEED;
			if (y > FP.screen.height)
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

		protected function doScore():void {
			GV.SCORE += GC.ENEMY_VALUE;
		}

		public function destroy(reason:String):void {
			if (reason == DEATH)
				GV.PARTICLE_CONTROLLER.explodeStandard(x, y, explosionType);
			this.world.remove(this);
		}

		protected function set myColor(s:String):void {
			Image(graphic).color = (s == WHITE) ? 0xffffff : 0x0;
			this.explosionType = (s == WHITE) ? GC.EXP_ENEMY_W : GC.EXP_ENEMY_B;
		}
	}
}

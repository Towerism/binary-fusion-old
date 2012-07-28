package enemies {

	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	import bullets.*;
	import emitters.Explosion;

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

		private var _myColor:String;
		private var explosionColor:uint;
		private const EXPLOSION_SIZE:int = 20;
		private const EXPLOSION_MAXDIST:int = 20;

		public function Enemy() {
			super(FP.clamp(FP.rand(FP.screen.width - GC.GFX_ENEMY_W), GC.GFX_ENEMY_W, FP.screen.width - 2 * GC.GFX_ENEMY_W), -10);
			this.graphic = new Image(GC.GFX_ENEMY);
			this.setHitbox(10, 8, 0, -1);
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
			GV.Score += GC.ENEMY_VALUE;
		}

		public function destroy(reason:String):void {
			if (reason == DEATH)
				this.world.add(new Explosion(x + width / 2, y + height / 2, explosionColor, EXPLOSION_SIZE, EXPLOSION_MAXDIST));
			this.world.remove(this);
		}

		protected function set myColor(s:String):void {
			this._myColor = s;
			this.explosionColor = (_myColor == WHITE) ? 0xffffff : 0;
		}
	}
}

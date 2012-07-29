package bullets {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	/**
	 * { Description of Bullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Bullet extends Entity {
		
		private var _gfx:Image = new Image(new BitmapData(2, 2, true, 0xffffffff));

		public function Bullet(x:Number = 0, y:Number = 0) {
			super(x, y);			
			this.setHitbox(2, 2);
			this.graphic = _gfx;
			_gfx.scrollX = 0;
			_gfx.scrollY = 0;
			layer = GC.LAYER_BULLET;
		}

		override public function update():void {
			y -= FP.elapsed * GC.BULLET_SPEED;
			if (y < -height)
				this.destroy();
		}

		public function destroy():void {
			this.world.recycle(this);
		}
	}
}

package bullets {

	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;

	/**
	 * { Description of Bullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Bullet extends Entity {

		public function Bullet(x:Number = 0, y:Number = 0) {
			super(x, y);
			this.setHitbox(2, 2);
			this.graphic = new Image(new BitmapData(2, 2, true, 0xffffffff));
		}

		override public function update():void {
			y -= FP.elapsed * GC.BULLET_SPEED;
			if (y < -height)
				this.destroy();
		}

		public function destroy():void {
			this.world.remove(this);
		}
	}
}

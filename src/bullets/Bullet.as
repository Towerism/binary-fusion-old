package bullets {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	/**
	 * { Description of Bullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Bullet extends Entity {

		private var _rotation:Number;
		private var _speed:Number;

		public function Bullet(x:Number = 0, y:Number = 0, dir:Number = 270) {
			super(x, y);
			var gfx:Image = Image(graphic);
			graphic.centerOO();
			this.setHitbox(gfx.width, gfx.height, gfx.width / 2, gfx.height / 2);
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			layer = GC.LAYER_BULLET;
			_rotation = dir;
		}

		override public function update():void {
			var radAngle:Number = _rotation * Math.PI / 180;
			x += FP.elapsed * (_speed * Math.cos(radAngle));
			y += FP.elapsed * (_speed * Math.sin(radAngle));
			if (x < -width || x > FP.screen.width + width || y < -height || y > FP.screen.height + height) this.destroy();
		}

		public function destroy():void {
			world.remove(this);
		}
		
		protected function get speed():Number {
			return _speed;
		}
		
		protected function set speed(spd:Number):void {
			_speed = spd;
		}
	}
}

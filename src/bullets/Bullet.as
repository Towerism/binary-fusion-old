package bullets {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;

	/**
	 * { Description of Bullet.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Bullet extends Entity {
		
		protected static var WHITE:String = "white";
		protected static var BLACK:String = "black";
		
		private var _gfx:Image = new Image(new BitmapData(4, 4, false, 0xffffff));

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
		
		protected function set myColor(s:String):void {
			Image(graphic).color = (s == WHITE) ? 0xffffff : 0x000000;
			this.type = (s == WHITE) ? GC.TYPE_WHITE_BULLET : GC.TYPE_BLACK_BULLET;
		}
	}
}

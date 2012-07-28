package emitters {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;

	/**
	 * { Description of Explosion.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Explosion extends Entity {

		private var explosionEmitter:Emitter;
		private var _amount:int;
		private var posx:int;
		private var posy:int;

		public function Explosion(_x:Number, _y:Number, color:uint, amount:int) {
			super();
			posx = _x;
			posy = _y;
			_amount = amount;
			explosionEmitter = new Emitter(new BitmapData(1, 1), 1, 1);
			explosionEmitter.newType("explode", [0]);
			explosionEmitter.setAlpha("explode", 1, 0, Ease.quadIn);
			explosionEmitter.setColor("explode", color, color);
			explosionEmitter.setMotion("explode", 0, 50, 2, 360, -49, -0.5, Ease.quadOut);
			explosionEmitter.relative = false;
			graphic = explosionEmitter;

			for (var i:int; i < _amount; i++) {
				explosionEmitter.emit("explode", posx, posy);
			}
		}

		override public function update():void {

			if (explosionEmitter.particleCount == 0) {
				destroy();
			}
		}

		public function destroy():void {
			this.world.remove(this);
		}
	}
}

package players {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	import bullets.*;
	import emitters.Explosion;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Player extends Entity {

		private var currentBullet:Class = WhiteBullet;
		private var g:Image;
		private var flipInTween:VarTween;
		private var flipOutTween:VarTween;
		private var _explosionColor:uint = 0xffffff;
		private const FLIP_SPEED:Number = 0.5;
		private const EXPLOSION_SIZE:int = 50;

		public function Player(x:Number = 0, y:Number = 0) {
			super(x, y);
			g = new Image(GC.GFX_PLAYER);
			g.originX = 6;
			graphic = g;

			flipInTween = new VarTween(onFlipInComplete, Tween.PERSIST);
			flipOutTween = new VarTween(onFlipOutComplete, Tween.PERSIST);

			addTween(flipInTween);
			addTween(flipOutTween);
			this.setHitbox(12, 8, g.originX, g.originY);
			this.currentBullet = WhiteBullet;
		}

		private function onFlipInComplete():void {
			switchColor();
			flipOutTween.tween(g, "scaleX", 1, FLIP_SPEED / 2, Ease.quadIn);
			flipOutTween.start();
		}

		private function onFlipOutComplete():void {

		}

		private function switchColor():void {
			if (currentBullet == WhiteBullet) {
				g.color = 0;
				_explosionColor = 0;
				currentBullet = BlackBullet;
			} else {
				g.color = 0xffffff;
				_explosionColor = 0xffffff;
				currentBullet = WhiteBullet;
			}
		}

		private function checkTweenActive():Boolean {
			if (flipInTween.active || flipOutTween.active)
				return true
			else
				return false;
		}

		override public function update():void {
			x = Input.mouseX + 1;
			x = FP.clamp(x, 0 + g.originX, FP.screen.width - width + g.originX);

			if (Input.mousePressed && !checkTweenActive()) {
				this.world.add(new currentBullet(x + 5 - g.originX, y - 2 - g.originY));
			}

			if (Input.pressed(Key.Z) && !checkTweenActive()) {
				flipInTween.tween(g, "scaleX", 0, FLIP_SPEED / 2, Ease.quadOut);
				flipInTween.start();
			}
			if (this.collide(GC.TYPE_ENEMY, x, y)) {
				destroy();
			}
		}

		public function destroy():void {
			this.world.add(new Explosion(x + width / 2 - g.originX, y + height / 2 - g.originY, _explosionColor, EXPLOSION_SIZE))
			this.world.remove(this);
		}
	}
}

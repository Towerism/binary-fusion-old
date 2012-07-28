package players {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	import bullets.*;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Player extends Entity {
		
		private static const FLIP_SPEED:Number = 0.5;
		private static const EXPLOSION_SIZE:int = 50;

		private var currentBullet:Class = WhiteBullet;
		private var asset:Class = Assets.GFX_PLAYER;
		private var gfx:Image = new Image(asset);
		private var flipInTween:VarTween;
		private var flipOutTween:VarTween;
		private var explosionType:String;

		public function Player(x:Number = 0, y:Number = 0) {
			super(x, y);
			gfx.centerOO();
			graphic = gfx;

			flipInTween = new VarTween(onFlipInComplete, Tween.PERSIST);
			flipOutTween = new VarTween(onFlipOutComplete, Tween.PERSIST);

			addTween(flipInTween);
			addTween(flipOutTween);
			mask = new Pixelmask(asset, -gfx.width / 2, -gfx.height / 2);
			this.currentBullet = WhiteBullet;
		}

		override public function update():void {
			x = Input.mouseX + 1;
			x = FP.clamp(x, 0 + gfx.originX, FP.screen.width - width + gfx.originX);

			if (Input.mousePressed && !checkTweenActive()) {
				this.world.add(new currentBullet(x - 1, y - 2));
			}

			if (Input.pressed(Key.Z) && !checkTweenActive()) {
				flipInTween.tween(gfx, "scaleX", 0, FLIP_SPEED / 2, Ease.quadOut);
				flipInTween.start();
			}
			
			if (this.collide(GC.TYPE_ENEMY, x, y)) {
				destroy();
			}
		}
		
		private function onFlipInComplete():void {
			switchColor();
			flipOutTween.tween(gfx, "scaleX", 1, FLIP_SPEED / 2, Ease.quadIn);
			flipOutTween.start();
		}

		private function onFlipOutComplete():void {

		}

		private function switchColor():void {
			if (currentBullet == WhiteBullet) color = 0x0;
			else color = 0xffffff;
		}

		private function checkTweenActive():Boolean {
			return (flipInTween.active || flipOutTween.active)
		}
		
		public function set color(c:uint):void {
			gfx.color = c;
			if (c == 0x0) {
				explosionType = GC.EXP_PLAYER_B;
				currentBullet = BlackBullet;				
			} else {
				explosionType = GC.EXP_PLAYER_W;
				currentBullet = WhiteBullet;
			}
		}

		public function destroy():void {
			GV.PARTICLE_CONTROLLER.explodeStandard(x, y, explosionType);
			this.world.remove(this);
		}
	}
}

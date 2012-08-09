package players {
	
	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.*;

	import bullets.Bullet;
	import bullets.player.*;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Player extends Entity {
		
		private static const FLIP_SPEED:Number = 0.5;

		private var _asset:Class = Assets.GFX_PLAYER;
		private var _gfx:Image = new Image(_asset);	
		private var _explosionType:String = GC.EXP_LARGE_W;
		private var _speedX:Number = GC.PLAYER_SPEED;
		private var _currentBullet:Class = WhiteBullet;
		private var _introTween:VarTween;
		private var _flipInTween:VarTween;
		private var _flipOutTween:VarTween;
		private var _spawnWait:Number = 0;
		private var _invincibleTimer:Number = 0;
		private var _isInvincible:Boolean = false;

		public function Player(x:Number = 0, y:Number = 0, respawn:Boolean = false) {
			super(x, y);
			_gfx.centerOO();
			graphic = _gfx;
			
			_gfx.scrollX = 0;
			_gfx.scrollY = 0;

			_introTween = new VarTween(onIntroComplete, Tween.PERSIST);
			_flipInTween = new VarTween(onFlipInComplete, Tween.PERSIST);
			_flipOutTween = new VarTween(onFlipOutComplete, Tween.PERSIST);

			addTween(_introTween);
			addTween(_flipInTween);
			addTween(_flipOutTween);
			mask = new Pixelmask(_asset, -_gfx.width / 2, -_gfx.height / 2);
			this._currentBullet = WhiteBullet;
			layer = GC.LAYER_PLAYER;
			
			if (respawn) {
				_isInvincible = true;
			}
		}

		override public function update():void {

			if (y >= GC.PLAYER_START_Y) {
				_spawnWait += FP.elapsed;
				if (_spawnWait >= GC.PLAYER_SPAWN_WAIT) {
					_introTween.tween(this, "y", GC.PLAYER_AXIS_X, 1.5, Ease.quadOut);
					_introTween.start();		
				}
			}

			var moveX:Number = (!_introTween.active) ? _speedX * FP.elapsed : 0;
			x += (Input.check("left")) ? -moveX : ((Input.check("right")) ? moveX : 0);
			x = FP.clamp(x, 0 + _gfx.originX, FP.screen.width - width + _gfx.originX);
			
			if (_isInvincible) {
				_invincibleTimer += FP.elapsed;
				if (_invincibleTimer < GC.PLAYER_INVINCIBLE_TIME) _gfx.alpha = 0.5;
				else {
					_gfx.alpha = 1;
					_isInvincible = false;
				}
			}

			if (Input.pressed("shoot") && !checkTweenActive()) {
				var b:Bullet = this.world.add(new _currentBullet) as Bullet;
				b.x = x;
				b.y = y;
			}

			if (Input.pressed("color") && !checkTweenActive()) {
				_flipInTween.tween(_gfx, "scaleX", 0, FLIP_SPEED / 2, Ease.quadOut);
				_flipInTween.start();
			}
			var b:Bullet = this.collide(GC.TYPE_ENEMY_BULLET, x, y) as Bullet;
			if ((!_introTween.active && !_isInvincible) && (this.collide(GC.TYPE_ENEMY, x, y) || b != null)) {
				destroy();
				if (b != null) b.destroy();
			}
		}

		private function switchColor():void {
			if (_currentBullet == WhiteBullet) color = 0x0;
			else color = 0xffffff;
		}
		
		private function checkTweenActive():Boolean {
			return (_flipInTween.active || _flipOutTween.active || _introTween.active)
		}
		
		private function onIntroComplete():void {
			
		}
		
		private function onFlipInComplete():void {
			switchColor();
			_flipOutTween.tween(_gfx, "scaleX", 1, FLIP_SPEED / 2, Ease.quadIn);
			_flipOutTween.start();
		}

		private function onFlipOutComplete():void {

		}

		public function destroy():void {
			GV.LIVES--;
			GV.CURRENT_GUI.updateLives();
			GV.PARTICLE_CONTROLLER.explodeStandard(x, y, _explosionType);
			this.world.remove(this);
		}
		
		public function set color(c:uint):void {
			_gfx.color = c;
			if (c == 0x0) {
				_explosionType = GC.EXP_LARGE_B;
				_currentBullet = BlackBullet;				
			} else {
				_explosionType = GC.EXP_LARGE_W;
				_currentBullet = WhiteBullet;
			}
		}
	}
}

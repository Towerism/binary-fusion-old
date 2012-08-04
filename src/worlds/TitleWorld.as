package worlds {

	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.*;
	import gamejolt.*;

	/**
	 * { Description of TitleWorld.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class TitleWorld extends World {

		private var _topTitle:Entity;
		private var _bottomTitle:Entity;
		private var _hasPlayedTitle:Boolean;
		private var _infoText:Text;
		private var _textOutTween:VarTween;
		private var _textInTween:VarTween;
		private var _textTotalTime:Number = 1;
		private var _startMusicTimer:Number = 0;
		private var _creditText:Text;
		private var _showCreditText:Text;
		private var _versionText:Text;
		private var _creditUnlocked:Boolean = false;

		public function TitleWorld() {
			_hasPlayedTitle = false;
			super();
		}

		override public function begin():void {
			_versionText = new Text("v"+GC.VERSION, -2, 2, {size:12, align:"right", width:FP.screen.width, color:0xffffff});
			addGraphic(_versionText, -5);
			
			_creditText = new Text("Credits (Hold X or C)", 2, 2, {size:12, align:"left", width:FP.screen.width, color:0xffffff});
			addGraphic(_creditText, -5);
			
			_showCreditText = new Text("programming/art by Martin (Towerism)\n\nmusic by SkyeWintrest", 0, 50, { width:FP.screen.width, align:"center", size:12, color:0xffffff } );
			addGraphic(_showCreditText, -5);
			_showCreditText.visible = true;
			
			_topTitle = addGraphic(new Image(Assets.GFX_TITLE_TOP));
			_topTitle.y = -FP.screen.height / 2;

			_bottomTitle = addGraphic(new Image(Assets.GFX_TITLE_BOTTOM));
			_bottomTitle.y = FP.screen.height;

			var topTween:VarTween = new VarTween(onBounceIn, Tween.ONESHOT);
			topTween.tween(_topTitle, "y", 0, 1.5, Ease.bounceOut);
			addTween(topTween, true);

			var bottomTween:VarTween = new VarTween(null, Tween.ONESHOT);
			bottomTween.tween(_bottomTitle, "y", FP.screen.height / 2, 1.5, Ease.bounceOut);
			addTween(bottomTween, true);

			_infoText = new Text("Press Z", 0, FP.screen.height - 40, {size:32, align:"center", width:FP.screen.width, alpha:0, color:0});
			addGraphic(_infoText, -1);

			_textInTween = new VarTween(onTextTweenIn, Tween.PERSIST);
			_textOutTween = new VarTween(onTextTweenOut, Tween.PERSIST);

			addTween(_textInTween, false);
			addTween(_textOutTween, false);
		}

		private function onBounceIn():void {
			_textInTween.tween(_infoText, "alpha", 1, _textTotalTime / 2, Ease.quadIn);
			_textInTween.start();
		}

		private function onTextTweenIn():void {
			_textOutTween.tween(_infoText, "alpha", 0, _textTotalTime / 2, Ease.quadIn);
			_textOutTween.start();
			_hasPlayedTitle = true;
		}

		private function onTextTweenOut():void {
			_textInTween.tween(_infoText, "alpha", 1, _textTotalTime / 2, Ease.quadOut);
			_textInTween.start();
		}

		override public function update():void {
			
			_startMusicTimer += FP.elapsed;
			if (_startMusicTimer >= 0.5 && !Audio.bgloop.playing) {
				Audio.bgloop.loop();
			}
			
			if (Input.pressed("shoot") && _hasPlayedTitle) {
				FP.world = new GameWorld;
			}
			
			if (Input.check("color")) {
				_showCreditText.visible = true;
				_creditText.visible = false;
				if (!_creditUnlocked) {
					_creditUnlocked = true;
					GV.ACHIEVEMENTS.unlock(Achievements.ACH_CREDITS, false);
				}
			} else {
				_showCreditText.visible = false;
				_creditText.visible = true;
			}
			
			super.update();
		}
	}
}

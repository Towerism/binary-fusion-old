package worlds {
	
	import net.flashpunk.*;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import punk.ui.PunkButton;
	import punk.ui.PunkText;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GameOver extends World {
		
		private var _gOverText:PunkText;
		private var _finalScoreText:PunkText;
		private var _retryButton:PunkButton;
		private var _menuButton:PunkButton;
		private var _musicButton:PunkButton;
		
		public function GameOver() {
			var bd:Backdrop = new Backdrop(Assets.GFX_BACKDROP, true, true);
			addGraphic(bd, 5);
			
			_gOverText = new PunkText("GAME OVER", FP.halfWidth, 0, { size:50, align:"center", width:FP.screen.width, outlineColor:0x000000, outlineStrength:4 } );
			_gOverText.y = -_gOverText.textHeight / 2;
			_gOverText.centerOO();
			addGraphic(_gOverText);
			Tween.to(_gOverText, 1.7, { y:FP.halfHeight - 100 }, waitTween, Ease.bounceOut);
			
			_finalScoreText = new PunkText("Your final score\n " + GV.SCORE, FP.halfWidth, FP.halfHeight + _gOverText.textHeight / 2 - 50, { size:22, align:"center", width:FP.screen.width, outlineColor:0x000000, outlineStrength:2 } );
			_finalScoreText.centerOO();
			_finalScoreText.alpha = 0;
			addGraphic(_finalScoreText);
			
			_retryButton = new PunkButton((FP.width - 100) / 2, _finalScoreText.y + _finalScoreText.textHeight / 2 + 20, 100, 30, "Retry", onRetry);
			_retryButton.alpha = 0;
			add(_retryButton);
			
			_menuButton = new PunkButton((FP.width - 100) / 2, _retryButton.y + _retryButton.height + 10, 100, 30, "Menu", onMenu);
			_menuButton.alpha = 0;
			add(_menuButton);
			
			_musicButton = new PunkButton((FP.width - 100) / 2, _menuButton.y + _menuButton.height + 10, 100, 30, (Audio.bgloop.volume) ? "Music On" : "Music Off", onMusic);
			_musicButton.alpha = 0;
			add(_musicButton);
		}
		
		private function startButtonTween(b:PunkButton, callback:Function = null) {
			Tween.to(b, .5, { alpha:1 }, callback, Ease.quadOut);
		}
		
		private function waitTween():void {
			Tween.to(_gOverText, .5, { alpha:1 }, afterWait, Ease.quadOut);
		}
		
		private function afterWait():void {
			Tween.to(_finalScoreText, .5, { alpha:1 }, onScoreText, Ease.quadOut);
		}
		
		private function onScoreText():void {
			startButtonTween(_retryButton);
			startButtonTween(_menuButton);
			startButtonTween(_musicButton);
		}
		
		private function onRetry():void {
			FP.world = new GameWorld;
		}
		
		private function onMenu():void {
			FP.world = new TitleWorld;
		}
		
		private function onMusic():void {
			if (Audio.bgloop.volume) {
				Audio.bgloop.volume = 0;
				_musicButton.label.text = "Music Off";
			} else {
				Audio.bgloop.volume = 1;
				_musicButton.label.text = "Music On";
			}
		}
	}
}
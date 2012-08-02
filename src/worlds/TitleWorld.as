package worlds {

	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.*;

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
		private var _timer:Number = 0;

		public function TitleWorld() {
			_hasPlayedTitle = false;
			super();
		}

		override public function begin():void {
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
			
			_timer += FP.elapsed;
			trace(_timer);
			if (_timer >= 0.5 && !Audio.bgloop.playing) {
				Audio.bgloop.loop();
			}
			
			if (Input.pressed(Key.Z) && _hasPlayedTitle) {
				FP.world = new GameWorld;
			}
			
			super.update();
		}
	}
}

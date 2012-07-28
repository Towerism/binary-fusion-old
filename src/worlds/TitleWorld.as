package worlds {

	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	/**
	 * { Description of TitleWorld.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class TitleWorld extends World {

		private var topTitle:Entity;
		private var bottomTitle:Entity;
		private var hasPlayedTitle:Boolean;
		private var infoText:Text;
		private var textOutTween:VarTween;
		private var textInTween:VarTween;
		private var textTotalTime:Number = 1;

		public function TitleWorld() {
			hasPlayedTitle = false;
			super();
		}

		override public function begin():void {
			topTitle = addGraphic(new Image(Assets.GFX_TITLE_TOP));
			topTitle.y = -FP.screen.height / 2;

			bottomTitle = addGraphic(new Image(Assets.GFX_TITLE_BOTTOM));
			bottomTitle.y = FP.screen.height;

			var topTween:VarTween = new VarTween(onBounceIn, Tween.ONESHOT);
			topTween.tween(topTitle, "y", 0, 1.5, Ease.bounceOut);
			addTween(topTween, true);

			var bottomTween:VarTween = new VarTween(null, Tween.ONESHOT);
			bottomTween.tween(bottomTitle, "y", FP.screen.height / 2, 1.5, Ease.bounceOut);
			addTween(bottomTween, true);

			infoText = new Text("Press Z");
			infoText.x = (FP.screen.width - infoText.width) / 2;
			infoText.y = FP.screen.height - 20;
			infoText.color = 0;
			infoText.alpha = 0;
			addGraphic(infoText, -1);

			textInTween = new VarTween(onTextTweenIn, Tween.PERSIST);
			textOutTween = new VarTween(onTextTweenOut, Tween.PERSIST);

			addTween(textInTween, false);
			addTween(textOutTween, false);
		}

		private function onBounceIn():void {
			textInTween.tween(infoText, "alpha", 1, textTotalTime / 2, Ease.quadIn);
			textInTween.start();
		}

		private function onTextTweenIn():void {
			textOutTween.tween(infoText, "alpha", 0, textTotalTime / 2, Ease.quadIn);
			textOutTween.start();
			hasPlayedTitle = true;
		}

		private function onTextTweenOut():void {
			textInTween.tween(infoText, "alpha", 1, textTotalTime / 2, Ease.quadOut);
			textInTween.start();
		}

		override public function update():void {
			if (Input.pressed(Key.Z) && hasPlayedTitle) {
				FP.world = new GameWorld;
			}
		}
	}
}

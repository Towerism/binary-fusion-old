package ui {
	
	import flash.geom.Point;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	import punk.ui.PunkText;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Score extends Entity {
		
		private var _duration:Number = 1;
		private var _moveY:Number = 25;
		
		public function Score(value:int, point:Point) {
			FP.world.add(this);
			var t:PunkText = new PunkText(String(value), point.x, point.y, { outlineColor:0x0, outlineStrength:2 } );
			t.centerOO();
			graphic = t;
			layer = GC.LAYER_GUI;
			graphic.scrollX = 0;
			graphic.scrollX = 0;
			Tween.to(this, 1, { y:y - _moveY }, onMoveY, Ease.quadOut);
			GV.SCORE += value;
			GV.CURRENT_GUI.updateScore();
		}
		
		private function onMoveY():void {
			Tween.to(Image(graphic), 0.5, { alpha:0 }, onFade);
		}
		
		private function onFade():void {
			world.remove(this);
		}
	}
}
package ui {

	import flash.display.BitmapData;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GUI extends Entity {
		
		private var _glist:Graphiclist = new Graphiclist;
		private var _livesText:Text;
		private var _scoreText:Text;
		
		public function GUI() {
			super(0, FP.screen.height);
			
			var guiHeight:Number = 20;
			Tween.to(this, 0.5, { y:FP.screen.height-guiHeight }, guiTweened, Ease.quadOut);
			var bar:Image = new Image(new BitmapData(FP.width, int(guiHeight), false, 0x0));
			bar.scrollX = 0;
			bar.scrollY = 0;
			bar.alpha = 0.5;
			_glist.add(bar);
			
			_scoreText = new Text("Score: 0", FP.width - 150, 0, { size:16, width:150, scrollX:0, scrollY:0 } );
			_glist.add(_scoreText);
			
			_livesText = new Text("Lives x " + GC.MAX_LIVES, 2, 0, { size:16, scrollX:0, scrollY:0 } );
			_glist.add(_livesText);
			
			graphic = _glist;
			
			layer = GC.LAYER_GUI;
		}
		
		public function updateScore():void {
			_scoreText.text = "Score: " + GV.SCORE;
		}
		
		public function updateLives():void {
			_livesText.text = "Lives x " + GV.LIVES;
		}
		
		private function guiTweened():void {
			GV.GUI_INIT = true;
		}
	}
}
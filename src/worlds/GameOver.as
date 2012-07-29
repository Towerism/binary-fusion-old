package worlds {
	
	import net.flashpunk.graphics.Text;
	import net.flashpunk.*;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GameOver extends World {
		
		public function GameOver() {
			FP.screen.color = 0x202020;
			var t:Text = new Text("Your final score was " + GV.SCORE + "\n\nPress (Z / Space) to retry.", 0, 0, {size:8, align:"center"});
			t.centerOO();
			var e:Entity = new Entity(FP.halfWidth, FP.halfHeight, t);
			add(e);
		}
		
		override public function update():void {
			super.update();
			if (Input.pressed("shoot")) {
				FP.screen.color = GC.SCREEN_COLOR;
				FP.world = new GameWorld;
			}
		}
	}
}
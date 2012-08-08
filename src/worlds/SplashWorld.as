package worlds {
	
	import net.flashpunk.*;
	import splash.Splash;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class SplashWorld extends World {
		
		public function SplashWorld() {
			FP.screen.color = 0x202020;
			super();
			var s:Splash = new Splash;
			add(s);
			s.start(splashComplete);
		}
		
		private function splashComplete():void {
			FP.screen.color = 0x666666;
			FP.world = new TitleWorld;
		}
	}
}
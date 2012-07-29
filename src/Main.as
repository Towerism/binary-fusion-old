package {

	import flash.system.System;
	import net.flashpunk.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	import worlds.*;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Main extends Engine {

		public function Main():void {
			super(160, 300, 60, false);
			FP.screen.scale = 2;
			FP.screen.color = GC.SCREEN_COLOR;

			//FP.console.enable();
			FP.randomizeSeed();
			Input.mouseCursor = "hide";
		}

		override public function init():void {
			FP.world = new TitleWorld;
			super.init();
			
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT);
			Input.define("shoot", Key.Z, Key.SPACE);
			Input.define("color", Key.X, Key.C);
		}

		override public function update():void {
			if (Input.check(Key.ESCAPE))
				System.exit(0);
			super.update();
		}
	}
}

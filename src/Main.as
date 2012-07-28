package {

	import flash.system.System;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
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
			FP.screen.color = 0x888888;

			//FP.console.enable();
			FP.randomizeSeed();
			Input.mouseCursor = "hide";
		}

		override public function init():void {
			FP.world = new TitleWorld;
			super.init();
		}

		override public function update():void {
			if (Input.check(Key.ESCAPE))
				System.exit(0);
			super.update();
		}
	}
}

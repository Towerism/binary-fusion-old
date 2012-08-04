package {

	import flash.system.System;
	import gamejolt.Achievements;
	import gamejolt.Session;
	import net.flashpunk.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;

	import worlds.*;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Main extends Engine {
		
		private var _session:Session = new Session(true, true);

		public function Main():void {
		
			super(320, 600, 60, false);
			FP.screen.color = GC.SCREEN_COLOR;

			//FP.console.enable();
			FP.randomizeSeed();
		}

		override public function init():void {
			
			FP.world = new TitleWorld;
			super.init();
			var hi:Object = FP.flashvars;
			
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT);
			Input.define("shoot", Key.Z, Key.SPACE);
			Input.define("color", Key.X, Key.C);
		}

		override public function update():void {
			if (FP.world.classCount(Session) < 1) {
				_session = new Session(false, true);
				FP.world.add(_session);
			}
			
			if (FP.world.classCount(Achievements) < 1) {
				GV.ACHIEVEMENTS = new Achievements;
				FP.world.add(GV.ACHIEVEMENTS);
				GV.ACHIEVEMENTS.x = GV.ACHIEVEMENTS.startX;
				GV.ACHIEVEMENTS.y = GV.ACHIEVEMENTS.startY;
			}
			
			if (Input.check(Key.ESCAPE))
				System.exit(0);	
			super.update();
		}
	}
}

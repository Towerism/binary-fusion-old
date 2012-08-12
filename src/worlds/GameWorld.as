package worlds {
	
	import gamejolt.Achievements;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	import enemies.Enemy;
	import enemies.types.EnemyBasic;
	import enemies.types.EnemyLarge;
	import enemies.waves.Wave;
	import enemies.waves.WaveController;
	import enemies.waves.Waves;
	import enemies.types.color.*;
	import players.Player;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GameWorld extends World {

		public function GameWorld() {
			super();
		}

		override public function begin():void {
			GV.reset();
			this.add(GV.PARTICLE_CONTROLLER);
			this.add(GV.CURRENT_GUI);
			
			var b:Backdrop = new Backdrop(Assets.GFX_BACKDROP, true, true);
			b.alpha = 0.5;
			
			var e:Entity = new Entity;
			e.graphic = b;
			e.layer = GC.LAYER_BACKDROP;
			add(e);
		}

		override public function update():void {
			//trace("Enemy count :: " + FP.world + ": " + classCount(BasicBlack));
			if (classCount(WaveController) < 1 && !GV.GAME_IS_NEW) {
				add(new WaveController);
			}

			if (this.classCount(Player) == 0 && GV.PARTICLE_CONTROLLER.particleCount == 0 && GV.GUI_INIT) {
				GV.PLAYER = new Player(FP.halfWidth, GC.PLAYER_START_Y, (GV.GAME_IS_NEW) ? false : true)
				add(GV.PLAYER);
			}
			
			if (GV.KILL_COLOR_INROW >= GC.GOAL_RACIST) {
				GV.ACHIEVEMENTS.unlock(Achievements.ACH_RACIST, true);
				GV.KILL_COLOR_INROW = 0;
			}
			
			if (GV.PARTICLE_CONTROLLER.particleCount == 0) {
				if (GV.LIVES <= 0) FP.world = new GameOver;
			}
			super.update();
		}
	}
}

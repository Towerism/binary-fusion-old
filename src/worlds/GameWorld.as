package worlds {

	import gamejolt.Achievements;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Input;

	import enemies.*;
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
			GV.PLAYER.x = FP.halfWidth;
			GV.PLAYER.y = GC.PLAYER_START_Y;
			this.add(GV.PLAYER);
			this.add(GV.PARTICLE_CONTROLLER);
			this.add(GV.CURRENT_GUI);
			
			var b:Backdrop = new Backdrop(Assets.GFX_BACKDROP, true, true);
			b.alpha = 0.3;
			
			var e:Entity = new Entity;
			e.graphic = b;
			e.layer = GC.LAYER_BACKDROP;
			add(e);
		}

		override public function update():void {
			var isTrue:Boolean = (GV.GAME_IS_NEW) ? GV.PLAYER.y <= GC.PLAYER_AXIS_X : true;
			if (isTrue && (this.typeCount(GC.TYPE_ENEMY) == 0 || FP.random < GC.ENEMY_SPAWN_CHANCE)) {
				var e:Entity;
				e = (FP.rand(2)) ? create(WhiteEnemy) : create(BlackEnemy);
				e.x = FP.clamp(FP.rand(FP.width), e.width, FP.width - e.width);
				e.y = -GC.ENEMY_SPEED;	
				GV.GAME_IS_NEW = false;
			}

			if (this.classCount(Player) == 0 && GV.PARTICLE_CONTROLLER.particleCount == 0) {
				GV.PLAYER = new Player(FP.halfWidth, GC.PLAYER_START_Y, true);
				add(GV.PLAYER);
			}
			
			FP.log(GV.KILL_COLOR_INROW + " :: " + GV.LAST_COLOR_KILLED);
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

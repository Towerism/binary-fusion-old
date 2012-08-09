package worlds {

	import enemies.Enemy;
	import enemies.types.EnemyLarge;
	import gamejolt.Achievements;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

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
			var isTrue:Boolean = (GV.GAME_IS_NEW) ? (GV.PLAYER.y == GC.PLAYER_AXIS_X) : true;
			if (isTrue && (this.typeCount(GC.TYPE_ENEMY) == 0 || FP.random < GC.ENEMY_SPAWN_CHANCE)) {
				var e:Entity;
				e = (FP.rand(2)) ? add(new BasicWhite) : add(new BasicWhite);
				e.x = FP.clamp(FP.rand(FP.width), e.width, FP.width - e.width);
				e.y = -50;
				GV.GAME_IS_NEW = false;
				if (FP.random < .3) {
					var f:Entity = add(new EnemyLarge);
					f.x = FP.clamp(FP.rand(FP.width), f.width, FP.width - f.width);
					f.y = -25 * (FP.rand(15) + 1);
				}
				if (FP.random < .2) {
					var f:Entity = (FP.rand(2)) ? add(new BombBlack) : add(new BombWhite);
					f.x = FP.clamp(FP.rand(FP.width), f.width, FP.width - f.width);
					f.y = -25 * (FP.rand(15) + 1);
				}
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

package worlds {

	import net.flashpunk.*;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;

	import enemies.*;
	import players.Player;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GameWorld extends World {

		private var player:Player;
		private var scoreText:Text;

		public function GameWorld() {
			super();
		}

		override public function begin():void {
			player = new Player(Input.mouseX - GC.GFX_PLAYER_W / 2, 250);
			this.add(player);

			scoreText = new Text("0", 0, 0);
			scoreText.size = 8;
			addGraphic(scoreText);
		}

		override public function update():void {
			if (this.classCount(Player) != 0) {
				if (this.typeCount(GC.TYPE_ENEMY) == 0 || FP.random < GC.ENEMY_SPAWN_CHANCE) {
					var e:Entity;
					e = (FP.rand(2)) ? add(new WhiteEnemy) : add(new BlackEnemy);
				}
			}


			if (this.classCount(Player) == 0 && typeCount(GC.TYPE_ENEMY) == 0) {
				GV.Score = 0;
				player = new Player(Input.mouseX - GC.GFX_PLAYER_W / 2, 250);
				add(player);
			}

			scoreText.text = GV.Score.toString();

			super.update();
		}
	}
}

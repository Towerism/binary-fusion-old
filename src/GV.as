package {
	import emitters.ParticleController;
	import players.Player;
	import ui.GUI;

	/**
	 * { Description of GV.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class GV {
		
		public static var CURRENT_GUI:GUI = null;
		public static var GAME_IS_NEW:Boolean = true;
		public static var LIVES:Number = GC.MAX_LIVES;
		public static var PARTICLE_CONTROLLER:ParticleController = null;
		public static var PLAYER:Player = null;
		public static var SCORE:Number = 0;
		
		public static function reset():void {
			CURRENT_GUI = new GUI;
			GAME_IS_NEW = true;
			LIVES = GC.MAX_LIVES;
			PARTICLE_CONTROLLER = new ParticleController;			
			PLAYER = new Player;
			SCORE = 0;
		}
	}
}

package {
	
	import emitters.ParticleController;
	import enemies.Enemy;
	import enemies.formations.Formation;
	import enemies.formations.Formations;
	import enemies.waves.Waves;
	import gamejolt.Achievements;
	import players.Player;
	import ui.GUI;

	/**
	 * { Description of GV.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class GV {
		
		public static var CURRENT_GUI:GUI = null;
		public static var GAME_IS_NEW:Boolean = true;
		public static var GUI_INIT:Boolean = false;
		public static var LIVES:Number = GC.MAX_LIVES;
		public static var PARTICLE_CONTROLLER:ParticleController = null;
		public static var PLAYER:Player = null;
		public static var SCORE:int = 0;
		
		//will use for achievements
		public static var ACHIEVEMENTS:Achievements = null
		//these two for racist achievement	
		public static var KILL_COLOR_INROW:int = 0;
		public static var LAST_COLOR_KILLED:String = "none";
		
		//Enemy spawning objects
		public static var FORMATIONS:Formations = null;
		public static var WAVES:Waves = null;
		
		public static function reset():void {
			CURRENT_GUI = new GUI;
			GAME_IS_NEW = true;
			GUI_INIT = false;
			LIVES = GC.MAX_LIVES;
			PARTICLE_CONTROLLER = new ParticleController;			
			PLAYER = new Player;
			SCORE = 0;
			
			FORMATIONS = new Formations;
			WAVES = new Waves;
		}
	}
}

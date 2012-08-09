package {
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GC {
		//Build info
		public static const VERSION:String = "0.2.11";
		
		//Achievement goals
		public static const GOAL_RACIST:int = 50;
		
		//system settings
		public static const SCREEN_COLOR:uint = 0x888888;
		
		//Enemy costants
		public static const ENEMY_BULLET_SPEED:Number = 150;
		public static const ENEMY_SPAWN_CHANCE:Number = 0.01;
		
		public static const ENEMY_BASIC_VALUE:int = 100;
		public static const ENEMY_LARGE_VALUE:int = 150;
		public static const ENEMY_BOMB_VALUE:int = 150;
		
		public static const ENEMY_BASIC_SPEED:Number = 80;
		public static const ENEMY_LARGE_SPEED:Number = 50;
		
		//Player / Game constants
		public static const PLAYER_AXIS_X:Number = FP.height - 50;
		public static const PLAYER_START_Y:Number = FP.height + 10;
		public static const PLAYER_SPEED:Number = 200;
		public static const PLAYER_BULLET_SPEED:int = 200;
		public static const PLAYER_SPAWN_WAIT:Number = 0.5;
		public static const PLAYER_INVINCIBLE_TIME:Number = PLAYER_SPAWN_WAIT + 2.7;
		public static const MAX_LIVES:Number = 3;

		//collision typing
		public static const TYPE_WHITE_BULLET_P:String = "white_bullet";
		public static const TYPE_BLACK_BULLET_P:String = "black_bullet";
		public static const TYPE_ENEMY:String = "enemy";
		public static const TYPE_ENEMY_BULLET:String = "enemy_bullet";
		
		//explosion particle types
		public static const EXP_LARGE_W:String = "explodelargewhite";
		public static const EXP_LARGE_B:String = "explodelargeblack";
		public static const EXP_SMALL_W:String = "explodesmallwhite";
		public static const EXP_SMALL_B:String = "explodesmallblack";
		
		//draw sequence
		private static var lc:Number = 0;
		public static const LAYER_ACHIEVEMENT:Number = -10;
		public static const LAYER_GUI:Number = lc++;
		public static const LAYER_ENEMY:Number = lc++;
		public static const LAYER_PLAYER:Number = lc++;
		public static const LAYER_PARTICLE:Number = lc++;
		public static const LAYER_BULLET:Number = lc++;
		public static const LAYER_BACKDROP:Number = lc++;
	}
}

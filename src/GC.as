package {
	
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GC {
		//system settings
		public static const SCREEN_COLOR:uint = 0x888888;
		
		//Non Player costants
		public static const BULLET_SPEED:int = 100;		
		public static const ENEMY_SPAWN_CHANCE:Number = 0.01;
		public static const ENEMY_VALUE:int = 100;
		public static const ENEMY_SPEED:int = 40;
		
		//Player / Game constants
		public static const PLAYER_AXIS_Y:Number = FP.height - 25;
		public static const PLAYER_START_Y:Number = FP.height + 10;
		public static const PLAYER_SPEED:Number = 100;
		public static const MAX_LIVES:Number = 3;
		public static const PLAYER_SPAWN_WAIT:Number = 0.5;
		public static const PLAYER_INVINCIBLE_TIME:Number = PLAYER_SPAWN_WAIT + 2.7;

		//collision typing
		public static const TYPE_WHITE_BULLET:String = "white_bullet";
		public static const TYPE_BLACK_BULLET:String = "black_bullet";
		public static const TYPE_ENEMY:String = "enemy";
		
		//explosion particle types
		public static const EXP_PLAYER_W:String = "explodeplayerwhite";
		public static const EXP_PLAYER_B:String = "explodeplayerblack";
		public static const EXP_ENEMY_W:String = "explodeenemywhite";
		public static const EXP_ENEMY_B:String = "explodeenemyblack";
		
		//draw sequence
		private static var lc:Number = 0;
		public static const LAYER_GUI:Number = lc++;
		public static const LAYER_ENEMY:Number = lc++;
		public static const LAYER_PLAYER:Number = lc++;
		public static const LAYER_PARTICLE:Number = lc++;
		public static const LAYER_BULLET:Number = lc++;
		public static const LAYER_BACKDROP:Number = lc++;
	}
}

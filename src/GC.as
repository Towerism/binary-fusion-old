package {

	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GC {
		[Embed(source = "/../assets/player.png")]
		public static const GFX_PLAYER:Class;
		public static const GFX_PLAYER_W:int = 12;

		[Embed(source = "/../assets/enemy.png")]
		public static const GFX_ENEMY:Class;
		public static const GFX_ENEMY_W:int = 10;

		[Embed(source = "/../assets/background_01.png")]
		public static const GFX_TITLE_TOP:Class;
		[Embed(source = "/../assets/background_02.png")]
		public static const GFX_TITLE_BOTTOM:Class;

		public static const BULLET_SPEED:int = 100;
		public static const ENEMY_SPEED:int = 40;
		public static const ENEMY_SPAWN_CHANCE:Number = 0.01;
		public static const ENEMY_VALUE:int = 100;
		public static const TIME_TO_RESPAWN:Number = 2;

		public static const TYPE_WHITE_BULLET:String = "white_bullet";
		public static const TYPE_BLACK_BULLET:String = "black_bullet";
		public static const TYPE_ENEMY:String = "enemy";
	}
}

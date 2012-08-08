package {
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Assets {
		[Embed(source="../assets/players/player.png")]
		public static const GFX_PLAYER:Class;
		
		[Embed(source="../assets/enemies/enemy.png")]
		public static const GFX_ENEMY_BASIC:Class;
		
		[Embed(source="../assets/enemies/bigenemy.png")]
		public static const GFX_ENEMY_LARGE:Class;
		
		[Embed(source="../assets/title/title_01.png")]
		public static const GFX_TITLE_TOP:Class;
		
		[Embed(source="../assets/title/title_02.png")]
		public static const GFX_TITLE_BOTTOM:Class;
		
		[Embed(source="../assets/bg/backdrop.png")]
		public static const GFX_BACKDROP:Class;
		
		[Embed(source="../assets/trophies/achieve_unlocked.png")]
		public static const GFX_ACHIEVE:Class
		
		[Embed(source="../assets/music/bgloop.mp3")]
		public static const SFX_BGLOOP:Class;
	}
}
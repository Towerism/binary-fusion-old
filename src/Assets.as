package {
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Assets {
		[Embed(source = "/../assets/player.png")]
		public static const GFX_PLAYER:Class;

		[Embed(source = "/../assets/enemy.png")]
		public static const GFX_ENEMY:Class;

		[Embed(source = "/../assets/background_01.png")]
		public static const GFX_TITLE_TOP:Class;
		
		[Embed(source = "/../assets/background_02.png")]
		public static const GFX_TITLE_BOTTOM:Class;		
	}
}
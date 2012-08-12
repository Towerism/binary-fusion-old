package enemies.formations {
	
	import net.flashpunk.*;
	
	import enemies.types.color.*;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Formations extends Entity{
		
		public const FORM_THREE_BASIC:Formation = new Formation;
		public const FORM_BOMB_OUTTER:Formation = new Formation;
		
		public function Formations() {
			FORM_THREE_BASIC.add([BasicWhite, BasicBlack, BasicWhite]);
			FORM_THREE_BASIC.define(0, -40, 0);
			FORM_THREE_BASIC.define(1, 0, 0);
			FORM_THREE_BASIC.define(2, 40, 0);
			
			FORM_BOMB_OUTTER.add([BombWhite, BombBlack]);
			FORM_BOMB_OUTTER.define(0, -130, 0);
			FORM_BOMB_OUTTER.define(1, 130, 0);		
		}
	}
}
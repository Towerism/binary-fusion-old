package enemies.formations {
	
	import flash.geom.Point;
	import net.flashpunk.*;
	
	import enemies.types.color.*;
	import enemies.types.*;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Formations extends Entity{
		
		public const FORM_LINE_3Bas:Formation = new Formation;
		public const FORM_LINE_3Lg:Formation = new Formation;
		public const FORM_LINE_3Bm:Formation = new Formation;
		public const FORM_LINE_2Bas:Formation = new Formation;
		public const FORM_LINE_2Bm:Formation = new Formation;
		public const FORM_LINE_2Lg:Formation = new Formation;
		
		public const FORM_SLANT_4Bas:Formation = new Formation;
		public const FORM_SLANT_4Lg:Formation = new Formation;
		
		public const FORM_ARROW_5Bas:Formation = new Formation;
		public const FORM_ARROW_5Lg:Formation = new Formation;
		
		public function Formations() {
			
			//Define Presets
			Formation.LINE_THREE.push(np(-40, 0),   np(0, 0),     np(40, 0)                            );
			Formation.OUTTER_TWO.push(np(-130, 0),  np(130, 0)                                         );
			Formation.SLANT_FOUR.push(np(-60, 0),   np(-20, -30), np(20, -60), np(60, -90)             );
			Formation.ARROW_FIVE.push(np(-80, -60), np(-40, -30), np(0, 0),    np(40, -30), np(80, -60));
		
			//=========================================================================
			//=========================    LINE formations    =========================
			//=========================================================================
			FORM_LINE_3Bas.add([BasicWhite, BasicBlack, BasicWhite], Formation.LINE_THREE);			
			FORM_LINE_3Lg.add([EnemyLarge, EnemyLarge, EnemyLarge], Formation.LINE_THREE);
			FORM_LINE_3Bm.add([BombBlack, BombWhite, BombBlack], Formation.LINE_THREE);
			
			//===========================================================================
			//=========================   Outter formations   ===========================
			//===========================================================================
			FORM_LINE_2Bas.add([BasicWhite, BasicBlack], Formation.OUTTER_TWO);			
			FORM_LINE_2Bm.add([BombWhite, BombBlack], Formation.OUTTER_TWO);			
			FORM_LINE_2Lg.add([EnemyLarge, EnemyLarge], Formation.OUTTER_TWO);			
			
			//========================================================================
			//=========================   SLANT formations    ========================
			//========================================================================
			FORM_SLANT_4Bas.add([BasicWhite, BasicBlack, BasicBlack, BasicWhite], Formation.SLANT_FOUR);			
			FORM_SLANT_4Lg.add([EnemyLarge, EnemyLarge, EnemyLarge, EnemyLarge], Formation.SLANT_FOUR);
			
			//========================================================================
			//=========================   ARROW formations    ========================
			//========================================================================
			FORM_ARROW_5Bas.add([BasicWhite, BasicBlack, BasicWhite, BasicBlack, BasicWhite], Formation.ARROW_FIVE);
			FORM_ARROW_5Lg.add([EnemyLarge, EnemyLarge, EnemyLarge, EnemyLarge, EnemyLarge], Formation.ARROW_FIVE);
			
		}
		
		private function np(x:Number = 0, y:Number = 0):Point {
			return new Point(x, y);
		}
	}
}
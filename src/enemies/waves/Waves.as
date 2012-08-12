package enemies.waves {
	
	import flash.geom.Point;
	import net.flashpunk.*;
	
	import enemies.formations.Formation;
	import enemies.formations.Formations;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Waves extends Entity{
		
		public const WAVE_3Bas_2Bm:Wave = new Wave();
		
		public function Waves() {
			var hw:Number = FP.halfWidth;
			
			WAVE_3Bas_2Bm.define("3Basic2Bombs");
			add(WAVE_3Bas_2Bm, GV.FORMATIONS.FORM_THREE_BASIC, new Point(hw, -25), 0);
			add(WAVE_3Bas_2Bm, GV.FORMATIONS.FORM_BOMB_OUTTER, new Point(hw, -25), 1);
		}
		
		private function add(w:Wave, form:Formation, point:Point, time:Number):void {
			FP.world.add(w);
			w.add(form, point, time);
		}
	}
}
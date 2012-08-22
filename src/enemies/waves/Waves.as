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
		private const _collection:Vector.<Wave> = new Vector.<Wave>;
		
		public const WAVE_3Bas:Wave = new Wave;
		public const WAVE_3Bas_2Bm:Wave = new Wave;
		public const WAVE_3Bas_2Lg:Wave = new Wave;
		
		public const WAVE_3Lg:Wave = new Wave;
		public const WAVE_3Lg_2Bm:Wave = new Wave;
		public const WAVE_3Lg_2Bas:Wave = new Wave;
		
		public const WAVE_3Bm:Wave = new Wave;
		public const WAVE_3Bm_2Lg:Wave = new Wave;
		public const WAVE_3Bm_2Bas:Wave = new Wave;
		
		public const WAVE_4Bas:Wave = new Wave;
		public const WAVE_4Bas_2Bm:Wave = new Wave;
		public const WAVE_4Bas_2Lg:Wave = new Wave;
		
		public const WAVE_4Lg:Wave = new Wave;
		public const WAVE_4Lg_2Bm:Wave = new Wave;
		public const WAVE_4Lg_2Bas:Wave = new Wave;
		
		public const WAVE_5Bas:Wave = new Wave;
		public const WAVE_5Bas_2Bm:Wave = new Wave;
		public const WAVE_5Bas_2Lg:Wave = new Wave;
		
		public const WAVE_5Lg:Wave = new Wave;
		public const WAVE_5Lg_2Bm:Wave = new Wave;
		public const WAVE_5Lg_2Bas:Wave = new Wave;
		
		
		public function Waves() {
			var hw:Number = FP.halfWidth;
			//--------------- Basic (3) Waves ---------------
			add(WAVE_3Bas, GV.FORMATIONS.FORM_LINE_3Bas, new Point(hw, -25), 0, true);
			
			add(WAVE_3Bas_2Bm, GV.FORMATIONS.FORM_LINE_3Bas, new Point(hw, -25), 0, true);
			add(WAVE_3Bas_2Bm, GV.FORMATIONS.FORM_LINE_2Bm, new Point(hw, -100), 1);
			
			add(WAVE_3Bas_2Lg, GV.FORMATIONS.FORM_LINE_3Bas, new Point(hw, -25), 0, true);
			add(WAVE_3Bas_2Lg, GV.FORMATIONS.FORM_LINE_2Lg, new Point(hw, -25), 0);
			
			//--------------- Bomb (3) Waves ---------------
			add(WAVE_3Bm, GV.FORMATIONS.FORM_LINE_3Bm, new Point(hw, -100), 0, true);
			
			add(WAVE_3Bm_2Lg, GV.FORMATIONS.FORM_LINE_2Lg, new Point(hw, -25), 0, true);
			add(WAVE_3Bm_2Lg, GV.FORMATIONS.FORM_LINE_3Bm, new Point(hw, -100), 2);
			
			add(WAVE_3Bm_2Bas, GV.FORMATIONS.FORM_LINE_2Bas, new Point(hw, -25), 0, true);
			add(WAVE_3Bm_2Bas, GV.FORMATIONS.FORM_LINE_3Bm, new Point(hw, -100), 0);
			
			//--------------- Large (3) Waves ---------------
			add(WAVE_3Lg, GV.FORMATIONS.FORM_LINE_3Lg, new Point(hw, -25), 0, true);
			
			add(WAVE_3Lg_2Bm, GV.FORMATIONS.FORM_LINE_3Lg, new Point(hw, -25), 0, true);
			add(WAVE_3Lg_2Bm, GV.FORMATIONS.FORM_LINE_2Bm, new Point(hw, -100), 2);
			
			add(WAVE_3Lg_2Bas, GV.FORMATIONS.FORM_LINE_3Lg, new Point(hw, -25), 0, true);
			add(WAVE_3Lg_2Bas, GV.FORMATIONS.FORM_LINE_2Bas, new Point(hw, -25), 0);
			
			//--------------- Basic (4) Waves ---------------
			add(WAVE_4Bas, GV.FORMATIONS.FORM_SLANT_4Bas, new Point(hw, -25), 0, true);
			
			add(WAVE_4Bas_2Bm, GV.FORMATIONS.FORM_SLANT_4Bas, new Point(hw, -25), 0, true);
			add(WAVE_4Bas_2Bm, GV.FORMATIONS.FORM_LINE_2Bm, new Point(hw, -100), 1);
			
			add(WAVE_4Bas_2Lg, GV.FORMATIONS.FORM_SLANT_4Bas, new Point(hw, -25), 0, true);
			add(WAVE_4Bas_2Lg, GV.FORMATIONS.FORM_LINE_2Lg, new Point(hw, -25), 0);
			
			//--------------- Large (4) Waves ---------------
			add(WAVE_4Lg, GV.FORMATIONS.FORM_SLANT_4Lg, new Point(hw, -25), 0, true);
			
			add(WAVE_4Lg_2Bm, GV.FORMATIONS.FORM_SLANT_4Lg, new Point(hw, -25), 0, true);
			add(WAVE_4Lg_2Bm, GV.FORMATIONS.FORM_LINE_2Bm, new Point(hw, -100), 2);
			
			add(WAVE_4Lg_2Bas, GV.FORMATIONS.FORM_SLANT_4Lg, new Point(hw, -25), 0, true);
			add(WAVE_4Lg_2Bas, GV.FORMATIONS.FORM_LINE_2Bas, new Point(hw, -25), 0);
			
			//--------------- Basic (5) Waves ---------------
			add(WAVE_5Bas, GV.FORMATIONS.FORM_ARROW_5Bas, new Point(hw, -25), 0, true);
			
			add(WAVE_5Bas_2Bm, GV.FORMATIONS.FORM_ARROW_5Bas, new Point(hw, -25), 0, true);
			add(WAVE_5Bas_2Bm, GV.FORMATIONS.FORM_LINE_2Bm, new Point(hw, -100), 1);
			
			add(WAVE_5Bas_2Lg, GV.FORMATIONS.FORM_ARROW_5Bas, new Point(hw, -25), 0, true);
			add(WAVE_5Bas_2Lg, GV.FORMATIONS.FORM_LINE_2Lg, new Point(hw, -25), 0);
			
			//--------------- Large (5) Waves ---------------
			add(WAVE_5Lg, GV.FORMATIONS.FORM_ARROW_5Lg, new Point(hw, -25), 0, true);
			
			add(WAVE_5Lg_2Bm, GV.FORMATIONS.FORM_ARROW_5Lg, new Point(hw, -25), 0, true);
			add(WAVE_5Lg_2Bm, GV.FORMATIONS.FORM_LINE_2Bm, new Point(hw, -100), 2);
			
			add(WAVE_5Lg_2Bas, GV.FORMATIONS.FORM_ARROW_5Lg, new Point(hw, -25), 0, true);
			add(WAVE_5Lg_2Bas, GV.FORMATIONS.FORM_LINE_2Bas, new Point(hw, -25), 0);
		}
		
		private function add(w:Wave, form:Formation, point:Point, time:Number = 0, first:Boolean = false):void {
			FP.world.add(w);
			w.add(form, point, time);
			
			if (first) _collection.push(w);
		}
		
		public function get collection():Vector.<Wave> {
			return _collection;
		}
	}
}
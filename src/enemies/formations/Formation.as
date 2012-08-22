package enemies.formations {
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import net.flashpunk.*;
	
	import enemies.Enemy;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Formation {
		
		//Preset formation positions
		public static const LINE_THREE:Vector.<Point> = new Vector.<Point>;
		public static const OUTTER_TWO:Vector.<Point> = new Vector.<Point>;
		public static const SLANT_FOUR:Vector.<Point> = new Vector.<Point>;
		public static const ARROW_FIVE:Vector.<Point> = new Vector.<Point>;	
		
		private var _members:Vector.<Class> = new Vector.<Class>();
		private var _coords:Vector.<Point> = new Vector.<Point>();
		
		public function Formation() {
		}
		
		public function add(list:Array, points:Vector.<Point>):void {
			for (var i:int; i < list.length; i++) {
				_members.push(list[i]);
				_coords.push(new Point);
			}
			
			for (var j:int; j < _members.length; j++) {
				_coords[j].x = points[j].x;
				_coords[j].y = points[j].y;
				
			}
		}

		public function spawn(offsetx:Number, offsety:Number):Array {
			var spawnArray:Array = new Array();
			for (var i:int; i < _members.length; i++) {
				var e:Enemy = FP.world.add(new _members[i]) as Enemy;
				e.x = _coords[i].x + offsetx;
				e.y = _coords[i].y + offsety;
				spawnArray.push(e);
			}
			
			return spawnArray;
		}
	}
}
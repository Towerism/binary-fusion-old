package enemies.formations {
	
	import flash.geom.Point;
	import net.flashpunk.*;
	
	import enemies.Enemy;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Formation extends Entity {
		
		private var _members:Vector.<Class> = new Vector.<Class>();
		private var _coords:Vector.<Point> = new Vector.<Point>();
		
		public function Formation() {
		}
		
		public function add(list:Array):void {
			for (var i:int; i < list.length; i++) {
				_members.push(list[i]);
				_coords.push(new Point);
			}
		}
		
		public function define(index:int, posx:Number, posy:Number):void {
			_coords[index].x = posx;
			_coords[index].y = posy;
		}
		public function spawn(offsetx:Number, offsety:Number):Array {
			var spawnArray:Array = new Array();
			for (var i:int; i < _members.length; i++) {
				var e:Entity = FP.world.add(new _members[i]);
				e.x = _coords[i].x + offsetx;
				e.y = _coords[i].y + offsety;
				spawnArray.push(e);
			}
			
			return spawnArray;
		}	
	}
}
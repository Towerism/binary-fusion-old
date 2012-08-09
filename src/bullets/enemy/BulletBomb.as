package bullets.enemy {
	
	import bullets.enemy.BulletEnemy;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class BulletBomb extends BulletEnemy {
		
		public function BulletBomb(color:uint=0xffffff, x:Number = 0, y:Number = 0, dir:Number = 270) {
			super(x, y, dir);
			Image(graphic).color = color;
		}		
	}
}
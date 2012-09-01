package enemies {

	import enemies.types.EnemyBomb;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import ui.Score;

	import bullets.*;

	/**
	 * { Description of Enemy.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class Enemy extends Entity {

		protected static const WHITE:String = "white";
		protected static const BLACK:String = "black";

		protected static const OUT_OF_BOUNDS:String = "outofbounds";
		protected static const DEATH:String = "death";
		protected static const DETONATE:String = "detonate";
		
		protected static const SMALL:String = "small";
		protected static const LARGE:String = "large";
		
		private var _value:int;
		private var _explosionType:String;
		private var _myColor:String;
		private var _expSize:String;
		private var _speed:Number;

		public function Enemy(gfx:Image, explodeSize:String, x:Number = 0, y:Number = 0) {
			super(x, y);
			graphic = gfx;
			gfx.centerOO();
			graphic.scrollX = 0;
			graphic.scrollY = 0;
			var img:Image = Image(graphic)
			this.setHitbox(img.width, img.height, img.width / 2, img.height / 2);
			this.type = GC.TYPE_ENEMY;
			layer = GC.LAYER_ENEMY;
			_expSize = explodeSize;
		}

		//it is better to override the hit method if you wish to only change bullet collide action
		override public function update():void {
			if (_speed) y += FP.elapsed * _speed;
			if (y > FP.screen.height + Image(graphic).height)
				destroy(OUT_OF_BOUNDS);
			var b:Bullet = this.collideTypes([GC.TYPE_WHITE_BULLET_P, GC.TYPE_BLACK_BULLET_P], x, y) as Bullet;
			if (b != null) {
				hit(b);
			}
		}

		//You must override this method if you wish to do something different then destroy instantly
		protected function hit(b:Bullet):void {
			b.destroy();
		}
		
		protected function explode(exp:String):void {
			GV.PARTICLE_CONTROLLER.explodeStandard(x, y, exp);
		}
		
		public function destroy(reason:String):void {
			if (reason == DEATH) {
				onDeath();
			}
			
			if (reason == DETONATE) {
				onDetonate();
			}
			
			if (reason == OUT_OF_BOUNDS) {
				onOutOfBounds();
			}
			this.world.remove(this);
		}
		
		//override these three functions if you need to do specific actions when these events occur
		protected function onDeath():void {
			new Score(_value, new Point(x, y));
			explode(_explosionType);
		}
		
		protected function onDetonate():void { }
		
		protected function onOutOfBounds():void { }
		
		protected function set value(v:int):void {
			_value = v;
		}
	
		protected function get speed():Number {
			return _speed;
		}
		
		protected function set speed(value:Number):void {
			_speed = value;
		}	
		
		protected function set myColor(s:String):void {
			Image(graphic).color = (s == WHITE) ? 0xffffff : 0x0;
			if (s == WHITE && _expSize == SMALL) _explosionType = GC.EXP_SMALL_W;
			else if (s == WHITE && _expSize == LARGE) _explosionType = GC.EXP_LARGE_W;
			else if (s == BLACK && _expSize == SMALL) _explosionType = GC.EXP_SMALL_B;
			else if (s == BLACK && _expSize == LARGE) _explosionType = GC.EXP_LARGE_B;
			_myColor = s;
		}
		
		protected function get myColor():String {
			return _myColor;
		}
	}
}

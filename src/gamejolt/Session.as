package gamejolt {
	
	import gamejolt.core.*;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Session extends GJAPI {
		
		private var _timer:Number = 0;
		
		public function Session(newSession:Boolean = false, doAuth:Boolean=false) {
			super(doAuth);
			if (newSession && isAuth) api.sessionOpen(gid, privKey, key, onSessionOpen, user, token);
		}
		
		override public function update():void {
			_timer += FP.elapsed;
			if (_timer > 120 && isAuth) {
				_timer -= 120;
				api.sessionOpen(gid, privKey, newKey(), onSessionOpen, user, token);
			}
			
			if (_timer > 30 && isAuth) {
				api.sessionPing(gid, privKey, key, onSessionPing, user, token);
				_timer -= 30;
			}
		}
		
		private function onSessionOpen():void { }
		private function onSessionPing():void { }
	}
}
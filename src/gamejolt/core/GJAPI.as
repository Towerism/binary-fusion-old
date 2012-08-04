package gamejolt.core {
	
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.system.Security;
	import gamejolt.core.*;
	import net.flashpunk.*;
	
	//gj
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class GJAPI extends Entity {

		private static var _gid:int = 8910;
		private static var _privKey:String = "bceb4a2a8ab749dea8b1f3897c482f9d";
		private static var _user:String = "flashvars";
		private static var _token:String = "null";
		private static var _isAuth:Boolean = false;
		private static var _key:String = MD5.encrypt(String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000) + String(FP.rand(899999999) + 100000000));
		
		private var _api:API = new API;
		
		public function GJAPI(doAuth:Boolean = false) {
			if (doAuth) {
				//gjapi flashvars gjapi_username, gjapi_token
				if (FP.flashvars != null) {
					if (FP.flashvars.hasOwnProperty("gjapi_username") && FP.flashvars.hasOwnProperty("gjapi_token")) {
						_user = FP.flashvars.gjapi_username;
						_token = FP.flashvars.gjapi_token;
					}
				}
				_api.authUser(gid, privKey, user, token, onAuthSuccess);
			}
		}
		
		private function onAuthSuccess(success:Boolean):void {
			_isAuth = success;
			if (_isAuth) {
				FP.log(_user + " :: " + _token + " authenticated successfully!");
			}
			else {
				FP.log(_user + " :: " + _token + " could NOT be authenticated!");
			}
		}
		
		protected function newKey(strength:int = 32):String {
			var tempString:String = "";
			for (var i:int; i < strength; i++) {
				tempString += String(FP.rand(899999999) + 100000000);
			}
			_key = MD5.encrypt(tempString);
			return _key;
		}
		
		protected function get gid():int {
			return GJAPI._gid;
		}
		
		protected function get privKey():String {
			return GJAPI._privKey;
		}
		
		protected function get user():String {
			return GJAPI._user;
		}
		
		protected function get token():String {
			return GJAPI._token;
		}
		
		protected function get isAuth():Boolean {
			return GJAPI._isAuth;
		}
		
		protected function get key():String {
			return _key;
		}
		
		protected static function set key(s:String):void {
			GJAPI._key = s;
		}
		
		protected function get api():API {
			return _api;
		}
	}
}
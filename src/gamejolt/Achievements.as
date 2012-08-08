package gamejolt {

	import gamejolt.core.GJAPI;
	import net.flashpunk.*;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author Martin L. Fracker, Jr.
	 */
	public class Achievements extends GJAPI {
		/*
		 * names of index for _tempTrophyData after Trophy is called
		 * ["id"][1] will return the id of the second trophy in the array
		 * id of achievement
		 * title of achievement
		 * description of achievement
		 * difficulty of achievement
		 * image_url of achievement
		 * achieved of achievement
		*/
		
		private var _gfx:Image = new Image(Assets.GFX_ACHIEVE);
		private var _glist:Graphiclist;
		private var _tempTrophyData:Array = [];
		
		private var _nextUnlock:Boolean = true;
		private var _unlockChain:Array = [];
		private var _isTopChain:Array = [];
		private var _isTop:Boolean = true;
		
		private var _unlockTween:VarTween;
		private var _fadeTween:VarTween;
		private var _waitTween:VarTween;
		public var _wait:int = 0;
		
		private var _achNameText:Text;
		private var _achUnlockText:Text;
		private var _achUnlockTextOffsetY:Number;
		private var _achNameTextOffsetY:Number;
		private var _achNameTextOffsetX:Number;
		
		private var _startX:Number = (FP.screen.width - _gfx.width) / 2;
		private var _ypadding:Number = 5;
		private var _topStartY:Number = -_gfx.height;
		private var _bottomStartY:Number = FP.screen.height;
		private var _topEndY:Number = _ypadding;
		private var _bottomEndY:Number = FP.screen.height - _ypadding - _gfx.height;
		private var _startY:Number = _topStartY;
		private var _endY:Number = _topEndY;
		
		public function Achievements(doAuth:Boolean = false) {
			super(doAuth);
			
			_achNameTextOffsetX = 49;
			_achNameTextOffsetY = 35;
			_achUnlockTextOffsetY = 3;
			_achNameText = new Text("Achivement Name Here", _achNameTextOffsetX, _achNameTextOffsetY, { size:17, width:_gfx.width - _achNameTextOffsetX - 4, align:"center" } );
			_achUnlockText = new Text("Trophy Added!", 1, _achUnlockTextOffsetY, {size:17, width:_gfx.width, align:"center"});
			_glist = new Graphiclist(_gfx, _achNameText, _achUnlockText);
			
			graphic = _glist;
			x = _startX;
			y = _startY;

			_unlockTween = new VarTween(onUnlockComplete, Tween.PERSIST);
			addTween(_unlockTween);
			_waitTween = new VarTween(onWaitComplete, Tween.PERSIST);
			addTween(_waitTween);
			_fadeTween = new VarTween(onFadeComplete, Tween.PERSIST);
			addTween(_fadeTween);
			
			layer = GC.LAYER_ACHIEVEMENT;
		}
		
		public function unlock(trophyid:int, isTop:Boolean = true):void {
			getTrophy(trophyid);
			_isTop = isTop;
		}
		
		private function processUnlockChain():void {
			if (_nextUnlock && _unlockChain.length > 0) {
				_startY = (_isTopChain[0]) ? _topStartY : _bottomStartY;
				_endY = (_isTopChain[0]) ? _topEndY: _bottomEndY;
				y = _startY;
				if (isAuth) {
					api.addTrophyAchieved(gid, privKey, user, token, _unlockChain[0])
					_achNameText.text = _tempTrophyData["title"][0];
					_unlockTween.tween(this, "y", _endY, 1, Ease.quadOut);
					_unlockTween.start();
					_nextUnlock = false;
				}
				_unlockChain.shift();
				_isTopChain.shift();
			}	
		}
		
		private function getTrophy(trophyid:int):void {
			if (isAuth) api.getTrophyData(gid, privKey, user, token, trophyid, processTrophyData);
		}
		
		private function processTrophyData(a:Array):void {
			_tempTrophyData = a;
			var achieved:Boolean = (_tempTrophyData["achieved"][0] == "false") ? false : true;
			var trophyid:int = _tempTrophyData["id"][0] as int;
			if (!achieved) {
				FP.log(_unlockChain.indexOf(trophyid));
				if (_unlockChain.indexOf(trophyid) == -1 ) {
					_unlockChain.push(trophyid);
					_isTopChain.push(_isTop);
				}
			}
		}
		
		private function resetArrays():void {
			_isTopChain = [];
			_unlockChain = [];
		}
		
		override public function update():void {
			_achNameText.alpha = _gfx.alpha;
			_achUnlockText.alpha = _gfx.alpha;
			processUnlockChain();
		}
		
		private function onUnlockComplete():void {
			_waitTween.tween(this, "_wait", 0, 1.5);
			_waitTween.start();
		}
		
		private function onWaitComplete():void {
			_fadeTween.tween(_gfx, "alpha", 0, 1, Ease.quadIn);
			_fadeTween.start();
		}
		
		private function onFadeComplete():void {
			resetArrays();
			_nextUnlock = true;
			_gfx.alpha = 1;
			y = FP.screen.height; 
		}
		
		public function get startX():Number {
			return _startX;
		}
		
		public function get startY():Number {
			return _startY;
		}
		
		public static const ACH_CREDITS:int = 664;
		public static const ACH_RACIST:int = 666;
	}
}
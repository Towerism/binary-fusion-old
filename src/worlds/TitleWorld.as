package worlds {

	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.*;
	import gamejolt.*;
	import punk.ui.*;

	/**
	 * { Description of TitleWorld.as here }
	 * @author Martin L. Fracker, Jr.
	 */
	public class TitleWorld extends World {

		private var _startMusicTimer:Number = 0;
		
		private var _topTitle:Entity;
		private var _bottomTitle:Entity;
		private var _bottomTitleNormalY:Entity;
		private var _backdrop:Backdrop
		
		private var _versionText:Text;	
		private var _creditText:PunkText;	
		private var _creditUnlocked:Boolean = false;
		
		private var _playButton:PunkButton;
		private var _creditButton:PunkButton;
		private var _musicButton:PunkButton;
		private var _creditBackButton:PunkButton;
		
		private var _buttonsWidth:Number = 100;
		private var _buttonsHeight:Number = 30;
		private var _buttonsStartY:Number = 435;
		private var _buttonsPadding:Number = 10;
		private var _buttonsSpacing:Number = _buttonsHeight + _buttonsPadding;
		private var _buttonTweenTimer:Number = 0;
		private var _startButtons:Boolean = false;

		public function TitleWorld() {
			super();
		}

		override public function begin():void {
			_backdrop = new Backdrop(Assets.GFX_BACKDROP, true, true);
			addGraphic(_backdrop, 200);
			
			_versionText = new Text("v"+GC.VERSION, -2, 2, {size:12, align:"right", width:FP.screen.width, color:0xffffff});
			addGraphic(_versionText, -5);
			
			_creditText = new PunkText("[Programming / Art] by Martin (Towerism)\n\n[Music] by SkyeWintrest @ New Grounds", 0, 0, { size:12, align:"center", width:FP.screen.width, color:0xffffff, outlineColor:0x000000, outlineStrength:2} );
			//_creditText.x = (FP.screen.width - _creditText.textWidth) / 2;
			_creditText.y = (FP.screen.height - _creditText.textHeight + _creditText.textHeight) / 2 + 110;
			_creditText.visible = false;
			addGraphic(_creditText, 1);
			
			_topTitle = addGraphic(new Image(Assets.GFX_TITLE_TOP));
			_topTitle.y = -FP.screen.height / 2;
			_bottomTitle = addGraphic(new Image(Assets.GFX_TITLE_BOTTOM));
			_bottomTitle.y = FP.screen.height;
			if (GV.GAME_IS_NEW) {
				Tween.to(_topTitle, 1.5, { y:0 }, onIntroEnd, Ease.bounceOut);
				Tween.to(_bottomTitle, 1.5, { y:FP.screen.height / 2 }, null, Ease.bounceOut);
			} else {
				Tween.to(_topTitle, 1, { y:0 }, onIntroEnd, Ease.quadOut);
				Tween.to(_bottomTitle, 1, { y:FP.screen.height / 2 }, null, Ease.quadOut);
			}
			
			var bCount:int = 0;
			_playButton = new PunkButton( -_buttonsWidth, _buttonsStartY + _buttonsSpacing * bCount++, _buttonsWidth, _buttonsHeight, "Begin", onPlay, 0, null);
				add(_playButton);
			_creditButton = new PunkButton(-_buttonsWidth, _buttonsStartY + _buttonsSpacing * bCount++, _buttonsWidth, _buttonsHeight, "Credits", onCredit, 0, null);
				add(_creditButton);
			_musicButton = new PunkButton( -_buttonsWidth, _buttonsStartY + _buttonsSpacing * bCount++, _buttonsWidth, _buttonsHeight, (Audio.bgloop.volume) ? "Music On" : "Music Off", onMusic, 0, null);
				add(_musicButton);
			_creditBackButton = new PunkButton( 0 , _creditText.y + _creditText.textHeight + 10, _buttonsWidth, _buttonsHeight, "Back", onCreditBack, 0, null);
				_creditBackButton.x = buttonCenter(_creditBackButton);
				add(_creditBackButton);
				_creditBackButton.layer = 1;
				_creditBackButton.visible = false;
		}
		
		private function buttonCenter(e:PunkButton):uint {
			e.label.color = 0xffffff;
			return (FP.screen.width - _buttonsWidth) / 2;
		}
		
		private function updateButtonYtoEntity(e:PunkButton, o:Entity, offset:Number, mult:Number):void {
			var _offset:Number = offset * mult + 100;
			if (e.y != o.y + _offset) {
				e.y = o.y + _offset;
			}
		}
		
		private function startButtonTween(b:PunkButton, callback:Function = null):void {
			Tween.to(b, 1, { x:buttonCenter(b) }, callback, Ease.expoOut);
		}

		override public function update():void {
			
			_startMusicTimer += FP.elapsed;
			if (_startMusicTimer >= 0.5 && !Audio.bgloop.playing) {
				Audio.bgloop.loop();
			}
			
			if (_startButtons) {
				_buttonTweenTimer += FP.elapsed;
				if (_buttonTweenTimer >= 0 && _buttonTweenTimer <= .1) startButtonTween(_playButton);
				if (_buttonTweenTimer >= .1 && _buttonTweenTimer <= .2) startButtonTween(_creditButton);
				if (_buttonTweenTimer >= .2) startButtonTween(_musicButton, onButtonsDone);
			}
			
			updateButtonYtoEntity(_playButton, _bottomTitle, _buttonsSpacing, 0);
			updateButtonYtoEntity(_creditButton, _bottomTitle, _buttonsSpacing, 1);
			updateButtonYtoEntity(_musicButton, _bottomTitle, _buttonsSpacing, 2);
			
			super.update();
		}
		
		private function onPlay():void {
			Tween.to(_topTitle, 1, { y: -FP.screen.height / 2 }, onTransitionPlay, Ease.quadIn);
			Tween.to(_bottomTitle, 1, { y: FP.screen.height }, null, Ease.quadIn);
			//FP.world = new GameWorld;
		}
		
		private function onCredit():void {
			_creditText.visible = true;
			_creditBackButton.visible = true;
			Tween.to(_bottomTitle, 0.7, {y:FP.screen.height + _bottomTitle.height}, awardTrophy, Ease.quadOut);
			
		}
		
		private function awardTrophy():void {
			GV.ACHIEVEMENTS.unlock(Achievements.ACH_CREDITS);
		}
		
		private function onCreditBack():void {
			Tween.to(_bottomTitle, 0.7, {y:FP.screen.height / 2}, creditsHide, Ease.quadOut);
		}
		
		private function creditsHide():void {
			_creditText.visible = false;
			_creditBackButton.visible = false;
		}
		
		private function onMusic():void {
			if (Audio.bgloop.volume) {
				Audio.bgloop.volume = 0;
				_musicButton.label.text = "Music Off";
			} else {
				Audio.bgloop.volume = 1;
				_musicButton.label.text = "Music On";
			}
		}
		
		private function onButtonsDone():void {
			_startButtons = false;
		}
			
		private function onIntroEnd():void {
			_startButtons = true;
		}
		
		private function onTransitionPlay():void {
			FP.world = new GameWorld;
		}
	}
}

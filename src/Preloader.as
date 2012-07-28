package {

	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.getDefinitionByName;

	[SWF(width = "320", height = "600")]
	public class Preloader extends Sprite {
		// Change these values
		private static const mustClick:Boolean = false;
		private static const mainClassName:String = "Main";

		private static const BG_COLOR:uint = 0x000000;
		private static const FG_COLOR:uint = 0xFFFFFF;

		[Embed(source = 'net/flashpunk/graphics/04B_03__.TTF', embedAsCFF = "false", fontFamily = 'default')]
		private static const FONT:Class;

		// Ignore everything else


		private var progressBar:Shape;
		private var text:TextField;

		private var px:int;
		private var py:int;
		private var w:int;
		private var h:int;
		private var sw:int;
		private var sh:int;
		private var doStart:Boolean;

		public function Preloader() {
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			doStart = false;

			w = stage.stageWidth * 0.8;
			h = 20;

			px = (sw - w) * 0.5;
			py = (sh - h) * 0.5;

			graphics.beginFill(BG_COLOR);
			graphics.drawRect(0, 0, sw, sh);
			graphics.endFill();

			graphics.beginFill(FG_COLOR);
			graphics.drawRect(px - 2, py - 2, w + 4, h + 4);
			graphics.endFill();

			progressBar = new Shape();

			addChild(progressBar);

			text = new TextField();

			text.textColor = FG_COLOR;
			text.selectable = false;
			text.mouseEnabled = false;
			text.defaultTextFormat = new TextFormat("default", 16);
			text.embedFonts = true;
			text.autoSize = "left";
			text.text = "0%";
			text.x = (sw - text.width) * 0.5;
			text.y = sh * 0.5 + h;

			addChild(text);

			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);

			if (mustClick) {
				stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			}
		}

		public function onEnterFrame(e:Event):void {
			if (hasLoaded()) {
				graphics.clear();
				graphics.beginFill(BG_COLOR);
				graphics.drawRect(0, 0, sw, sh);
				graphics.endFill();

				if (!mustClick) {
					startup();
				} else {
					text.scaleX = 2.0;
					text.scaleY = 2.0;

					text.text = "Click to start";

					text.y = (sh - text.height) * 0.5;
				}
			} else {
				var p:Number = (loaderInfo.bytesLoaded / loaderInfo.bytesTotal);

				progressBar.graphics.clear();
				progressBar.graphics.beginFill(BG_COLOR);
				progressBar.graphics.drawRect(px, py, p * w, h);
				progressBar.graphics.endFill();

				text.text = int(p * 100) + "%";
			}

			text.x = (sw - text.width) * 0.5;
		}

		private function onMouseDown(e:MouseEvent):void {
			if (hasLoaded()) {
				stage.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				startup();
			}
		}

		private function hasLoaded():Boolean {
			return (loaderInfo.bytesLoaded >= loaderInfo.bytesTotal);
		}

		private function startup():void {
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);

			var mainClass:Class = getDefinitionByName(mainClassName) as Class;
			parent.addChild(new mainClass as DisplayObject);

			parent.removeChild(this);
		}
	}
}
/*package {

	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.getDefinitionByName;

	[SWF(width = "320", height = "600")]
	public class Preloader extends MovieClip {
		private var loader:Sprite = new Sprite();
		private var border:Sprite = new Sprite();
		private var text:TextField = new TextField();

		private const loaderWidth:int = 320;
		private const loaderHeight:int = 32;

		private const loaderColor:uint = 0xAFAFAF;
		private const textColor:uint = 0xbbbbbb;
		private const backgroundColor:uint = 0x888888;

		private const main:String = "Main";
		private var loaded:Number = 0;

		public function Preloader() {
			// loader information
			stage.addEventListener(Event.ENTER_FRAME, progress);

			// show loader
			addChild(loader);
			loader.x = (stage.stageWidth / 2) - (loaderWidth / 2) + 4;
			loader.y = (stage.stageHeight / 2) - (loaderHeight / 2) + 4;

			addChild(border);
			border.x = (stage.stageWidth / 2) - (loaderWidth / 2);
			border.y = (stage.stageHeight / 2) - (loaderHeight / 2);

			addChild(text);
			text.x = (stage.stageWidth / 2) - (loaderWidth / 2);
			text.y = (stage.stageHeight / 2) - (loaderHeight / 2) - 30;
			text.textColor = textColor;

			// render background
			graphics.beginFill(backgroundColor, 1);
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			graphics.endFill();

			// render the border
			border.graphics.clear();
			border.graphics.lineStyle(2, loaderColor);
			border.graphics.drawRect(0, 0, loaderWidth, loaderHeight);
		}

		private function progress(e:Event):void {
			// how much we've loaded thus far
			loaded = loaderInfo.bytesLoaded / loaderInfo.bytesTotal;

			// update loader graphic
			loader.graphics.clear();
			loader.graphics.beginFill(loaderColor);
			loader.graphics.drawRect(0, 0, loaded * (loaderWidth - 8), loaderHeight - 8);
			loader.graphics.endFill();

			// update text
			text.text = "Loading: " + Math.ceil(loaded * 100) + "%";
			trace(text.text);

			// done loading?
			if (loaderInfo.bytesLoaded >= loaderInfo.bytesTotal) {
				startup();
			}
		}

		private function startup():void {
			// remove event listener(s)
			stage.removeEventListener(Event.ENTER_FRAME, progress);

			// hide loader
			stop();

			// remove all the children
			var i:int = numChildren;
			while (i--) {
				removeChildAt(i)
			}

			// go to the main class
			var mainClass:Class = getDefinitionByName(main) as Class;
			parent.addChild(new mainClass as DisplayObject);

			// remove self
			parent.removeChild(this)
		}
	}
}*/

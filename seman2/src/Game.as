package 
{
	import flash.display.DisplayObject;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author Dudu
	 */
	public class Game extends Sprite 
	{
		private var timer:Timer;
		private var numbebes:int;
				
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		
		public function start():void 
		{
			var fondo:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("scene1"));
			addChild(fondo);
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER, ontimer);
			timer.start();
			
		}
		
		private function ontimer(e:TimerEvent):void 
		{	
		
			var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
			addChild(mc);
			mc.x = Math.random() * stage.stageWidth;
			mc.y = Math.random() * stage.stageHeight;
			Starling.juggler.add(mc);
			mc.name = 'hero';
			numbebes += 1;
			mc.addEventListener(TouchEvent.TOUCH, touching);
			if (numbebes == 10)
			{
				var over:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("game_over"));
				addChild(over);
				over.x = 125;
				over.y = 250;
				timer.removeEventListener(TimerEvent.TIMER, ontimer);
			}
			if (timer.currentCount % 4 == 0)
			{
				var coin:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("coin"));
				addChild(coin);
				coin.x = Math.random() * stage.stageWidth;
				coin.y = Math.random() * stage.stageHeight;
				coin.name = 'dinero';
			}
		}
		
		
		private function touching(e:TouchEvent):void 
		{
			//var mc:MovieClip = e.currentTarget as MovieClip;
			var touch:Touch = e.getTouch(this);
			if (touch != null) 
			{
				if (touch.phase == TouchPhase.BEGAN)
					{
						var content:DisplayObject = e.target as DisplayObject;
						if (content.name == 'dinero' || content.name == 'hero') 
						{
							removeChild(content);
						}
					//trace(e.target);
					//removeChild(mc);
					//Starling.juggler.remove(mc);
					//mc.removeEventListener(TouchEvent.TOUCH, touching);
					}
				}
				
			}
		}
		
	}


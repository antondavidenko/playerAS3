package view.ui
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class AbstractButtonUI
	{
		protected var _skin:MovieClip;
		protected var _iconID:String;
		protected var _callback:Function;
		
		protected const AREA:String = "area";
		protected const LIGHTER:String = "lighter";
		
		public function AbstractButtonUI($skin:DisplayObject, $iconID:String, $callback:Function)
		{
			_skin = MovieClip($skin);
			_iconID = $iconID;
			_callback = $callback;
			
			showIcon(_iconID);
			
			_skin.getChildByName(AREA).addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_skin.getChildByName(AREA).addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_skin.getChildByName(AREA).addEventListener(MouseEvent.CLICK, onMouseClick);
			
			if (_skin.getChildByName(LIGHTER))
			{
				(_skin.getChildByName(LIGHTER) as MovieClip).addEventListener(Event.ENTER_FRAME, onLighterEnterFrame);
			}
		}
	
		protected function onLighterEnterFrame(e:Event):void
		{
			if ((e.target as MovieClip).currentFrame == (e.target as MovieClip).totalFrames)
			{
				(e.target as MovieClip).stop();
				(e.target as MovieClip).visible = true;
			}
		}		
	
		protected function onMouseOut(e:Event):void
		{
			showIcon(_iconID);
		}
		
		protected function onMouseOver(e:Event):void
		{
			showIcon(_iconID, true);
		}
		
		protected function onMouseClick(e:Event):void
		{
			(_skin.getChildByName(LIGHTER) as MovieClip).play();
			_callback.call(null, _iconID);			
		}
		
		protected function showIcon($iconID:String, $active:Boolean = false):void
		{
			(_skin.getChildByName(_iconID) as Sprite).visible = !$active;
			(_skin.getChildByName(_iconID+"_") as Sprite).visible = $active;
		}
	}
}
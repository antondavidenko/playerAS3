package view.ui
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class LiveButtonUI extends AbstractButtonUI
	{
		private const LIVE_ICON:String = "live";
		
		public function LiveButtonUI($skin:DisplayObject, $callback:Function)
		{
			super($skin, LIVE_ICON, $callback);
		}
		
		override protected function onMouseClick(e:Event):void
		{
			(_skin.getChildByName(LIGHTER) as MovieClip).play();
			_callback.call(null, -2);			
		}		
	}
}
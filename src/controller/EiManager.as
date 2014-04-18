package controller
{
	import flash.external.ExternalInterface;

	public class EiManager
	{
		protected var _callback:Function;
		
		public function EiManager($callback:Function)
		{
			_callback = $callback;
			
			if (ExternalInterface.available) {
				ExternalInterface.addCallback("eiWatchRTMP", eiWatchRTMP);
				trace("checkJavaScriptReady:"+checkJavaScriptReady());
			} else {
				trace("External interface is not available for this container.");
			}			
		}
		
		private function eiWatchRTMP(rtmp:String, time:String):void
		{
			_callback.call(null, rtmp, time);
		}
		
		private function checkJavaScriptReady():Boolean {
			var isReady:Boolean = ExternalInterface.call("isReady");
			return isReady;
		}		
	}
}
package view.player
{
	import flash.display.MovieClip;
	import flash.media.Video;

	public class NetStreamClient
	{
		private var _vid:Video;
		private var _client:Object;
		protected var _root:MovieClip;		
		
		public function NetStreamClient($vid:Video, $root:MovieClip)
		{
			_vid = $vid;
			_root = $root;
			_client = new Object();
			_client.onMetaData = receivedMeta;
		}
		
		private function receivedMeta(data:Object):void
		{
			var Aspect_num:Number;
			Aspect_num = data.height / data.width;			
			
			var stageW:int = _root.stage.stageWidth;
			
			_vid.x = 0;
			_vid.y = 0;
			_vid.width = stageW;
			_vid.height = stageW * Aspect_num;
		}
		
		public function getClient():Object
		{
			return _client;
		}
	}
}
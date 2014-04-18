package data
{
	public class RTMPChanelVO
	{
		public var rtmp:String;
		public var time:int;
		
		public function RTMPChanelVO($rtmp:String, $time:int = 100)
		{
			rtmp = $rtmp;
			time = $time;
		}
	}
}
package view.player 
{
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.net.*;
	import flash.system.*;
	import flash.utils.setInterval;
	
	import view.ui.AbstractContainerUI;
	
	public class RTMPplayer extends AbstractContainerUI
	{
		protected var _netStreamObj:NetStream;
		protected var _nc:NetConnection;
		protected var _vid:Video;
		
		protected var _streamID:String;
		protected var _netStreamClient:NetStreamClient;
		
		public function RTMPplayer($root:MovieClip)
		{
			super($root);
			
			_vid = new Video(); 
			_nc = new NetConnection();
			_netStreamClient = new NetStreamClient(_vid, _root);
			
			_nc.addEventListener(NetStatusEvent.NET_STATUS, onConnectionStatus);
			_nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
			_nc.client = { onBWDone: function():void{} };
			
			_container.addChild(_vid);
		}
		
		private function onConnectionStatus(e:NetStatusEvent):void
		{
			trace("Connection CODE " + e.info.code);
		
			if (e.info.code == "NetConnection.Connect.Success")
			{
				trace("Creating NetStream");
				_netStreamObj = new NetStream(_nc);
				_netStreamObj.addEventListener(NetStatusEvent.NET_STATUS, onStreamStatus);					
				_netStreamObj.client = _netStreamClient.getClient();
				_netStreamObj.bufferTime = 10;
				_netStreamObj.inBufferSeek = true;			
				_netStreamObj.play(_streamID);
				_vid.attachNetStream(_netStreamObj);
				setInterval(playback, 1000);
			}
		
			switch (e.info.code) 
			{
				case "NetConnection.Connect.Success":
					trace("‹ ----------- Connected ----------- ›");
					break;
				
				case "NetStream.Buffer.Empty":
					trace("‹ ----------- Buffer is Empty! ----------- ›");
					break;
				
				case "NetStream.Buffer.Full":
					trace("‹ ----------- Buffer is FULL! ----------- ›");
					break;
				
				case "NetStream.Buffer.Flush":
					trace("‹ ----------- Data has finished streaming, remaining buffer will be emptied. ----------- ›");
					break;
				
				case "NetStream.Play.Stop":
					trace("‹ ----------- Playback has stopped. ----------- ›");
					break;
			}
		}
		
		protected function onStreamStatus(e:NetStatusEvent):void
		{
			trace("Stream CODE " + e.info.code);
		}		
		
		private function playback():void
		{ 
			//trace("Buffer length: " + _netStreamObj.bufferLength); 
			//trace("Time: " + _netStreamObj.time); 
		}
		
		private function asyncErrorHandler(event:AsyncErrorEvent):void 
		{ 
			trace("asyncErrorHandler.." + "\r"); 
		}
	}
}
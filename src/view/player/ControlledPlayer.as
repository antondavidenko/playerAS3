package view.player
{
	import controller.CommandsEnum;
	import controller.CommandsManager;
	
	import data.PlayerData;
	
	import flash.display.MovieClip;
	import flash.events.NetStatusEvent;
	import flash.media.SoundTransform;
	import flash.net.NetStreamPlayOptions;
	import flash.net.NetStreamPlayTransitions;

	public class ControlledPlayer extends RTMPplayer
	{
		private var _commandsManager:CommandsManager;
		
		public function ControlledPlayer($root:MovieClip, $commandsManager:CommandsManager)
		{
			super($root);
			_commandsManager = $commandsManager;
		}
		
		public function connect($rtmp:String):void
		{
			_streamID = $rtmp.substr($rtmp.lastIndexOf("/")+1, $rtmp.length);
			var videoURL:String = $rtmp.substr(0, $rtmp.lastIndexOf("/")+1);
			if (videoURL.length > 4)
			{
				_nc.connect(videoURL);  
			}
			else
			{
				_commandsManager.executeCommand(CommandsEnum.MESSAGE_ERROR_URL);
				trace("URL ERROR");
			}
		}		
		
		public function play():void
		{
			_netStreamObj.resume();
		}
		
		public function pause():void
		{
			_netStreamObj.pause();
		}
		
		public function setSound($value:Number):void
		{
			_netStreamObj.soundTransform = new SoundTransform($value);
		}
		
		public function rewind($value:Number):void
		{
			//_netStreamObj.seek(-10);
			//_netStreamObj.play(_streamID, -2, 1);
			
			//var opts:NetStreamPlayOptions = new NetStreamPlayOptions();
			//opts.streamName = _streamID;
			//opts.transition = NetStreamPlayTransitions.SWITCH;
			//opts.offset = -2;
			//_netStreamObj.play2(opts);
			
			//_netStreamObj.play(_streamID+"?seek=10");
		}	
		
		override protected function onStreamStatus(e:NetStatusEvent):void
		{
			super.onStreamStatus(e)
				
			switch (e.info.code) 
			{
				case "NetStream.Failed":
					_commandsManager.executeCommand(CommandsEnum.MESSAGE_ERROR_STREAM);
					break;
				
				case "NetStream.Play.Start":
					_commandsManager.executeCommand(CommandsEnum.MESSAGE_HIDE_BLOCKER);
					break;
			}
		}
	}
}
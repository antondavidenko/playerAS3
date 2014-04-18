package  {
	import controller.CommandsEnum;
	import controller.CommandsManager;
	
	import data.PlayerData;
	import data.RTMPChanelVO;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import view.player.ControlledPlayer;
	
	import view.ui.BlockerUI;
	import view.ui.ControlPanel;
	import view.ui.controlButtons.ControlButtonsIconsEnum;
	import controller.EiManager;
	
	[SWF(frameRate = "24", width = "854", height = "510")]
	public class PlayerAS3 extends MovieClip 
	{
		private var _data:PlayerData;
		
		private var _player:ControlledPlayer;
		private var _panel:ControlPanel;
		private var _commandsManager:CommandsManager;
		private var _eiManager:EiManager;
		private var _blocker:BlockerUI;
		
		public function PlayerAS3() 
		{ 
			// DATA INIT
			_data = new PlayerData();
			
			// CONTROLLER INIT
			_eiManager = new EiManager(eiCallback);				
			_commandsManager = new CommandsManager();	
			
			// VIEW INIT
			_player = new ControlledPlayer(this, _commandsManager);
			_panel = new ControlPanel(this, buttonCallback, seekBarCallback);
			_blocker = new BlockerUI(this);			
			
			_commandsManager.prepareCommands(_data, _player, stage, _panel, _blocker);	
			
			// DEFAULT ACTION
			_data.RTMPChanel = new RTMPChanelVO(stage.loaderInfo.parameters["rtmp"]);
			_commandsManager.executeCommand(CommandsEnum.MESSAGE_STATUS_CONNECTING);			
			_commandsManager.executeCommand(CommandsEnum.SETUP_RTMP);
		}
		
		public function buttonCallback(buttonAction:String):void
		{
			trace("Button: " + buttonAction);			
			_commandsManager.executeByCommandButtonAction(buttonAction)
		}	
		
		public function eiCallback(rtmp:String, time:String):void
		{
			trace("RTMP: " + rtmp);			
			_data.RTMPChanel = new RTMPChanelVO( rtmp, int(time));
			_commandsManager.executeCommand(CommandsEnum.MESSAGE_STATUS_CONNECTING);
			_commandsManager.executeCommand(CommandsEnum.SETUP_RTMP);
		}	
		
		public function seekBarCallback(value:Number):void
		{
			trace("REWIND: " + value);

			_data.currentPlayTimeSec = value;
			_commandsManager.executeCommand(CommandsEnum.REWIND);
		}		
	}
} 
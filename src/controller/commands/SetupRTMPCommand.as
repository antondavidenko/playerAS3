package controller.commands
{
	import controller.CommandsEnum;
	import controller.CommandsManager;
	import controller.ICommand;
	
	import data.PlayerData;
	import data.RTMPChanelVO;
	
	import view.player.ControlledPlayer;
	
	import view.ui.ControlPanel;

	public class SetupRTMPCommand extends AbstractPlayerCommand implements ICommand
	{
		private var _panel:ControlPanel;
		private var _commandsManager:CommandsManager;
		
		public function SetupRTMPCommand($data:PlayerData, $player:ControlledPlayer, $panel:ControlPanel, $commandsManager:CommandsManager)
		{
			super($data, $player);
			_panel = $panel;
			_commandsManager = $commandsManager;
		}
		
		public function execute():void
		{
			if (_data.RTMPChanel.rtmp)
			{
				_player.connect(_data.RTMPChanel.rtmp);
				_panel.setupSecondsAllTime(_data.RTMPChanel.time, false);
			}
			else
			{
				_commandsManager.executeCommand(CommandsEnum.MESSAGE_ERROR_URL);
				trace("URL ERROR");
			}			
		}
	}
}
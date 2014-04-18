package controller.commands
{
	import controller.ICommand;
	
	import data.PlayerData;
	
	import view.player.ControlledPlayer;
	import view.ui.ControlPanel;

	public class RewindCommand extends AbstractPlayerCommand implements ICommand
	{
		private var _panel:ControlPanel;
		
		public function RewindCommand($data:PlayerData, $player:ControlledPlayer, $panel:ControlPanel)
		{
			super($data, $player);
			_panel = $panel;
		}
		
		public function execute():void
		{
			if (_data.currentPlayTimeSec == -2)
			{
				_data.currentPlayTimeSec = _data.RTMPChanel.time;
				_panel.setupSecondsAllTime(_data.RTMPChanel.time, false);
			}

			_player.rewind(_data.currentPlayTimeSec);
		}		
	}
}
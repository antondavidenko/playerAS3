package controller
{
	import controller.commands.RewindCommand;
	import controller.commands.SetupRTMPCommand;
	import controller.commands.control.FullscrCommand;
	import controller.commands.control.NoSoundCommand;
	import controller.commands.control.PauseCommand;
	import controller.commands.control.PlayCommand;
	import controller.commands.control.SetSoundCommand;
	import controller.commands.control.WindowedCommand;
	import controller.commands.messages.MessageErrorConnection;
	import controller.commands.messages.MessageErrorUrl;
	import controller.commands.messages.MessageHideBlocker;
	import controller.commands.messages.MessageStatusConnecting;
	
	import data.PlayerData;
	
	import flash.display.Stage;
	
	import view.player.ControlledPlayer;
	
	import view.ui.BlockerUI;
	import view.ui.ControlPanel;

	public class CommandsManager
	{
		private var _commandList:Array = new Array();
		
		public function CommandsManager()
		{
			
		}
		
		public function prepareCommands($data:PlayerData, $player:ControlledPlayer, $stage:Stage, $panel:ControlPanel, $blocker:BlockerUI):void
		{
			_commandList[CommandsEnum.SETUP_RTMP] = new SetupRTMPCommand($data, $player, $panel, this);
			_commandList[CommandsEnum.REWIND] = new RewindCommand($data, $player, $panel);
			
			// CONTROL
			_commandList[CommandsEnum.PLAY] = new PlayCommand($data, $player);
			_commandList[CommandsEnum.PAUSE] = new PauseCommand($data, $player);
			_commandList[CommandsEnum.SOUND] = new SetSoundCommand($data, $player);
			_commandList[CommandsEnum.NO_SOUND] = new NoSoundCommand($data, $player);	
			_commandList[CommandsEnum.WINDOWED] = new WindowedCommand($data, $stage);
			_commandList[CommandsEnum.FULL_SCREEN] = new FullscrCommand($data, $stage);	
			
			// MESSAGES
			_commandList[CommandsEnum.MESSAGE_STATUS_CONNECTING] = new MessageStatusConnecting($data, $blocker);
			_commandList[CommandsEnum.MESSAGE_ERROR_URL] = new MessageErrorUrl($data, $blocker);	
			_commandList[CommandsEnum.MESSAGE_ERROR_STREAM] = new MessageErrorConnection($data, $blocker);
			_commandList[CommandsEnum.MESSAGE_HIDE_BLOCKER] = new MessageHideBlocker($data, $blocker);	
		}
		
		public function executeByCommandButtonAction($buttonAction:String):void
		{
			(_commandList[CommandsEnum.BUTTON_TO_COMMAND[$buttonAction]] as ICommand).execute();
		}
		
		public function executeCommand($ClassName:String):void
		{
			(_commandList[$ClassName] as ICommand).execute();
		}
	}
}
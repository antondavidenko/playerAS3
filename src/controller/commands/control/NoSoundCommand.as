package controller.commands.control
{
	import controller.ICommand;
	
	import data.PlayerData;
	
	import view.player.ControlledPlayer;
	import controller.commands.AbstractPlayerCommand;

	public class NoSoundCommand extends AbstractPlayerCommand implements ICommand
	{
		public function NoSoundCommand($data:PlayerData, $player:ControlledPlayer)
		{
			super($data, $player);
		}
		
		public function execute():void
		{
			_player.setSound(0);
		}		
	}
}
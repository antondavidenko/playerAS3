package controller.commands.control
{
	import controller.ICommand;
	
	import data.PlayerData;
	
	import view.player.ControlledPlayer;
	import controller.commands.AbstractPlayerCommand;

	public class PlayCommand extends AbstractPlayerCommand implements ICommand
	{
		public function PlayCommand($data:PlayerData, $player:ControlledPlayer)
		{
			super($data, $player);
		}
		
		public function execute():void
		{
			_player.play();
		}		
	}
}
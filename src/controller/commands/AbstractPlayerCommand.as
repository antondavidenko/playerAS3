package controller.commands
{
	import data.PlayerData;
	import view.player.ControlledPlayer;

	public class AbstractPlayerCommand extends AbstractCommand
	{
		protected var _player:ControlledPlayer;
		
		public function AbstractPlayerCommand($data:PlayerData, $player:ControlledPlayer)
		{
			super($data);
			_player = $player;			
		}
	}
}
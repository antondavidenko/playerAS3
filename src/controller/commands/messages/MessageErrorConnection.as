package controller.commands.messages
{
	import controller.ICommand;
	
	import data.LocalisationData;
	import data.PlayerData;
	
	import view.ui.BlockerUI;

	public class MessageErrorConnection extends AbsractMessage implements ICommand
	{
		public function MessageErrorConnection($data:PlayerData, $blocker:BlockerUI)
		{
			super($data, $blocker);
		}
		
		public function execute():void
		{
			_blocker.showBlocker(LocalisationData.ERROR_STREAM_ERROR, false);
		}		
	}
}
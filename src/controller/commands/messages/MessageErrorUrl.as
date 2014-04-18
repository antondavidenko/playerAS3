package controller.commands.messages
{
	import controller.ICommand;
	
	import data.LocalisationData;
	import data.PlayerData;
	
	import view.ui.BlockerUI;

	public class MessageErrorUrl extends AbsractMessage implements ICommand
	{
		public function MessageErrorUrl($data:PlayerData, $blocker:BlockerUI)
		{
			super($data, $blocker);
		}
		
		public function execute():void
		{
			_blocker.showBlocker(LocalisationData.ERROR_WRONG_URL, false);
		}		
	}
}
package controller.commands.messages
{
	import controller.ICommand;
	
	import data.LocalisationData;
	import data.PlayerData;
	
	import view.ui.BlockerUI;

	public class MessageStatusConnecting extends AbsractMessage implements ICommand
	{
		public function MessageStatusConnecting($data:PlayerData, $blocker:BlockerUI)
		{
			super($data, $blocker);
		}
		
		public function execute():void
		{
			_blocker.showBlocker(LocalisationData.STATUS_CONNECTING);
		}		
	}
}
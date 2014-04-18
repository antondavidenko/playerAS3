package controller.commands.messages
{
	import controller.ICommand;
	
	import data.PlayerData;
	
	import view.ui.BlockerUI;

	public class MessageHideBlocker extends AbsractMessage implements ICommand
	{
		public function MessageHideBlocker($data:PlayerData, $blocker:BlockerUI)
		{
			super($data, $blocker);
		}
		
		public function execute():void
		{
			_blocker.hideBlocker();
		}
	}
}
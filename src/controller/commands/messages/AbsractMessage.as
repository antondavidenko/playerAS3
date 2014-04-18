package controller.commands.messages
{
	import controller.commands.AbstractCommand;
	
	import data.PlayerData;
	
	import view.ui.BlockerUI;

	public class AbsractMessage extends AbstractCommand
	{
		protected var _blocker:BlockerUI;		
		
		public function AbsractMessage($data:PlayerData, $blocker:BlockerUI)
		{
			super($data);
			_blocker = $blocker;
		}
	}
}
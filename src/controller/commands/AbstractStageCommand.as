package controller.commands
{
	import data.PlayerData;
	
	import flash.display.Stage;

	public class AbstractStageCommand extends AbstractCommand
	{
		protected var _stage:Stage;		
		
		public function AbstractStageCommand($data:PlayerData, $stage:Stage)
		{
			super($data);
			_stage = $stage;
		}
	}
}
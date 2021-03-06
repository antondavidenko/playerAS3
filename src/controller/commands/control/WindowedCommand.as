package controller.commands.control
{
	import controller.ICommand;
	
	import data.PlayerData;
	
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import controller.commands.AbstractStageCommand;

	public class WindowedCommand extends AbstractStageCommand implements ICommand
	{
		public function WindowedCommand($data:PlayerData, $stage:Stage)
		{
			super($data, $stage);
		}
		
		public function execute():void
		{
			_stage.displayState = StageDisplayState.NORMAL;
		}		
	}
}
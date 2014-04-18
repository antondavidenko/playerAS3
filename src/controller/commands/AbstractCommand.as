package controller.commands
{
	import data.PlayerData;

	public class AbstractCommand
	{
		protected var _data:PlayerData;
		
		public function AbstractCommand($data:PlayerData)
		{
			_data = $data;
		}
	}
}
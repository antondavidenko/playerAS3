package view.ui.controlButtons
{
	import flash.display.DisplayObject;

	public class PlayPauseButtonUI extends AbstractControlButtonUI
	{
		public function PlayPauseButtonUI($skin:DisplayObject, $callback:Function)
		{
			super($skin, ControlButtonsIconsEnum.PLAY, ControlButtonsIconsEnum.PAUSE, $callback);
		}
	}
}
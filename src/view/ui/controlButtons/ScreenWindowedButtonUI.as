package view.ui.controlButtons
{
	import flash.display.DisplayObject;

	public class ScreenWindowedButtonUI extends AbstractControlButtonUI
	{
		public function ScreenWindowedButtonUI($skin:DisplayObject, $callback:Function)
		{
			super($skin, ControlButtonsIconsEnum.FULL_SCREEN, ControlButtonsIconsEnum.WINDOWED, $callback);
		}
	}
}
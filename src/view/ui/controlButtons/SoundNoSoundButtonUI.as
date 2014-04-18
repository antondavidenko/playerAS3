package view.ui.controlButtons
{
	import flash.display.DisplayObject;

	public class SoundNoSoundButtonUI extends AbstractControlButtonUI
	{
		public function SoundNoSoundButtonUI($skin:DisplayObject, $callback:Function)
		{
			super($skin, ControlButtonsIconsEnum.SOUND, ControlButtonsIconsEnum.NO_SOUND, $callback);			
		}
	}
}
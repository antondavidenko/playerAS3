package view.ui
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import view.ui.controlButtons.PlayPauseButtonUI;
	import view.ui.controlButtons.ScreenWindowedButtonUI;
	import view.ui.controlButtons.SoundNoSoundButtonUI;
	import view.ui.seekBar.SeekBarUI;

	public class ControlPanel extends AbstractContainerUI
	{
		[Embed(source="./../resources/skin.swf", symbol="ControlPanelUI")]
		private var ControlPanelUI:Class;
		
		private var _controlPanel:Sprite = new ControlPanelUI();
		
		private var _seekBar:SeekBarUI;
		
		public function ControlPanel($root:MovieClip, $buttonCallback:Function, $seekBarCallback:Function )
		{
			super($root);
			_container.addChild(_controlPanel);
			
			_seekBar = new SeekBarUI(_controlPanel.getChildByName("bar"), $seekBarCallback);
			new PlayPauseButtonUI(_controlPanel.getChildByName("playPause_btn"), $buttonCallback);
			new SoundNoSoundButtonUI(_controlPanel.getChildByName("sound_btn"), $buttonCallback);
			new ScreenWindowedButtonUI(_controlPanel.getChildByName("screen_btn"), $buttonCallback);
			new LiveButtonUI(_controlPanel.getChildByName("live"), $seekBarCallback);
		}
		
		public function setupSecondsAllTime($actualValue:int, $doCallBack:Boolean = true):void
		{
			_seekBar.setupSecondsAllTime($actualValue, $doCallBack);
		}
	}
}
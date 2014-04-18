package controller
{
	import controller.commands.SetupRTMPCommand;
	
	import view.ui.controlButtons.ControlButtonsIconsEnum;

	public class CommandsEnum
	{
		public static const SETUP_RTMP:String = "SetupRTMPCommand";
		public static const REWIND:String = "RewindCommand";
		
		public static const PLAY:String = "PlayCommand";
		public static const PAUSE:String = "PauseCommand";
		public static const FULL_SCREEN:String = "FullscrCommand";
		public static const WINDOWED:String = "WindowedCommand";
		public static const SOUND:String = "SetSoundCommand";
		public static const NO_SOUND:String = "NoSoundCommand";
		
		public static const MESSAGE_STATUS_CONNECTING:String = "MessageStatusConnecting";
		public static const MESSAGE_ERROR_URL:String = "MessageErrorUrl";
		public static const MESSAGE_ERROR_STREAM:String = "MessageErrorConnection";
		public static const MESSAGE_HIDE_BLOCKER:String = "MessageHideBlocker";
		
		public static var BUTTON_TO_COMMAND:Array = new Array();
		BUTTON_TO_COMMAND[ControlButtonsIconsEnum.PLAY] = PLAY;
		BUTTON_TO_COMMAND[ControlButtonsIconsEnum.PAUSE] = PAUSE;
		BUTTON_TO_COMMAND[ControlButtonsIconsEnum.FULL_SCREEN] = WINDOWED;
		BUTTON_TO_COMMAND[ControlButtonsIconsEnum.WINDOWED] = FULL_SCREEN;
		BUTTON_TO_COMMAND[ControlButtonsIconsEnum.SOUND] = SOUND;
		BUTTON_TO_COMMAND[ControlButtonsIconsEnum.NO_SOUND] = NO_SOUND;		
		
		public function CommandsEnum()
		{
		}
	}
}
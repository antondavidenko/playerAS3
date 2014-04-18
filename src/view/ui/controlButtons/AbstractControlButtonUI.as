package view.ui.controlButtons
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import view.ui.AbstractButtonUI;

	public class AbstractControlButtonUI extends AbstractButtonUI
	{
		protected var _icon2ID:String;
		
		public function AbstractControlButtonUI($skin:DisplayObject, $iconID:String, $icon2ID:String, $callback:Function)
		{
			_icon2ID = $icon2ID;
			super($skin, $iconID, $callback);
		}
		
		override protected function onMouseClick(e:Event):void
		{
			var tmp:String = _icon2ID;
			_icon2ID = _iconID;
			_iconID = tmp;
			showIcon(_iconID);
			super.onMouseClick(e);
		}
		
		override protected function showIcon($iconID:String, $active:Boolean = false):void
		{
			var i:int
			
			for (i=0; i<ControlButtonsIconsEnum.LIST.length; i++)
			{
				(_skin.getChildByName(ControlButtonsIconsEnum.LIST[i])).visible = false;
				(_skin.getChildByName(ControlButtonsIconsEnum.LIST[i]+"_") as Sprite).visible = false;
			}
			
			super.showIcon($iconID, $active);
		}		
	}
}
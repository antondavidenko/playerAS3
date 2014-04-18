package view.ui.seekBar
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import view.ui.AbstractButtonUI;

	public class ProgressButtonUI extends AbstractButtonUI
	{
		private const PROGRESS_ICON:String = "progress";
		private var _data:BarData;		
		private var _fieldetSkin:DisplayObject;
		private var _tooltip:BarTooltipManager;
		private var _seekBarCallback:Function;
		
		public function ProgressButtonUI($skin:DisplayObject, $callback:Function, $fieldetSkin:DisplayObject, $tooltip:BarTooltipManager, $data:BarData)
		{
			super($skin, PROGRESS_ICON, $callback);
			
			_data = $data;
			_seekBarCallback = $callback;
			_fieldetSkin = $fieldetSkin;
			_tooltip = $tooltip;
			
			_skin.getChildByName(AREA).addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			_skin.getChildByName(AREA).addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		public function onUpdate(e:Event):void
		{
			_fieldetSkin.x = _skin.x - _fieldetSkin.width;
			_tooltip.update(_skin.x, BarTooltipManager.PROGRESS_STATE);
		}
		
		override protected function onMouseClick(e:Event):void
		{
		}	
		
		protected function onMouseDown(e:Event):void
		{
			var bounds:Rectangle = new Rectangle(_data.visualMin, _skin.y, _data.visualMax, 0);
			_skin.startDrag(false,bounds);
		}
		
		protected function onMouseUp($iconID:String, $active:Boolean = false):void
		{
			_skin.stopDrag();
			_seekBarCallback.call(null, _data.getSecondsByVisual(_skin.x));
		}
		
		public function setupProgress($value:int, $doCallBack:Boolean = true):void
		{
			$value = $value>_data.visualMax ? _data.visualMax : $value;
			$value = $value<_data.visualMin ? _data.visualMin : $value;
			_skin.x = $value;
			if ($doCallBack)
			{
				_seekBarCallback.call(null, _data.getSecondsByVisual(_skin.x));
			}
		}	
		
		override protected function onMouseOut(e:Event):void
		{
			super.onMouseOut(e);
			_tooltip.setState(BarTooltipManager.HIDEN_STATE);
		}
		
		override protected function onMouseOver(e:Event):void
		{
			super.onMouseOver(e);
			_tooltip.setState(BarTooltipManager.PROGRESS_STATE);
		}
	}
}
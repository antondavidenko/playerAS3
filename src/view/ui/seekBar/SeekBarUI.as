package view.ui.seekBar
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;

	public class SeekBarUI
	{
		private var _data:BarData;
		private var _bar:Sprite;	
		private var _progress_btn:ProgressButtonUI;
		private var _rewind_btn:DisplayObject;
		private var _rewind:DisplayObject;
		private var _tooltip:BarTooltipManager;	
		
		public function SeekBarUI($bar:DisplayObject, $seekBarCallback:Function)
		{
			_bar = Sprite($bar);
			_data = new BarData(_bar.getChildByName("fieldet"));
			_data.setupSecondsAllTime(36600);
			
			_tooltip = new BarTooltipManager( _bar.getChildByName("tooltip"), _data);			
			_progress_btn = new ProgressButtonUI( _bar.getChildByName("progress_btn"), $seekBarCallback, _bar.getChildByName("fieldet"), _tooltip, _data);
			
			_rewind_btn = _bar.getChildByName("rewind_btn");
			_rewind = _bar.getChildByName("rewind");
			_rewind.visible = false;
			
			_bar.addEventListener(Event.ENTER_FRAME, onUpdate);
			_rewind_btn.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			_rewind_btn.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			_rewind_btn.addEventListener(MouseEvent.CLICK, onMouseClick);
		}

		protected function onUpdate(e:Event):void
		{
			_rewind.x = _bar.mouseX;
			_tooltip.update(_bar.mouseX, BarTooltipManager.BAR_STATE);
			_progress_btn.onUpdate(e);
		}
		
		protected function onMouseOut(e:Event):void
		{
			_rewind.visible = false;
			_tooltip.setState(BarTooltipManager.HIDEN_STATE);
		}
		
		protected function onMouseOver(e:Event):void
		{
			_rewind.visible = true;
			_tooltip.setState(BarTooltipManager.BAR_STATE);
		}
		
		protected function onMouseClick(e:Event):void
		{
			_progress_btn.setupProgress(_rewind.x);
		}
		
		public function setupSecondsAllTime($actualValue:int, $doCallBack:Boolean = true):void
		{
			_data.setupSecondsAllTime($actualValue);
			_progress_btn.setupProgress(_data.visualMax, $doCallBack);
		}
	}
}
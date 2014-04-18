package view.ui.seekBar
{
	import data.LocalisationData;
	
	import flash.display.DisplayObject;

	public class BarTooltipManager
	{
		private var _data:BarData;		
		public static const BAR_STATE:String = "bar";
		public static const PROGRESS_STATE:String = "progress";
		public static const HIDEN_STATE:String = "hidden";
		private var _currentState:String;
		private var _textValues:Array = new Array();
		private var _xValues:Array = new Array();		
		
		private var _tooltip:BarTooltipUI;
		
		public function BarTooltipManager($tooltip:DisplayObject,  $data:BarData)
		{
			_tooltip = new BarTooltipUI($tooltip);
			_data = $data;
			_currentState = HIDEN_STATE; 
			_textValues[HIDEN_STATE] = "";
			_textValues[BAR_STATE] = "";
			_textValues[PROGRESS_STATE] = "";
			_xValues[HIDEN_STATE] = 0;
			_xValues[BAR_STATE] = 0;
			_xValues[PROGRESS_STATE] = 0;			
		}
		
		public function update($value:Number, $state:String):void
		{
			var value:String = _data.getTimeByVisual($value);
			setLabel(value, $state);
			_xValues[$state] = $value;
			_tooltip.update(_textValues[_currentState], _xValues[_currentState]);
		}
		
		private function setLabel($value:String, $state:String):void
		{
			if ($state == BAR_STATE)
			{
				_textValues[$state] = LocalisationData.TOOLTIP_REWIND + $value;
			}
			else
			{
				_textValues[$state] = $value;
			}
		}
		
		public function setState($state:String):void
		{
			_currentState = $state;
			_tooltip.visible = (_currentState != HIDEN_STATE);
		}
	}
}
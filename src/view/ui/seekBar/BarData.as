package view.ui.seekBar
{
	import flash.display.DisplayObject;

	public class BarData
	{
		private var _visualMaxX:Number;
		private var _visualMinX:Number;

		private var _visualValue:Number = 1;
		private var _actualValue:int = 100;		
		
		public function BarData($fieldetSkin:DisplayObject)
		{
			_visualMaxX = $fieldetSkin.width;
			_visualMinX = 0;	
			_visualValue = _visualMaxX - _visualMinX;			
		}
		
		public function get visualMax():Number
		{
			return _visualMaxX;
		}
		
		public function get visualMin():Number
		{
			return _visualMinX;
		}	
		
		public function setupSecondsAllTime($actualValue:int):void
		{
			_actualValue = $actualValue;
		}
		
		public function getSecondsByVisual($value:Number):int
		{
			var result:int = int(($value/_visualValue)*_actualValue);
			return result;
		}
		
		public function getTimeByVisual($value:Number):String
		{
			var seconds:int = getSecondsByVisual($value);
			var minutes:Number          = Math.floor(seconds/60);
			var remainingSec:Number     = seconds % 60;
			var remainingMinutes:Number = minutes % 60;
			var hours:Number            = Math.floor(minutes/60);
			var floatSeconds:Number     = Math.floor((remainingSec - Math.floor(remainingSec))*100);
			remainingSec                = Math.floor(remainingSec);
			
			return getTwoDigits(hours) + ":" + getTwoDigits(remainingMinutes) + ":" + getTwoDigits(remainingSec);
		}	
		
		private static function getTwoDigits($number:Number):String
		{	
			var result:String = ($number < 10) ? ("0" + $number) : $number + "";
			return result;
		}		
	}
}
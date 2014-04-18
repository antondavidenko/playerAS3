package view.ui.seekBar
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;

	public class BarTooltipUI
	{
		private var _tooltip:DisplayObjectContainer;
		private var _tooltip_text:TextField;
		private var _originalWidth:int;
		
		public function BarTooltipUI($tooltip:DisplayObject)
		{
			_tooltip = DisplayObjectContainer($tooltip);
			_tooltip_text = (_tooltip.getChildByName("message_txt") as TextField);
			_tooltip_text.multiline = false;
			_originalWidth = _tooltip_text.width;
			_tooltip.visible = false;			
		}
		
		public function update($text:String, $x:int):void
		{
			_tooltip_text.text = $text;
			_tooltip_text.width = int(_tooltip_text.textWidth + 20);
			_tooltip.x = int($x) + (_originalWidth - _tooltip_text.width)/2;
		}	
		
		public function get visible():Boolean
		{
			return _tooltip.visible;
		}	
		
		public function set visible($value:Boolean):void
		{
			_tooltip.visible = $value;
		}		
	}
}
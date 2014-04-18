package view.ui
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;

	public class BlockerUI extends AbstractContainerUI
	{
		[Embed(source="./../resources/skin.swf", symbol="BlockerSkin")]
		private var BlockerSkin:Class;	
		
		private var _blockerSkin:Sprite = new BlockerSkin();		
		
		public function BlockerUI($root:MovieClip)
		{
			super($root);
			_container.addChild(_blockerSkin);
			hideBlocker()				
		}
		
		public function showBlocker(text:String="", showAnimation:Boolean = true, showText:Boolean = true):void
		{
			_blockerSkin.visible = true;
			(_blockerSkin.getChildByName("message_txt") as TextField).visible = showText;
			(_blockerSkin.getChildByName("progress") as MovieClip).visible = showAnimation;
			(_blockerSkin.getChildByName("message_txt") as TextField).text = text;	
		}
		
		public function hideBlocker():void
		{
			_blockerSkin.visible = false;
		}
	}
}
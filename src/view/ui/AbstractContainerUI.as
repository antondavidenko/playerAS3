package view.ui
{
	import flash.display.MovieClip;

	public class AbstractContainerUI
	{
		protected var _root:MovieClip;
		protected var _container:MovieClip;		
		
		public function AbstractContainerUI($root:MovieClip)
		{
			_root = $root;
			_container = new MovieClip();
			_root.addChild(_container);			
		}
	}
}
package com.casusludi.wampigraph.app.assets 
{
	import net.croquepixel.lib.gen.EmbedFactory;
	/**
	 * ...
	 * @author ...
	 */
	public class Assets 
	{
		
		public function Assets() 
		{
			
		}

		[Embed(source="pearlFaceA.png")]
		public static const PEARL_FACE_A:Class;
		
		[Embed(source="pearlFaceB.png")]
		public static const PEARL_FACE_B:Class;
		
		
		public static var factory:EmbedFactory = new EmbedFactory(Assets);
		
	}

}
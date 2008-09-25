package com.timrobles.util {

    public class MathUtil {
	
		public static function mod( n : int, m : int ) : int {
			
			var tmp : int = n % m;
			return tmp < 0 ? tmp + m : tmp;
				
		}
			
	}

}

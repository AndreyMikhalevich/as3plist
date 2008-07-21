/*
 * Licensed under the MIT License
 * 
 * Copyright (c) 2008 Daisuke Yanagi
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package net.tautausan.plist
{
	import flash.utils.*;
	/**
	 *	Property List Dictionary 
	 * @author dai
	 * 
	 */	
	dynamic public class PDict extends PlistElement
	{
		
		public function PDict(x:XML)
		{
			super(x);
		}
	
		override public function toString():String
		{
			return "[object PDict]";
		}
		
		override public function get object():*
		{
			
			if(!data)
			{
				var i:uint;
				var length:uint=x.*.length();
				var dic:Object=new Object();
				var key:XML;
	
				for(i=0;i<length;i++)
				{
					if(x.*[i].name()=="key")
					{
						key=x.*[i];
					}
					else
					{
						if(key)
						{
							dic[key]=ParseUtils.valueFromXML(x.*[i]);
						}
					}
				}
				data=dic;
			}
			return data;
		}
		
	}
}
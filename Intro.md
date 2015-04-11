# Introduction #

This is a small library to use plist files for flash contents.


# Details #

Features list

  * XML based property list support

  * plist 1.0 support

  * access properties directly using dot syntax

  * Binary based property list support (tentative)


# Getting Started #

1. load plist file with URLLoader and prepare to capture event from URLLoader.
```
public function init():void
{
	var loader:URLLoader=new URLLoader(new URLRequest("sample.plist"));
	loader.addEventListener(Event.COMPLETE, onComplete);
}
```
2. create an instace and use parse() method with loaded data. That's all.
```
private function onComplete(e:Event):void
{
	var plist:Plist10=new Plist10();
	plist.parse(e.target.data);
	
}
```
## For Binary Format ##
Invoke getXML method before parse loaded data within onComplete method.
```
public function init():void
{
	var loader:URLLoader=new URLLoader(new URLRequest("sample_bin.plist"));
	loader.dataFormat = URLLoaderDataFormat.BINARY;
	loader.addEventListener(Event.COMPLETE, onComplete);
}
```
```
private function onComplete(e:Event):void
{
	var plist:Plist10=new Plist10();
	plist.parse(Bin2Xml.getXML(e.target.data));
	
}
```
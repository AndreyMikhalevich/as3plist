# Access Plist Node Value #

## Get value ##
Use 'parent dot child' to reach parent's child element.
```
trace(plist.root.false_key); //false
```

## You want XMLList? ##
Use reserved keyword named 'xml' to get its own XMLList object.
```
trace(plist.root.arr_key[0].arr_child_dic); // null
trace(plist.root.arr_key[0].xml); //<dict><key>arr_child_dic</key><string>null</string></dict>
```
You should use toXMLString() for no collective types because they will be converted to string automatically.
```
trace(plist.root.false_key.xml); //false_key (toString() works silently)
trace(plist.root.false_key.xml.toXMLString()); //<key>false_key</key>
```

## Use .object property ##
Reserved word 'object' is useful to view whole object created from XML.

parsed from XML below.
```
<key>arr_key</key>
<array>
	<string>111111</string>
	<string>222222</string>
</array>
```
sample using .object property
```
trace(plist.root.arr_key); //11111,22222
trace(plist.root.arr_key[0]); //11111
trace(plist.root.arr_key.object); //11111,22222
```

# Node Exists or not? #
All elements are derived from PlistElement class and you can check if they exists or not using 'is'.
```
trace(plist.root.dic_key);
trace(plist.root.dic_key is PlistElement);//true
trace(plist.root.dic_key2);
trace(plist.root.dic_key2 is PlistElement);//false
```

# Type of nodes #
You should check the type of object property of node when you want to know the type of node.
```
trace(plist.root.arr_key is Array); //false
trace(plist.root.arr_key.object is Array); //true
```

**sample.plst**
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>New item</key>
	<data>
	</data>
	<key>arr_key</key>
	<array>
		<dict>
			<key>arr_child_dic</key>
			<string>null</string>
		</dict>
		<string>str_data</string>
		<true/>
		<integer>0</integer>
		<array>
			<string>111111</string>
			<string>222222</string>
		</array>
	</array>
	<key>date_key</key>
	<date>2008-07-18T13:35:27Z</date>
	<key>dic_key</key>
	<dict>
		<key>child_key</key>
		<string>dic_child_data</string>
	</dict>
	<key>false_key</key>
	<false/>
	<key>num_key</key>
	<integer>0</integer>
	<key>num_key_2</key>
	<real>0.23011999999999999</real>
	<key>str_key</key>
	<string>Hello</string>
	<key>true_key</key>
	<true/>
</dict>
</plist>
```
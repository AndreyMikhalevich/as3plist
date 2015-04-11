# Date problem #
The date is shown in your local time with Apple Property list editor and it will be converted to UTC when it is saved. You have to pay attention to the difference of format between Apple's editor and raw text.

if you have GMT+9:00,

then:
```
2008/07/18 22:05:07
```
```
<date>2008-07-18T13:05:07Z</date>
```


# HTML tags in XML #
You can use HTML tags in plist using htmlText property of TextField.

![http://files.droplr.com/files/17030847/xbSN.usage.png](http://files.droplr.com/files/17030847/xbSN.usage.png)


```
tf.htmlText="HTML marked up messages here";
```

```
tf.htmlText=plist.root.img_tag.url;
```

## CDATA ##
CDATA directive is useful to write html tags in xml. You do not have to care about escape strings.
```
<string>&lt;a href=&quot;http://www.google.com&quot;&gt;hello&lt;/a&gt;</string>
```

```
<string><![CDATA[<a href="http://www.google.com">hello</a>]]></string>
```
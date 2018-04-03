# Python XML

* <https://docs.python.org/3/library/xml.html>
* [lxml](http://lxml.de/) ([SO](https://stackoverflow.com/a/5140190/125246))

## [Element Tree](https://docs.python.org/3/library/xml.etree.elementtree.html)

* [Tips from the author](http://effbot.org/zone/element.htm)

```python
import xml.etree.ElementTree as ET
root = ET.parse("filename.xml")

# Debug output to STDOUT
ET.dump(root)
```

Get/set attributes:

```python
val = el.get('attr-name', 'default')
el.set('attr-name', 'new-value')
```

Add a new element to a parent element:

```python
ET.SubElement(parent, 'tag', { 'attr-name': 'attr-value' }, text='element's text')
```

Output as a string (_without_ an XML declaration):

* Use `getroot()` when outputting the result of `ET.parse` ([ref](https://everydayimlearning.blogspot.co.uk/2012/11/elementtree.html))

```python
print(ET.tostring(element.getroot(), encoding='unicode'))
```

Write to a file ([functions ref](https://docs.python.org/3/library/xml.etree.elementtree.html#functions)):

```python
element.write(filename, encoding='unicode', xml_declaration=True)
```

### [XPath](https://docs.python.org/3/library/xml.etree.elementtree.html#xpath-support)

```python
location = root.find(".//header[@name='location']")
locations = root.findall(".//header[@name='location']")
```
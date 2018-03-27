# Python XML

* <https://docs.python.org/3/library/xml.html>

## [Element Tree](https://docs.python.org/3/library/xml.etree.elementtree.html)

```python
import xml.etree.ElementTree as ET
root = ET.parse("filename.xml")

# Debug output to STDOUT
ET.dump(root)
```

### [XPath](https://docs.python.org/3/library/xml.etree.elementtree.html#xpath-support)

```python
location = root.find(".//header[@name='location']")
locations = root.findall(".//header[@name='location']")
```
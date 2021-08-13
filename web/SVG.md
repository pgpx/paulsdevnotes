# Scalable Vector Graphics (SVG)

* Specs: [1.1 (Second Edition)](https://www.w3.org/TR/SVG11/), [2](https://www.w3.org/TR/SVG2/)
* [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/SVG)
  * [Tutorial]() 
  * [Elements](https://developer.mozilla.org/en-US/docs/Web/SVG/Element),
    [Attributes](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)
* [Transform attribute](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/transform)

## Basics

* Later elements rendered atop previous ([ref](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Getting_Started#basic_properties_of_svg_files))
* `Content-Type: image/svg+xml` and for compression: `Content-Encoding: gzip`
* Origin `0, 0` is top-left, increasing to the right and down ([ref](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Positions#the_grid)).

## Root

Specify canvas width and height but only show the specified `viewBox` ([ref](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Positions#what_are_pixels)):

```svg
<svg width="200" height="200" viewBox="0 0 100 100">
```

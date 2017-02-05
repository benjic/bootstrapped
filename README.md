# bootstrapped
[![Build Status](https://travis-ci.org/benjic/bootstrapped.svg?branch=master)](https://travis-ci.org/benjic/bootstrapped)

> A collection of over_react components for the Bootstrap framework.

This library aims to provide [`over_react`][over_react] statically typed
component builders for the [Bootstrap][Bootstrap] framework.

## Examples

```dart
void main() {
    final container = (Container())([
        (Row())([
            (Column()..constraints = [
                new ColumnConstraint(width: ColumnWidth.six),
            ])('1 of 3'),
            (Column())('2 of 3'),
            (Column())('3 of 3'),
        ]),
    ]);

    react_dom.render(container, querySelector('#content'));
}
```

[over_react]: https://github.com/Workiva/over_react
part of grid;

@Factory()
UiFactory<ColumnProps> Column;

@Props()
class ColumnProps extends UiProps {
  Iterable<ColumnConstraint> constraints;
  VerticalAlignment verticalAlignment;
}

@Component()
class ColumnComponent extends UiComponent<ColumnProps> {
  static final Iterable<ColumnConstraint> _defaultConstraints =
      <ColumnConstraint>[new ColumnConstraint()];

  @override
  getDefaultProps() => newProps()..constraints = _defaultConstraints;

  @override
  render() {
    final builder = new ClassNameBuilder.fromProps(props)
      ..add('align-self-${_verticalAlignmentString[props.verticalAlignment]}',
          props.verticalAlignment != null);

    (props.constraints.isEmpty ? _defaultConstraints : props.constraints)
        .expand((ColumnConstraint description) => description.classNames)
        .forEach(builder.add);

    return (Dom.div()..className = builder.toClassName())(props.children);
  }
}

enum Breakpoint { extraSmall, small, medium, large, extraLarge }

enum ColumnWidth {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  eleven,
  twelve,
  fill,
  auto
}

class ColumnConstraint {
  static final Map<Breakpoint, String> _breakpointString =
      new Map.unmodifiable(<Breakpoint, String>{
    Breakpoint.extraLarge: '-xl',
    Breakpoint.extraSmall: '',
    Breakpoint.large: '-lg',
    Breakpoint.medium: '-md',
    Breakpoint.small: '-sm',
  });

  static bool _isLegalSize(ColumnWidth sizeValue) =>
      sizeValue != null &&
      ![ColumnWidth.auto, ColumnWidth.fill].contains(sizeValue);

  static final Map<ColumnWidth, String> _widthString =
      new Map.unmodifiable(<ColumnWidth, String>{
    ColumnWidth.auto: '-auto',
    ColumnWidth.fill: '',
    ColumnWidth.one: '-1',
    ColumnWidth.two: '-2',
    ColumnWidth.three: '-3',
    ColumnWidth.four: '-4',
    ColumnWidth.five: '-5',
    ColumnWidth.six: '-6',
    ColumnWidth.seven: '-7',
    ColumnWidth.eight: '-8',
    ColumnWidth.nine: '-9',
    ColumnWidth.ten: '-10',
    ColumnWidth.eleven: '-11',
    ColumnWidth.twelve: '-12'
  });

  final Breakpoint breakpoint;
  final ColumnWidth offset;
  final ColumnWidth push;
  final ColumnWidth pull;
  final ColumnWidth width;

  ColumnConstraint(
      {this.breakpoint: Breakpoint.extraSmall,
      this.offset,
      this.push,
      this.pull,
      this.width: ColumnWidth.fill});

  String get className => _buildClassName('col', width);

  Iterable<String> get classNames => new List.unmodifiable([
        className,
        offsetClassName,
        pullClassName,
        pushClassName
      ].where((String className) => className.isNotEmpty));

  String get offsetClassName =>
      _isLegalSize(offset) ? _buildClassName('offset', offset) : '';

  String get pushClassName =>
      _isLegalSize(push) ? _buildClassName('push', push) : '';

  String get pullClassName =>
      _isLegalSize(pull) ? _buildClassName('pull', pull) : '';

  String _buildClassName(String prefix, ColumnWidth widthValue) =>
      '$prefix${_breakpointString[breakpoint]}${_widthString[widthValue]}';
}

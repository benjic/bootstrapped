part of grid;

@Factory()
UiFactory<RowProps> Row;

@Props()
class RowProps extends UiProps {
  bool gutters;
  VerticalAlignment verticalAlignment;
  HorizontalAlignment horizontalAlignment;
}

@Component()
class RowComponent extends UiComponent<RowProps> {
  @override
  getDefaultProps() => newProps()..gutters = true;

  @override
  render() {
    final className = new ClassNameBuilder.fromProps(props)
      ..add('align-items-${_vertialAlignmentString[props.verticalAlignment]}',
          props.verticalAlignment != null)
      ..add(
          'justify-content-${_horizontalAlignmentString[props.horizontalAlignment]}',
          props.horizontalAlignment != null)
      ..add('no-gutters', !props.gutters)
      ..add('row');

    return (Dom.div()..className = className.toClassName())(props.children);
  }
}

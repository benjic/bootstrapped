part of grid;

@Factory()
UiFactory<ContainerProps> Container;

@Props()
class ContainerProps extends UiProps {
  bool fluid;
}

@Component()
class ContainerComponent extends UiComponent<ContainerProps> {
  @override
  getDefaultProps() => newProps()..fluid = false;

  @override
  render() {
    final classNames = new ClassNameBuilder.fromProps(props)
      ..add('container', !props.fluid)
      ..add('container-fluid', props.fluid)
      ..blacklist('container', props.fluid)
      ..blacklist('container-fluid', !props.fluid);

    return (Dom.div()..className = classNames.toClassName())(props.children);
  }
}

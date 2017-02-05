part of components;

@Factory()
UiFactory Badge;

@Props()
class BadgeProps extends UiProps {
  bool pill;
  Context context;
}

@Component()
class BadgeComponent extends UiComponent<BadgeProps> {
  @override
  getDefaultProps() => newProps()..pill = false;

  @override
  render() {
    final classNameBuilder = new ClassNameBuilder.fromProps(props)
      ..add('badge')
      ..add('badge-pill', props.pill)
      ..add(_contextClassName(props.context));

    return (Dom.span()
      ..className = classNameBuilder.toClassName()
      ..classNameBlacklist =
          classNameBuilder.toClassNameBlacklist())(props.children);
  }

  String _contextClassName(Context context) =>
      'badge-${_contextString(context)}';
}

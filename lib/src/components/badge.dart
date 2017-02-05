part of components;

enum BadgeContext { defaulted, danger, info, primary, success, warning }

@Factory()
UiFactory<BadgeProps> Badge;

@Props()
class BadgeProps extends UiProps {
  bool pill;
  BadgeContext context;
}

@Component()
class BadgeComponent extends UiComponent<BadgeProps> {
  static final Map<BadgeContext, String> _contextClassName = {
    BadgeContext.defaulted: 'badge-default',
    BadgeContext.danger: 'badge-danger',
    BadgeContext.info: 'badge-info',
    BadgeContext.primary: 'badge-primary',
    BadgeContext.success: 'badge-success',
    BadgeContext.warning: 'badge-warning'
  };

  @override
  getDefaultProps() => newProps()
    ..pill = false
    ..context = BadgeContext.defaulted;

  @override
  render() {
    final classNameBuilder = new ClassNameBuilder.fromProps(props)
      ..add('badge')
      ..add('badge-pill', props.pill)
      ..add(_contextClassName[props.context], props.context != null);

    return (Dom.span()
      ..className = classNameBuilder.toClassName()
      ..classNameBlacklist =
          classNameBuilder.toClassNameBlacklist())(props.children);
  }
}

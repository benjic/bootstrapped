part of components;

@Factory()
UiFactory<BreadcrumbItemProps> BreadcrumbItem;

@Props()
class BreadcrumbItemProps extends UiProps {
  String href;
  bool active;
}

@Component()
class BreadcrumbItemComponent extends UiComponent<BreadcrumbItemProps> {
  @override
  getDefaultProps() => newProps()..active = false;

  @override
  render() {
    final classNameBuilder = new ClassNameBuilder.fromProps(props)
      ..add('breadcrumb-item')
      ..add('active', props.active);

    return props.href == null
        ? (Dom.span()
          ..props.addAll(copyUnconsumedProps())
          ..className = classNameBuilder.toClassName()
          ..classNameBlacklist =
              classNameBuilder.toClassNameBlacklist())(props.children)
        : (Dom.a()
          ..props.addAll(copyUnconsumedProps())
          ..className = classNameBuilder.toClassName()
          ..classNameBlacklist = classNameBuilder.toClassNameBlacklist()
          ..href = props.href)(props.children);
  }
}

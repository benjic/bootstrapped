part of components;

@Factory()
UiFactory<BreadcrumbProps> Breadcrumb;

@Props()
class BreadcrumbProps extends UiProps {}

@Component()
class BreadcrumbComponent extends UiComponent {
  @override
  render() {
    final classNameBuilder = new ClassNameBuilder.fromProps(props)
      ..add('breadcrumb');

    return (Dom.nav()
      ..className = classNameBuilder.toClassName()
      ..classNameBlacklist = classNameBuilder.toClassNameBlacklist()
      ..props.addAll(copyUnconsumedProps()))(props.children);
  }
}

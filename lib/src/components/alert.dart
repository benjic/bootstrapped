part of components;

enum AlertContext { danger, info, success, warning }

@Factory()
UiFactory<AlertProps> Alert;

@Props()
class AlertProps extends UiProps {
  bool animate;
  AlertContext context;
  bool dismissable;
}

@Component()
class AlertComponent extends UiComponent<AlertProps> {
  static final Map<AlertContext, String> _contextClassName = {
    AlertContext.danger: 'alert-danger',
    AlertContext.info: 'alert-info',
    AlertContext.success: 'alert-success',
    AlertContext.warning: 'alert-warning'
  };

  @override
  getDefaultProps() => newProps()
    ..animate = false
    ..context = AlertContext.success
    ..dismissable = false;

  @override
  render() {
    final classNameBuilder = new ClassNameBuilder.fromProps(props)
      ..add('alert')
      ..add('alert-dismissable', props.dismissable)
      ..add(_contextClassName[props.context])
      ..add('fade', props.animate)
      ..add('show', props.animate);

    final children = (props.dismissable
        ? ([
            (Dom.button()
              ..type = 'button'
              ..className = 'close')(Dom.span()('×'))
          ]..addAll(props.children))
        : props.children);

    return (Dom.div()
      ..role = 'alert'
      ..className = classNameBuilder.toClassName()
      ..classNameBlacklist = classNameBuilder.toClassNameBlacklist())(children);
  }
}

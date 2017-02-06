part of components;

enum ButtonContext { primary, secondary, success, info, warning, danger, link }

enum ButtonSize { large, medium, small }

@Factory()
UiFactory<ButtonProps> Button;

@Props()
class ButtonProps extends UiProps {
  bool active;
  bool blockLevel;
  ButtonContext context;
  bool disabled;
  bool outline;
  ButtonSize size;
}

@Component()
class ButtonComponent extends UiComponent<ButtonProps> {
  static final Map<ButtonContext, String> _contextClassName = {
    ButtonContext.danger: 'danger',
    ButtonContext.info: 'info',
    ButtonContext.link: 'link',
    ButtonContext.primary: 'primary',
    ButtonContext.secondary: 'secondary',
    ButtonContext.success: 'success',
    ButtonContext.warning: 'warning'
  };

  static final Map<ButtonSize, String> _sizeClassName = {
    ButtonSize.large: 'btn-lg',
    ButtonSize.medium: '',
    ButtonSize.small: 'btn-sm',
  };

  @override
  getDefaultProps() => newProps()
    ..active = false
    ..blockLevel = false
    ..context = ButtonContext.primary
    ..disabled = false
    ..outline = false
    ..size = ButtonSize.medium;

  @override
  render() {
    final classNameBuilder = new ClassNameBuilder.fromProps(props)
      ..add('btn')
      ..add(_buildContextClassName(props.context, props.outline))
      ..add(_sizeClassName[props.size], props.size != ButtonSize.medium)
      ..add('btn-block', props.blockLevel)
      ..add('disabled', props.disabled)
      ..add('active', props.active);

    final button = (Dom.button()
      ..className = classNameBuilder.toClassName()
      ..classNameBlacklist = classNameBuilder.toClassNameBlacklist()
      ..props.addAll(copyUnconsumedProps())
      ..type = 'button');

    if (props.disabled) {
      button..addProp('disabled', null)..addProp('aria-disabled', 'true');
    }

    return button(props.children);
  }

  String _buildContextClassName(ButtonContext context, bool outline) =>
      'btn${outline && context != ButtonContext.link ? "-outline-" : "-"}${_contextClassName[context]}';
}

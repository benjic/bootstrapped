part of components;

enum Context { danger, info, primary, success, warning }

String _contextString(Context context) =>
    {
      Context.danger: 'danger',
      Context.info: 'info',
      Context.primary: 'primary',
      Context.success: 'success',
      Context.warning: 'warning'
    }[context] ??
    'default';

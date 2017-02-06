// Copyright (c) 2017, Benjamin Campbell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:bootstrapped/bootstrapped.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;

void main() {
  react_client.setClientConfiguration();

  final alertExample = (Dom.div())([
    (Alert()..context = AlertContext.danger)([
      Dom.strong()('Oh snap!'),
      ' Change a few things up and try again',
    ]),
    (Alert()..context = AlertContext.info)([
      Dom.strong()('Heads up!'),
      ' This alert needs your attention, but it\'s not super important.'
    ]),
    (Alert()..context = AlertContext.success)([
      Dom.strong()('Well done!'),
      ' You successfully read this important alert message.'
    ]),
    (Alert()..context = AlertContext.warning)([
      Dom.strong()('Warning!'),
      ' Better check yourself, you\'re not looking too good.'
    ]),
    (Dom.h4()('Dismissable Alerts')),
    (Alert()
      ..context = AlertContext.warning
      ..dismissable = true
      ..animate = true)([
      Dom.strong()('Holy guacamole!'),
      ' I am an animated dismissal. Watch me fade away...',
    ]),
    (Alert()
      ..context = AlertContext.danger
      ..dismissable = true
      ..animate = false)([
      Dom.strong()('Holy guacamole!'),
      ' I am not animated. I will leave as soon as I am dismissed.',
    ]),
  ]);

  react_dom.render(alertExample, querySelector('#alert-example'));

  final badgeExample = (Dom.div())(
    (Dom.div())([
      (Badge())('Default'),
      (Badge()..context = BadgeContext.primary)('Primary'),
      (Badge()..context = BadgeContext.success)('Success'),
      (Badge()..context = BadgeContext.info)('Info'),
      (Badge()..context = BadgeContext.warning)('Warning'),
      (Badge()..context = BadgeContext.danger)('Danger'),
    ]),
    (Dom.div())([
      (Badge())('Default'),
      (Badge()
        ..context = BadgeContext.primary
        ..pill = true)('Primary'),
      (Badge()
        ..context = BadgeContext.success
        ..pill = true)('Success'),
      (Badge()
        ..context = BadgeContext.info
        ..pill = true)('Info'),
      (Badge()
        ..context = BadgeContext.warning
        ..pill = true)('Warning'),
      (Badge()
        ..context = BadgeContext.danger
        ..pill = true)('Danger'),
    ]),
  );

  react_dom.render(badgeExample, querySelector('#badge-example'));

  final breadcrumbExample = (Breadcrumb())([
    (BreadcrumbItem()..href = "#")('Alpha'),
    (BreadcrumbItem()..href = "#")('Beta'),
    (BreadcrumbItem()..href = "#")('Gamma'),
    (BreadcrumbItem()..active)('Delta'),
  ]);

  react_dom.render(breadcrumbExample, querySelector('#breadcrumb-example'));

  final buttonsFactory =
      (String label, dynamic buttonFactory(ButtonContext context)) {
    final heading = (Dom.h4())(label);
    final buttons = ButtonContext.values.map((ButtonContext context) =>
        buttonFactory(context)(context.toString().split(".")[1]));
    return (Dom.div())([heading]..addAll(buttons));
  };

  final buttons = (Dom.div())([
    buttonsFactory('Normal', (context) => Button()..context = context),
    buttonsFactory(
        'Outline',
        (context) => Button()
          ..context = context
          ..outline = true),
    buttonsFactory(
        'Large',
        (context) => Button()
          ..context = context
          ..size = ButtonSize.large),
    buttonsFactory(
        'Small',
        (context) => Button()
          ..context = context
          ..size = ButtonSize.small),
    buttonsFactory(
        'Active',
        (context) => Button()
          ..context = context
          ..active = true),
    buttonsFactory(
        'Disabled',
        (context) => Button()
          ..context = context
          ..disabled = true)
  ]);

  react_dom.render(buttons, querySelector('#button-example'));
}

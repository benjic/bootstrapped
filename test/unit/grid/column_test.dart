@TestOn('browser')
import 'package:test/test.dart';

import 'package:bootstrapped/src/grid.dart';

typedef String ClassNameGetter(ColumnConstraint constraint);
typedef ColumnConstraint ConstraintFactory(
    Breakpoint breakpoint, ColumnWidth width);
typedef ColumnConstraint WidthContstraintFactory(ColumnWidth width);

class ConstraintClassNameTestHarness {
  final ClassNameGetter classNameGetter;
  final ConstraintFactory constraintFactory;
  final String prefix;
  final WidthContstraintFactory widthContstraintFactory;

  static final ConstraintClassNameTestHarness offset =
      new ConstraintClassNameTestHarness(
          (ColumnConstraint constraint) => constraint.offsetClassName,
          (Breakpoint breakpoint, ColumnWidth columnWidth) =>
              new ColumnConstraint(breakpoint: breakpoint, offset: columnWidth),
          'offset',
          (ColumnWidth columnWidth) =>
              new ColumnConstraint(offset: columnWidth));

  static final ConstraintClassNameTestHarness push =
      new ConstraintClassNameTestHarness(
          (ColumnConstraint constraint) => constraint.pushClassName,
          (Breakpoint breakpoint, ColumnWidth columnWidth) =>
              new ColumnConstraint(breakpoint: breakpoint, push: columnWidth),
          'push',
          (ColumnWidth columnWidth) => new ColumnConstraint(push: columnWidth));

  static final ConstraintClassNameTestHarness pull =
      new ConstraintClassNameTestHarness(
          (ColumnConstraint constraint) => constraint.pullClassName,
          (Breakpoint breakpoint, ColumnWidth columnWidth) =>
              new ColumnConstraint(breakpoint: breakpoint, pull: columnWidth),
          'pull',
          (ColumnWidth columnWidth) => new ColumnConstraint(pull: columnWidth));

  ConstraintClassNameTestHarness(this.classNameGetter, this.constraintFactory,
      this.prefix, this.widthContstraintFactory);
}

void main() {
  group('Column', () {
    test('should render', () {});
    test('should not include vertical alignemnt by default', () {});
    test('should include vertical alignment value', () {});
    test('should include default column constraint if unspecified', () {});
    test('should include default column constraint if given empty list', () {});
    test('should render children', () {});
  }, skip: 'Missing implementation');

  group('ColumnConstraint', () {
    group('with default construction', () {
      final ColumnConstraint constraint = new ColumnConstraint();

      test('should have extra small breakpoint',
          () => expect(constraint.breakpoint, Breakpoint.extraSmall));

      test('should have fill width',
          () => expect(constraint.width, ColumnWidth.fill));

      test('should have lone "col" className',
          () => expect(constraint.classNames, ['col']));

      test('should not have a offset class name',
          () => expect(constraint.offsetClassName, ''));
      test('should not have a push class name',
          () => expect(constraint.pullClassName, ''));

      test('should not have a pull class name',
          () => expect(constraint.pushClassName, ''));
    });

    group('className', () {
      test('should respect set breakpoint', () {
        final expectedValues = {
          Breakpoint.extraLarge: 'col-xl',
          Breakpoint.extraSmall: 'col',
          Breakpoint.large: 'col-lg',
          Breakpoint.medium: 'col-md',
          Breakpoint.small: 'col-sm'
        };

        expectedValues.forEach(
            (Breakpoint breakpoint, String expectedClassName) => expect(
                new ColumnConstraint(breakpoint: breakpoint).className,
                expectedClassName));
      });

      test('should respect set width', () {
        final expectedValues = {
          ColumnWidth.auto: 'col-auto',
          ColumnWidth.fill: 'col',
          ColumnWidth.one: 'col-1',
          ColumnWidth.two: 'col-2',
          ColumnWidth.three: 'col-3',
          ColumnWidth.four: 'col-4',
          ColumnWidth.five: 'col-5',
          ColumnWidth.six: 'col-6',
          ColumnWidth.seven: 'col-7',
          ColumnWidth.eight: 'col-8',
          ColumnWidth.nine: 'col-9',
          ColumnWidth.ten: 'col-10',
          ColumnWidth.eleven: 'col-11',
          ColumnWidth.twelve: 'col-12',
        };

        expectedValues.forEach((ColumnWidth width, String expectedClassName) =>
            expect(new ColumnConstraint(width: width).className,
                expectedClassName));
      });

      test('should respect set width and breakpoint', () {
        final expectedValues = {
          ColumnWidth.auto: 'col-lg-auto',
          ColumnWidth.fill: 'col-lg',
          ColumnWidth.one: 'col-lg-1',
          ColumnWidth.two: 'col-lg-2',
          ColumnWidth.three: 'col-lg-3',
          ColumnWidth.four: 'col-lg-4',
          ColumnWidth.five: 'col-lg-5',
          ColumnWidth.six: 'col-lg-6',
          ColumnWidth.seven: 'col-lg-7',
          ColumnWidth.eight: 'col-lg-8',
          ColumnWidth.nine: 'col-lg-9',
          ColumnWidth.ten: 'col-lg-10',
          ColumnWidth.eleven: 'col-lg-11',
          ColumnWidth.twelve: 'col-lg-12',
        };

        expectedValues.forEach((ColumnWidth width, String expectedClassName) =>
            expect(
                new ColumnConstraint(breakpoint: Breakpoint.large, width: width)
                    .className,
                expectedClassName));
      });
    });
    group('classNames', () {
      final width = ColumnWidth.one;
      test(
          'should contain all classes when valid',
          () => expect(
              new ColumnConstraint(
                      breakpoint: Breakpoint.extraLarge,
                      offset: width,
                      pull: width,
                      push: width,
                      width: width)
                  .classNames,
              ['col-xl-1', 'offset-xl-1', 'pull-xl-1', 'push-xl-1']));
    });

    [
      ConstraintClassNameTestHarness.offset,
      ConstraintClassNameTestHarness.pull,
      ConstraintClassNameTestHarness.pull
    ].forEach((ConstraintClassNameTestHarness harness) {
      group('${harness.prefix}ClassName', () {
        test('should be empty when ${harness.prefix} is unset',
            () => expect(harness.classNameGetter(new ColumnConstraint()), ''));

        test('should respect set breakpoint', () {
          final expectedValues = {
            Breakpoint.extraLarge: '${harness.prefix}-xl-6',
            Breakpoint.extraSmall: '${harness.prefix}-6',
            Breakpoint.large: '${harness.prefix}-lg-6',
            Breakpoint.medium: '${harness.prefix}-md-6',
            Breakpoint.small: '${harness.prefix}-sm-6'
          };

          expectedValues.forEach(
              (Breakpoint breakpoint, String expectedClassName) => expect(
                  harness.classNameGetter(
                      harness.constraintFactory(breakpoint, ColumnWidth.six)),
                  expectedClassName));
        });

        test('should respect set offset value', () {
          final expectedValues = {
            ColumnWidth.auto: '',
            ColumnWidth.fill: '',
            ColumnWidth.one: '${harness.prefix}-1',
            ColumnWidth.two: '${harness.prefix}-2',
            ColumnWidth.three: '${harness.prefix}-3',
            ColumnWidth.four: '${harness.prefix}-4',
            ColumnWidth.five: '${harness.prefix}-5',
            ColumnWidth.six: '${harness.prefix}-6',
            ColumnWidth.seven: '${harness.prefix}-7',
            ColumnWidth.eight: '${harness.prefix}-8',
            ColumnWidth.nine: '${harness.prefix}-9',
            ColumnWidth.ten: '${harness.prefix}-10',
            ColumnWidth.eleven: '${harness.prefix}-11',
            ColumnWidth.twelve: '${harness.prefix}-12',
          };

          expectedValues.forEach(
              (ColumnWidth width, String expectedClassName) => expect(
                  harness
                      .classNameGetter(harness.widthContstraintFactory(width)),
                  expectedClassName));
        });
      });
    });
  });
}

part of grid;

enum HorizontalAlignment { around, between, center, end, start }
enum VerticalAlignment { end, center, start }

final Map<HorizontalAlignment, String> _horizontalAlignmentString =
    new Map.unmodifiable(<HorizontalAlignment, String>{
  HorizontalAlignment.around: 'around',
  HorizontalAlignment.between: 'between',
  HorizontalAlignment.center: 'center',
  HorizontalAlignment.end: 'end',
  HorizontalAlignment.start: 'start'
});

final Map<VerticalAlignment, String> _verticalAlignmentString =
    new Map.unmodifiable(<VerticalAlignment, String>{
  VerticalAlignment.center: 'center',
  VerticalAlignment.end: 'end',
  VerticalAlignment.start: 'start'
});

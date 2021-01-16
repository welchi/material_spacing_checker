# material_spacing_checker
A package that draws a grid to check if the widget is aligned according to the Material Design spacing method.
[Spacing methods - Material Design]( https://material.io/design/layout/spacing-methods.html#baseline-grid )

## Usage

## Example

```dart
// ..
Widget build(BuildContext context) {
    return MaterialSpacingChecker( // Add checker
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: List<Widget>.generate(
            10,
            (index) => MyListTile(),
          ).toList(),
        ),
      ),
    );
}
// ..
```

Customize lines
```dart
// ..
Widget build(BuildContext context) {
    return MaterialSpacingChecker( // Add checker
      lineColor : Colors.blue.withOpacity(0.7), // default : Colors.red.withOpacity(0.7)
      lineSpacing : 16, // default : 8(dp)
      lineWeight : 0.5, // default : 0.3
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: List<Widget>.generate(
            10,
            (index) => MyListTile(),
          ).toList(),
        ),
      ),
    );
}
// ..
```


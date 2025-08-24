import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';

const surfaceColor = Color.fromARGB(255, 27, 27, 30);

// TODO: Add transparency for the hover colors, so it looks cool with MICA/Acrylic
final windowButtonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: _darken(surfaceColor, .025),
  mouseDown: _darken(surfaceColor),
  iconMouseOver: Colors.white,
  iconMouseDown: Colors.white,
);

// TODO: Add transparency for the hover colors, so it looks cool with MICA/Acrylic
final closeWindowButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: Colors.white,
  iconMouseOver: Colors.white,
);

Color _darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

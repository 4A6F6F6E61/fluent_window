import 'dart:developer' as dev;
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:fluent_window/window_title_bar.dart';

// TODO: Add a stack varient which is rendered on top of the window instead of taking vertical space
class FluentWindow extends StatelessWidget {
  const FluentWindow({
    super.key,
    this.title,
    this.menuBar,
    required this.child,
    this.windowsEffect = WindowEffect.mica,
    this.macOSEffect = WindowEffect.sidebar,
    this.linuxEffect = WindowEffect.transparent,
    this.windowsEffectColor = const Color(0xCC222222),
    this.macOSEffectColor = Colors.transparent,
    this.linuxEffectColor = Colors.transparent,
  });

  static bool _initialRender = true;

  final Widget child;
  final Widget? menuBar;
  final String? title;

  final WindowEffect windowsEffect;
  final WindowEffect macOSEffect;
  final WindowEffect linuxEffect;
  final Color windowsEffectColor;
  final Color macOSEffectColor;
  final Color linuxEffectColor;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return child;
    }

    // TODO: Add a check to make sure this only gets called once
    if (Platform.isMacOS) {
      dev.log(
        "Warning: macOS is not officially supported yet, use at your own risk.",
        name: "fluent_window",
      );
      if (_initialRender) {
        Window.setEffect(
          effect: macOSEffect,
          color: macOSEffectColor,
          dark: FluentTheme.of(context).brightness == Brightness.dark,
        );
        _initialRender = false;
      }
      return Column(
        children: [
          WindowTitleBar(title: title, menuBar: menuBar),
          Expanded(child: child),
        ],
      );
    }
    if (Platform.isWindows) {
      if (_initialRender) {
        Window.setEffect(
          effect: windowsEffect,
          color: windowsEffectColor,
          dark: FluentTheme.of(context).brightness == Brightness.dark,
        );
        _initialRender = false;
      }

      return Column(
        children: [
          WindowTitleBar(title: title, menuBar: menuBar),
          Expanded(child: child),
        ],
      );
    }
    if (_initialRender) {
      Window.setEffect(
        effect: linuxEffect,
        color: linuxEffectColor,
        dark: FluentTheme.of(context).brightness == Brightness.dark,
      );
      _initialRender = false;
    }
    // Fake Acrylic effect for development because it doesn't work under Linux
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/background.png"), fit: BoxFit.cover),
      ),
      child: Acrylic(
        tint: Color(0xCC222222),
        blurAmount: 20,
        child: Column(
          children: [
            WindowTitleBar(title: title, menuBar: menuBar),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

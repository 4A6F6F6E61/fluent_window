import 'dart:developer' as dev;
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:fluent_window/window_title_bar.dart';

class FluentWindow extends StatelessWidget {
  const FluentWindow({super.key, this.title, this.menuBar, required this.child});

  final Widget child;
  final Widget? menuBar;
  final String? title;

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
      Window.setEffect(
        effect: WindowEffect.sidebar,
        dark: FluentTheme.of(context).brightness == Brightness.dark,
      );
      return Column(
        children: [
          WindowTitleBar(title: title, menuBar: menuBar),
          Expanded(child: child),
        ],
      );
    }
    if (Platform.isWindows) {
      Window.setEffect(
        effect: WindowEffect.mica,
        // color: Color(0xCC222222),
        dark: FluentTheme.of(context).brightness == Brightness.dark,
      );

      return Column(
        children: [
          WindowTitleBar(menuBar: menuBar),
          Expanded(child: child),
        ],
      );
    }
    Window.setEffect(
      effect: WindowEffect.transparent,
      color: Colors.transparent,
      dark: FluentTheme.of(context).brightness == Brightness.dark,
    );
    // Fake Acrylic effect for development because it doesn't work under Linux
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/background_red.png"), fit: BoxFit.cover),
      ),
      child: Acrylic(
        tint: Color(0xCC222222),
        blurAmount: 20,
        child: Column(
          children: [
            WindowTitleBar(menuBar: menuBar),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

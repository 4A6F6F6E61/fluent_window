import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluent_window/window_buttons.dart';

class WindowTitleBar extends StatelessWidget {
  const WindowTitleBar({super.key, this.title, this.menuBar});

  final String? title;
  final Widget? menuBar;

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: EdgeInsetsGeometry.all(0),
      borderColor: Colors.transparent,
      borderRadius: BorderRadiusGeometry.circular(0),
      child: SizedBox(
        width: double.infinity,
        height: appWindow.titleBarButtonSize.height + 10,
        child: MoveWindow(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title != null ? Row(children: [SizedBox(width: 8), Text(title!)]) : SizedBox(),
              Expanded(child: menuBar != null ? menuBar! : SizedBox()),
              WindowButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

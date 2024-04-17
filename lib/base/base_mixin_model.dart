import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin MixinModel<T extends ChangeNotifier?> {
  Function(BuildContext, T, Widget?) withBuilder();
  T withModel();
  Widget withChild() {
    return Container();
  }

  Widget present(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: withModel(),
      child: Consumer<T>(
        builder: withBuilder() as Widget Function(BuildContext, T, Widget?),
        child: withChild(),
      ),
    );
  }

}

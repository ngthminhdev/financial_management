import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePage<T extends ChangeNotifier> extends StatefulWidget {
  final Widget? child;
  final T model;
  final Function(BuildContext, T, Widget)? builder;
  final bool modelWillDispose;
  BasePage(
      {this.child,
      required this.model,
      this.builder,
      this.modelWillDispose = false});

  @override
  _BasePageState<T> createState() => _BasePageState<T>();
}

class _BasePageState<T extends ChangeNotifier> extends State<BasePage<T>> {
  T? model;

  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  void dispose() {
    if (widget.modelWillDispose) {
      model!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T?>.value(
      value: model,
      child: Consumer<T>(
          builder: widget.builder as Widget Function(BuildContext, T, Widget?),
          child: SafeArea(
            child: widget.child!,
          )),
    );
  }
}

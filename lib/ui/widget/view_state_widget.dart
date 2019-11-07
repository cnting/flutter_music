import 'package:flutter/material.dart';
import 'package:flutter_music/view_model/base/view_state_vm.dart';

import 'common.dart';
import 'provider_widget.dart';

/// TODO: 2019-11-07 add by ct 暂时用不了，想把ViewStateWidget放到最顶层，这样在不需要每个地方都包一下。但是ChangeNotifier是往下传递的，没法传递到ViewStateWidget
class ViewStateWidget<T extends ChangeNotifier> extends StatelessWidget {
  final ValueWidgetBuilder<T> builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  const ViewStateWidget(
      this.builder, this.model, this.child, this.onModelReady);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
      builder: (BuildContext context, T model, Widget child) {
        List<Widget> children = [builder(context, model, child)];
        if (model is ViewStateVM) {
          if (model.isLoading()) {
            children.add(CustomLoading());
          }
        }
        return Stack(
          children: children,
        );
      },
      model: model,
      child: child,
      onModelReady: onModelReady,
    );
  }
}

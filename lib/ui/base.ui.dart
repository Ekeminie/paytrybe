import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:paytrybe/locator.dart';
import 'package:provider/provider.dart';

import 'base.vm.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  const BaseView({Key? key, this.builder, this.onModelReady}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: (_, model, __) => Stack(
          children: [
            widget.builder!.call(_, model, __),
            if (model.isLoading)
              Stack(children: [
                ModalBarrier(
                  color: Colors.white.withOpacity(.7),
                  dismissible: false,
                ),
                Center(child: SpinKitChasingDots())
              ])
            else
              const SizedBox(),
            if (model.hasError)
              Stack(children: [
                ModalBarrier(
                  color: Colors.black12.withOpacity(.5),
                  dismissible: false,
                ),
                Center(
                    child: Column(
                  children: [
                    Text(model.errorMessage!),
                    if (model.retryFunction != null)
                      GestureDetector(
                          onTap: () => model.retryFunction!(),
                          child: const Icon(Icons.refresh))
                  ],
                ))
              ])
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NovelFullView extends StatefulWidget {
  final double viewWidth;
  final double viewHeight;

  const NovelFullView(
      {Key? key, required this.viewWidth, required this.viewHeight})
      : super(key: key);

  @override
  _NovelFullViewState createState() => _NovelFullViewState();
}

class _NovelFullViewState extends State<NovelFullView> {
  final String _viewType = "com.yhfwork.f_yc_pangrowth/NovelFullView";

  MethodChannel? _methodChannel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox(
        width: widget.viewWidth,
        height: widget.viewHeight,
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "viewWidth": widget.viewWidth,
            "viewHeight": widget.viewHeight,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        width: widget.viewWidth,
        height: widget.viewHeight,
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "viewWidth": widget.viewWidth,
            "viewHeight": widget.viewHeight,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else {
      return Container();
    }
  }

  //注册cannel
  void _registerChannel(int id) {
    _methodChannel = MethodChannel("${_viewType}_$id");
    _methodChannel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
    }
  }
}

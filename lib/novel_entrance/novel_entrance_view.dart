import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NovelEntranceView extends StatefulWidget {
  final double viewWidth;
  final double viewHeight;
  final String type;
  final String style;

  const NovelEntranceView(
      {Key? key,
      required this.viewWidth,
      required this.viewHeight,
      required this.type,
      required this.style})
      : super(key: key);

  @override
  _NovelEntranceViewState createState() => _NovelEntranceViewState();
}

class _NovelEntranceViewState extends State<NovelEntranceView> {
  final String _viewType =
      "com.example.flutter_pangrowth_plugin/NovelEntranceView";

  MethodChannel? _channel;

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
            "type": widget.type,
            "style": widget.style,
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
            "type": widget.type,
            "style": widget.style,
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
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
    }
  }
}

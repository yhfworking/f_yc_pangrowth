import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FYcPangrowthVideoNewsSingleCardView extends StatefulWidget {
  final double viewWidth;
  final double viewHeight;

  const FYcPangrowthVideoNewsSingleCardView(
      {Key? key, required this.viewWidth, required this.viewHeight})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FYcPangrowthVideoNewsSingleCardViewState createState() =>
      _FYcPangrowthVideoNewsSingleCardViewState();
}

class _FYcPangrowthVideoNewsSingleCardViewState
    extends State<FYcPangrowthVideoNewsSingleCardView> {
  final String _viewType = "f_yc_pangrowth_video/NewsSingleCardView";

  MethodChannel? _channel;

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
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
    }
  }
}

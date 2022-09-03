import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsTabOneView extends StatefulWidget {
  final double viewWidth;
  final double viewHeight;

  const NewsTabOneView(
      {Key? key, required this.viewWidth, required this.viewHeight})
      : super(key: key);

  @override
  _NewsTabOneViewState createState() => _NewsTabOneViewState();
}

class _NewsTabOneViewState extends State<NewsTabOneView> {
  final String _viewType = "com.yhfwork.f_yc_pangrowth/NewsTabOneView";

  MethodChannel? _channel;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container();
      // return SizedBox(
      //   width: widget.viewWidth,
      //   height: widget.viewHeight,
      //   child: AndroidView(
      //     viewType: _viewType,
      //     creationParams: {
      //       "viewWidth": widget.viewWidth,
      //       "viewHeight": widget.viewHeight,
      //     },
      //     onPlatformViewCreated: _registerChannel,
      //     creationParamsCodec: const StandardMessageCodec(),
      //   ),
      // );
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

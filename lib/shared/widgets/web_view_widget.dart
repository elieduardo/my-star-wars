import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({Key? key}) : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  bool isLoading = true;
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://www.starwars.com/community',
          onProgress: (int progress) {
            if (progress > 80)
              setState(() {
                isLoading = false;
              });
          },
          onPageFinished: (String value) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        if (isLoading)
          Center(
            child: CircularProgressIndicator(
              color: AppColors.yellow,
            ),
          ),
      ],
    );
  }
}

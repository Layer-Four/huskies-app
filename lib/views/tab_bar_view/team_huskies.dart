import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebTeamContainer extends StatefulWidget {
  const WebTeamContainer({Key? key}) : super(key: key);

  @override
  _WebTeamContainerState createState() => _WebTeamContainerState();
}

class _WebTeamContainerState extends State<WebTeamContainer> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: WebView(
              initialUrl: 'https://www.kassel-huskies.de/team',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () async {
                  if (await controller.canGoForward()) {
                    await controller.goForward();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

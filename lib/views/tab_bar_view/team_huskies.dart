import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebTeamContainer extends StatefulWidget {
  const WebTeamContainer({super.key});

  @override
  State<WebTeamContainer> createState() => _WebTeamContainerState();
}

class _WebTeamContainerState extends State<WebTeamContainer> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              icon: const Icon(
                Icons.arrow_back,
                color: AppTheme.black,
              ),
              onPressed: () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                }
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: AppTheme.black,
              ),
              onPressed: () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

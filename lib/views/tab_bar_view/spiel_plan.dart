import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebTeamSpielPlan extends StatefulWidget {
  const WebTeamSpielPlan({super.key});

  @override
  State<WebTeamSpielPlan> createState() => _WebTeamSpielPlanState();
}

class _WebTeamSpielPlanState extends State<WebTeamSpielPlan> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: WebView(
            initialUrl: 'https://www.kassel-huskies.de/saison/spielplan',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller =
                  webViewController; // Initialize the WebViewController
            },
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       icon: const Icon(Icons.arrow_back),
        //       onPressed: () async {
        //         if (await controller.canGoBack()) {
        //           await controller.goBack();
        //         }
        //       },
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.arrow_forward),
        //       onPressed: () async {
        //         if (await controller.canGoForward()) {
        //           await controller.goForward();
        //         }
        //       },
        //     ),
        //   ],
        // )
      ],
    );
  }
}

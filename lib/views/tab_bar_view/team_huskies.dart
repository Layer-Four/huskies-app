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
      appBar: AppBar(
        title: const Text('Huskies Team'),
      ),
      body: WebView(
        initialUrl: 'https://www.kassel-huskies.de/team',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
        },
        onPageFinished: (String url) {
          // Execute JavaScript code after page has finished loading
          controller.runJavascript(
              "document.querySelector('.img-fluid').style.display = 'none' ");
          controller.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          // Additional JavaScript code can be executed here if needed
        },
      ),
    );
  }
}

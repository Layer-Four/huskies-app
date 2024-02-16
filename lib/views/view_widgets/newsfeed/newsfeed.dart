// import 'package:flutter/material.dart';
// import 'package:huskies_app/views/view_widgets/newsfeed/navigation_controlls.dart';
// import 'package:huskies_app/views/view_widgets/newsfeed/web_view_stack.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// // import 'src/navigation_controls.dart';
// // import 'src/web_view_stack.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: NewsFeed(),
//     ),
//   );
// }

// class NewsFeed extends StatefulWidget {
//   const NewsFeed({super.key});

//   @override
//   State<NewsFeed> createState() => _NewsFeedState();
// }

// class _NewsFeedState extends State<NewsFeed> {
//   // Add from here...
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest(
//         Uri.parse('https://www.kassel-huskies.de/news'),
//       );
//   }
//   // ...to here.

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView'),
//         // Add from here...
//         actions: [
//           NavigationControls(controller: controller),
//         ],
//         // ...to here.
//       ),
//       body: WebViewStack(controller: controller),
//     );
//   }
// }

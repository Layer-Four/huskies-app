// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/constants/sponsors.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/loading_view.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  const Helpers();

  static Widget buildIndicator({required int selectedIndex, required int length}) =>
      AnimatedSmoothIndicator(
        activeIndex: selectedIndex,
        count: length,
        effect: const SlideEffect(
          dotColor: Colors.grey,
          activeDotColor: Colors.black,
          dotHeight: 8,
          dotWidth: 8,
        ),
      );

  static Container buildScoreboardRow({
    required BuildContext context,
    required int place,
    required String imageSource,
    required int games,
    required int points,
    required int goals,
    required int difference,
  }) =>
      Container(
        height: 35,
        margin: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
            color: place != 1 ? AppTheme.white : const Color.fromARGB(255, 235, 231, 231)),
        child: Row(
          mainAxisAlignment: AppTheme.mainAlignEvenly,
          children: [
            Text('$place.', style: const TextStyle(color: AppTheme.black)),
            SizedBox(
              height: 30,
              child: Center(child: Image.asset('assets/$imageSource', width: 20, height: 20)),
            ),
            Center(child: Text('$games', style: const TextStyle(color: AppTheme.black))),
            Center(child: Text('$points', style: const TextStyle(color: AppTheme.black))),
            Center(child: Text('$goals', style: const TextStyle(color: AppTheme.black))),
            Center(child: Text('$difference', style: const TextStyle(color: AppTheme.black))),
          ],
        ),
      );

  static Container buildTableHead({
    required BuildContext context,
    required String position,
    required String team,
    required String games,
    required String points,
    required String goals,
    required String difference,
  }) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
        color: AppTheme.primary,
      ),
      child: Row(
        mainAxisAlignment: AppTheme.mainAlignEvenly,
        children: [
          Text(position, style: const TextStyle(color: AppTheme.white)),
          Text(team, style: const TextStyle(color: AppTheme.white)),
          Text(games, style: const TextStyle(color: AppTheme.white)),
          Text(points, style: const TextStyle(color: AppTheme.white)),
          Text(goals, style: const TextStyle(color: AppTheme.white)),
          Text(difference, style: const TextStyle(color: AppTheme.white)),
        ],
      ),
    );
  }

  /// use this function for  [Helpers.showLoadingView()] method
  ///   + $1  the  advertising String  from sponsor
  ///   - $2 the associated asset image name
  static (String, String) getAdvertising() {
    final index = Random().nextInt(sponsors.length);
    final imageString = sponsors[index].values.first;
    final advertisingString = sponsors[index].keys.first;
    return (imageString, advertisingString);
  }

  /// ownNavigation function.
  static loadAndNavigate({
    required BuildContext context,
    required WidgetRef ref,
    required ViewPage nextView,
  }) {
    const LoadingView();
    // showLoadingView(context);
    Future.delayed(const Duration(milliseconds: 1500)).then((_) {
      Navigator.of(context).pop();
      ref.read(viewProvider.notifier).state = nextView;
    });
  }

  static Future<File?> pickImageFromGalery() async {
    final ImagePicker picker = ImagePicker();
    XFile? file;
    file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) return File(file.path);
    return null;
  }

  static Future<File?> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? file;
    file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) return File(file.path);
    return null;
  }

  static Future<File?> asktForImage(BuildContext context, WidgetRef ref) async {
    showDialog(
        context: context,
        builder: (context) => Card(
              margin: AppTheme.regtangelCard,
              child: Column(
                mainAxisAlignment: AppTheme.mainAlignCenter,
                children: [
                  Padding(
                    padding: AppTheme.paddingM,
                    child: SymetricButton(
                        color: Colors.green,
                        text: 'Wähle ein Bild aus \ndeiner Galerie',
                        onPressed: () async {
                          PermissionStatus storeStatus = await Permission.storage.request();
                          if (!storeStatus.isGranted) {
                            await Permission.storage.request();
                          }
                          if (storeStatus.isGranted || storeStatus.isDenied) {
                            final image = await Helpers.pickImageFromGalery();
                            if (image != null) {
                              ref.read(userProvider.notifier).updateUserProfile(image: image);
                              showSnackbar(context, ' Bild ausgewählt');
                              Navigator.of(context).pop();
                              return image;
                            } else {
                              showSnackbar(context, 'kein Bild ausgewählt');
                              Navigator.of(context).pop();
                            }
                          }
                        }),
                  ),
                  Padding(
                    padding: AppTheme.paddingM,
                    child: SymetricButton(
                        color: Colors.green,
                        text: 'Erstelle ein neues \nProfile von dir',
                        onPressed: () async {
                          final cameraPermission = await Permission.camera.request();
                          if (cameraPermission.isGranted || cameraPermission.isDenied) {
                            final image = await Helpers.pickImageFromCamera();
                            if (image != null) {
                              showSnackbar(context, 'Bild ausgewählt!');
                              ref.read(userProvider.notifier).updateUserProfile(image: image);
                              Navigator.of(context).pop();
                              return image;
                            }
                            showSnackbar(context, 'kein Bild ausgewählt');
                            Navigator.of(context).pop();
                          }
                        }),
                  ),
                ],
              ),
            ));
    return null;
  }

  static void launchToWebsite(Product product) async {
    final url = Uri.parse(product.shopUrl);
    try {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw Exception('its a trap \ncheck launchToWebsite and refactor error handling');
    }
  }
//   ProductNotifier._();
//   factory ProductNotifier({
//     required List<Product> products,
//   });
//   // Future<List<Product>> _fetchProducts() async {
//   //   final dbData = await productsDB.then((value) {
//   //     print(value.toString());
//   //   });
//   //   final json = dbData.data();

//   //   for (var element in json) {}
//   // }

// }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
          context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

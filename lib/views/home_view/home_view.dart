// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/match_view_widget.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerStatefulWidget {
  static const HomeView _instance = HomeView._internal();
  factory HomeView() => _instance;
  const HomeView._internal();

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int indexUpperCarousel = 0;
  int indexLowerCarousel = 0;
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return SafeArea(
      child: Scaffold(
        // drawer: const Drawer(),
        appBar: AppBar(
          toolbarHeight: 60,
          // iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppTheme.primary,
          // toolbarHeight: 70,
          title: HeadWidget(
            start: user != null
                ? UserIconWidget(onPressed: () {})
                : const SizedBox(),
            center: Text(
              "Hallo ${user?.displayedName?.split(',').first ?? ''}${user == null ? '' : ' Willkommen zurück'}",
              style: AppTheme.titleWhite,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          padding: AppTheme.paddingXL,
          color: AppTheme.primary,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                    decoration: AppTheme.whiteBox,
                    height: 130,
                    child: const Column(
                      children: [
                        Padding(
                          padding: AppTheme.padding8_4,
                          child: Text('Nachstes Match',
                              style: AppTheme.defaultText),
                        ),
                        MatchViewWidget(),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Helpers.launchToWebsite(
                              'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung');
                        },
                        child: Stack(
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black
                                    .withOpacity(0.3), // Set opacity level here
                                BlendMode.srcOver,
                              ),
                              child: SizedBox(
                                height: 200,
                                child: Image.network(
                                  'https://www.kassel-huskies.de/fileadmin/_processed_/b/5/csm_Huskies_MacAulay_ce60d17c73.jpg',
                                  width: MediaQuery.of(context).size.width * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Positioned widgets to position the text at the bottom left
                            const Positioned(
                              bottom: 0,
                              left: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      '15.02.2024 . TEAMUPDATE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, bottom: 17, top: 5),
                                    child: Text(
                                      'STEPHEN MACAULAY WIRD EIN HUSKY',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //--------- Mehr News -----------------------//
                      SymetricButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 90),
                        color: AppTheme.white,
                        style: AppTheme.textMedium,
                        onPressed: () {
                          Helpers.launchToWebsite(
                              'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung');
                          //     // const url = 'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung';
                          //     // launchURL(url);
                        },
                        text: 'Mehr News',
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Container(
                    decoration: AppTheme.whiteBox,
                    child: Row(
                      children: [
                        Image.asset('assets/images/first.png'),
                        const Column(
                          children: [
                            Padding(
                              padding: AppTheme.padding0_30,
                              child: Text(
                                'Neue Fanartikel',
                                style: AppTheme.largBoldText,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SymetricButton(
                                text: 'ZUM SHOP',
                                color: AppTheme.buttonBackgroundColor,
                              ),
                            ),
                            // Icon(Icons.arrow_forward)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

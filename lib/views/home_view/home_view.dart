// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/match_view_widget.dart';
// import 'package:huskies_app/views/view_widgets/home_view_widgets/page_view_widget.dart';
// import 'package:huskies_app/views/view_widgets/score_board_widgets/match_card_widget.dart';
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
        drawer: const Drawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppTheme.customButton,
          toolbarHeight: 70,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const UserIconWidget(),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "Hallo ${user.displayedName?.split(',').first ?? ''}",
                  style: AppTheme.titleWhite,
                ),
                user.displayedName != null
                    ? const Text(
                        "Willkommon zurück!",
                        style: AppTheme.textDefault,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        body: Container(
          padding: AppTheme.paddingXL,
          color: AppTheme.customButton,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: 120,
                    color: AppTheme.white,
                    // padding: AppTheme.paddingXL,
                    child: const MatchViewWidget(),
                  ),
                ),
                //   child: const MatchCard(
                //     isLastMatch: false,
                //     homeScore: 3,
                //     visitorScore: 1,
                //     homeImage: 'huskies.png',
                //     visitorImage: 'fuechse.png',
                //   ),
                // ),
                // News Section
                // AppTheme.sizedBox14,
                // Display the most recent news image
                Card(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Helpers.launchToWebsite(
                              'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung');
                          // const url = 'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung';
                          // launchURL(url);
                        },
                        child: Stack(
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3), // Set opacity level here
                                BlendMode.srcOver,
                              ),
                              child: SizedBox(
                                height: 220,
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
                                    padding: EdgeInsets.only(left: 8, bottom: 17, top: 5),
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
                        padding: AppTheme.pointsBoxPadding,
                        color: Color.fromARGB(255, 97, 80, 158),
                        onPressed: () {
                          Helpers.launchToWebsite(
                              'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung');
                          //     // const url = 'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung';
                          //     // launchURL(url);
                        },
                        text:
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: AppTheme.white,
                            //     border: Border.all(
                            //       color: Colors.black,
                            //       width: 1.0,
                            //     ),
                            //     // borderRadius: BorderRadius.circular(8.0),
                            //     // Adjust the radius as needed
                            //   ),
                            //   padding: AppTheme.paddingS,
                            //   alignment: Alignment.center,
                            //   child: const Text(
                            'Mehr News',
                        // style: TextStyle(
                        //   // color: Colors.white,
                        //   fontSize: 16,
                        // ),
                      ),
                      // ),
                      // ),
                    ],
                  ),
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                    // color: AppTheme.white,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('New Fanartikel'),
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/first.png'),
                            ),
                            Text('ZUM \n SHOP'),
                            Icon(Icons.arrow_forward)
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

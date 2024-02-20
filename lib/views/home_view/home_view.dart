// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppTheme.white),
          backgroundColor: AppTheme.primary,
          toolbarHeight: 70,
          title: Align(
            alignment: AppTheme.alignCenterLeft,
            child: Row(
              children: [
                const UserIconWidget(),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "Hallo ${user?.displayedName?.split(',').first ?? ''}",
                  style: AppTheme.titleWhite,
                ),
                user?.displayedName != null
                    ? const Text(
                        "Willkommon zurück!",
                        style: AppTheme.whiteDefaultText,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        body: Container(
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
                          child: Text('Nachstes Match', style: AppTheme.defaultText),
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
                                AppTheme.black.withOpacity(0.3), // Set opacity level here
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
                                      style: AppTheme.whiteDefaultTextBold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, bottom: 17, top: 5),
                                    child: Text(
                                      'STEPHEN MACAULAY WIRD EIN HUSKY',
                                      style: AppTheme.whiteDefaultTextBold,
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 90),
                        color: AppTheme.white,
                        style: AppTheme.textMedium,
                        onPressed: () {
                          Helpers.launchToWebsite(
                              'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung');
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
                        Column(
                          children: [
                            const Padding(
                              padding: AppTheme.padding0_30,
                              child: Text(
                                'Neue Fanartikel',
                                style: AppTheme.largBoldText,
                              ),
                            ),
                            Padding(
                              padding: AppTheme.paddingM,
                              child: SymetricButton(
                                text: 'ZUM SHOP',
                                color: AppTheme.buttonBackgroundColor,
                                onPressed: () {
                                  ref.read(viewProvider.notifier).state = ViewPage.shop;
                                },
                              ),
                            ),
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

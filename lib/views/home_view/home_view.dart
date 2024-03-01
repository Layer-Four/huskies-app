import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/match_view_widget.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';
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
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // decoration: const BoxDecoration(color: Color.fromARGB(255, 239, 237, 237)),
      child: Column(
        mainAxisAlignment: AppTheme.mainAlignEvenly,
        children: [
          Card(
            elevation: 7,
            child: SizedBox(
              height: height / 6,
              child: const Column(
                children: [
                  Padding(
                    padding: AppTheme.padding8_4,
                    child: Text('Nächstes Match', style: AppTheme.defaultText),
                  ),
                  MatchViewWidget(),
                ],
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: height / 2.5,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Helpers.launchToWebsite(
                        'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung',
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                    child: Stack(
                      children: [
                        ColorFiltered(
                          // Set opacity level here
                          colorFilter: ColorFilter.mode(
                            AppTheme.black.withOpacity(0.0),
                            BlendMode.srcOver,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            )),
                            child: Image.network(
                              'https://www.kassel-huskies.de/fileadmin/_processed_/b/5/csm_Huskies_MacAulay_ce60d17c73.jpg',
                              height: height / 2.8,
                              // width: MediaQuery.of(context).size.width * 1,
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
                  SymmetricButton(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 90),
                    color: AppTheme.white,
                    style: AppTheme.textMedium,
                    onPressed: () {
                      Helpers.launchToWebsite(
                        'https://www.kassel-huskies.de/news/detail/macaulay-verpflichtung',
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                    text: 'Mehr News',
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: height / 6,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/halloween_jersy.jpg',
                    width: 180,
                    height: 200,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Neue Fanartikel',
                          style: AppTheme.largBoldText,
                        ),
                      ),
                      Padding(
                        padding: AppTheme.paddingM,
                        child: SymmetricButton(
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
    );
  }
}

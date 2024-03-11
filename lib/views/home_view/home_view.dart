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
    const url =
        'https://www.kassel-huskies.de/news/detail/erster-karriere-sieg-fuer-pankraz-huskies-holen-zwei-punkte-in-weisswasser';
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // decoration: const BoxDecoration(color: Color.fromARGB(255, 239, 237, 237)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => ref.read(viewProvider.notifier).state = ViewPage.ticket,
            child: Card(
              child: SizedBox(
                height: height / 6,
                child: Column(
                  children: [
                    Padding(
                      padding: AppTheme.padding8_4,
                      child: Text(
                        'Nächstes Match',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const MatchViewWidget(),
                  ],
                ),
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
                          url,
                          mode: LaunchMode.inAppWebView,
                        );
                      },
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3),
                            topRight: Radius.circular(3),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/new_news.png',
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      Helpers.launchToWebsite(
                        'https://www.kassel-huskies.de/news',
                        mode: LaunchMode.inAppWebView,
                      );
                    },
                    child: SizedBox(
                      height: 45,
                      width: 400,
                      child: Center(
                        child: Text(
                          'Mehr News',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
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
                    height: 180,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Neue Fanartikel',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w800),
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/user_views/user_view.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/page_view_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    // final state = ref.read(provider);
    // final notifier = ref.read(provider.notifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.customButton,
          toolbarHeight: 120,
          title: Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  UserIconWidget(
                    image: 'da.jpg',
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const UserProfileView())),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 25, bottom: 10),
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //   ),
                  //   clipBehavior: Clip.antiAlias,
                  //   child: Image.asset(
                  //     'assets/da.jpg',
                  //     width: 35,
                  //   ),
                  //   // ),
                  // ),
                  const Text("Hallo David", style: AppTheme.titleWhite),
                  const Text("Willkommon zurück!", style: AppTheme.textDefault),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: AppTheme.customButton,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: AppTheme.hugePaddingBottom,
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return const UserInfoWidget();
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 110,
                      onPageChanged: (index, reason) {
                        setState(() {
                          indexUpperCarousel = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20,
              //   child: buildIndicator(
              //       index: indexUpperCarousel,
              //       isBackgroundColor: Colors.white),
              // ),
              /*........Trikos Section...............*/

              Container(
                color: AppTheme.white,
                child: Column(
                  mainAxisAlignment: AppTheme.mainCenter,
                  children: [
                    Container(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: AppTheme.mainCenter,
                      children: [
                        Padding(
                          padding: AppTheme.paddingS,
                          child: Image.asset(
                            'assets/second.png',
                            width: 80,
                          ),
                        ),
                        Padding(
                          padding: AppTheme.paddingS,
                          child: Image.asset('assets/first.png', width: 80),
                        ),
                        Padding(
                          padding: AppTheme.paddingS,
                          child: Image.asset('assets/first.png', width: 80),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: AppTheme.paddingS,
                      child: Text(
                        'Unsere neuen Trikots sind da!',
                        style: AppTheme.textDefaultBlue,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 85,
                        height: 30,
                        padding: AppTheme.paddingS,
                        decoration: AppTheme.homePageButton,
                        child: const Center(
                          child: Text(
                            "Shop",
                            style: AppTheme.textDefaultSmall10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Puzzle Section===================================

              Container(
                color: AppTheme.huskiesPuzzle,
                child: Stack(
                  children: [
                    AppTheme.puzzleHuskiesImg,
                    // Container(
                    //   color: Color.fromARGB(207, 213, 236, 255),
                    // ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 20,
                      child: SizedBox(
                        // padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Kassel Huskies",
                              style: AppTheme.titleBlue,
                            ),
                            const Text(
                              "NFT-Puzzle",
                              style: AppTheme.titleBlue,
                            ),
                            const Text(
                              "Sichere dir jetzt dein exklusives,\n limitiertes Kassel Huskies \n Puzzlestück und zeige deine \n Unterschtützung für das Team.",
                              style: AppTheme.textDefaultSmall10Black,
                              textAlign: AppTheme.textCenter,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 85,
                                height: 30,
                                padding: AppTheme.paddingM,
                                decoration: AppTheme.homePageButton,
                                child: const Center(
                                  child: Text(
                                    "Mehr Infos",
                                    style: AppTheme.textDefaultSmall10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(
          {required int index, required Color isBackgroundColor}) =>
      AnimatedSmoothIndicator(
        activeIndex: index,
        count: 3,
        effect: SlideEffect(
            dotHeight: 8, dotWidth: 8, activeDotColor: isBackgroundColor),
      );
}

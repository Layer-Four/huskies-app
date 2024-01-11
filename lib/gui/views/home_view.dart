import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/gui/views/widgets/match_view_widget.dart';
import 'package:huskies_app/gui/views/widgets/page_view_widget.dart';
import 'package:huskies_app/logic/globals.dart';
import 'package:huskies_app/logic/helpers/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends ConsumerStatefulWidget {
  static const HomeView _homeViewInstance = HomeView._();
  factory HomeView() => _homeViewInstance;

  const HomeView._();

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int indexUpperCarousel = 0;
  int indexLowerCarousel = 0;
  @override
  Widget build(BuildContext context) {
    final state = ref.read(provider);
    final notifier = ref.read(provider.notifier);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 22, 63, 92),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 40,
                    //   child: IconButton(
                    //     //TODO: Navigate to UserProfileView
                    //     //TODO: Write UserProfileView.
                    //     onPressed: () {
                    //       notifier.greeting(
                    //           '${state.products.elementAt(0).values.toList()[2]}');
                    //     },
                    //     icon: const Icon(Icons.menu),
                    //     color: Colors.white,
                    //   ),
                    // ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/da.jpg',
                            width: 35,
                          ),
                          // ),
                        ),
                        const Text("Hallo David",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        const Text(
                          "Willkommon zurück!",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return const PageViewWidget();
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
                SizedBox(
                  height: 20,
                  child: buildIndicator(
                      index: indexUpperCarousel,
                      isBackgroundColor: Colors.white),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Nächstes Match",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      CarouselSlider.builder(
                        itemCount: 3,
                        itemBuilder: (context, index, realIndex) {
                          return const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: MatchViewWidget(),
                          );
                        },
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 80,
                          onPageChanged: (index, reason) {
                            setState(() {
                              indexLowerCarousel = index;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Center(
                          child: buildIndicator(
                              index: indexLowerCarousel,
                              isBackgroundColor: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                //Puzzle Section===================================
                Container(
                  color: const Color.fromARGB(255, 168, 199, 224),
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/puzzle_huskies.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                        ),
                      ),
                      // Container(
                      //   color: Color.fromARGB(207, 213, 236, 255),
                      // ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Kassel Huskies",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(255, 22, 63, 92),
                              ),
                            ),
                            const Text(
                              "NFT-Puzzle",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(255, 22, 63, 92),
                              ),
                            ),
                            const Text(
                              "sichere dir jetzt dein exklusives.\n limitiertes Kassel Huskies \n Puzzlestück und zeige deine \n Unterschtützung für das Team.",
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                padding: AppTheme.mediumPadding,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 22, 63, 92),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "Mehr Infos",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

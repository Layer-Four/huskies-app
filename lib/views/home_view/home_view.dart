import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/page_view_widget.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';

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
        appBar: AppBar(
          backgroundColor: AppTheme.primary,
          toolbarHeight: 120,
          centerTitle: true,
          title: Column(
            children: [
              const UserIconWidget(),
              user != null
                  ? Text("Hallo ${user.displayedName?.split(',').first ?? ''}\nWillkommon zurück!",
                      style: AppTheme.titleWhite)
                  : const Text("Hallo", style: AppTheme.whiteDefaultText)
            ],
          ),
        ),
        body: Container(
          color: AppTheme.primary,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: AppTheme.paddingBottom20,
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
              Container(
                color: AppTheme.white,
                padding: AppTheme.paddingS,
                child: Column(
                  mainAxisAlignment: AppTheme.mainAlignCenter,
                  children: [
                    Row(
                      mainAxisAlignment: AppTheme.mainAlignCenter,
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
                    const SymetricButton(color: AppTheme.primary, text: 'Mehr Infos')
                  ],
                ),
              ),

              //Puzzle Section===================================

              Container(
                color: AppTheme.huskiesPuzzle,
                child: Stack(
                  children: [
                    AppTheme.puzzleHuskiesImg,
                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 20,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text("Kassel Huskies", style: AppTheme.titleBlue),
                            Text("NFT-Puzzle", style: AppTheme.titleBlue),
                            Text(
                              "Sichere dir jetzt dein exklusives,\n limitiertes Kassel Huskies \n Puzzlestück und zeige deine \n Unterschtützung für das Team.",
                              style: AppTheme.textMedium,
                              textAlign: AppTheme.textCenter,
                            ),
                            Padding(
                              padding: AppTheme.paddingTop20,
                              child: SymetricButton(color: AppTheme.primary, text: 'Mehr Infos'),
                            )
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
}

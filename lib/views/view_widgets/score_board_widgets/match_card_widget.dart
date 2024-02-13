import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/match_view_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/match_result_widget.dart';

class MatchCard extends StatefulWidget {
  final int? homeScore;
  final int? visitorScore;
  final String? homeImage;
  final String? visitorImage;
  final bool isLastMatch;
  final Color color;
  const MatchCard({
    super.key,
    this.homeScore,
    this.visitorScore,
    this.homeImage,
    this.visitorImage,
    this.isLastMatch = true,
    this.color = Colors.white,
  });

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  final matches = List.generate(13, (index) => index++);
  int currentMatch = 0;
  @override
  Widget build(BuildContext context) => Card(
        elevation: 7,
        child: Container(
          decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(8)),
          // height: MediaQuery.of(context).size.height / 3.563,
          // height: 195,
          child: Column(
            mainAxisAlignment: AppTheme.mainStart,
            children: [
              Padding(
                padding: AppTheme.paddingM,
                child: Text(
                  widget.isLastMatch ? 'Letztes Match' : 'Nächstes Match',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              CarouselSlider.builder(
                itemCount: 15,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: 120,
                  onPageChanged: (index, _) => setState(() => currentMatch = index),
                ),
                itemBuilder: (BuildContext context, int i, _) => widget.isLastMatch
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: AppTheme.mainStart,
                        children: [
                          LastMatchResultWidget(
                            homeScore: widget.homeScore,
                            visitiorScore: widget.visitorScore,
                            homeImage: widget.homeImage,
                            visitorImage: widget.visitorImage,
                          ),
                          Padding(
                            padding: AppTheme.paddingM,
                            child: TextButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => Container(
                                  margin: AppTheme.popUpMargin,
                                  color: Colors.white70,
                                  alignment: AppTheme.alignCenter,
                                  child: const Text('Spielbericht'),
                                ),
                              ),
                              child: Container(
                                padding: AppTheme.paddingS,
                                color: AppTheme.buttonBackgroundColor,
                                child: const Text(
                                  'Spielbericht',
                                  style: TextStyle(color: AppTheme.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const MatchViewWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Helpers.buildIndicator(
                  selectedIndex: currentMatch,
                  length: matches.length,
                ),
              ),
            ],
          ),
        ),
      );
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/home_view_widgets/match_view_widget.dart';
import 'package:huskies_app/views/view_widgets/score_board_widgets/match_result_widget.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';

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
  final matches = List.generate(5, (index) => index++);
  int currentMatch = 0;
  @override
  Widget build(BuildContext context) => Card(
        elevation: 7,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: AppTheme.lowRoundedCorner,
          ),
          child: Column(
            mainAxisAlignment: AppTheme.mainAlignStart,
            children: [
              Padding(
                padding: AppTheme.paddingS,
                child: Text(
                  widget.isLastMatch ? 'Letztes Match' : 'Nächstes Match',
                  style: AppTheme.largBoldText,
                ),
              ),
              CarouselSlider.builder(
                itemCount: matches.length,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  height: 130,
                  onPageChanged: (index, _) => setState(() => currentMatch = index),
                ),
                itemBuilder: (BuildContext context, int i, _) => widget.isLastMatch
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: AppTheme.mainAlignStart,
                        children: [
                          LastMatchResultWidget(
                            homeScore: widget.homeScore,
                            visitiorScore: widget.visitorScore,
                            homeImage: widget.homeImage,
                            visitorImage: widget.visitorImage,
                          ),
                          Padding(
                              padding: AppTheme.paddingM,
                              child: SymetricButton(
                                color: AppTheme.primary,
                                text: 'Spielbericht',
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => Container(
                                    margin: AppTheme.padding40_100,
                                    color: Colors.white70,
                                    alignment: AppTheme.alignCenter,
                                    child: const Text('Spielbericht'),
                                  ),
                                ),
                              )),
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

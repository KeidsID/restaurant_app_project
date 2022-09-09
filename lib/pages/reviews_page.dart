import 'package:flutter/material.dart';

import '../common.dart';
import '../data/api/api_service.dart';
import '../data/model/from_api/restaurant_detail.dart';
import '../widgets/review_container.dart';

class ReviewsPage extends StatelessWidget {
  static const routeName = '/reviews_page';
  final Restaurant restaurant;

  const ReviewsPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mainHMargin = 16;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: restaurant.customerReviews
                .map((e) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: mainHMargin,
                      ),
                      child: ReviewContainer(
                        customerReviews: e,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        height: kToolbarHeight,
        child: Row(
          children: [
            Flexible(
              child: Image.network(
                ApiService.imageSmall(restaurant.pictureId),
              ),
            ),
            const Flexible(child: SizedBox(width: 8)),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    overflow: TextOverflow.ellipsis,
                    style: AppBarTheme.of(context)
                        .titleTextStyle
                        ?.copyWith(color: secondaryColor),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .reviewHeading(restaurant.customerReviews.length),
                    style: txtThemeCaption?.copyWith(
                      color: primaryColorBrighter,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

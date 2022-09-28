import 'package:flutter/material.dart';
import 'common_card.dart';
import 'static_hotel_data/hotel_list_static_data.dart';


class CategoryView extends StatelessWidget {
  final VoidCallback callback;
  final HotelListData popularList;
  final AnimationController animationController;
  final Animation<double> animation;

  const CategoryView(
      {Key? key,
        required this.popularList,
        required this.animationController,
        required this.animation,
        required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: child,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, bottom: 24, top: 16, right: 8),
          child: CommonCard(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),

              child: AspectRatio(
                aspectRatio: 1.9,
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.9,
                      child: Image.asset(
                        popularList.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.withOpacity(0.4),
                                    Colors.grey.withOpacity(0.0),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, bottom: 32, top: 8, right: 8),
                                child: Text(
                                  popularList.titleTxt,
                                  style:
                                  const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
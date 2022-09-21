import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phase3/core/resources/strings_manager.dart';
import 'package:phase3/features/login/presentation/pages/login_page.dart';
import 'package:phase3/features/login/presentation/widgets/my_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/routes.dart';


var boardController = PageController();

bool isLast = false;


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    image: ImageAssets.first,
    title: AppStrings.bestHotelDeals,
    body: AppStrings.bookOneOfYourUnique,
  ),
  BoardingModel(
    image: ImageAssets.second,
    title: AppStrings.bestHotelDeals,
    body: AppStrings.bookOneOfYourUnique,
  ),
  BoardingModel(
    image: ImageAssets.third,
    title: AppStrings.bestHotelDeals,
    body: AppStrings.bookOneOfYourUnique,
  ),
];

class OnBoardingScreen extends StatefulWidget {


  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}



class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      //extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 900.0,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemBuilder: (context, index) =>
                            buildBoarding(boarding[index], context),
                        itemCount: boarding.length,
                        controller: boardController,
                        onPageChanged: (int index)
                        {
                          if(index == boarding.length -1)
                          {
                            setState(() {
                              isLast = true;
                            });
                          }else{
                            setState(() {
                              isLast = false;
                            });
                          }
                        },
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


}


Widget buildBoarding(BoardingModel model, context) => Column(
      children: [
        Image(
          image: AssetImage(
            model.image,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 25.0, color: Colors.white),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 15.0, color: Colors.grey),
        ),
        const SizedBox(
          height: 50.0,
        ),
        SmoothPageIndicator(
          controller: boardController,
          count: boarding.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 10.0,
            dotWidth: 10.0,
            dotColor: Colors.grey,
            activeDotColor: Colors.deepOrange,
            expansionFactor: 1.1,
            spacing: 4,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        MyButton(
          onPressed: ()
          {
            if(isLast){
              Navigator.pushNamed(
                context,
                  Routes.login,
              );
            }else{
              boardController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastLinearToSlowEaseIn,
              ).then((value){

              });
            }
          },
          text: AppStrings.login,
          background: Colors.teal,
        ),
        const SizedBox(
          height: 20.0,
        ),
        MyButton(
          onPressed: () {},
          text: AppStrings.createAccount,
          background: Colors.teal,
        ),
      ],
    );

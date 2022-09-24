import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'common_card.dart';
import 'common_search_bar.dart';

class SerachBarDesign extends StatelessWidget {
  const SerachBarDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.only(left: 24,right: 24,top: 15),
      child:CommonCard(
        radius: 36,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          onTap: (){},
          child: CommonSearchBar(
            iconData: FontAwesomeIcons.magnifyingGlass ,
            enabled: true,
            text: 'Where are you going...?',


          ),
        ),

      ) ,


    );
  }
}

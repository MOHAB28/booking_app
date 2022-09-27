import 'package:flutter/material.dart';

class CommonSearchBar extends StatelessWidget {
  final String? text;
  final TextEditingController? textEditingController;
  final bool enabled, isShow;
  final double height;
  final IconData? iconData;

  const CommonSearchBar(
      {Key? key,
        this.text,
        this.enabled = false,
        this.height = 48,
        this.iconData,
        this.isShow = true,
        this.textEditingController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: SizedBox(
        height: height,
        child: Center(
          child: Row(
            children: <Widget>[
              isShow == true
                  ? Icon(
                iconData,
                // FontAwesomeIcons.search,
                size: 18,
                color: Colors.teal,
              )
                  : const SizedBox(),
              isShow == true
                  ? const SizedBox(
                width: 30,
              )
                  : const SizedBox(),
              Expanded(
                child: TextFormField(
                  controller: textEditingController,
                  maxLines: 1,
                  enabled: enabled,
                  onChanged: (String txt) {},
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      errorText: null,
                      border: InputBorder.none,
                      hintText: text,
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
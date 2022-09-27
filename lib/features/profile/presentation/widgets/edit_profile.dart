import 'package:flutter/material.dart';

import '../../../../core/resources/routes.dart';
import '../cubit/profile/profile_cubit.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({
    Key? key,
    required this.profile,
  }) : super(key: key);

  final ProfileCubitData profile;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed(
        Routes.updateProfilePage,
        arguments: profile,
      ),
      icon: const Icon(Icons.edit),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile_cubit.dart';

class ProfileTestPage extends StatelessWidget {
   ProfileTestPage({super.key});
  final String testToken =
      "DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u";

  final ProfileCubitData data = ProfileCubitData(
    name: 'mohamed',
    email: 'mohamed@gmail.com',
    image: 'mohamed.png',
    token: "DnkaEA2eU1DNZmKIpx5I7u6ptaKeEGAA1nq4bFkClgBsYsWLyTMNsJD7O06u",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<ProfileCubit>(context).getProfile(testToken),
              child: const Text('Get profile'),
            ),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is SuccessToGetProfileState) {
                  log(state.profile.data.name);
                } else if (state is FailToGetProfileState) {
                  log('fail');
                }
              },
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app/shared/cubit/cubit.dart';
import 'package:app/shared/cubit/states.dart';
import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final appCubit = AppCubit.get(context);
          return Scaffold(
              floatingActionButton: CircleAvatar(
                backgroundColor: firstColor,
                radius: 30,
                child: InkWell(
                  child: const Icon(Icons.add),
                  onTap: () {},
                ),
              ),
              body: const Center(
                child: Text('ProfilePage ...!',
                    style: TextStyle(fontSize: 30, color: Colors.grey)),
              ));
        });
  }
}

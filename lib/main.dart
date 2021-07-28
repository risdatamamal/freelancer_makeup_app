import 'package:freelancer_makup_app/cubit/freelancer_cubit.dart';
import 'package:freelancer_makup_app/cubit/transaction_cubit.dart';
import 'package:freelancer_makup_app/cubit/user_cubit.dart';
import 'package:freelancer_makup_app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(),
        ),
        BlocProvider(
          create: (_) => FreelancerCubit(),
        ),
        BlocProvider(
          create: (_) => TransactionCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

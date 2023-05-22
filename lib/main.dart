import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/presentation/pages/home_page.dart';
import 'package:marvel_app/presentation/pages/login_page.dart';
import 'package:marvel_app/presentation/pages/onboarding_page.dart';
import 'package:marvel_app/presentation/pages/profile_page.dart';
import 'package:marvel_app/presentation/states/login_state/login_bloc.dart';
import 'package:marvel_app/presentation/states/main_state/main_bloc.dart';
import 'package:marvel_app/presentation/states/onboarding_state/onboarding_bloc.dart';
import 'package:marvel_app/presentation/states/profile_state/profile_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => OnboardingBloc()),
    BlocProvider(create: (context) => LoginBloc()),
    BlocProvider(create: (context) => ProfileBloc()),
    BlocProvider(create: (context) => MainBloc())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(GetAllDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle()
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: Scaffold(
          backgroundColor: Colors.black,
            body: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                if(state.userData != null) {
                  return const HomePage();
                }
                else if(state.userData == null && state.onboardingShowed) {
                  return const LoginPage();
                }
                else {
                  return OnboardingPage();
                }
              },
            )
        ),
      );
  }
}
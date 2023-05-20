import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/presentation/pages/login_page.dart';
import 'package:marvel_app/presentation/pages/signup_page.dart';
import 'package:marvel_app/presentation/states/onboarding_state/onboarding_bloc.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OnboardingBloc>(context).add(OnboardingEvent());
    BlocProvider.of<OnboardingBloc>(context).add(GetOnboardingDataEvent());

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingDataLoaded) {
          return PageView(
            controller: controller,
            onPageChanged: (index) {
              BlocProvider.of<OnboardingBloc>(context).add(OnboardingEvent());
              state.page = index;
            },
            children: [
              onboardingCard(
                  context, state.data.data[0].image, state.data.data[0].title),
              onboardingCard(
                  context, state.data.data[1].image, state.data.data[1].title),
              onboardingCard(
                  context, state.data.data[2].image, state.data.data[2].title),
              onboardingCard(
                  context, state.data.data[3].image, state.data.data[3].title),
              onboardingCard(
                  context, state.data.data[4].image, state.data.data[4].title),
              onboardingEnd(context)
            ],
          );
        }
        return PageView(
          controller: controller,
          onPageChanged: (index) {
            BlocProvider.of<OnboardingBloc>(context).add(OnboardingEvent());
            state.page = index;
          },
          children: [
            onboardingCard(context, "assets/images/onb1.png",
                "All your favourite \nMARVEL Movies & Series \nat one place"),
            onboardingCard(context, "assets/images/onb2.png",
                "Watch Online \nor \nDownload Offline"),
            onboardingCard(context, "assets/images/onb3.png",
                "Create profiles for \ndiffrent members & \nget personalised recommendations"),
            onboardingCard(context, "assets/images/onb4.png",
                "Plans according to your \nneeds at affordable \nprices"),
            onboardingCard(
                context, "assets/images/onb5.png", "Let’s Get Started !!!"),
            onboardingEnd(context)
          ],
        );
      },
    );
  }

  Widget onboardingCard(BuildContext context, String image, String title) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Image.asset(image),
            Padding(
              padding: EdgeInsets.only(top: height * 0.222),
              child: Image.asset("assets/images/marvel_logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.551),
              child: Center(
                child: DotsIndicator(
                  dotsCount: 6,
                  position: context.read<OnboardingBloc>().state.page,
                  decorator: const DotsDecorator(
                      activeColor: Color(0xFFED1B24), color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.639, left: 55, right: 55),
              child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.3),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: height * 0.83),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFED1B24),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero))),
                    onPressed: () {
                      controller.animateToPage(controller.page!.toInt() + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn
                      );
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget onboardingEnd(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            Image.asset("assets/images/onb6.png"),
            Padding(
              padding: EdgeInsets.only(top: height * 0.222),
              child: Image.asset("assets/images/marvel_logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.551),
              child: Center(
                child: DotsIndicator(
                  dotsCount: 6,
                  position: context.read<OnboardingBloc>().state.page,
                  decorator: const DotsDecorator(
                      activeColor: Color(0xFFED1B24), color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: height * 0.654),
              child: SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFED1B24),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero))),
                    onPressed: () {
                      context.read<OnboardingBloc>().add(SaveOnboardingShowedEvent());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: height * 0.76),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFED1B24), width: 3)
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero))),
                    onPressed: () {
                      context.read<OnboardingBloc>().add(SaveOnboardingShowedEvent());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
            )
          ],
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/presentation/pages/home_page.dart';
import 'package:marvel_app/presentation/pages/login_page.dart';
import 'package:marvel_app/presentation/pages/profile_page.dart';
import 'package:marvel_app/presentation/states/login_state/login_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late bool _passwordVisible;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.08),
              child: Image.asset("assets/images/marvel_logo_4.png", width: 188.23, height: 85.19,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: height * 0.07),
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    context
                        .read<LoginBloc>()
                        .add(CheckCredsEvent(value, passwordCont.text));
                  },
                  controller: emailCont,
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: "Enter your Email ID",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 12),
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  onChanged: (value) {
                    context
                        .read<LoginBloc>()
                        .add(CheckCredsEvent(emailCont.text, value));
                  },
                  controller: passwordCont,
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  obscureText: !_passwordVisible,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    suffixIcon: TextButton(
                      child: Text(
                        _passwordVisible ? "Hide" : "Show",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.5)),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              print(state);
              if (state is CredsChecked) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 24),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFED1B24),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                        },
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 24),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFED1B24), width: 3)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.white,
                          disabledBackgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero))),
                      onPressed: null,
                      child: const Text(
                        "Signup",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 12),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        color: Colors.white.withOpacity(0.7)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text("or",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.5))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24),
              child: Center(
                child: Text("Continue With",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Image.asset("assets/images/facebook.png"),
                  ),
                  Image.asset("assets/images/google.png")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.5))),
                  SizedBox(
                    width: 56,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                        child: const Text("Login",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                color: Color(0xFFED1B24)))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

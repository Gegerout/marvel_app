import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/presentation/states/profile_state/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 10;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Image.asset(
                  "assets/images/marvel_logo_4.png",
                  width: 150,
                  height: 67.89,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: const Text(
                "Choose your Avatar",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w800,
                    fontSize: 24),
              ),
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: (1 / .7),
                children: List.generate(8, (index) {
                  return Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index + 1;
                          context
                              .read<ProfileBloc>()
                              .add(GetAvatarEvent(index));
                        });
                      },
                      icon: Transform.scale(
                          scale: index == selectedIndex - 1 ? 1.15 : 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              boxShadow: [
                                BoxShadow(
                                  color: index == selectedIndex - 1
                                      ? Colors.grey.shade700
                                      : Colors.black,
                                  blurRadius: 7,
                                  offset: const Offset(3.0, 3.0),
                                )
                              ],
                            ),
                            child: Image.asset(
                                "assets/images/avatar (${index + 1}).png"),
                          )),
                    ),
                  );
                }),
              ),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
              if (state is AvatarSelectedState) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 30, right: 30, bottom: height * 0.04),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFED1B24),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserNamePage(
                                      avatarIndex: selectedIndex)));
                        },
                        child: const Text(
                          "Looks good",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),
                );
              }
              return Padding(
                padding:
                    EdgeInsets.only(left: 30, right: 30, bottom: height * 0.04),
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
                        "Looks good",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      )),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class UserNamePage extends StatelessWidget {
  UserNamePage({Key? key, required this.avatarIndex}) : super(key: key);

  final int avatarIndex;

  final TextEditingController usernameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image.asset(
                    "assets/images/marvel_logo_4.png",
                    width: 150,
                    height: 67.89,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text(
                  "Enter your Username",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                          child: Image.asset(
                        "assets/images/avatar ($avatarIndex).png",
                        width: 120,
                        height: 120,
                      )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage()));
                              },
                              child: const Text(
                                "Change",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFED1B24)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: 25, right: 25),
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(GetUserNameEvent(value));
                    },
                    controller: usernameCont,
                    cursorColor: Colors.white,
                    cursorHeight: 20,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w800,
                          color: Colors.white.withOpacity(0.3)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
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
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is UserNameSetState) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 4, left: 25, right: 25),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Username is available",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF0E9B02)
                                      .withOpacity(0.8)))),
                    );
                  }
                  return Container();
                },
              ),
              const Spacer(),
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is UserNameSetState) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.04),
                    child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFED1B24),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChoosePasswordPage(
                                          avatarIndex: avatarIndex,
                                          userName: usernameCont.text,
                                        )));
                          },
                          child: const Text(
                            "Call me this",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFED1B24), width: 3)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledForegroundColor: Colors.white,
                            disabledBackgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        onPressed: null,
                        child: const Text(
                          "Call me this",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ChoosePasswordPage extends StatelessWidget {
  ChoosePasswordPage(
      {Key? key, required this.avatarIndex, required this.userName})
      : super(key: key);

  final int avatarIndex;
  final String userName;

  final TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image.asset(
                    "assets/images/marvel_logo_4.png",
                    width: 150,
                    height: 67.89,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text(
                  "Choose a password",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                          child: Image.asset(
                        "assets/images/avatar ($avatarIndex).png",
                        width: 120,
                        height: 120,
                      )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfilePage()));
                              },
                              child: const Text(
                                "Change",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFED1B24)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  userName,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: 25, right: 25),
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    obscureText: true,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      context.read<ProfileBloc>().add(GetPasswordEvent(value));
                    },
                    controller: passwordCont,
                    cursorColor: Colors.white,
                    cursorHeight: 20,
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Create a password",
                      hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w800,
                          color: Colors.white.withOpacity(0.3)),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
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
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is PasswordSetState) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 25, right: 25),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "Minimum 8 characters\nOnly A-Z, a-z, 0-9\n1 special charcter (. , _ - / &)",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF0E9B02)
                                      .withOpacity(0.8)))),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Minimum 8 characters\nOnly A-Z, a-z, 0-9\n1 special charcter (. , _ - / &)",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.white.withOpacity(0.3)))),
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is PasswordSetState) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.04),
                    child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFED1B24),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PinCodePage(
                                          avatarIndex: avatarIndex, userName: userName,
                                        )));
                          },
                          child: const Text(
                            "Looks strong",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFED1B24), width: 3)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledForegroundColor: Colors.white,
                            disabledBackgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        onPressed: null,
                        child: const Text(
                          "Looks strong",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class PinCodePage extends StatelessWidget {
  PinCodePage({Key? key, required this.avatarIndex, required this.userName}) : super(key: key);

  final int avatarIndex;
  final String userName;
  TextEditingController opt1 = TextEditingController();
  TextEditingController opt2 = TextEditingController();
  TextEditingController opt3 = TextEditingController();
  TextEditingController opt4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    String? code = "";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image.asset(
                    "assets/images/marvel_logo_4.png",
                    width: 150,
                    height: 67.89,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text(
                  "Create a pin",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: Image.asset(
                    "assets/images/avatar ($avatarIndex).png",
                    width: 120,
                    height: 120,
                  )),
              Padding(
                padding:
                    EdgeInsets.only(left: 34, right: 34, top: height * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 40,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          code = value + opt2.text + opt3.text + opt4.text;
                          context
                              .read<ProfileBloc>()
                              .add(GetPinCodeEvent(code!));
                        },
                        controller: opt1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 40,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          code = opt1.text + value + opt3.text + opt4.text;
                          context
                              .read<ProfileBloc>()
                              .add(GetPinCodeEvent(code!));
                        },
                        controller: opt2,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 40,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          code = opt1.text + opt2.text + value + opt4.text;
                          context
                              .read<ProfileBloc>()
                              .add(GetPinCodeEvent(code!));
                        },
                        controller: opt3,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 40,
                      child: TextFormField(
                        onChanged: (value) {
                          code = opt1.text + opt2.text + opt3.text + value;
                          context
                              .read<ProfileBloc>()
                              .add(GetPinCodeEvent(code!));
                        },
                        controller: opt4,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none)),
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Text(
                  "This pin will be used to \nlog-in to your profile",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white.withOpacity(0.5)),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
                if (state is PinCodeSetState) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.04),
                    child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFED1B24),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.zero))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileSuccessPage(
                                        avatarIndex: avatarIndex, userName: userName,)));
                          },
                          child: const Text(
                            "I’m all safe now",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.04),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFED1B24), width: 3)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            disabledForegroundColor: Colors.white,
                            disabledBackgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.zero))),
                        onPressed: null,
                        child: const Text(
                          "I’m all safe now",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        )),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSuccessPage extends StatelessWidget {
  const ProfileSuccessPage({Key? key, required this.avatarIndex, required this.userName})
      : super(key: key);

  final int avatarIndex;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 6),
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                "assets/images/marvel_logo_4.png",
                width: 150,
                height: 67.89,
              )),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: const Text("Your Profile is Created\nSuccessfully!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w800,
                    fontSize: 24),),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                        child: Image.asset("assets/images/avatar_circle.png", width: 260, height: 260,)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/avatar ($avatarIndex).png",
                          width: 200,
                          height: 200,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.04),
                child: Text(userName, style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w800,
                    fontSize: 20),),
              ),
              const Spacer(),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.04),
          child: SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFED1B24),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero))),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProfileSuccessPage(
                  //           avatarIndex: avatarIndex, userName: userName,)));
                },
                child: const Text(
                  "Eat Your Green Vegetables",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )),
          ),
        )
            ],
          ),
        ),
      ),
    );
  }
}

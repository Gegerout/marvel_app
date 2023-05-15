import 'package:flutter/material.dart';
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
                                  minimumSize: Size(50, 30),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                          }, child: const Text(
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
                padding: EdgeInsets.only(top: height * 0.03, left: 25, right: 25),
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
                  if(state is UserNameSetState) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4, left: 25, right: 25),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Username is available",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF0E9B02).withOpacity(0.8)
                              )
                          )
                      ),
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
                          onPressed: () {},
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
                  padding:
                  EdgeInsets.only(bottom: height * 0.04),
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

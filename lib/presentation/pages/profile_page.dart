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
                            child: Image.asset(
                                      "assets/images/avatar (${index + 1}).png")),
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
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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

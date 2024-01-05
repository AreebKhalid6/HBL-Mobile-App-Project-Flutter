import 'package:canteen_hub/services/auth_services.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool showpassword = true;
  bool showConfirmPassword = true;
  AuthServices authServices = AuthServices();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: LoginClipper(),
              child: Opacity(
                opacity: 0.75,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/bgvector.png')),
                    gradient: LinearGradient(colors: [
                      Color(0xff009984),
                      Color(0xff00E1C2),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/images/HBL_White.png',
                      height: 40,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'ASSET MANAGEMENT',
                      style: TextStyle(
                          color: Colors.white, fontSize: 25, letterSpacing: 1),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade600,
                              offset: const Offset(0, 0),
                              blurRadius: 8,
                              spreadRadius: 2),
                        ],
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff00E1C2),
                              Color(0xff009984),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ContainedTabBarView(
                          tabBarProperties: const TabBarProperties(
                              labelStyle: TextStyle(fontSize: 17),
                              indicatorColor: Color(0xff009984),
                              indicatorWeight: 2,
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 25),
                              indicatorSize: TabBarIndicatorSize.tab),
                          tabs: const [
                            Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                          views: [
                            _loginView(
                              context: context,
                              showPassword: showpassword,
                              togglePasswordText: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              onTap: () async {
                                final String email = emailController.text;
                                final String password = passwordController.text;
                                await authServices
                                    .login(
                                        context: context,
                                        email: email,
                                        password: password)
                                    .whenComplete(() {
                                  emailController.clear();
                                  passwordController.clear();
                                });
                              },
                              emailController: emailController,
                              passwordController: passwordController,
                            ),
                            _signupView(
                              context: context,
                              userNameController: userNameController,
                              emailController: emailController,
                              fullNameController: fullNameController,
                              passwordController: passwordController,
                              confirmPasswordController:
                                  confirmPasswordController,
                              showPassword: showpassword,
                              showConfirmPassword: showConfirmPassword,
                              togglePasswordText: () {
                                setState(() {
                                  showpassword = !showpassword;
                                });
                              },
                              toggleConfirmPasswordText: () {
                                setState(() {
                                  showConfirmPassword = !showConfirmPassword;
                                });
                              },
                              onTap: () {
                                final String fullName = fullNameController.text;
                                final String userName = userNameController.text;
                                final String email = emailController.text;
                                final String password = passwordController.text;
                                final String confirmPassword =
                                    confirmPasswordController.text;
                                authServices
                                    .signUp(
                                  context: context,
                                  email: email,
                                  password: password,
                                  confirmPassword: confirmPassword,
                                  userName: userName,
                                  fullName: fullName,
                                )
                                    .whenComplete(() {
                                  fullNameController.clear();
                                  userNameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  confirmPasswordController.clear();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _loginView({
  required BuildContext context,
  void Function()? onTap,
  void Function()? togglePasswordText,
  required bool showPassword,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter email or username',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: showPassword,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: togglePasswordText,
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle:
                      const TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(3, 3),
                  blurRadius: 8,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff009984),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _signupView({
  required BuildContext context,
  void Function()? onTap,
  void Function()? togglePasswordText,
  void Function()? toggleConfirmPasswordText,
  required bool showPassword,
  required bool showConfirmPassword,
  required TextEditingController fullNameController,
  required TextEditingController userNameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
}) {
  return Container(
    color: Colors.transparent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: fullNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: userNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: showPassword,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: togglePasswordText,
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle:
                      const TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: confirmPasswordController,
                style: const TextStyle(color: Colors.white),
                obscureText: showConfirmPassword,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: toggleConfirmPasswordText,
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  hintText: 'Confirm Password',
                  hintStyle:
                      const TextStyle(color: Colors.white70, fontSize: 14),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(80),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(3, 3),
                  blurRadius: 8,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'SIGNUP',
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff009984)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class LoginClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    // path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height + 100,
      size.width,
      size.height * 0.55,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

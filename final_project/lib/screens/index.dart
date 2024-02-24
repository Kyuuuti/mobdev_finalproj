// ignore: file_names
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:midterm/components/PasswordField.dart';
import 'package:midterm/components/PrimaryButton.dart';
import 'package:midterm/components/login-form.dart';
import 'package:midterm/screens/Home.dart';

class Login extends StatefulWidget {
  static const String routeName = "login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginEmailTextController = TextEditingController();
  final loginPasswordTextController = TextEditingController();
  final registerEmailTextController = TextEditingController();
  final registerPasswordTextController = TextEditingController();
  final registerRepeatPasswordTextController = TextEditingController();
  bool obscureText = true;
  bool showLogin = true;
  bool showRegister = false;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Visibility(
            visible: showLogin,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/c86fa7fd5a93f4402631bde333bb755b.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    LoginForm(
                      labelText: "Email Address",
                      hintText: "Enter a valid email address",
                      iconData: Icons.email,
                      textInputType: TextInputType.emailAddress,
                      controller: loginEmailTextController
                    ),
                    const SizedBox(height: 20),

                    PasswordField(
                      labelText: "Password",
                      hintText: "Enter your password",
                      obscureText: obscureText,
                      onTap: setPasswordVisibility,
                      controller: loginPasswordTextController,
                    ),
                    const SizedBox(height: 20),

                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPressed: loginWithEmail
                    ),
                    const SizedBox(height: 20),

                    const Text("Or"),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        loginWithGoogle();
                      },
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          const Text("Don't have account?"),
                          TextButton(
                            onPressed: displayRegister,
                            child: const Text('Create a new account'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          Visibility(
            visible: showRegister,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/c86fa7fd5a93f4402631bde333bb755b.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("Create Account"),
                    const SizedBox(height: 20),
                    
                    LoginForm(
                      labelText: "Email Address",
                      hintText: "Enter a valid email address",
                      iconData: Icons.email,
                      textInputType: TextInputType.emailAddress,
                      controller: registerEmailTextController
                    ),
                    const SizedBox(height: 20),
                    
                    PasswordField(
                      labelText: "Password",
                      hintText: "Enter your password",
                      obscureText: obscureText,
                      onTap: setPasswordVisibility,
                      controller: registerPasswordTextController,
                    ),
                    const SizedBox(height: 20),

                    PasswordField(
                      labelText: "Repeat Password",
                      hintText: "Re-enter your password",
                      obscureText: obscureText,
                      onTap: setPasswordVisibility,
                      controller: registerRepeatPasswordTextController,
                    ),
                    const SizedBox(height: 20),

                    PrimaryButton(
                      text: "Confirm",
                      iconData: Icons.login,
                      onPressed: register
                    ),
                    const SizedBox(height: 20),
                    
                    Container(
                      margin: const EdgeInsets.only(left: 70.0),
                      child: Row(
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: displayLogin,
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  void displayLogin() {
    setState(() {
      showLogin = true;
      showRegister = false;
    });
  }

  void displayRegister() {
    setState(() {
      showLogin = false;
      showRegister = true;
    });
  }
  
  void loginWithEmail() async {
    if (loginPasswordTextController.text.isNotEmpty &&
      loginEmailTextController.text.isNotEmpty) {
      try {
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: loginEmailTextController.text,
                password: loginPasswordTextController.text);
        print(userCredential);
        Navigator.pushReplacementNamed(context, Home.routeName);
      } catch (e) {
        _showMyDialog('Email or password is invalid.');
      }
    } else {
      _showMyDialog('Please fill in all fields.');
    }
  }

  void loginWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential);
      Navigator.pushReplacementNamed(context, Home.routeName);
    } catch (e) {
      print(e);
    }
  }

  void register() async {
    if (registerPasswordTextController.text.isNotEmpty &&
        registerEmailTextController.text.isNotEmpty &&
        registerRepeatPasswordTextController.text.isNotEmpty) {
      try {
        if (registerPasswordTextController.text ==
            registerRepeatPasswordTextController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: registerEmailTextController.text,
              password: registerPasswordTextController.text);
          User? currentUser = FirebaseAuth.instance.currentUser;
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;
          final googleCredential = GoogleAuthProvider.credential(
              accessToken: googleAuth?.accessToken,
              idToken: googleAuth?.idToken);
          if (currentUser != null && !currentUser.isAnonymous) {
            await currentUser.linkWithCredential(googleCredential);
            _showMyDialog('Account created successfully!');
          }
        } else {
          _showMyDialog('Password does not match.');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showMyDialog('Please input up to 6 characters.');
        } else if (e.code == 'email-already-in-use') {
          _showMyDialog('Account already exists.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      _showMyDialog('Please fill in all fields.');
    }
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  Future<void> _showMyDialog(message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content:Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
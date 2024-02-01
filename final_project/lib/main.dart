import 'package:flutter/material.dart';
import 'package:midterm/ForgotPassword.dart';
import 'package:midterm/Home.dart';
import 'package:midterm/PasswordField.dart';
import 'package:midterm/PrimaryButton.dart';
import 'package:midterm/Registration.dart';
import 'package:midterm/SecondaryButton.dart';
import 'package:midterm/login-form.dart';
import 'package:midterm/routes.dart';

void main() {  
  runApp(MaterialApp(
    home: const Login(),
    routes: routes,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.red), // Set AppBar background color
      buttonTheme: const ButtonThemeData(buttonColor: Colors.red), // Set button color
    ),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  static const String routeName = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Container(
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
                const SizedBox(
                  height: 20,
                ),
                const LoginForm(
                  labelText: "Email Address",
                  hintText: "Enter a valid email address",
                  iconData: Icons.email,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                PasswordField(
                  labelText: "Password",
                  hintText: "Enter your password",
                  obscureText: obscureText,
                  onTap: setPasswordVisibility,
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: "Login",
                  iconData: Icons.login,
                  onPressed: login,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SecondaryButton(text: "Register here!", onPressed: register),
                    SecondaryButton(text: "Forgot Password?", onPressed: forgotpwd),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushReplacementNamed(context, Home.routeName);
  }

  void register() {
    Navigator.pushNamed(context, Registration.routeName);
  }

  void forgotpwd() {
    Navigator.pushNamed(context, ForgotPassword.routeName);
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Midterm App"),
//           actions: [
//             IconButton(
//               onPressed: (){}, 
//               icon: const Icon(Icons.search),
//             )
//           ],
//         ),
//         body: const Center(
//           child: Text("This is my mobile application")
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){}, 
//           child: const Icon(Icons.add)
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings), label: "Settings")
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reddit/ui/LoginPage.dart';
import 'package:flutter_reddit/ui/main/MainPage.dart';
import 'package:flutter_reddit/utils/PrefManager.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
            height: 45.0, child: Image.asset("asset/images/reddit.png")),
        backgroundColor: Colors.black,
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 100,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: gmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              obscureText: !_passwordVisible,
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              obscureText: !_passwordVisible,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                labelText: 'Confirm password',
                labelStyle: const TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: const Text('Sign up'),
                onPressed: () {
                  String email = gmailController.text;
                  String userName = nameController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;
                  if (inputsAreValid(
                    userName,
                    email,
                    password,
                    confirmPassword,
                  )) {
                    var prefManager = PrefManager();
                    prefManager.createUser(
                      userName,
                      email,
                      password,
                    );
                    prefManager.setUserLogin(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }

  bool inputsAreValid(
      String userName, String email, String password, String confirmPassword) {
    if (email.isEmpty ||
        userName.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      showSnackBar('all fields are necessary');
      return false;
    } else if (!email.contains('@') ||
        !email.contains('.') ||
        email.indexOf('@') > email.indexOf('.')) {
      showSnackBar('email is wrong');
      return false;
    } else if (password.length < 8 || !validatePasswordStructure(password)) {
      showSnackBar(
        'Password should contain at least on upper character, ond lower character and one number',
      );
      return false;
    } else if (password != confirmPassword) {
      showSnackBar('both password must be same');
      return false;
    } else {
      return true;
    }
  }

  bool validatePasswordStructure(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }
}

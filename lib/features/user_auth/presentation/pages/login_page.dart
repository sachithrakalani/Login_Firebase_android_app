import 'package:firebase_app/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_app/features/user_auth/presentation/pages/home_page.dart';
import 'package:firebase_app/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:firebase_app/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_app/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  bool _isSigning = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Login'
          ),
      ),
      body:Center(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold 
                ),
              ),
              const SizedBox(height: 30),
          
              FormContainerWidget(
                controller: _emailController,
                hintText: 'Email',
                isPasswordField: false,
              ),
          
              const SizedBox(height: 10),
          
              FormContainerWidget(
                controller: _passwordController,
                hintText: 'Password',
                isPasswordField: true,
              ),

              const SizedBox(height: 30),

              GestureDetector(
                onTap: (){
                  _signIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:BorderRadius.circular(10) 
                  ),
                  child: Center(
                    child: _isSigning ? const CircularProgressIndicator(
                      color: Colors.white,) : 
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              GestureDetector(
                onTap: (){
                  _signIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:BorderRadius.circular(10) 
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google,color:Colors.white,),
                        SizedBox(width: 5),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),





              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                            (route) => false,
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  void _signIn()async{

    setState(() {
      _isSigning = true;
    });
    
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user  = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
    showToast(message: "User is successfully Signed in");
      Navigator.pushNamed(context,"/home");
    } else {
      showToast(message: "Some error happend");
    }

  }



}
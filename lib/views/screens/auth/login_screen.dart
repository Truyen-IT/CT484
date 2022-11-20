import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/screens/auth/signup_screen.dart';

import '../../../constants.dart';
import '../../widgets/text_input_field.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();//hai cai bien
  final  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,//aligin nay chua 1 wigget con aligin .center la dua nay giua
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag1.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        
        
        child: Column(//can chinh tu tren xuong cos the cuon duoc
          mainAxisAlignment: MainAxisAlignment.center,//no se canh con a cozzz
          
          children: [
            Text(
              'Tiktok',
              style: TextStyle(
                fontSize: 35,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            
            const Text(//moi cai const la cai chu tren man hinh
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            
            const SizedBox(
              height: 15,
            ),
           
            Container(//container nay chua  text input nha
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(//import cai text input trong widgets
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
           
            const SizedBox(
              height: 15,
            ),
           
           
            Container(//container nay chua cai khung pass nha
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(//ham tetx in put ne
                controller: _passwordController,//khai bao o treen
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            
            
            const SizedBox(
              height: 10,
            ),//khoang cach ra ne
           
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              
              child: InkWell(//nhap vao nut button se qua trang ne//log in
                // onTap: () => {
                //  // print('login user')

                // },
                
               
                onTap: () => authController.loginUser(
                  _emailController.text,
                  _passwordController.text,
                ),
               
               
                child: const Center(//cai nut login
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(
              height: 15,
            ),

            Row(//cot chu khong co tai khoan thi vao trong
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(//qua rerister
                  
           onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),//nhap vo no chay qua sigupsream
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: buttonColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

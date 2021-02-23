import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/widgets/loading_widget.dart';
import 'package:flutter_app_clean_auth/core/widgets/massage_display.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/presentation/pages/page_send_recovery_code.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
import 'file:///C:/Project/Flutter/flutter_app_clean_auth/lib/core/widgets/background.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/pages/register_page.dart';
import 'package:flutter_app_clean_auth/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async{
          if (state is Loaded) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                duration: const Duration(seconds: 5),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.massage),
                  ],
                ),
              ));
            await Future.delayed(Duration(seconds: 5));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SendRecoveryCodePage()));
          } else if (state is Loading) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                duration: const Duration(seconds: 10),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Loading'),
                    CircularProgressIndicator(),
                  ],
                ),
              ));
            await Future.delayed(Duration(seconds: 15));
          }else if (state is Error){
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                duration: const Duration(seconds: 10),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.message),
                  ],
                ),
              ));

          }
        },
        // ignore: missing_return
        builder: (context, state) {
          if (state is Empty) {
            return LoginScreen();
          } else if (state is Loading) {
            return LoadingWidget();
          } //else if (state is Loaded) {
          //   return MessageDisplay(message: state.massage);
          else if (state is Error) {
            return MessageDisplay(message: state.message);
          }
        },
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  String inputUsername;
  String inputPassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2661FA),
                  fontSize: 36),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: "Username"),
              onChanged: (value) {
                inputUsername = value;
              },
              onSubmitted: (_) {
                dispatchConcrete(context);
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: "Password"),
              onChanged: (value) {
                inputPassword = value;
              },
              onSubmitted: (_) {
                dispatchConcrete(context);
              },
              obscureText: true,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: GestureDetector(
              onTap: () => goToForgotPasswordPage(context),
              child: Text(
                "ForgotPassword",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: RaisedButton(
              onPressed: () => dispatchConcrete(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: size.width * 0.5,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(colors: [
                      Color.fromARGB(255, 255, 136, 34),
                      Color.fromARGB(255, 255, 177, 41)
                    ])),
                padding: const EdgeInsets.all(0),
                child: Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: GestureDetector(
              onTap: () => goToRegisterPage(context),
              child: Text(
                "Don't Have an Account? Sign up",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchConcrete(context) {
    controllerUsername.clear();
    controllerPassword.clear();
    if (inputUsername == null || inputPassword == null) {
      SnackBar(content: Text('please fill all fields '));
    } else {
      BlocProvider.of<LoginBloc>(context)
          .add(clickButtonPress(inputUsername, inputPassword));
    }
  }

  void goToRegisterPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void goToForgotPasswordPage(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SendRecoveryCodePage()));
  }
}

// class pageforlogin extends StatelessWidget {
//   final controllerusername = TextEditingController();
//   final controllerpassword = TextEditingController();
//   String inputUsername;
//   String inputPassword;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         Text(
//           'Login Test For Ebook',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Username',
//           ),
//           onChanged: (value) {
//             inputUsername = value;
//           },
//           onSubmitted: (_) {
//             dispatchConcrete(context);
//           },
//         ),
//         SizedBox(height: size.height * 0.03),
//         TextField(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Password',
//           ),
//           onChanged: (value) {
//             inputPassword = value;
//           },
//           onSubmitted: (_) {
//             dispatchConcrete(context);
//           },
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         FlatButton(
//           child: RaisedButton(
//             child: Text('Login'),
//             color: Colors.blueAccent,
//             onPressed: () => dispatchConcrete(context),
//           ),
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         FlatButton(
//           child: RaisedButton(
//             child: Text('Sing Up'),
//             color: Colors.blueAccent,
//             onPressed: () => GoToRegisterPage(context),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void dispatchConcrete(context) {
//     BlocProvider.of<LoginBloc>(context)
//         .add(clickButtonPress(inputUsername, inputPassword));
//   }
//
//   void GoToRegisterPage(context) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => RegisterPage()));
//   }
// }

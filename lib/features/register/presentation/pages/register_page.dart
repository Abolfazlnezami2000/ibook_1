import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/widgets/loading_widget.dart';
import 'package:flutter_app_clean_auth/core/widgets/massage_display.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/pages/login_page.dart';
import 'file:///C:/Project/Flutter/flutter_app_clean_auth/lib/core/widgets/background.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
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
                context, MaterialPageRoute(builder: (context) => LoginPage()));
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
            return RegisterScreen();
          } else if (state is Loading) {
            return LoadingWidget();
          } //else if (state is Loaded) {
          // return MessageDisplay(message: state.massage);
          else if (state is Error) {
            return MessageDisplay(message: state.message);
          }
        },
      ),
    );
  }
}
//
// class PageForSingUp extends StatelessWidget {
//   final controllerUsername = TextEditingController();
//   final controllerPassword = TextEditingController();
//   final controllerFirstName = TextEditingController();
//   final controllerLastName = TextEditingController();
//   final controllerPoneNumber = TextEditingController();
//   final controllerEmail = TextEditingController();
//   String inputUsername;
//   String inputPassword;
//   String inputFirstName;
//   String inputLastName;
//   String inputPoneNumber;
//   String inputEmail;
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
//           'SingUp Test For Ebook',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         TextField(
//           // --------------------------username
//           controller: controllerUsername,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Username',
//           ),
//           onChanged: (value) {
//             inputUsername = value;
//           },
//           onSubmitted: (_) {
//             GoToLoginPage(context);
//           },
//         ),
//         SizedBox(height: size.height * 0.03),
//         TextField(
//           //---------------------------password
//           controller: controllerPassword,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Password',
//           ),
//           onChanged: (value) {
//             inputPassword = value;
//           },
//           onSubmitted: (_) {
//             GoToLoginPage(context);
//           },
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         TextField(
//           //------------------------ first name
//           controller: controllerFirstName,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a First Name',
//           ),
//           onChanged: (value) {
//             inputFirstName = value;
//           },
//           onSubmitted: (_) {
//             GoToLoginPage(context);
//           },
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         TextField(
//           // -------------------------Last Name
//           controller: controllerLastName,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Last Name',
//           ),
//           onChanged: (value) {
//             inputLastName = value;
//           },
//           onSubmitted: (_) {
//             GoToLoginPage(context);
//           },
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         TextField(
//           // --------------------------Phone Number
//           controller: controllerPoneNumber,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Phone Number',
//           ),
//           onChanged: (value) {
//             inputPoneNumber = value;
//           },
//           onSubmitted: (_) {
//             GoToLoginPage(context);
//           },
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         TextField(
//           // ---------------------------email
//           controller: controllerEmail,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Input a Email',
//           ),
//           onChanged: (value) {
//             inputEmail = value;
//           },
//           onSubmitted: (_) {
//             GoToLoginPage(context);
//           },
//         ),
//         SizedBox(
//           height: size.height * 0.03,
//         ),
//         FlatButton(
//           child: RaisedButton(
//             child: Text('Sing Up'),
//             color: Colors.blueAccent,
//             onPressed: () => GoToLoginPage(context),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void GoToLoginPage(context) {
//     controllerUsername.clear();
//     controllerPassword.clear();
//     controllerFirstName.clear();
//     controllerLastName.clear();
//     controllerPoneNumber.clear();
//     controllerEmail.clear();
//     BlocProvider.of<RegisterBloc>(context).add(clickButtonPress(
//         inputUsername,
//         inputPassword,
//         inputPoneNumber,
//         inputEmail,
//         inputFirstName,
//         inputLastName));
//   }
// }

class RegisterScreen extends StatelessWidget {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerPoneNumber = TextEditingController();
  final controllerEmail = TextEditingController();
  String inputUsername;
  String inputPassword;
  String inputFirstName;
  String inputLastName = '1';
  String inputPoneNumber = '1';
  String inputEmail;

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
              "REGISTER",
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
              decoration: InputDecoration(labelText: "Name"),
              onChanged: (value) {
                inputFirstName = value;
              },
              onSubmitted: (_) {
                GoToLoginPage(context);
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (value) {
                inputEmail = value;
              },
              onSubmitted: (_) {
                GoToLoginPage(context);
              },
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
                GoToLoginPage(context);
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (value) {
                inputPassword = value;
              },
              onSubmitted: (_) {
                GoToLoginPage(context);
              },
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: RaisedButton(
              onPressed: () => GoToLoginPage(context),
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
                  "SIGN UP",
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
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()))
              },
              child: Text(
                "Already Have an Account? Sign in",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)),
              ),
            ),
          )
        ],
      ),
    );
  }

  void GoToLoginPage(context) {
    controllerUsername.clear();
    controllerPassword.clear();
    controllerFirstName.clear();
    controllerLastName.clear();
    controllerPoneNumber.clear();
    controllerEmail.clear();

    if (controllerUsername == null ||
        controllerPassword == null ||
        controllerFirstName == null ||
        controllerLastName == null ||
        controllerPoneNumber == null ||
        controllerEmail == null) {
      SnackBar(content: Text('please fill all fields '));
    } else {
      BlocProvider.of<RegisterBloc>(context).add(clickButtonPress(
          inputUsername,
          inputPassword,
          inputPoneNumber,
          inputEmail,
          inputFirstName,
          inputLastName));
    }
  }
}

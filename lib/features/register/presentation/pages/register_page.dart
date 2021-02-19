import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/widgets/loading_widget.dart';
import 'package:flutter_app_clean_auth/core/widgets/massage_display.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/pages/login_page.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => sl<RegisterBloc>(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is Loaded) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        // ignore: missing_return
        builder: (context, state) {
          if (state is Empty) {
            return PageForSingUp();
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

class PageForSingUp extends StatelessWidget {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerPoneNumber = TextEditingController();
  final controllerEmail = TextEditingController();
  String inputUsername;
  String inputPassword;
  String inputFirstName;
  String inputLastName;
  String inputPoneNumber;
  String inputEmail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          'SingUp Test For Ebook',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextField(
          // --------------------------username
          controller: controllerUsername,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Username',
          ),
          onChanged: (value) {
            inputUsername = value;
          },
          onSubmitted: (_) {
            GoToLoginPage(context);
          },
        ),
        SizedBox(height: size.height * 0.03),
        TextField(
          //---------------------------password
          controller: controllerPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Password',
          ),
          onChanged: (value) {
            inputPassword = value;
          },
          onSubmitted: (_) {
            GoToLoginPage(context);
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextField(
          //------------------------ first name
          controller: controllerFirstName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a First Name',
          ),
          onChanged: (value) {
            inputFirstName = value;
          },
          onSubmitted: (_) {
            GoToLoginPage(context);
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextField(
          // -------------------------Last Name
          controller: controllerLastName,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Last Name',
          ),
          onChanged: (value) {
            inputLastName = value;
          },
          onSubmitted: (_) {
            GoToLoginPage(context);
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextField(
          // --------------------------Phone Number
          controller: controllerPoneNumber,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Phone Number',
          ),
          onChanged: (value) {
            inputPoneNumber = value;
          },
          onSubmitted: (_) {
            GoToLoginPage(context);
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextField(
          // ---------------------------email
          controller: controllerEmail,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Email',
          ),
          onChanged: (value) {
            inputEmail = value;
          },
          onSubmitted: (_) {
            GoToLoginPage(context);
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        FlatButton(
          child: RaisedButton(
            child: Text('Sing Up'),
            color: Colors.blueAccent,
            onPressed: () => GoToLoginPage(context),
          ),
        ),
      ],
    );
  }

  void GoToLoginPage(context) {
    controllerUsername.clear();
    controllerPassword.clear();
    controllerFirstName.clear();
    controllerLastName.clear();
    controllerPoneNumber.clear();
    controllerEmail.clear();
    BlocProvider.of<RegisterBloc>(context).add(clickButtonPress(
        inputUsername,
        inputPassword,
        inputPoneNumber,
        inputEmail,
        inputFirstName,
        inputLastName));
  }
}

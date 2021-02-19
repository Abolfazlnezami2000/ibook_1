import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/widgets/loading_widget.dart';
import 'package:flutter_app_clean_auth/core/widgets/massage_display.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_app_clean_auth/features/register/presentation/pages/register_page.dart';
import 'package:flutter_app_clean_auth/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: BlocBuilder<LoginBloc, LoginState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is Empty) {
            return pageforlogin();
          } else if (state is Loading) {
            return LoadingWidget();
          } else if (state is Loaded) {
            return MessageDisplay(message: state.massage);
          } else if (state is Error) {
            return MessageDisplay(message: state.message);
          }
        },
      ),
    );
  }
}

class pageforlogin extends StatelessWidget {
  final controllerusername = TextEditingController();
  final controllerpassword = TextEditingController();
  String inputUsername;
  String inputPassword;

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
          'Login Test For Ebook',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Username',
          ),
          onChanged: (value) {
            inputUsername = value;
          },
          onSubmitted: (_) {
            dispatchConcrete(context);
          },
        ),
        SizedBox(height: size.height * 0.03),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Password',
          ),
          onChanged: (value) {
            inputPassword = value;
          },
          onSubmitted: (_) {
            dispatchConcrete(context);
          },
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        FlatButton(
          child: RaisedButton(
            child: Text('Login'),
            color: Colors.blueAccent,
            onPressed: () => dispatchConcrete(context),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        FlatButton(
          child: RaisedButton(
            child: Text('Sing Up'),
            color: Colors.blueAccent,
            onPressed: () => GoToRegisterPage(context),
          ),
        ),
      ],
    );
  }

  void dispatchConcrete(context) {
    BlocProvider.of<LoginBloc>(context)
        .add(clickButtonPress(inputUsername, inputPassword));
  }

  void GoToRegisterPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}

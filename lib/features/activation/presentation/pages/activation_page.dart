import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/widgets/background.dart';
import 'package:flutter_app_clean_auth/features/activation/presentation/bloc/activation_bloc.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class ActivationPage extends StatelessWidget {
  String inputCode;
  String username;
  ActivationPage(this.username);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider<ActivationBloc>(
      create: (context) => sl<ActivationBloc>(),
      child: BlocConsumer<ActivationBloc, ActivationState>(
        listener: (context, state) async {
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
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                ModalRoute.withName('/Login'),
            );
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
          return SendRecoveryCodeScreen(context);
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SendRecoveryCodeScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Activation",
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
              decoration:
              InputDecoration(labelText: "Input Code"),
              onChanged: (value) {
                inputCode = value;
              },
              onSubmitted: (_) {
                dispatchActivationCode(context);
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: RaisedButton(
              onPressed: () => dispatchActivationCode(context),
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
                  "Activation",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchActivationCode(context) {
    BlocProvider.of<ActivationBloc>(context)
        .add(ClickButtonActivation(code: inputCode , username: username));
  }

}
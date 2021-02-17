import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/widgets/loading_widget.dart';
import 'package:flutter_app_clean_auth/core/widgets/massage_display.dart';
import 'package:flutter_app_clean_auth/features/login/presentation/bloc/login_bloc.dart';
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
            return Container(
              color: Colors.blueAccent,
              alignment: Alignment.center,
              height: 250,
              width: 250,
            );
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

class Controler extends StatefulWidget {
  const Controler({
    Key key,
  }) : super(key: key);

  @override
  _LoginControlsState createState() => _LoginControlsState();
}

class _LoginControlsState extends State<Controler> {
  final controller = TextEditingController();
  String inputUsername;
  String inputPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Username',
          ),
          onChanged: (value) {
            inputUsername = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a Password',
          ),
          onChanged: (value) {
            inputPassword = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Login'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        Expanded(
          child: RaisedButton(
            child: Text('Sing up'),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: dispatchConcrete,
          ),
        ),
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(clickButtonPress(inputUsername, inputPassword));
  }

  void gotosingup() {
    controller.clear();
    // BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}

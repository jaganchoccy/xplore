import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xploreDev/models/user.dart';
import '../../../components/no_account_text.dart';
import '../../../components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn gSignIn = GoogleSignIn();
final usersReference = FirebaseFirestore.instance.collection("ExploreUsers");
final DateTime timestamp = new DateTime.now();
User currentUser;

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isSignedIn = false;

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter UserName'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "Enter UserName"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void initState() {
    super.initState();
    gSignIn.onCurrentUserChanged.listen((gSignInAccount) async {
      controlSignIn(gSignInAccount);
    }, onError: (gError) {
      print("error msg " + gError);
    });

    gSignIn.isSignedIn().then((isSignedIn) async {
      // TODO: Implement onError
      if (isSignedIn) {
        await gSignIn
            .signInSilently()
            .then((value) => controlSignIn(value), onError: print);
      }
    });
  }

  controlSignIn(GoogleSignInAccount signInAccount) async {
    print('control');
    if (signInAccount != null) {
      await saveUserInfoToFirestore();
      setState(() {
        isSignedIn = true;
      });
    } else {
      setState(() {
        isSignedIn = false;
      });
    }
  }

  saveUserInfoToFirestore() async {
    final GoogleSignInAccount gCurrentUser = gSignIn.currentUser;
    DocumentSnapshot documentSnapshot =
        await usersReference.doc(gCurrentUser.id).get();
    if (!documentSnapshot.exists) {
      print('guser username not exit');

      //final username = await _displayDialog;
      usersReference.doc(gCurrentUser.id).set({
        "id": gCurrentUser.id,
        "email": gCurrentUser.email,
        "username": 'jagan',
        "url": gCurrentUser.photoUrl,
        "profileName": gCurrentUser.displayName,
        "bio": '',
        "timestamp": timestamp,
        "dob": ''
      });
      documentSnapshot = await usersReference.doc(gCurrentUser.id).get();
    }
    currentUser = User.fromDocument(documentSnapshot);
  }

  _googleSignIn() async {
    print('google signIn');
    await gSignIn.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome To Xplore",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: _googleSignIn,
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(40)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

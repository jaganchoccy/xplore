import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xploreunitrix/theme.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../screens/login_success/login_success_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDateInit = DateTime.now();
  String errorMsg = "";

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        //textDirection: TextDirection.rtl,
        lastDate: DateTime(2101),
        helpText: 'Select DOB',
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(backgroundColor: Colors.red),
            child: child,
          );
        });
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  File _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => _imageFile = image);
  }

  Future<void> _cropImage() async {
    final cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      maxWidth: 150,
      maxHeight: 100,
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  void _clear() {
    setState(() {
      _imageFile = null;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String userName;
  DateTime dob;
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) print(arguments);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_imageFile != null) ...[
                      Image.file(_imageFile, width: double.infinity),
                    ]
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: -2,
                child: FloatingActionButton(
                  mini: true,
                  onPressed: () => _pickImage(ImageSource.gallery),
                  elevation: 6,
                  child: new Icon(Icons.add),
                  backgroundColor: kPrimaryColor,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_imageFile != null) ...[
                  FlatButton(
                    onPressed: _cropImage,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: kGrey,
                          fontSize: getProportionateScreenWidth(12),
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: "Crop image.. ",
                          ),
                          WidgetSpan(
                            child: Icon(Icons.crop, size: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDOBField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                try {
                  var userCredential = await auth.FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: arguments['email'],
                          password: arguments['password']);

                  // FirebaseUser
                  var newUser = userCredential.user;

                  /// Add the first and last name to the FirebaseUser
                  String newDisplayName = '$userName';
                  await newUser
                      .updateProfile(displayName: newDisplayName)
                      .catchError((error) => print(error));

                  final databaseReference = FirebaseFirestore.instance;
                  databaseReference.collection('users').doc().set({
                    'email': arguments['email'],
                    'displayName': this.userName,
                    'Dob': selectedDate,
                  });
                } catch (error) {
                  switch (error.code) {
                    case "ERROR_EMAIL_ALREADY_IN_USE":
                      {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  child: Text(errorMsg),
                                ),
                              );
                            });
                      }
                      break;
                    case "ERROR_WEAK_PASSWORD":
                      {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  child: Text(errorMsg),
                                ),
                              );
                            });
                      }
                      break;
                    default:
                      {
                        print('error');
                      }
                  }
                }
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: "User Name *",
        labelStyle: TextStyle(
          color: kGrey,
        ),
        hintText: "Enter the Username",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  Widget buildDOBField() {
    String doBText = "${selectedDate.toLocal()}".split(' ')[0];
    String doBTextCheck = "${selectedDateInit.toLocal()}".split(' ')[0];
    if (doBText != doBTextCheck) {
      doBText = "${selectedDate.toLocal()}".split(' ')[0];
    } else {
      doBText = "Enter Date of birth";
    }

    return DecoratedBox(
      decoration: ShapeDecoration(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0),
          ),
          color: Colors.white),
      child: Theme(
        data: Theme.of(context).copyWith(
            buttonTheme: ButtonTheme.of(context).copyWith(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
        child: OutlineButton(
          color: Colors.white,
          padding: EdgeInsets.only(top: 18, left: 45, right: 20, bottom: 18),
          onPressed: () => _selectDate(context),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.calendar_today,
                  color: kTextColor,
                  size: 20,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  doBText,
                  style: TextStyle(
                    fontSize: 16,
                    //fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          borderSide: new BorderSide(color: kGrey),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}

class UserUpdateInfo {}

class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key, this.file}) : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://xpore06.appspot.com/');

  StorageUploadTask _uploadTask;

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';
    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;
            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            return Column(
              children: [
                if (_uploadTask.isComplete) Text('success'),
                if (_uploadTask.isPaused)
                  FlatButton(
                    onPressed: _uploadTask.resume,
                    child: Icon(Icons.play_arrow),
                  ),
                if (_uploadTask.isInProgress)
                  FlatButton(
                    onPressed: _uploadTask.pause,
                    child: Icon(Icons.pause),
                  ),
                LinearProgressIndicator(value: progressPercent),
                Text('${(progressPercent * 100).toStringAsFixed(2)} %'),
              ],
            );
          });
    } else {
      return FlatButton.icon(
        onPressed: _startUpload,
        icon: Icon(Icons.cloud_upload),
        label: Text('upload to firebase'),
      );
    }
  }
}

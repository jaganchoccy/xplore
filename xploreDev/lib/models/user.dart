import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String profileName;
  final String username;
  final String url;
  final String email;
  final String bio;
  final String dob;

  User({
    this.id,
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.bio,
    this.dob,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc.id,
      email: doc['email'],
      username: doc['username'],
      url: doc['photoUrl'],
      profileName: doc['displayName'],
      bio: doc['bio'],
      dob: doc['dob'],
    );
  }
}

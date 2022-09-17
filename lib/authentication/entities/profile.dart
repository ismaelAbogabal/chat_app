// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class Profile {
  final String id;
  final String? name;
  final String? phone;
  final String? email;
  final String? image;

  Profile({
    required this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
  });

  factory Profile.fromFirebaseUser(User user) {
    return Profile(
      id: user.uid,
      email: user.email,
      image: user.photoURL,
      name: user.displayName,
      phone: user.phoneNumber,
    );
  }

  Profile copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? image,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, phone: $phone, email: $email, image: $image)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        image.hashCode;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';

class Opener {
  final int id;
  final String firstName;
  final String lastName;
  final Image avatar;
  final String? openingsNumber;

  const Opener({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.openingsNumber,
  });

  factory Opener.fromJson(Map<String, dynamic> json) {
    return Opener(
      id: json['id'] as int,
      firstName: json['firstname'] as String,
      lastName: json['lastname'] as String,
      avatar: json['avatar'] ?? Image.asset('assets/images/michaelJackson.jpg'),
      openingsNumber: json['openings_number'] ?? "0",
    );
  }
}

List<Opener> parseOpeners(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Opener>((json) => Opener.fromJson(json)).toList();
}

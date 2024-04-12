import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User with ChangeNotifier {
  String fullName;
  String phoneNumber;
  String id;

  User({
    required this.fullName,
    required this.phoneNumber,
    required this.id,
  });
}

class Jobs with ChangeNotifier {
  final String fullName;
  final String phoneNumber;
  final String creatorid;
  final String description;
  final String address;
  final String techId;
  final String techName;
  final String techNumber;
  final String type;
  final String jobstat;
  final bool rating;
  final String jobId;

  Jobs({
    required  this.fullName,
    required  this.jobId,
    required  this.phoneNumber,
    required  this.creatorid,
    required this.jobstat,
    required this.address,
    required this.description,
    required this.techId,
    required this.techName,
    required this.techNumber,
    required this.type,
    required this.rating,
  });
}

class Technician with ChangeNotifier {
  final String id;
  final String fullName;
  final String address;
  final double latitude;
  final double longitude;
  final String phoneNumber;
  final String techtype;
  final String fcm;
  double? distance ;
  int? arating;
  int? trating;
  int? jobs;

  Technician({
    required this.id,
    required this.address,
    required this.fullName,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.techtype,
    required this.fcm,
    required this.arating,
    required this.trating,
    required this.jobs,
  });
}

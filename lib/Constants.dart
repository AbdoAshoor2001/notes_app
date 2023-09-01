import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const kPrimaryColor = Color(0xff62FCD7);
const appBarBackgroundColor = Color(0xff2E2E2E);

const kNotesBox = 'notes_box';
final noteRef = Hive.box(kNotesBox);
final titleControllar = TextEditingController();
final contantControllar = TextEditingController();

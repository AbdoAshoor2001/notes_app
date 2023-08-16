import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Controllar/Cubits/add_note_cubit.dart';
import 'package:notes_app/Models/note_model.dart';
import 'Constants.dart';
import 'Views/note_view.dart';

void main() async{
 await Hive.initFlutter();
 await Hive.openBox(kNotesBox);
 Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NotesCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(brightness: Brightness.dark,),
        home: const NoteView(),
        builder: (context, child) => SafeArea(child: child!),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

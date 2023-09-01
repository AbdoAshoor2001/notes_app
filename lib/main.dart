import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Controllar/Cubits/add_note_cubit.dart';
import 'package:notes_app/Controllar/States/add_notes_state.dart';
import 'Constants.dart';
import 'Views/note_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()..getNotes()),
      ],
      child: BlocConsumer<NotesCubit,NotesState>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            title: 'Notes App',
            theme: ThemeData(
              brightness: Brightness.dark,
            ),
            home:  NoteView(),
            builder: (context, child) => SafeArea(child: child!),
            debugShowCheckedModeBanner: false,
          );
        },

      ),
    );
  }
}

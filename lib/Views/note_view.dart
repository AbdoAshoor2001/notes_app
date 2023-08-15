import 'package:flutter/material.dart';

import '../Widgets/note_body_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteBodyView(),
    );
  }
}

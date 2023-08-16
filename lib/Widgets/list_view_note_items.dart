import 'package:flutter/material.dart';

import 'custom_note_items.dart';

class ListViewNote extends StatelessWidget {
  const ListViewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child:  NoteItems(),
        );
      }),
    );
  }
}

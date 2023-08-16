import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'list_view_note_items.dart';

class NoteBodyView extends StatelessWidget {
  const NoteBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          Expanded(child: ListViewNote()),
        ],
      ),
    );
  }
}

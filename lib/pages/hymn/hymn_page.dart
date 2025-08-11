import 'package:flutter/material.dart';
import 'package:harpa_crista_app/models/hino_model.dart';

class HymnPage extends StatefulWidget {
  final HinoModel hymn;
  const HymnPage({required this.hymn, super.key});

  @override
  State<HymnPage> createState() => _HymnPageState();
}

class _HymnPageState extends State<HymnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  String key = widget.hymn.verses.keys.elementAt(index);
                  String value = widget.hymn.verses[key]!;
                  return Text('$value\n');
                },
                itemCount: widget.hymn.verses.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

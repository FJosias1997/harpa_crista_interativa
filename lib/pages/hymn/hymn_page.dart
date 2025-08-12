import 'package:flutter/material.dart';
import 'package:harpa_crista_app/extensions/context_extensions.dart';
import 'package:harpa_crista_app/models/hino_model.dart';
import 'package:harpa_crista_app/pages/hymn/widgets/pw_widgets/print_body_layout_pw_widget.dart';
import 'package:harpa_crista_app/pages/hymn/widgets/sections/chorus_section_widget.dart';
import 'package:harpa_crista_app/pages/hymn/widgets/sections/verse_section_widget.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HymnPage extends StatefulWidget {
  final HinoModel hymn;
  const HymnPage({required this.hymn, super.key});

  @override
  State<HymnPage> createState() => _HymnPageState();
}

class _HymnPageState extends State<HymnPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      _printText();
    } else if (index == 1) {
      // Handle business action
    } else if (index == 2) {
      // Handle school action
    }
  }

  void _printText() {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        build: (context) {
          return printBodyLayoutPwWidget(widget.hymn);
        },
      ),
    );

    Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),

              Center(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    String title = widget.hymn.hino;
                    String chorus = widget.hymn.coro;
                    String verse = widget.hymn.verses.keys.elementAt(index);
                    String value = widget.hymn.verses[verse]!;

                    switch (index) {
                      case 0:
                        return Column(
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: context.theme.textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            VerseSectionWidget(index, value),
                          ],
                        );
                      case 1:
                        return Column(
                          children: [
                            if (chorus.isNotEmpty)
                              ChorusSectionWidget(index, chorus),
                            VerseSectionWidget(index, value),
                          ],
                        );
                      default:
                        return VerseSectionWidget(index, value);
                    }
                  },
                  itemCount: widget.hymn.verses.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.print), label: 'Imprimir'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

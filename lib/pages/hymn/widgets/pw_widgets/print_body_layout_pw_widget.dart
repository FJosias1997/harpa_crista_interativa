import 'package:harpa_crista_app/models/hino_model.dart';
import 'package:harpa_crista_app/pages/hymn/widgets/pw_widgets/chorus_section_pw_widget.dart';
import 'package:harpa_crista_app/pages/hymn/widgets/pw_widgets/verse_section_pw_widget.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget printBodyLayoutPwWidget(HinoModel hymn) {
  return pw.Center(
    child: pw.ListView.builder(
      itemBuilder: (context, index) {
        String title = hymn.hino;
        String chorus = hymn.coro;
        String verse = hymn.verses.keys.elementAt(index);
        String value = hymn.verses[verse]!;

        switch (index) {
          case 0:
            return pw.Column(
              children: [
                pw.Text(
                  title,
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20),
                verseSectionPwWidget(index, value),
              ],
            );
          case 1:
            return pw.Column(
              children: [
                if (chorus.isNotEmpty) chorusSectionPwWidget(chorus),
                verseSectionPwWidget(index, value),
              ],
            );
          default:
            return verseSectionPwWidget(index, value);
        }
      },
      itemCount: hymn.verses.length,
    ),
  );
}

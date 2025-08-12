import 'package:pdf/widgets.dart' as pw;

pw.Widget verseSectionPwWidget(int index, String value) {
  return pw.Column(
    children: [
      pw.Text(
        'Verso ${index + 1}',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 14, // ajuste o tamanho conforme desejar
        ),
      ),
      pw.Text(
        '$value\n',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(fontSize: 12),
      ),
    ],
  );
}

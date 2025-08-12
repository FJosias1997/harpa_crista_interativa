import 'package:pdf/widgets.dart' as pw;

pw.Widget chorusSectionPwWidget(String chorus) {
  return pw.Column(
    children: [
      pw.Text(
        'Coro',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          fontWeight: pw.FontWeight.bold,
          fontSize: 14, // ajuste conforme quiser
        ),
      ),
      pw.Text(
        '$chorus\n',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(fontSize: 12),
      ),
    ],
  );
}

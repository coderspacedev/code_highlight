import '../src/mode.dart';

final vbscriptHtml = Mode(refs: {}, subLanguage: [
  "xml"
], contains: [
  Mode(begin: "<%", end: "%>", subLanguage: ["vbscript"])
]);

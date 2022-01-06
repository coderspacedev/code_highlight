import '../src/common_modes.dart';
import '../src/mode.dart';

final step21 = Mode(
    refs: {},
    aliases: ["p21", "step", "stp"],
    caseInsensitive: true,
    lexemes: "[A-Z_][A-Z0-9_.]*",
    keywords: {"keyword": "HEADER ENDSEC DATA"},
    contains: [
      Mode(className: "meta", begin: "ISO-10303-21;", relevance: 10),
      Mode(className: "meta", begin: "END-ISO-10303-21;", relevance: 10),
      cLineCommentMode,
      cBlockCommentMode,
      Mode(className: "comment", begin: "/\\*\\*!", end: "\\*/", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      cNumberMode,
      Mode(className: "string", begin: "'", end: "'", illegal: null, contains: [backSlashEscape]),
      Mode(className: "string", begin: "\"", end: "\"", illegal: null, contains: [backSlashEscape]),
      Mode(className: "string", begin: "'", end: "'"),
      Mode(className: "symbol", variants: [Mode(begin: "#", end: "\\d+", illegal: "\\W")])
    ]);

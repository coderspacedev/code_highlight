import '../src/common_modes.dart';
import '../src/mode.dart';

final gcode = Mode(
    refs: {},
    aliases: ["nc"],
    caseInsensitive: true,
    lexemes: "[A-Z_][A-Z0-9_.]*",
    keywords: "IF DO WHILE ENDWHILE CALL ENDIF SUB ENDSUB GOTO REPEAT ENDREPEAT EQ LT GT NE GE LE OR XOR",
    contains: [
      Mode(className: "meta", begin: "\\%"),
      Mode(className: "meta", begin: "([O])([0-9]+)"),
      cLineCommentMode,
      cBlockCommentMode,
      Mode(className: "comment", begin: "\\(", end: "\\)", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "number", begin: "([-+]?([0-9]*\\.?[0-9]+\\.?))|(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)", relevance: 0),
      Mode(className: "string", begin: "'", end: "'", illegal: null, contains: [backSlashEscape]),
      Mode(className: "string", begin: "\"", end: "\"", illegal: null, contains: [backSlashEscape]),
      Mode(className: "name", begin: "([G])([0-9]+\\.?[0-9]?)"),
      Mode(className: "name", begin: "([M])([0-9]+\\.?[0-9]?)"),
      Mode(className: "attr", begin: "(VC|VS|#)", end: "(\\d+)"),
      Mode(className: "attr", begin: "(VZOFX|VZOFY|VZOFZ)"),
      Mode(className: "built_in", begin: "(ATAN|ABS|ACOS|ASIN|SIN|COS|EXP|FIX|FUP|ROUND|LN|TAN)(\\[)", end: "([-+]?([0-9]*\\.?[0-9]+\\.?))(\\])"),
      Mode(className: "symbol", variants: [Mode(begin: "N", end: "\\d+", illegal: "\\W")])
    ]);

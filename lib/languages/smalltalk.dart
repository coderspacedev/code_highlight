import '../src/common_modes.dart';
import '../src/mode.dart';

final smalltalk = Mode(
    refs: {
      '~contains~6': Mode(className: "string", begin: "\\\$.{1}"),
      '~contains~5': Mode(className: "symbol", begin: "#[a-zA-Z_]\\w*"),
    },
    aliases: ["st"],
    keywords: "self super nil true false thisContext",
    contains: [
      Mode(className: "comment", begin: "\"", end: "\"", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      aposStringMode,
      Mode(className: "type", begin: "\\b[A-Z][A-Za-z0-9_]*", relevance: 0),
      Mode(begin: "[a-z][a-zA-Z0-9_]*:", relevance: 0),
      cNumberMode,
      Mode(ref: '~contains~5'),
      Mode(ref: '~contains~6'),
      Mode(begin: "\\|[ ]*[a-z][a-zA-Z0-9_]*([ ]+[a-z][a-zA-Z0-9_]*)*[ ]*\\|", returnBegin: true, end: "\\|", illegal: "\\S", contains: [Mode(begin: "(\\|[ ]*)?[a-z][a-zA-Z0-9_]*")]),
      Mode(begin: "\\#\\(", end: "\\)", contains: [aposStringMode, Mode(ref: '~contains~6'), cNumberMode, Mode(ref: '~contains~5')])
    ]);

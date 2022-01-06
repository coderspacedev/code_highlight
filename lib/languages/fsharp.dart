import '../src/common_modes.dart';
import '../src/mode.dart';

final fsharp = Mode(
    refs: {},
    aliases: ["fs"],
    keywords: "abstract and as assert base begin class default delegate do done downcast downto elif else end exception extern false finally for fun function global if in inherit inline interface internal lazy let match member module mutable namespace new null of open or override private public rec return sig static struct then to true try type upcast use val void when while with yield",
    illegal: "\\/\\*",
    contains: [
      Mode(className: "keyword", begin: "\\b(yield|return|let|do)!"),
      Mode(className: "string", begin: "@\"", end: "\"", contains: [Mode(begin: "\"\"")]),
      Mode(className: "string", begin: "\"\"\"", end: "\"\"\""),
      Mode(className: "comment", begin: "\\(\\*", end: "\\*\\)", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "class", beginKeywords: "type", end: "\\(|=|\$", excludeEnd: true, contains: [
        underScoreTitleMode,
        Mode(begin: "<", end: ">", contains: [Mode(className: "title", begin: "'[a-zA-Z0-9_]+", relevance: 0)])
      ]),
      Mode(className: "meta", begin: "\\[<", end: ">\\]", relevance: 10),
      Mode(className: "symbol", begin: "\\B('[A-Za-z])\\b", contains: [backSlashEscape]),
      cLineCommentMode,
      Mode(className: "string", begin: "\"", end: "\"", illegal: null, contains: [backSlashEscape]),
      cNumberMode
    ]);

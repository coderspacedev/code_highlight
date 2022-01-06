import '../src/common_modes.dart';
import '../src/mode.dart';

final monkey = Mode(
    refs: {},
    caseInsensitive: true,
    keywords: {
      "keyword": "public private property continue exit extern new try catch eachin not abstract final select case default const local global field end if then else elseif endif while wend repeat until forever for to step next return module inline throw import",
      "built_in": "DebugLog DebugStop Error Print ACos ACosr ASin ASinr ATan ATan2 ATan2r ATanr Abs Abs Ceil Clamp Clamp Cos Cosr Exp Floor Log Max Max Min Min Pow Sgn Sgn Sin Sinr Sqrt Tan Tanr Seed PI HALFPI TWOPI",
      "literal": "true false null and or shl shr mod"
    },
    illegal: "\\/\\*",
    contains: [
      Mode(className: "comment", begin: "#rem", end: "#end", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "comment", begin: "'", end: "\$", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)], relevance: 0),
      Mode(className: "function", beginKeywords: "function method", end: "[(=:]|\$", illegal: "\\n", contains: [underScoreTitleMode]),
      Mode(className: "class", beginKeywords: "class interface", end: "\$", contains: [Mode(beginKeywords: "extends implements"), underScoreTitleMode]),
      Mode(className: "built_in", begin: "\\b(self|super)\\b"),
      Mode(className: "meta", begin: "\\s*#", end: "\$", keywords: {"meta-keyword": "if else elseif endif end then"}),
      Mode(className: "meta", begin: "^\\s*strict\\b"),
      Mode(beginKeywords: "alias", end: "=", contains: [underScoreTitleMode]),
      quoteStringMode,
      Mode(className: "number", relevance: 0, variants: [Mode(begin: "[\$][a-fA-F0-9]+"), numberMode])
    ]);

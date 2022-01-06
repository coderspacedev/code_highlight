import '../src/common_modes.dart';
import '../src/mode.dart';

final htmlbars = Mode(
    refs: {},
    caseInsensitive: true,
    subLanguage: ["xml"],
    contains: [
      Mode(className: "comment", begin: "{{!(--)?", end: "(--)?}}", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "template-tag", begin: "\\{\\{[#\\/]", end: "\\}\\}", contains: [
        Mode(
            className: "name",
            begin: "[a-zA-Z\\.\\-]+",
            keywords: {"builtin-name": "action collection component concat debugger each each-in else get hash if input link-to loc log mut outlet partial query-params render textarea unbound unless with yield view"},
            starts: Mode(endsWithParent: true, relevance: 0, keywords: {
              "keyword": "as",
              "built_in": "action collection component concat debugger each each-in else get hash if input link-to loc log mut outlet partial query-params render textarea unbound unless with yield view"
            }, contains: [
              quoteStringMode,
              Mode(illegal: "\\}\\}", begin: "[a-zA-Z0-9_]+=", returnBegin: true, relevance: 0, contains: [Mode(className: "attr", begin: "[a-zA-Z0-9_]+")]),
              numberMode
            ]))
      ]),
      Mode(className: "template-variable", begin: "\\{\\{[a-zA-Z][a-zA-Z\\-]+", end: "\\}\\}", keywords: {"keyword": "as", "built_in": "action collection component concat debugger each each-in else get hash if input link-to loc log mut outlet partial query-params render textarea unbound unless with yield view"}, contains: [quoteStringMode])
    ]);

import '../src/common_modes.dart';
import '../src/mode.dart';

final cal = Mode(
    refs: {
      '~contains~5~contains~1': Mode(className: "function", beginKeywords: "procedure", end: "[:;]", keywords: "procedure|10", contains: [
        titleMode,
        Mode(className: "params", begin: "\\(", end: "\\)", keywords: "div mod in and or not xor asserterror begin case do downto else end exit for if of repeat then to until while with var", contains: [Mode(ref: '~contains~0'), Mode(ref: '~contains~1')]),
        cLineCommentMode,
        Mode(className: "comment", begin: "\\{", end: "\\}", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)], relevance: 0),
        Mode(className: "comment", begin: "\\(\\*", end: "\\*\\)", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)], relevance: 10)
      ]),
      '~contains~1': Mode(className: "string", begin: "(#\\d+)+"),
      '~contains~0': Mode(className: "string", begin: "'", end: "'", contains: [Mode(begin: "''")]),
    },
    caseInsensitive: true,
    keywords: {"keyword": "div mod in and or not xor asserterror begin case do downto else end exit for if of repeat then to until while with var", "literal": "false true"},
    illegal: "\\/\\*",
    contains: [
      Mode(ref: '~contains~0'),
      Mode(ref: '~contains~1'),
      Mode(className: "number", begin: "\\b\\d+(\\.\\d+)?(DT|D|T)", relevance: 0),
      Mode(className: "string", begin: "\"", end: "\""),
      numberMode,
      Mode(className: "class", begin: "OBJECT (Table|Form|Report|Dataport|Codeunit|XMLport|MenuSuite|Page|Query) (\\d+) ([^\\r\\n]+)", returnBegin: true, contains: [titleMode, Mode(ref: '~contains~5~contains~1')]),
      Mode(ref: '~contains~5~contains~1')
    ]);

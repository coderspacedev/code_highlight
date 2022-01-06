import '../src/common_modes.dart';
import '../src/mode.dart';

final php = Mode(
    refs: {
      '~contains~9~contains~1~contains~4': Mode(variants: [binaryNumberMode, cNumberMode]),
      '~contains~9~contains~1~contains~3': Mode(className: "string", contains: [
        backSlashEscape,
        Mode(ref: '~contains~1~contains~0')
      ], variants: [
        Mode(begin: "b\"", end: "\""),
        Mode(begin: "b'", end: "'"),
        Mode(className: "string", begin: "'", end: "'", illegal: null, contains: [backSlashEscape]),
        Mode(className: "string", begin: "\"", end: "\"", illegal: null, contains: [backSlashEscape])
      ]),
      '~contains~7': Mode(begin: "\\\$+[a-zA-Z_-ÿ][a-zA-Z0-9_-ÿ]*"),
      '~contains~1~contains~0': Mode(className: "meta", begin: "<\\?(php)?|\\?>"),
    },
    aliases: ["php", "php3", "php4", "php5", "php6", "php7"],
    caseInsensitive: true,
    keywords:
        "and include_once list abstract global private echo interface as static endswitch array null if endwhile or const for endforeach self var while isset public protected exit foreach throw elseif include __FILE__ empty require_once do xor return parent clone use __CLASS__ __LINE__ else break print eval new catch __METHOD__ case exception default die require __FUNCTION__ enddeclare final try switch continue endfor endif declare unset true false trait goto instanceof insteadof __DIR__ __NAMESPACE__ yield finally",
    contains: [
      hashCommentMode,
      Mode(className: "comment", begin: "//", end: "\$", contains: [Mode(ref: '~contains~1~contains~0'), phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "comment", begin: "/\\*", end: "\\*/", contains: [Mode(className: "doctag", begin: "@[A-Za-z]+"), phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]),
      Mode(className: "comment", begin: "__halt_compiler.+?;", end: "false", contains: [phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)], endsWithParent: true, keywords: "__halt_compiler", lexemes: "[a-zA-Z_]\\w*"),
      Mode(className: "string", begin: "<<<['\"]?\\w+['\"]?\$", end: "^\\w+;?\$", contains: [
        backSlashEscape,
        Mode(className: "subst", variants: [Mode(begin: "\\\$\\w+"), Mode(begin: "\\{\\\$", end: "\\}")])
      ]),
      Mode(ref: '~contains~1~contains~0'),
      Mode(className: "keyword", begin: "\\\$this\\b"),
      Mode(ref: '~contains~7'),
      Mode(begin: "(::|->)+[a-zA-Z_\\x7f-\\xff][a-zA-Z0-9_\\x7f-\\xff]*"),
      Mode(className: "function", beginKeywords: "function", end: "[;{]", excludeEnd: true, illegal: "\\\$|\\[|%", contains: [
        underScoreTitleMode,
        Mode(className: "params", begin: "\\(", end: "\\)", contains: [Mode(self: true), Mode(ref: '~contains~7'), cBlockCommentMode, Mode(ref: '~contains~9~contains~1~contains~3'), Mode(ref: '~contains~9~contains~1~contains~4')])
      ]),
      Mode(className: "class", beginKeywords: "class interface", end: "{", excludeEnd: true, illegal: "[:\\(\\\$\"]", contains: [Mode(beginKeywords: "extends implements"), underScoreTitleMode]),
      Mode(beginKeywords: "namespace", end: ";", illegal: "[\\.']", contains: [underScoreTitleMode]),
      Mode(beginKeywords: "use", end: ";", contains: [underScoreTitleMode]),
      Mode(begin: "=>"),
      Mode(ref: '~contains~9~contains~1~contains~3'),
      Mode(ref: '~contains~9~contains~1~contains~4')
    ]);

import '../src/common_modes.dart';
import '../src/mode.dart';

final yaml = Mode(
    refs: {},
    caseInsensitive: true,
    aliases: ["yml", "YAML", "yaml"],
    contains: [
      Mode(className: "attr", variants: [Mode(begin: "\\w[\\w :\\/.-]*:(?=[ \t]|\$)"), Mode(begin: "\"\\w[\\w :\\/.-]*\":(?=[ \t]|\$)"), Mode(begin: "'\\w[\\w :\\/.-]*':(?=[ \t]|\$)")]),
      Mode(className: "meta", begin: "^---s*\$", relevance: 10),
      Mode(className: "string", begin: "[\\|>]([0-9]?[+-])?[ ]*\\n( *)[\\S ]+\\n(\\2[\\S ]+\\n?)*"),
      Mode(begin: "<%[%=-]?", end: "[%-]?%>", subLanguage: ["ruby"], excludeBegin: true, excludeEnd: true, relevance: 0),
      Mode(className: "type", begin: "![a-zA-Z_]\\w*"),
      Mode(className: "type", begin: "!![a-zA-Z_]\\w*"),
      Mode(className: "meta", begin: "&[a-zA-Z_]\\w*\$"),
      Mode(className: "meta", begin: "\\*[a-zA-Z_]\\w*\$"),
      Mode(className: "bullet", begin: "\\-(?=[ ]|\$)", relevance: 0),
      hashCommentMode,
      Mode(beginKeywords: "true false yes no null", keywords: {"literal": "true false yes no null"}),
      Mode(className: "number", begin: "(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)\\b"),
      Mode(className: "string", relevance: 0, variants: [
        Mode(begin: "'", end: "'"),
        Mode(begin: "\"", end: "\""),
        Mode(begin: "\\S+")
      ], contains: [
        backSlashEscape,
        Mode(className: "template-variable", variants: [Mode(begin: "{{", end: "}}"), Mode(begin: "%{", end: "}")])
      ])
    ]);

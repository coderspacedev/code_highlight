import '../src/common_modes.dart';
import '../src/mode.dart';

final graphql = Mode(
    refs: {},
    aliases: ["gql"],
    keywords: {"keyword": "query mutation subscription|10 type interface union scalar fragment|10 enum on ...", "literal": "true false null"},
    contains: [hashCommentMode, quoteStringMode, numberMode, Mode(className: "type", begin: "[^\\w][A-Z][a-z]", end: "\\W", excludeEnd: true), Mode(className: "literal", begin: "[^\\w][A-Z][A-Z]", end: "\\W", excludeEnd: true), Mode(className: "variable", begin: "\\\$", end: "\\W", excludeEnd: true), Mode(className: "keyword", begin: "[.]{2}", end: "\\."), Mode(className: "meta", begin: "@", end: "\\W", excludeEnd: true)],
    illegal: "([;<']|BEGIN)");

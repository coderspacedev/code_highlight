import '../src/common_modes.dart';
import '../src/mode.dart';

final nix = Mode(refs: {
  '~contains~3~contains~0~contains~4': Mode(begin: "[a-zA-Z0-9-_]+(\\s*=)", returnBegin: true, relevance: 0, contains: [Mode(className: "attr", begin: "\\S+")]),
  '~contains~3': Mode(className: "string", contains: [
    Mode(className: "subst", begin: "\\\$\\{", end: "}", keywords: {"keyword": "rec with let in inherit assert if else then", "literal": "true false or and null", "built_in": "import abort baseNameOf dirOf isNull builtins map removeAttrs throw toString derivation"}, contains: [numberMode, hashCommentMode, cBlockCommentMode, Mode(ref: '~contains~3'), Mode(ref: '~contains~3~contains~0~contains~4')])
  ], variants: [
    Mode(begin: "''", end: "''"),
    Mode(begin: "\"", end: "\"")
  ]),
}, aliases: [
  "nixos"
], keywords: {
  "keyword": "rec with let in inherit assert if else then",
  "literal": "true false or and null",
  "built_in": "import abort baseNameOf dirOf isNull builtins map removeAttrs throw toString derivation"
}, contains: [
  numberMode,
  hashCommentMode,
  cBlockCommentMode,
  Mode(ref: '~contains~3'),
  Mode(ref: '~contains~3~contains~0~contains~4')
]);

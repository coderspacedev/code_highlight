import '../src/common_modes.dart';
import '../src/mode.dart';

final capnproto = Mode(refs: {}, aliases: [
  "capnp"
], keywords: {
  "keyword": "struct enum interface union group import using const annotation extends in of on as with from fixed",
  "built_in": "Void Bool Int8 Int16 Int32 Int64 UInt8 UInt16 UInt32 UInt64 Float32 Float64 Text Data AnyPointer AnyStruct Capability List",
  "literal": "true false"
}, contains: [
  quoteStringMode,
  numberMode,
  hashCommentMode,
  Mode(className: "meta", begin: "@0x[\\w\\d]{16};", illegal: "\\n"),
  Mode(className: "symbol", begin: "@\\d+\\b"),
  Mode(className: "class", beginKeywords: "struct enum", end: "\\{", illegal: "\\n", contains: [Mode(className: "title", begin: "[a-zA-Z]\\w*", relevance: 0, starts: Mode(endsWithParent: true, excludeEnd: true))]),
  Mode(className: "class", beginKeywords: "interface", end: "\\{", illegal: "\\n", contains: [Mode(className: "title", begin: "[a-zA-Z]\\w*", relevance: 0, starts: Mode(endsWithParent: true, excludeEnd: true))])
]);

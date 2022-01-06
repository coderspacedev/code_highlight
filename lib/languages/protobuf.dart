import '../src/common_modes.dart';
import '../src/mode.dart';

final protobuf = Mode(refs: {}, keywords: {
  "keyword": "package import option optional required repeated group oneof",
  "built_in": "double float int32 int64 uint32 uint64 sint32 sint64 fixed32 fixed64 sfixed32 sfixed64 bool string bytes",
  "literal": "true false"
}, contains: [
  quoteStringMode,
  numberMode,
  cLineCommentMode,
  Mode(className: "class", beginKeywords: "message enum service", end: "\\{", illegal: "\\n", contains: [Mode(className: "title", begin: "[a-zA-Z]\\w*", relevance: 0, starts: Mode(endsWithParent: true, excludeEnd: true))]),
  Mode(className: "function", beginKeywords: "rpc", end: ";", excludeEnd: true, keywords: "rpc returns"),
  Mode(begin: "^\\s*[A-Z_]+", end: "\\s*=", excludeEnd: true)
]);

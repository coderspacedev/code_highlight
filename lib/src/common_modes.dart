import 'mode.dart';

final backSlashEscape = Mode(begin: "\\\\[\\s\\S]", relevance: 0);
final aposStringMode = Mode(className: "string", begin: "'", end: "'", illegal: "\\n", contains: [Mode(begin: "\\\\[\\s\\S]", relevance: 0)]);
final quoteStringMode = Mode(className: "string", begin: "\"", end: "\"", illegal: "\\n", contains: [Mode(begin: "\\\\[\\s\\S]", relevance: 0)]);
final phrasalWordsMode = Mode(begin: "\\b(a|an|the|are|I'm|isn't|don't|doesn't|won't|but|just|should|pretty|simply|enough|gonna|going|wtf|so|such|will|you|your|they|like|more)\\b");
final cLineCommentMode = Mode(className: "comment", begin: "//", end: "\$", contains: [Mode(begin: "\\b(a|an|the|are|I'm|isn't|don't|doesn't|won't|but|just|should|pretty|simply|enough|gonna|going|wtf|so|such|will|you|your|they|like|more)\\b"), Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]);
final cBlockCommentMode = Mode(className: "comment", begin: "/\\*", end: "\\*/", contains: [Mode(begin: "\\b(a|an|the|are|I'm|isn't|don't|doesn't|won't|but|just|should|pretty|simply|enough|gonna|going|wtf|so|such|will|you|your|they|like|more)\\b"), Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]);
final hashCommentMode = Mode(className: "comment", begin: "#", end: "\$", contains: [Mode(begin: "\\b(a|an|the|are|I'm|isn't|don't|doesn't|won't|but|just|should|pretty|simply|enough|gonna|going|wtf|so|such|will|you|your|they|like|more)\\b"), Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)]);
final numberMode = Mode(className: "number", begin: "\\b\\d+(\\.\\d+)?", relevance: 0);
final cNumberMode = Mode(className: "number", begin: "(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)", relevance: 0);
final binaryNumberMode = Mode(className: "number", begin: "\\b(0b[01]+)", relevance: 0);
final cssNumberMode = Mode(className: "number", begin: "\\b\\d+(\\.\\d+)?(%|em|ex|ch|rem|vw|vh|vmin|vmax|cm|mm|in|pt|pc|px|deg|grad|rad|turn|s|ms|Hz|kHz|dpi|dpcm|dppx)?", relevance: 0);
final regexpMode = Mode(className: "regexp", begin: "\\/", end: "\\/[gimuy]*", illegal: "\\n", contains: [
  Mode(begin: "\\\\[\\s\\S]", relevance: 0),
  Mode(begin: "\\[", end: "\\]", relevance: 0, contains: [Mode(begin: "\\\\[\\s\\S]", relevance: 0)])
]);
final titleMode = Mode(className: "title", begin: "[a-zA-Z]\\w*", relevance: 0);
final underScoreTitleMode = Mode(className: "title", begin: "[a-zA-Z_]\\w*", relevance: 0);
final methodGuard = Mode(begin: "\\.\\s*[a-zA-Z_]\\w*", relevance: 0);

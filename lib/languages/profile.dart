import '../src/common_modes.dart';
import '../src/mode.dart';

final profile = Mode(refs: {}, contains: [
  cNumberMode,
  Mode(begin: "[a-zA-Z_][\\da-zA-Z_]+\\.[\\da-zA-Z_]{1,3}", end: ":", excludeEnd: true),
  Mode(begin: "(ncalls|tottime|cumtime)", end: "\$", keywords: "ncalls tottime|10 cumtime|10 filename", relevance: 10),
  Mode(begin: "function calls", end: "\$", contains: [cNumberMode], relevance: 10),
  aposStringMode,
  quoteStringMode,
  Mode(className: "string", begin: "\\(", end: "\\)\$", excludeBegin: true, excludeEnd: true, relevance: 0)
]);

import '../src/common_modes.dart';
import '../src/mode.dart';

final tap = Mode(
    refs: {},
    caseInsensitive: true,
    contains: [
      hashCommentMode,
      Mode(className: "meta", variants: [Mode(begin: "^TAP version (\\d+)\$"), Mode(begin: "^1\\.\\.(\\d+)\$")]),
      Mode(begin: "(s+)?---\$", end: "\\.\\.\\.\$", subLanguage: ["yaml"], relevance: 0),
      Mode(className: "number", begin: " (\\d+) "),
      Mode(className: "symbol", variants: [Mode(begin: "^ok"), Mode(begin: "^not ok")])
    ]);

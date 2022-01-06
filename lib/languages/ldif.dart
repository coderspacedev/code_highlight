import '../src/common_modes.dart';
import '../src/mode.dart';

final ldif = Mode(refs: {}, contains: [Mode(className: "attribute", begin: "^dn", end: ": ", excludeEnd: true, starts: Mode(end: "\$", relevance: 0), relevance: 10), Mode(className: "attribute", begin: "^\\w", end: ": ", excludeEnd: true, starts: Mode(end: "\$", relevance: 0)), Mode(className: "literal", begin: "^-", end: "\$"), hashCommentMode]);

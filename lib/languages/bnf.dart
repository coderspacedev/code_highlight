import '../src/common_modes.dart';
import '../src/mode.dart';

final bnf = Mode(refs: {}, contains: [
  Mode(className: "attribute", begin: "<", end: ">"),
  Mode(begin: "::=", starts: Mode(end: "\$", contains: [Mode(begin: "<", end: ">"), cLineCommentMode, cBlockCommentMode, aposStringMode, quoteStringMode]))
]);

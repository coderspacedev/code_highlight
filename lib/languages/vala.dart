import '../src/common_modes.dart';
import '../src/mode.dart';

final vala = Mode(refs: {}, keywords: {
  "keyword": "char uchar unichar int uint long ulong short ushort int8 int16 int32 int64 uint8 uint16 uint32 uint64 float double bool struct enum string void weak unowned owned async signal static abstract interface override virtual delegate if while do for foreach else switch case break default return try catch public private protected internal using new this get set const stdout stdin stderr var",
  "built_in": "DBus GLib CCode Gee Object Gtk Posix",
  "literal": "false true null"
}, contains: [
  Mode(className: "class", beginKeywords: "class interface namespace", end: "{", excludeEnd: true, illegal: "[^,:\\n\\s\\.]", contains: [underScoreTitleMode]),
  cLineCommentMode,
  cBlockCommentMode,
  Mode(className: "string", begin: "\"\"\"", end: "\"\"\"", relevance: 5),
  aposStringMode,
  quoteStringMode,
  cNumberMode,
  Mode(className: "meta", begin: "^#", end: "\$", relevance: 2)
]);

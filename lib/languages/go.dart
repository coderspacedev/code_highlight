import '../src/common_modes.dart';
import '../src/mode.dart';

final go = Mode(
    refs: {},
    aliases: ["golang"],
    keywords: {"keyword": "break default func interface select case map struct chan else goto package switch const fallthrough if range type continue for import return var go defer bool byte complex64 complex128 float32 float64 int8 int16 int32 int64 string uint8 uint16 uint32 uint64 int uint uintptr rune", "literal": "true false iota nil", "built_in": "append cap close complex copy imag len make new panic print println real recover delete"},
    illegal: "</",
    contains: [
      cLineCommentMode,
      cBlockCommentMode,
      Mode(className: "string", variants: [quoteStringMode, aposStringMode, Mode(begin: "`", end: "`")]),
      Mode(className: "number", variants: [Mode(begin: "(-?)(\\b0[xX][a-fA-F0-9]+|(\\b\\d+(\\.\\d*)?|\\.\\d+)([eE][-+]?\\d+)?)[i]", relevance: 1), cNumberMode]),
      Mode(begin: ":="),
      Mode(className: "function", beginKeywords: "func", end: "\\s*(\\{|\$)", excludeEnd: true, contains: [
        titleMode,
        Mode(
            className: "params",
            begin: "\\(",
            end: "\\)",
            keywords: {"keyword": "break default func interface select case map struct chan else goto package switch const fallthrough if range type continue for import return var go defer bool byte complex64 complex128 float32 float64 int8 int16 int32 int64 string uint8 uint16 uint32 uint64 int uint uintptr rune", "literal": "true false iota nil", "built_in": "append cap close complex copy imag len make new panic print println real recover delete"},
            illegal: "[\"']")
      ])
    ]);

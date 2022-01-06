import '../src/common_modes.dart';
import '../src/mode.dart';

final clean =
    Mode(refs: {}, aliases: ["clean", "icl", "dcl"], keywords: {"keyword": "if let in with where case of class instance otherwise implementation definition system module from import qualified as special code inline foreign export ccall stdcall generic derive infix infixl infixr", "built_in": "Int Real Char Bool", "literal": "True False"}, contains: [cLineCommentMode, cBlockCommentMode, aposStringMode, quoteStringMode, cNumberMode, Mode(begin: "->|<-[|:]?|#!?|>>=|\\{\\||\\|\\}|:==|=:|<>")]);

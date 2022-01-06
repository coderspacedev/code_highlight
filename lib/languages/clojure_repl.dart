import '../src/mode.dart';

final clojureRepl = Mode(refs: {}, contains: [
  Mode(className: "meta", begin: "^([\\w.-]+|\\s*#_)?=>", starts: Mode(end: "\$", subLanguage: ["clojure"]))
]);

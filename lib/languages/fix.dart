import '../src/mode.dart';

final fix = Mode(refs: {}, contains: [
  Mode(begin: "[^\\u2401\\u0001]+", end: "[\\u2401\\u0001]", excludeEnd: true, returnBegin: true, returnEnd: false, contains: [Mode(begin: "([^\\u2401\\u0001=]+)", end: "=([^\\u2401\\u0001=]+)", returnEnd: true, returnBegin: false, className: "attr"), Mode(begin: "=", end: "([\\u2401\\u0001])", excludeEnd: true, excludeBegin: true, className: "string")])
], caseInsensitive: true);

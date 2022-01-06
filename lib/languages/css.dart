import '../src/common_modes.dart';
import '../src/mode.dart';

final css = Mode(
    refs: {},
    caseInsensitive: true,
    illegal: "[=\\/|'\\\$]",
    contains: [
      cBlockCommentMode,
      Mode(className: "selector-id", begin: "#[A-Za-z0-9_-]+"),
      Mode(className: "selector-class", begin: "\\.[A-Za-z0-9_-]+"),
      Mode(className: "selector-attr", begin: "\\[", end: "\\]", illegal: "\$", contains: [aposStringMode, quoteStringMode]),
      Mode(className: "selector-pseudo", begin: ":(:)?[a-zA-Z0-9\\_\\-\\+\\(\\)\"'.]+"),
      Mode(begin: "@(page|font-face)", lexemes: "@[a-z-]+", keywords: "@page @font-face"),
      Mode(begin: "@", end: "[{;]", illegal: ":", returnBegin: true, contains: [
        Mode(className: "keyword", begin: "@\\-?\\w[\\w]*(\\-\\w+)*"),
        Mode(begin: "\\s", endsWithParent: true, excludeEnd: true, relevance: 0, keywords: "and or not only", contains: [Mode(begin: "[a-z-]+:", className: "attribute"), aposStringMode, quoteStringMode, cssNumberMode])
      ]),
      Mode(className: "selector-tag", begin: "[a-zA-Z-][a-zA-Z0-9_-]*", relevance: 0),
      Mode(begin: "{", end: "}", illegal: "\\S", contains: [
        cBlockCommentMode,
        Mode(begin: "(?:[A-Z\\_\\.\\-]+|--[a-zA-Z0-9_-]+)\\s*:", returnBegin: true, end: ";", endsWithParent: true, contains: [
          Mode(
              className: "attribute",
              begin: "\\S",
              end: ":",
              excludeEnd: true,
              starts: Mode(endsWithParent: true, excludeEnd: true, contains: [
                Mode(begin: "[\\w-]+\\(", returnBegin: true, contains: [
                  Mode(className: "built_in", begin: "[\\w-]+"),
                  Mode(begin: "\\(", end: "\\)", contains: [aposStringMode, quoteStringMode, cssNumberMode])
                ]),
                cssNumberMode,
                quoteStringMode,
                aposStringMode,
                cBlockCommentMode,
                Mode(className: "number", begin: "#[0-9A-Fa-f]+"),
                Mode(className: "meta", begin: "!important")
              ]))
        ])
      ])
    ]);

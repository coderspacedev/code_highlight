import '../src/common_modes.dart';
import '../src/mode.dart';

final aspectj = Mode(
    refs: {},
    keywords:
        "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else extends implements break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws privileged aspectOf adviceexecution proceed cflowbelow cflow initialization preinitialization staticinitialization withincode target within execution getWithinTypeName handler thisJoinPoint thisJoinPointStaticPart thisEnclosingJoinPointStaticPart declare parents warning error soft precedence thisAspectInstance",
    illegal: "<\\/|#",
    contains: [
      Mode(className: "comment", begin: "/\\*\\*", end: "\\*/", contains: [Mode(begin: "\\w+@", relevance: 0), Mode(className: "doctag", begin: "@[A-Za-z]+"), phrasalWordsMode, Mode(className: "doctag", begin: "(?:TODO|FIXME|NOTE|BUG|XXX):", relevance: 0)], relevance: 0),
      cLineCommentMode,
      cBlockCommentMode,
      aposStringMode,
      quoteStringMode,
      Mode(className: "class", beginKeywords: "aspect", end: "[{;=]", excludeEnd: true, illegal: "[:;\"\\[\\]]", contains: [
        Mode(beginKeywords: "extends implements pertypewithin perthis pertarget percflowbelow percflow issingleton"),
        underScoreTitleMode,
        Mode(
            begin: "\\([^\\)]*",
            end: "[)]+",
            keywords:
                "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else extends implements break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws privileged aspectOf adviceexecution proceed cflowbelow cflow initialization preinitialization staticinitialization withincode target within execution getWithinTypeName handler thisJoinPoint thisJoinPointStaticPart thisEnclosingJoinPointStaticPart declare parents warning error soft precedence thisAspectInstance get set args call",
            excludeEnd: false)
      ]),
      Mode(className: "class", beginKeywords: "class interface", end: "[{;=]", excludeEnd: true, relevance: 0, keywords: "class interface", illegal: "[:\"\\[\\]]", contains: [Mode(beginKeywords: "extends implements"), underScoreTitleMode]),
      Mode(beginKeywords: "pointcut after before around throwing returning", end: "[)]", excludeEnd: false, illegal: "[\"\\[\\]]", contains: [
        Mode(begin: "[a-zA-Z_]\\w*\\s*\\(", returnBegin: true, contains: [underScoreTitleMode])
      ]),
      Mode(
          begin: "[:]",
          returnBegin: true,
          end: "[{;]",
          relevance: 0,
          excludeEnd: false,
          keywords:
              "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else extends implements break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws privileged aspectOf adviceexecution proceed cflowbelow cflow initialization preinitialization staticinitialization withincode target within execution getWithinTypeName handler thisJoinPoint thisJoinPointStaticPart thisEnclosingJoinPointStaticPart declare parents warning error soft precedence thisAspectInstance",
          illegal: "[\"\\[\\]]",
          contains: [
            Mode(
                begin: "[a-zA-Z_]\\w*\\s*\\(",
                keywords:
                    "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else extends implements break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws privileged aspectOf adviceexecution proceed cflowbelow cflow initialization preinitialization staticinitialization withincode target within execution getWithinTypeName handler thisJoinPoint thisJoinPointStaticPart thisEnclosingJoinPointStaticPart declare parents warning error soft precedence thisAspectInstance get set args call",
                relevance: 0),
            quoteStringMode
          ]),
      Mode(beginKeywords: "new throw", relevance: 0),
      Mode(
          className: "function",
          begin: "\\w+ +\\w+(\\.)?\\w+\\s*\\([^\\)]*\\)\\s*((throws)[\\w\\s,]+)?[\\{;]",
          returnBegin: true,
          end: "[{;=]",
          keywords:
              "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else extends implements break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws privileged aspectOf adviceexecution proceed cflowbelow cflow initialization preinitialization staticinitialization withincode target within execution getWithinTypeName handler thisJoinPoint thisJoinPointStaticPart thisEnclosingJoinPointStaticPart declare parents warning error soft precedence thisAspectInstance",
          excludeEnd: true,
          contains: [
            Mode(begin: "[a-zA-Z_]\\w*\\s*\\(", returnBegin: true, relevance: 0, contains: [underScoreTitleMode]),
            Mode(
                className: "params",
                begin: "\\(",
                end: "\\)",
                relevance: 0,
                keywords:
                    "false synchronized int abstract float private char boolean static null if const for true while long throw strictfp finally protected import native final return void enum else extends implements break transient new catch instanceof byte super volatile case assert short package default double public try this switch continue throws privileged aspectOf adviceexecution proceed cflowbelow cflow initialization preinitialization staticinitialization withincode target within execution getWithinTypeName handler thisJoinPoint thisJoinPointStaticPart thisEnclosingJoinPointStaticPart declare parents warning error soft precedence thisAspectInstance",
                contains: [aposStringMode, quoteStringMode, cNumberMode, cBlockCommentMode]),
            cLineCommentMode,
            cBlockCommentMode
          ]),
      cNumberMode,
      Mode(className: "meta", begin: "@[A-Za-z]+")
    ]);

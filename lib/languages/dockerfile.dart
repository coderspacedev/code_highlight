import '../src/common_modes.dart';
import '../src/mode.dart';

final dockerfile = Mode(
    refs: {},
    aliases: ["docker"],
    caseInsensitive: true,
    keywords: "from maintainer expose env arg user onbuild stopsignal",
    contains: [
      hashCommentMode,
      aposStringMode,
      quoteStringMode,
      numberMode,
      Mode(beginKeywords: "run cmd entrypoint volume add copy workdir label healthcheck shell", starts: Mode(end: "[^\\\\]\$", subLanguage: ["bash"]))
    ],
    illegal: "</");

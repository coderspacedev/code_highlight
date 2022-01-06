import '../src/common_modes.dart';
import '../src/mode.dart';

final axapta = Mode(
    refs: {},
    keywords: "false int abstract private char boolean static null if for true while long throw finally protected final return void enum else break new catch byte super case short default double public try this switch continue reverse firstfast firstonly forupdate nofetch sum avg minof maxof count order group by asc desc index hint like dispaly edit client server ttsbegin ttscommit str real date container anytype common div mod",
    contains: [
      cLineCommentMode,
      cBlockCommentMode,
      aposStringMode,
      quoteStringMode,
      cNumberMode,
      Mode(className: "meta", begin: "#", end: "\$"),
      Mode(className: "class", beginKeywords: "class interface", end: "{", excludeEnd: true, illegal: ":", contains: [Mode(beginKeywords: "extends implements"), underScoreTitleMode])
    ]);

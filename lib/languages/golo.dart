import '../src/common_modes.dart';
import '../src/mode.dart';

final golo =
    Mode(refs: {}, keywords: {"keyword": "println readln print import module function local return let var while for foreach times in case when match with break continue augment augmentation each find filter reduce if then else otherwise try catch finally raise throw orIfNull DynamicObject|10 DynamicVariable struct Observable map set vector list array", "literal": "true false null"}, contains: [hashCommentMode, quoteStringMode, cNumberMode, Mode(className: "meta", begin: "@[A-Za-z]+")]);

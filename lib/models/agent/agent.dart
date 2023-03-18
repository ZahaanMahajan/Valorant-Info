import 'ability.dart';
import 'role.dart';
import 'voice_line.dart';

class Agent {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  dynamic characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  List<Ability>? abilities;
  VoiceLine? voiceLine;

  Agent({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
    this.voiceLine,
  });

  // factory Agent.fromJson(Map<String, dynamic> json) => Agent(
  //       uuid: json['uuid'] as String?,
  //       displayName: json['displayName'] as String?,
  //       description: json['description'] as String?,
  //       developerName: json['developerName'] as String?,
  //       characterTags: json['characterTags'] as dynamic,
  //       displayIcon: json['displayIcon'] as String?,
  //       displayIconSmall: json['displayIconSmall'] as String?,
  //       bustPortrait: json['bustPortrait'] as String?,
  //       fullPortrait: json['fullPortrait'] as String?,
  //       fullPortraitV2: json['fullPortraitV2'] as String?,
  //       killfeedPortrait: json['killfeedPortrait'] as String?,
  //       background: json['background'] as String?,
  //       backgroundGradientColors:
  //           json['backgroundGradientColors'] as List<String>?,
  //       assetPath: json['assetPath'] as String?,
  //       isFullPortraitRightFacing: json['isFullPortraitRightFacing'] as bool?,
  //       isPlayableCharacter: json['isPlayableCharacter'] as bool?,
  //       isAvailableForTest: json['isAvailableForTest'] as bool?,
  //       isBaseContent: json['isBaseContent'] as bool?,
  //       role: json['role'] == null
  //           ? null
  //           : Role.fromJson(json['role'] as Map<String, dynamic>),
  //       abilities: (json['abilities'] as List<dynamic>?)
  //           ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
  //           .toList(),
  //       voiceLine: json['voiceLine'] == null
  //           ? null
  //           : VoiceLine.fromJson(json['voiceLine'] as Map<String, dynamic>),
  //     );

  // Map<String, dynamic> toJson() => {
  //       'uuid': uuid,
  //       'displayName': displayName,
  //       'description': description,
  //       'developerName': developerName,
  //       'characterTags': characterTags,
  //       'displayIcon': displayIcon,
  //       'displayIconSmall': displayIconSmall,
  //       'bustPortrait': bustPortrait,
  //       'fullPortrait': fullPortrait,
  //       'fullPortraitV2': fullPortraitV2,
  //       'killfeedPortrait': killfeedPortrait,
  //       'background': background,
  //       'backgroundGradientColors': backgroundGradientColors,
  //       'assetPath': assetPath,
  //       'isFullPortraitRightFacing': isFullPortraitRightFacing,
  //       'isPlayableCharacter': isPlayableCharacter,
  //       'isAvailableForTest': isAvailableForTest,
  //       'isBaseContent': isBaseContent,
  //       'role': role?.toJson(),
  //       'abilities': abilities?.map((e) => e.toJson()).toList(),
  //       'voiceLine': voiceLine?.toJson(),
  //     };
}

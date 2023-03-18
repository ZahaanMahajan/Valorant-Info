class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  // factory Role.fromJson(Map<String, dynamic> json) => Role(
  //       uuid: json['uuid'] as String?,
  //       displayName: json['displayName'] as String?,
  //       description: json['description'] as String?,
  //       displayIcon: json['displayIcon'] as String?,
  //       assetPath: json['assetPath'] as String?,
  //     );

  // Map<String, dynamic> toJson() => {
  //       'uuid': uuid,
  //       'displayName': displayName,
  //       'description': description,
  //       'displayIcon': displayIcon,
  //       'assetPath': assetPath,
  //     };
}

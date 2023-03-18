class MediaList {
  int? id;
  String? wwise;
  String? wave;

  MediaList({this.id, this.wwise, this.wave});

  // factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
  //       id: json['id'] as int?,
  //       wwise: json['wwise'] as String?,
  //       wave: json['wave'] as String?,
  //     );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'wwise': wwise,
  //       'wave': wave,
  //     };
}

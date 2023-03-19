class Maps {
  String? uuid;
  String? displayName;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? splash;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  // List<Callouts>? callouts;

  Maps({
    this.uuid,
    this.displayName,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.splash,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    // this.callouts,
  });

  Maps.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    // xMultiplier = json['xMultiplier'];
    // yMultiplier = json['yMultiplier'];
    // xScalarToAdd = json['xScalarToAdd'];
    // yScalarToAdd = json['yScalarToAdd'];
    // if (json['callouts'] != null) {
    // callouts = <Callouts>[];
    // json['callouts'].forEach((v) {
    // callouts!.add(Callouts.fromJson(v));
    // }
    // );
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> maps = <String, dynamic>{};
    maps['uuid'] = uuid;
    maps['displayName'] = displayName;
    maps['coordinates'] = coordinates;
    maps['displayIcon'] = displayIcon;
    maps['listViewIcon'] = listViewIcon;
    maps['splash'] = splash;
    maps['assetPath'] = assetPath;
    maps['mapUrl'] = mapUrl;
    maps['xMultiplier'] = xMultiplier;
    maps['yMultiplier'] = yMultiplier;
    maps['xScalarToAdd'] = xScalarToAdd;
    maps['yScalarToAdd'] = yScalarToAdd;
    // if (callouts != null) {
    //   maps['callouts'] = callouts!.map((v) => v.toJson()).toList();
    // }
    return maps;
  }
}

class Callouts {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callouts({this.regionName, this.superRegionName, this.location});

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> maps = <String, dynamic>{};
    maps['regionName'] = regionName;
    maps['superRegionName'] = superRegionName;
    if (location != null) {
      maps['location'] = location!.toJson();
    }
    return maps;
  }
}

class Location {
  double? x;
  double? y;

  Location({this.x, this.y});

  Location.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> maps = <String, dynamic>{};
    maps['x'] = x;
    maps['y'] = y;
    return maps;
  }
}

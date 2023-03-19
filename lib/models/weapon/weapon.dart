class Weapon {
  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skins>? skins;

  Weapon({
    this.uuid,
    this.displayName,
    this.category,
    this.defaultSkinUuid,
    this.displayIcon,
    this.killStreamIcon,
    this.assetPath,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  Weapon.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    defaultSkinUuid = json['defaultSkinUuid'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    assetPath = json['assetPath'];
    weaponStats = json['weaponStats'] == null
        ? null
        : WeaponStats.fromJson(json['weaponStats']);
    shopData =
        json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null;
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['category'] = category;
    data['defaultSkinUuid'] = defaultSkinUuid;
    data['displayIcon'] = displayIcon;
    data['killStreamIcon'] = killStreamIcon;
    data['assetPath'] = assetPath;
    if (weaponStats != null) {
      data['weaponStats'] = weaponStats!.toJson();
    }
    if (shopData != null) {
      data['shopData'] = shopData!.toJson();
    }
    if (skins != null) {
      data['skins'] = skins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeaponStats {
  dynamic fireRate;
  int? magazineSize;
  double? runSpeedMultiplier;
  dynamic equipTimeSeconds;
  dynamic reloadTimeSeconds;
  dynamic firstBulletAccuracy;
  int? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  String? fireMode;
  String? altFireType;
  AdsStats? adsStats;
  AltShotgunStats? altShotgunStats;
  AirBurstStats? airBurstStats;
  List<DamageRanges>? damageRanges;

  WeaponStats(
      {this.fireRate,
      this.magazineSize,
      this.runSpeedMultiplier,
      this.equipTimeSeconds,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.shotgunPelletCount,
      this.wallPenetration,
      this.feature,
      this.fireMode,
      this.altFireType,
      this.adsStats,
      this.altShotgunStats,
      this.airBurstStats,
      this.damageRanges});

  WeaponStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    feature = json['feature'];
    fireMode = json['fireMode'];
    altFireType = json['altFireType'];
    adsStats =
        json['adsStats'] != null ? AdsStats.fromJson(json['adsStats']) : null;
    altShotgunStats = json['altShotgunStats'] != null
        ? AltShotgunStats.fromJson(json['altShotgunStats'])
        : null;
    airBurstStats = json['airBurstStats'] != null
        ? AirBurstStats.fromJson(json['airBurstStats'])
        : null;
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(DamageRanges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fireRate'] = fireRate;
    data['magazineSize'] = magazineSize;
    data['runSpeedMultiplier'] = runSpeedMultiplier;
    data['equipTimeSeconds'] = equipTimeSeconds;
    data['reloadTimeSeconds'] = reloadTimeSeconds;
    data['firstBulletAccuracy'] = firstBulletAccuracy;
    data['shotgunPelletCount'] = shotgunPelletCount;
    data['wallPenetration'] = wallPenetration;
    data['feature'] = feature;
    data['fireMode'] = fireMode;
    data['altFireType'] = altFireType;
    if (adsStats != null) {
      data['adsStats'] = adsStats!.toJson();
    }
    if (altShotgunStats != null) {
      data['altShotgunStats'] = altShotgunStats!.toJson();
    }
    if (airBurstStats != null) {
      data['airBurstStats'] = airBurstStats!.toJson();
    }
    if (damageRanges != null) {
      data['damageRanges'] = damageRanges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdsStats {
  double? zoomMultiplier;
  dynamic fireRate;
  double? runSpeedMultiplier;
  int? burstCount;
  dynamic firstBulletAccuracy;

  AdsStats(
      {this.zoomMultiplier,
      this.fireRate,
      this.runSpeedMultiplier,
      this.burstCount,
      this.firstBulletAccuracy});

  AdsStats.fromJson(Map<String, dynamic> json) {
    zoomMultiplier = json['zoomMultiplier'];
    fireRate = json['fireRate'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    burstCount = json['burstCount'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zoomMultiplier'] = zoomMultiplier;
    data['fireRate'] = fireRate;
    data['runSpeedMultiplier'] = runSpeedMultiplier;
    data['burstCount'] = burstCount;
    data['firstBulletAccuracy'] = firstBulletAccuracy;
    return data;
  }
}

class AltShotgunStats {
  int? shotgunPelletCount;
  double? burstRate;

  AltShotgunStats({this.shotgunPelletCount, this.burstRate});

  AltShotgunStats.fromJson(Map<String, dynamic> json) {
    shotgunPelletCount = json['shotgunPelletCount'];
    burstRate = json['burstRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shotgunPelletCount'] = shotgunPelletCount;
    data['burstRate'] = burstRate;
    return data;
  }
}

class AirBurstStats {
  int? shotgunPelletCount;
  double? burstDistance;

  AirBurstStats({this.shotgunPelletCount, this.burstDistance});

  AirBurstStats.fromJson(Map<String, dynamic> json) {
    shotgunPelletCount = json['shotgunPelletCount'];
    burstDistance = json['burstDistance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shotgunPelletCount'] = shotgunPelletCount;
    data['burstDistance'] = burstDistance;
    return data;
  }
}

class DamageRanges {
  int? rangeStartMeters;
  int? rangeEndMeters;
  dynamic headDamage;
  int? bodyDamage;
  dynamic legDamage;

  DamageRanges(
      {this.rangeStartMeters,
      this.rangeEndMeters,
      this.headDamage,
      this.bodyDamage,
      this.legDamage});

  DamageRanges.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rangeStartMeters'] = rangeStartMeters;
    data['rangeEndMeters'] = rangeEndMeters;
    data['headDamage'] = headDamage;
    data['bodyDamage'] = bodyDamage;
    data['legDamage'] = legDamage;
    return data;
  }
}

class ShopData {
  int? cost;
  String? category;
  String? categoryText;
  GridPosition? gridPosition;
  bool? canBeTrashed;
  void image;
  String? newImage;
  void newImage2;
  String? assetPath;

  ShopData(
      {this.cost,
      this.category,
      this.categoryText,
      this.gridPosition,
      this.canBeTrashed,
      this.image,
      this.newImage,
      this.newImage2,
      this.assetPath});

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    categoryText = json['categoryText'];
    gridPosition = json['gridPosition'] != null
        ? GridPosition.fromJson(json['gridPosition'])
        : null;
    canBeTrashed = json['canBeTrashed'];
    newImage = json['newImage'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['category'] = category;
    data['categoryText'] = categoryText;
    if (gridPosition != null) {
      data['gridPosition'] = gridPosition!.toJson();
    }
    data['canBeTrashed'] = canBeTrashed;
    data['newImage'] = newImage;
    data['assetPath'] = assetPath;
    return data;
  }
}

class GridPosition {
  int? row;
  int? column;

  GridPosition({this.row, this.column});

  GridPosition.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['row'] = row;
    data['column'] = column;
    return data;
  }
}

class Skins {
  String? uuid;
  String? displayName;
  String? themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  String? wallpaper;
  String? assetPath;
  List<Chromas>? chromas;
  List<Levels>? levels;

  Skins(
      {this.uuid,
      this.displayName,
      this.themeUuid,
      this.contentTierUuid,
      this.displayIcon,
      this.wallpaper,
      this.assetPath,
      this.chromas,
      this.levels});

  Skins.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    themeUuid = json['themeUuid'];
    contentTierUuid = json['contentTierUuid'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
    assetPath = json['assetPath'];
    if (json['chromas'] != null) {
      chromas = <Chromas>[];
      json['chromas'].forEach((v) {
        chromas!.add(Chromas.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['themeUuid'] = themeUuid;
    data['contentTierUuid'] = contentTierUuid;
    data['displayIcon'] = displayIcon;
    data['wallpaper'] = wallpaper;
    data['assetPath'] = assetPath;
    if (chromas != null) {
      data['chromas'] = chromas!.map((v) => v.toJson()).toList();
    }
    if (levels != null) {
      data['levels'] = levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chromas {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? fullRender;
  String? swatch;
  String? streamedVideo;
  String? assetPath;

  Chromas(
      {this.uuid,
      this.displayName,
      this.displayIcon,
      this.fullRender,
      this.swatch,
      this.streamedVideo,
      this.assetPath});

  Chromas.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    fullRender = json['fullRender'];
    swatch = json['swatch'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    data['fullRender'] = fullRender;
    data['swatch'] = swatch;
    data['streamedVideo'] = streamedVideo;
    data['assetPath'] = assetPath;
    return data;
  }
}

class Levels {
  String? uuid;
  String? displayName;
  String? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String? assetPath;

  Levels(
      {this.uuid,
      this.displayName,
      this.levelItem,
      this.displayIcon,
      this.streamedVideo,
      this.assetPath});

  Levels.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    levelItem = json['levelItem'];
    displayIcon = json['displayIcon'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['levelItem'] = levelItem;
    data['displayIcon'] = displayIcon;
    data['streamedVideo'] = streamedVideo;
    data['assetPath'] = assetPath;
    return data;
  }
}

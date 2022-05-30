class DevicesModel {
  late String id;
  late String deviceName;
  late String deviceType;
  late String deviceManufacutrer;
  late String deviceSerialNumber;
  late String devicePhysicalLocation;
  late String deviceOperatingStatus;
  late String deviceModel;
  late String deviceDepoartment;
  late String devicenPowerRequirements;
  late String deviceServiceRequirements;
  late String devicePurchaseSupplier;
  late String deviceMaintanenceProvider;
  late String deviceStockQuantities;
  late String devicePurchaseDate;
  late String devicePreventiveMaintanencedate;
  late String deviceInventoryPerformedDate;

  DevicesModel({
    this.id = '',
    this.deviceName = '',
    this.deviceType = '',
    this.deviceManufacutrer = '',
    this.deviceSerialNumber = '',
    this.devicePhysicalLocation = '',
    this.deviceOperatingStatus = '',
    this.deviceModel = '',
    this.deviceDepoartment = '',
    this.devicenPowerRequirements = '',
    this.deviceServiceRequirements = '',
    this.devicePurchaseSupplier = '',
    this.deviceMaintanenceProvider = '',
    this.deviceStockQuantities = '',
    this.devicePurchaseDate = '',
    this.devicePreventiveMaintanencedate = '',
    this.deviceInventoryPerformedDate = '',
  }) {}
  DevicesModel.fromJson(Map<String, dynamic>? json) {
    deviceName = json!["deviceName"];
    deviceType = json["deviceType"];
    deviceManufacutrer = json["deviceManufacutrer"];
    deviceSerialNumber = json["deviceSerialNumber"];
    devicePhysicalLocation = json["devicePhysicalLocation"];
    deviceOperatingStatus = json["deviceOperatingStatus"];
    deviceModel = json["deviceModel"];
    deviceDepoartment = json["deviceDepoartment"];
    devicenPowerRequirements = json["devicenPowerRequirements"];
    deviceServiceRequirements = json["deviceServiceRequirements"];
    devicePurchaseSupplier = json["devicePurchaseSupplier"];
    deviceMaintanenceProvider = json["deviceMaintanenceProvider"];
    deviceStockQuantities = json["deviceStockQuantities"];
    devicePurchaseDate = json["devicePurchaseDate"];
    devicePreventiveMaintanencedate = json["devicePreventiveMaintanencedate"];
    deviceInventoryPerformedDate = json["deviceInventoryPerformedDate"];
  }
  Map<String, dynamic> toMap() {
    return {
      'deviceName': deviceName,
      'deviceType': deviceType,
      'deviceManufacutrer': deviceManufacutrer,
      'deviceSerialNumber': deviceSerialNumber,
      'devicePhysicalLocation': devicePhysicalLocation,
      'deviceOperatingStatus': deviceOperatingStatus,
      'deviceModel': deviceModel,
      'deviceDepoartment': deviceDepoartment,
      'devicenPowerRequirements': devicenPowerRequirements,
      'deviceServiceRequirements': deviceServiceRequirements,
      'devicePurchaseSupplier': devicePurchaseSupplier,
      'deviceMaintanenceProvider': deviceMaintanenceProvider,
      'deviceStockQuantities': deviceStockQuantities,
      'devicePurchaseDate': devicePurchaseDate,
      'devicePreventiveMaintanencedate': devicePreventiveMaintanencedate,
      'deviceInventoryPerformedDate': deviceInventoryPerformedDate,
    };
  }
}

class MaintenanceModel {
  late String MaintenanceTyp;
  late String startMaintenanceDate;
  late String EndMaintenanceDate;
  late String id;
  late String worker;
  late String Note;
  MaintenanceModel({
    this.MaintenanceTyp = '',
    this.startMaintenanceDate = '',
    this.EndMaintenanceDate = '',
    this.id = '',
    this.worker = '',
    this.Note = '',
  });
  MaintenanceModel.fromJson(Map<String, dynamic>? json) {
    MaintenanceTyp = json!['MaintenanceTyp'];
    startMaintenanceDate = json['startMaintenanceDate'];
    EndMaintenanceDate = json['EndMaintenanceDate'];
    id = json['id'];
    worker = json['worker'];
    Note = json['Note'];
  }
  Map<String, dynamic> toMap() {
    return {
      'MaintenanceTyp': MaintenanceTyp,
      'startMaintenanceDate': startMaintenanceDate,
      'EndMaintenanceDate': EndMaintenanceDate,
      'id': id,
      'worker': worker,
      'Note': Note,
    };
  }
}

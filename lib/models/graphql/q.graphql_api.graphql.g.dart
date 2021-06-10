// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'q.graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateShipperUser$Mutation$UpdateShipperUser
    _$UpdateShipperUser$Mutation$UpdateShipperUserFromJson(
        Map<String, dynamic> json) {
  return UpdateShipperUser$Mutation$UpdateShipperUser()
    ..id = json['id'] as String;
}

Map<String, dynamic> _$UpdateShipperUser$Mutation$UpdateShipperUserToJson(
        UpdateShipperUser$Mutation$UpdateShipperUser instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateShipperUser$Mutation _$UpdateShipperUser$MutationFromJson(
    Map<String, dynamic> json) {
  return UpdateShipperUser$Mutation()
    ..updateShipperUser = json['updateShipperUser'] == null
        ? null
        : UpdateShipperUser$Mutation$UpdateShipperUser.fromJson(
            json['updateShipperUser'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateShipperUser$MutationToJson(
        UpdateShipperUser$Mutation instance) =>
    <String, dynamic>{
      'updateShipperUser': instance.updateShipperUser?.toJson(),
    };

SendOtp$Mutation _$SendOtp$MutationFromJson(Map<String, dynamic> json) {
  return SendOtp$Mutation()..result = json['result'] as String;
}

Map<String, dynamic> _$SendOtp$MutationToJson(SendOtp$Mutation instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

Notifications$Query$UserNotifications$Data$Data
    _$Notifications$Query$UserNotifications$Data$DataFromJson(
        Map<String, dynamic> json) {
  return Notifications$Query$UserNotifications$Data$Data()
    ..title = json['title'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$Notifications$Query$UserNotifications$Data$DataToJson(
        Notifications$Query$UserNotifications$Data$Data instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };

Notifications$Query$UserNotifications$Data
    _$Notifications$Query$UserNotifications$DataFromJson(
        Map<String, dynamic> json) {
  return Notifications$Query$UserNotifications$Data()
    ..id = json['id'] as String
    ..data = json['data'] == null
        ? null
        : Notifications$Query$UserNotifications$Data$Data.fromJson(
            json['data'] as Map<String, dynamic>)
    ..createdAt = json['created_at'] as String
    ..readAt = json['read_at'] as String;
}

Map<String, dynamic> _$Notifications$Query$UserNotifications$DataToJson(
        Notifications$Query$UserNotifications$Data instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data?.toJson(),
      'created_at': instance.createdAt,
      'read_at': instance.readAt,
    };

Notifications$Query$UserNotifications$PaginatorInfo
    _$Notifications$Query$UserNotifications$PaginatorInfoFromJson(
        Map<String, dynamic> json) {
  return Notifications$Query$UserNotifications$PaginatorInfo()
    ..currentPage = json['currentPage'] as int
    ..lastPage = json['lastPage'] as int
    ..perPage = json['perPage'] as int
    ..total = json['total'] as int
    ..count = json['count'] as int;
}

Map<String, dynamic>
    _$Notifications$Query$UserNotifications$PaginatorInfoToJson(
            Notifications$Query$UserNotifications$PaginatorInfo instance) =>
        <String, dynamic>{
          'currentPage': instance.currentPage,
          'lastPage': instance.lastPage,
          'perPage': instance.perPage,
          'total': instance.total,
          'count': instance.count,
        };

Notifications$Query$UserNotifications
    _$Notifications$Query$UserNotificationsFromJson(Map<String, dynamic> json) {
  return Notifications$Query$UserNotifications()
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Notifications$Query$UserNotifications$Data.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..paginatorInfo = json['paginatorInfo'] == null
        ? null
        : Notifications$Query$UserNotifications$PaginatorInfo.fromJson(
            json['paginatorInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Notifications$Query$UserNotificationsToJson(
        Notifications$Query$UserNotifications instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'paginatorInfo': instance.paginatorInfo?.toJson(),
    };

Notifications$Query _$Notifications$QueryFromJson(Map<String, dynamic> json) {
  return Notifications$Query()
    ..userNotifications = json['userNotifications'] == null
        ? null
        : Notifications$Query$UserNotifications.fromJson(
            json['userNotifications'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Notifications$QueryToJson(
        Notifications$Query instance) =>
    <String, dynamic>{
      'userNotifications': instance.userNotifications?.toJson(),
    };

NotificationSubsciption$Query$UserNotificationSubscriptions
    _$NotificationSubsciption$Query$UserNotificationSubscriptionsFromJson(
        Map<String, dynamic> json) {
  return NotificationSubsciption$Query$UserNotificationSubscriptions()
    ..channel = json['channel'] as String
    ..isSubscribed = json['is_subscribed'] as bool
    ..type = _$enumDecodeNullable(_$NotificationsTypeEnumEnumMap, json['type'],
        unknownValue: NotificationsTypeEnum.artemisUnknown);
}

Map<String, dynamic>
    _$NotificationSubsciption$Query$UserNotificationSubscriptionsToJson(
            NotificationSubsciption$Query$UserNotificationSubscriptions
                instance) =>
        <String, dynamic>{
          'channel': instance.channel,
          'is_subscribed': instance.isSubscribed,
          'type': _$NotificationsTypeEnumEnumMap[instance.type],
        };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$NotificationsTypeEnumEnumMap = {
  NotificationsTypeEnum.quoteRequested: 'QUOTE_REQUESTED',
  NotificationsTypeEnum.priceDefined: 'PRICE_DEFINED',
  NotificationsTypeEnum.priceAccepted: 'PRICE_ACCEPTED',
  NotificationsTypeEnum.carrierAcceptedOffer: 'CARRIER_ACCEPTED_OFFER',
  NotificationsTypeEnum.carrierAssigned: 'CARRIER_ASSIGNED',
  NotificationsTypeEnum.driverAssigned: 'DRIVER_ASSIGNED',
  NotificationsTypeEnum.shipmentDispatched: 'SHIPMENT_DISPATCHED',
  NotificationsTypeEnum.shipmentRejected: 'SHIPMENT_REJECTED',
  NotificationsTypeEnum.shipmentAtPickup: 'SHIPMENT_AT_PICKUP',
  NotificationsTypeEnum.shipmentInTransit: 'SHIPMENT_IN_TRANSIT',
  NotificationsTypeEnum.shipmentAtDropoff: 'SHIPMENT_AT_DROPOFF',
  NotificationsTypeEnum.shipmentDelivered: 'SHIPMENT_DELIVERED',
  NotificationsTypeEnum.shipmentFinished: 'SHIPMENT_FINISHED',
  NotificationsTypeEnum.shipmentCompleted: 'SHIPMENT_COMPLETED',
  NotificationsTypeEnum.companyDocumentVerificationRequested:
      'COMPANY_DOCUMENT_VERIFICATION_REQUESTED',
  NotificationsTypeEnum.paymentInProgress: 'PAYMENT_IN_PROGRESS',
  NotificationsTypeEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

NotificationSubsciption$Query _$NotificationSubsciption$QueryFromJson(
    Map<String, dynamic> json) {
  return NotificationSubsciption$Query()
    ..userNotificationSubscriptions =
        (json['userNotificationSubscriptions'] as List)
            ?.map((e) => e == null
                ? null
                : NotificationSubsciption$Query$UserNotificationSubscriptions
                    .fromJson(e as Map<String, dynamic>))
            ?.toList();
}

Map<String, dynamic> _$NotificationSubsciption$QueryToJson(
        NotificationSubsciption$Query instance) =>
    <String, dynamic>{
      'userNotificationSubscriptions': instance.userNotificationSubscriptions
          ?.map((e) => e?.toJson())
          ?.toList(),
    };

SubscribeNotification$Mutation _$SubscribeNotification$MutationFromJson(
    Map<String, dynamic> json) {
  return SubscribeNotification$Mutation()
    ..subscribeNotification = json['subscribeNotification'] as String;
}

Map<String, dynamic> _$SubscribeNotification$MutationToJson(
        SubscribeNotification$Mutation instance) =>
    <String, dynamic>{
      'subscribeNotification': instance.subscribeNotification,
    };

UnSubscribeNotification$Mutation _$UnSubscribeNotification$MutationFromJson(
    Map<String, dynamic> json) {
  return UnSubscribeNotification$Mutation()
    ..unSubscribeNotification = json['unSubscribeNotification'] as String;
}

Map<String, dynamic> _$UnSubscribeNotification$MutationToJson(
        UnSubscribeNotification$Mutation instance) =>
    <String, dynamic>{
      'unSubscribeNotification': instance.unSubscribeNotification,
    };

EditLocation$Mutation$EditLocation _$EditLocation$Mutation$EditLocationFromJson(
    Map<String, dynamic> json) {
  return EditLocation$Mutation$EditLocation()..id = json['id'] as String;
}

Map<String, dynamic> _$EditLocation$Mutation$EditLocationToJson(
        EditLocation$Mutation$EditLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

EditLocation$Mutation _$EditLocation$MutationFromJson(
    Map<String, dynamic> json) {
  return EditLocation$Mutation()
    ..editLocation = json['editLocation'] == null
        ? null
        : EditLocation$Mutation$EditLocation.fromJson(
            json['editLocation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EditLocation$MutationToJson(
        EditLocation$Mutation instance) =>
    <String, dynamic>{
      'editLocation': instance.editLocation?.toJson(),
    };

CoordinatesInput _$CoordinatesInputFromJson(Map<String, dynamic> json) {
  return CoordinatesInput(
    lat: (json['lat'] as num)?.toDouble(),
    lng: (json['lng'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CoordinatesInputToJson(CoordinatesInput instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

AddressInput _$AddressInputFromJson(Map<String, dynamic> json) {
  return AddressInput(
    full: json['full'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    street: json['street'] as String,
    streetNumber: json['street_number'] as int,
    placeId: json['place_id'] as String,
  );
}

Map<String, dynamic> _$AddressInputToJson(AddressInput instance) =>
    <String, dynamic>{
      'full': instance.full,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'street_number': instance.streetNumber,
      'place_id': instance.placeId,
    };

ContactInput _$ContactInputFromJson(Map<String, dynamic> json) {
  return ContactInput(
    contactName: json['contact_name'] as String,
    email: json['email'] as String,
    phoneNumber: json['phone_number'] as String,
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$ContactInputToJson(ContactInput instance) =>
    <String, dynamic>{
      'contact_name': instance.contactName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'notes': instance.notes,
    };

UpdateLocationProfileInput _$UpdateLocationProfileInputFromJson(
    Map<String, dynamic> json) {
  return UpdateLocationProfileInput(
    locationName: json['location_name'] as String,
    coordinates: json['coordinates'] == null
        ? null
        : CoordinatesInput.fromJson(
            json['coordinates'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : AddressInput.fromJson(json['address'] as Map<String, dynamic>),
    operationalContact: json['operational_contact'] == null
        ? null
        : ContactInput.fromJson(
            json['operational_contact'] as Map<String, dynamic>),
    schedulingContact: json['scheduling_contact'] == null
        ? null
        : ContactInput.fromJson(
            json['scheduling_contact'] as Map<String, dynamic>),
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$UpdateLocationProfileInputToJson(
        UpdateLocationProfileInput instance) =>
    <String, dynamic>{
      'location_name': instance.locationName,
      'coordinates': instance.coordinates?.toJson(),
      'address': instance.address?.toJson(),
      'operational_contact': instance.operationalContact?.toJson(),
      'scheduling_contact': instance.schedulingContact?.toJson(),
      'notes': instance.notes,
    };

UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier
    _$UserShipments$Query$UserShipments$Data$Offer$Bid$CarrierFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier()
    ..id = json['id'] as String
    ..name = json['name'] as String;
}

Map<String,
    dynamic> _$UserShipments$Query$UserShipments$Data$Offer$Bid$CarrierToJson(
        UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UserShipments$Query$UserShipments$Data$Offer$Bid
    _$UserShipments$Query$UserShipments$Data$Offer$BidFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Offer$Bid()
    ..type = _$enumDecodeNullable(_$BidTypeEnumEnumMap, json['type'],
        unknownValue: BidTypeEnum.artemisUnknown)
    ..cents = json['cents'] as String
    ..carrier = json['carrier'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier.fromJson(
            json['carrier'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipments$Query$UserShipments$Data$Offer$BidToJson(
        UserShipments$Query$UserShipments$Data$Offer$Bid instance) =>
    <String, dynamic>{
      'type': _$BidTypeEnumEnumMap[instance.type],
      'cents': instance.cents,
      'carrier': instance.carrier?.toJson(),
    };

const _$BidTypeEnumEnumMap = {
  BidTypeEnum.openPrice: 'OPEN_PRICE',
  BidTypeEnum.adminPrice: 'ADMIN_PRICE',
  BidTypeEnum.shipperPrice: 'SHIPPER_PRICE',
  BidTypeEnum.bid: 'BID',
  BidTypeEnum.accept: 'ACCEPT',
  BidTypeEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver
    _$UserShipments$Query$UserShipments$Data$Offer$Shipment$DriverFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver()
    ..firstname = json['firstname'] as String;
}

Map<String, dynamic>
    _$UserShipments$Query$UserShipments$Data$Offer$Shipment$DriverToJson(
            UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver
                instance) =>
        <String, dynamic>{
          'firstname': instance.firstname,
        };

UserShipments$Query$UserShipments$Data$Offer$Shipment
    _$UserShipments$Query$UserShipments$Data$Offer$ShipmentFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Offer$Shipment()
    ..carrierId = json['carrier_id'] as String
    ..driver = json['driver'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver.fromJson(
            json['driver'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$UserShipments$Query$UserShipments$Data$Offer$ShipmentToJson(
            UserShipments$Query$UserShipments$Data$Offer$Shipment instance) =>
        <String, dynamic>{
          'carrier_id': instance.carrierId,
          'driver': instance.driver?.toJson(),
        };

UserShipments$Query$UserShipments$Data$Offer
    _$UserShipments$Query$UserShipments$Data$OfferFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Offer()
    ..bid = (json['bid'] as List)
        ?.map((e) => e == null
            ? null
            : UserShipments$Query$UserShipments$Data$Offer$Bid.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..shipment = json['shipment'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Offer$Shipment.fromJson(
            json['shipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipments$Query$UserShipments$Data$OfferToJson(
        UserShipments$Query$UserShipments$Data$Offer instance) =>
    <String, dynamic>{
      'bid': instance.bid?.map((e) => e?.toJson())?.toList(),
      'shipment': instance.shipment?.toJson(),
    };

UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates
    _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$CoordinatesFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lng = (json['lng'] as num)?.toDouble();
}

Map<String, dynamic>
    _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$CoordinatesToJson(
            UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates
                instance) =>
        <String, dynamic>{
          'lat': instance.lat,
          'lng': instance.lng,
        };

UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address
    _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$AddressFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address()
    ..full = json['full'] as String
    ..city = json['city'] as String
    ..state = json['state'] as String
    ..street = json['street'] as String;
}

Map<String, dynamic>
    _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$AddressToJson(
            UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address
                instance) =>
        <String, dynamic>{
          'full': instance.full,
          'city': instance.city,
          'state': instance.state,
          'street': instance.street,
        };

UserShipments$Query$UserShipments$Data$Stops$LocationProfile
    _$UserShipments$Query$UserShipments$Data$Stops$LocationProfileFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Stops$LocationProfile()
    ..coordinates = json['coordinates'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates
            .fromJson(json['coordinates'] as Map<String, dynamic>)
    ..address = json['address'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address
            .fromJson(json['address'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$UserShipments$Query$UserShipments$Data$Stops$LocationProfileToJson(
            UserShipments$Query$UserShipments$Data$Stops$LocationProfile
                instance) =>
        <String, dynamic>{
          'coordinates': instance.coordinates?.toJson(),
          'address': instance.address?.toJson(),
        };

UserShipments$Query$UserShipments$Data$Stops
    _$UserShipments$Query$UserShipments$Data$StopsFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data$Stops()
    ..startTime = json['start_time'] as String
    ..endTime = json['end_time'] as String
    ..locationProfile = json['location_profile'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Stops$LocationProfile.fromJson(
            json['location_profile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipments$Query$UserShipments$Data$StopsToJson(
        UserShipments$Query$UserShipments$Data$Stops instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'location_profile': instance.locationProfile?.toJson(),
    };

UserShipments$Query$UserShipments$Data
    _$UserShipments$Query$UserShipments$DataFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$Data()
    ..id = json['id'] as String
    ..uuid = json['uuid'] as String
    ..state = _$enumDecodeNullable(_$ShipmentStatusEnumEnumMap, json['state'],
        unknownValue: ShipmentStatusEnum.artemisUnknown)
    ..shortName = json['short_name'] as String
    ..routeDistanceMiles = (json['route_distance_miles'] as num)?.toDouble()
    ..routeDurationMinutes = json['route_duration_minutes'] as int
    ..requestedTruckTypes = (json['requested_truck_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TruckTypesEnumEnumMap, e,
            unknownValue: TruckTypesEnum.artemisUnknown))
        ?.toList()
    ..offer = json['offer'] == null
        ? null
        : UserShipments$Query$UserShipments$Data$Offer.fromJson(
            json['offer'] as Map<String, dynamic>)
    ..stops = (json['stops'] as List)
        ?.map((e) => e == null
            ? null
            : UserShipments$Query$UserShipments$Data$Stops.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserShipments$Query$UserShipments$DataToJson(
        UserShipments$Query$UserShipments$Data instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'state': _$ShipmentStatusEnumEnumMap[instance.state],
      'short_name': instance.shortName,
      'route_distance_miles': instance.routeDistanceMiles,
      'route_duration_minutes': instance.routeDurationMinutes,
      'requested_truck_types': instance.requestedTruckTypes
          ?.map((e) => _$TruckTypesEnumEnumMap[e])
          ?.toList(),
      'offer': instance.offer?.toJson(),
      'stops': instance.stops?.map((e) => e?.toJson())?.toList(),
    };

const _$ShipmentStatusEnumEnumMap = {
  ShipmentStatusEnum.created: 'CREATED',
  ShipmentStatusEnum.requestInProgress: 'REQUEST_IN_PROGRESS',
  ShipmentStatusEnum.rejectedByShipper: 'REJECTED_BY_SHIPPER',
  ShipmentStatusEnum.priceDefined: 'PRICE_DEFINED',
  ShipmentStatusEnum.priceAccepted: 'PRICE_ACCEPTED',
  ShipmentStatusEnum.unassigned: 'UNASSIGNED',
  ShipmentStatusEnum.carrierAssigned: 'CARRIER_ASSIGNED',
  ShipmentStatusEnum.driverAssigned: 'DRIVER_ASSIGNED',
  ShipmentStatusEnum.dispatched: 'DISPATCHED',
  ShipmentStatusEnum.atPickup: 'AT_PICKUP',
  ShipmentStatusEnum.inTransit: 'IN_TRANSIT',
  ShipmentStatusEnum.atDelivery: 'AT_DELIVERY',
  ShipmentStatusEnum.delivered: 'DELIVERED',
  ShipmentStatusEnum.completed: 'COMPLETED',
  ShipmentStatusEnum.pending: 'PENDING',
  ShipmentStatusEnum.finished: 'FINISHED',
  ShipmentStatusEnum.paymentInProgress: 'PAYMENT_IN_PROGRESS',
  ShipmentStatusEnum.inProgress: 'IN_PROGRESS',
  ShipmentStatusEnum.alerts: 'ALERTS',
  ShipmentStatusEnum.exceptions: 'EXCEPTIONS',
  ShipmentStatusEnum.warnings: 'WARNINGS',
  ShipmentStatusEnum.all: 'ALL',
  ShipmentStatusEnum.archived: 'ARCHIVED',
  ShipmentStatusEnum.trash: 'TRASH',
  ShipmentStatusEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$TruckTypesEnumEnumMap = {
  TruckTypesEnum.dryVan: 'DRY_VAN',
  TruckTypesEnum.reefer: 'REEFER',
  TruckTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipments$Query$UserShipments$PaginatorInfo
    _$UserShipments$Query$UserShipments$PaginatorInfoFromJson(
        Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments$PaginatorInfo()
    ..count = json['count'] as int
    ..currentPage = json['currentPage'] as int
    ..hasMorePages = json['hasMorePages'] as bool
    ..firstItem = json['firstItem'] as int
    ..lastItem = json['lastItem'] as int
    ..lastPage = json['lastPage'] as int
    ..perPage = json['perPage'] as int
    ..total = json['total'] as int;
}

Map<String, dynamic> _$UserShipments$Query$UserShipments$PaginatorInfoToJson(
        UserShipments$Query$UserShipments$PaginatorInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'currentPage': instance.currentPage,
      'hasMorePages': instance.hasMorePages,
      'firstItem': instance.firstItem,
      'lastItem': instance.lastItem,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'total': instance.total,
    };

UserShipments$Query$UserShipments _$UserShipments$Query$UserShipmentsFromJson(
    Map<String, dynamic> json) {
  return UserShipments$Query$UserShipments()
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : UserShipments$Query$UserShipments$Data.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..paginatorInfo = json['paginatorInfo'] == null
        ? null
        : UserShipments$Query$UserShipments$PaginatorInfo.fromJson(
            json['paginatorInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipments$Query$UserShipmentsToJson(
        UserShipments$Query$UserShipments instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'paginatorInfo': instance.paginatorInfo?.toJson(),
    };

UserShipments$Query _$UserShipments$QueryFromJson(Map<String, dynamic> json) {
  return UserShipments$Query()
    ..userShipments = json['userShipments'] == null
        ? null
        : UserShipments$Query$UserShipments.fromJson(
            json['userShipments'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipments$QueryToJson(
        UserShipments$Query instance) =>
    <String, dynamic>{
      'userShipments': instance.userShipments?.toJson(),
    };

AddShipper$Mutation$AddShipperUser _$AddShipper$Mutation$AddShipperUserFromJson(
    Map<String, dynamic> json) {
  return AddShipper$Mutation$AddShipperUser()..id = json['id'] as String;
}

Map<String, dynamic> _$AddShipper$Mutation$AddShipperUserToJson(
        AddShipper$Mutation$AddShipperUser instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

AddShipper$Mutation _$AddShipper$MutationFromJson(Map<String, dynamic> json) {
  return AddShipper$Mutation()
    ..addShipperUser = (json['addShipperUser'] as List)
        ?.map((e) => e == null
            ? null
            : AddShipper$Mutation$AddShipperUser.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AddShipper$MutationToJson(
        AddShipper$Mutation instance) =>
    <String, dynamic>{
      'addShipperUser':
          instance.addShipperUser?.map((e) => e?.toJson())?.toList(),
    };

GetEstimation$Query$GetEstimations _$GetEstimation$Query$GetEstimationsFromJson(
    Map<String, dynamic> json) {
  return GetEstimation$Query$GetEstimations()
    ..routeDistanceMiles = (json['route_distance_miles'] as num)?.toDouble()
    ..routeDurationMinutes = json['route_duration_minutes'] as int;
}

Map<String, dynamic> _$GetEstimation$Query$GetEstimationsToJson(
        GetEstimation$Query$GetEstimations instance) =>
    <String, dynamic>{
      'route_distance_miles': instance.routeDistanceMiles,
      'route_duration_minutes': instance.routeDurationMinutes,
    };

GetEstimation$Query _$GetEstimation$QueryFromJson(Map<String, dynamic> json) {
  return GetEstimation$Query()
    ..getEstimations = json['getEstimations'] == null
        ? null
        : GetEstimation$Query$GetEstimations.fromJson(
            json['getEstimations'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetEstimation$QueryToJson(
        GetEstimation$Query instance) =>
    <String, dynamic>{
      'getEstimations': instance.getEstimations?.toJson(),
    };

LocationCollectionInput _$LocationCollectionInputFromJson(
    Map<String, dynamic> json) {
  return LocationCollectionInput(
    coordinates: json['coordinates'] == null
        ? null
        : CoordinatesInput.fromJson(
            json['coordinates'] as Map<String, dynamic>),
    placeId: json['place_id'] as String,
  );
}

Map<String, dynamic> _$LocationCollectionInputToJson(
        LocationCollectionInput instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates?.toJson(),
      'place_id': instance.placeId,
    };

UserLocations$Query$ShipperLocationProfiles$Data$Address
    _$UserLocations$Query$ShipperLocationProfiles$Data$AddressFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles$Data$Address()
    ..full = json['full'] as String
    ..city = json['city'] as String
    ..state = json['state'] as String;
}

Map<String,
    dynamic> _$UserLocations$Query$ShipperLocationProfiles$Data$AddressToJson(
        UserLocations$Query$ShipperLocationProfiles$Data$Address instance) =>
    <String, dynamic>{
      'full': instance.full,
      'city': instance.city,
      'state': instance.state,
    };

UserLocations$Query$ShipperLocationProfiles$Data$Coordinates
    _$UserLocations$Query$ShipperLocationProfiles$Data$CoordinatesFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles$Data$Coordinates()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lng = (json['lng'] as num)?.toDouble();
}

Map<String, dynamic>
    _$UserLocations$Query$ShipperLocationProfiles$Data$CoordinatesToJson(
            UserLocations$Query$ShipperLocationProfiles$Data$Coordinates
                instance) =>
        <String, dynamic>{
          'lat': instance.lat,
          'lng': instance.lng,
        };

UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact
    _$UserLocations$Query$ShipperLocationProfiles$Data$OperationalContactFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact()
    ..contactName = json['contact_name'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phone_number'] as String
    ..notes = json['notes'] as String;
}

Map<String, dynamic>
    _$UserLocations$Query$ShipperLocationProfiles$Data$OperationalContactToJson(
            UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact
                instance) =>
        <String, dynamic>{
          'contact_name': instance.contactName,
          'email': instance.email,
          'phone_number': instance.phoneNumber,
          'notes': instance.notes,
        };

UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact
    _$UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContactFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact()
    ..contactName = json['contact_name'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phone_number'] as String
    ..notes = json['notes'] as String;
}

Map<String, dynamic>
    _$UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContactToJson(
            UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact
                instance) =>
        <String, dynamic>{
          'contact_name': instance.contactName,
          'email': instance.email,
          'phone_number': instance.phoneNumber,
          'notes': instance.notes,
        };

UserLocations$Query$ShipperLocationProfiles$Data
    _$UserLocations$Query$ShipperLocationProfiles$DataFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles$Data()
    ..id = json['id'] as String
    ..shipperId = json['shipper_id'] as String
    ..locationName = json['location_name'] as String
    ..address = json['address'] == null
        ? null
        : UserLocations$Query$ShipperLocationProfiles$Data$Address.fromJson(
            json['address'] as Map<String, dynamic>)
    ..coordinates = json['coordinates'] == null
        ? null
        : UserLocations$Query$ShipperLocationProfiles$Data$Coordinates.fromJson(
            json['coordinates'] as Map<String, dynamic>)
    ..operationalContact = json['operational_contact'] == null
        ? null
        : UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact
            .fromJson(json['operational_contact'] as Map<String, dynamic>)
    ..schedulingContact = json['scheduling_contact'] == null
        ? null
        : UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact
            .fromJson(json['scheduling_contact'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserLocations$Query$ShipperLocationProfiles$DataToJson(
        UserLocations$Query$ShipperLocationProfiles$Data instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipper_id': instance.shipperId,
      'location_name': instance.locationName,
      'address': instance.address?.toJson(),
      'coordinates': instance.coordinates?.toJson(),
      'operational_contact': instance.operationalContact?.toJson(),
      'scheduling_contact': instance.schedulingContact?.toJson(),
    };

UserLocations$Query$ShipperLocationProfiles$PaginatorInfo
    _$UserLocations$Query$ShipperLocationProfiles$PaginatorInfoFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles$PaginatorInfo()
    ..count = json['count'] as int
    ..currentPage = json['currentPage'] as int
    ..hasMorePages = json['hasMorePages'] as bool
    ..firstItem = json['firstItem'] as int
    ..lastItem = json['lastItem'] as int
    ..lastPage = json['lastPage'] as int
    ..perPage = json['perPage'] as int
    ..total = json['total'] as int;
}

Map<String,
    dynamic> _$UserLocations$Query$ShipperLocationProfiles$PaginatorInfoToJson(
        UserLocations$Query$ShipperLocationProfiles$PaginatorInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'currentPage': instance.currentPage,
      'hasMorePages': instance.hasMorePages,
      'firstItem': instance.firstItem,
      'lastItem': instance.lastItem,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'total': instance.total,
    };

UserLocations$Query$ShipperLocationProfiles
    _$UserLocations$Query$ShipperLocationProfilesFromJson(
        Map<String, dynamic> json) {
  return UserLocations$Query$ShipperLocationProfiles()
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : UserLocations$Query$ShipperLocationProfiles$Data.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..paginatorInfo = json['paginatorInfo'] == null
        ? null
        : UserLocations$Query$ShipperLocationProfiles$PaginatorInfo.fromJson(
            json['paginatorInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserLocations$Query$ShipperLocationProfilesToJson(
        UserLocations$Query$ShipperLocationProfiles instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'paginatorInfo': instance.paginatorInfo?.toJson(),
    };

UserLocations$Query _$UserLocations$QueryFromJson(Map<String, dynamic> json) {
  return UserLocations$Query()
    ..shipperLocationProfiles = json['shipperLocationProfiles'] == null
        ? null
        : UserLocations$Query$ShipperLocationProfiles.fromJson(
            json['shipperLocationProfiles'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserLocations$QueryToJson(
        UserLocations$Query instance) =>
    <String, dynamic>{
      'shipperLocationProfiles': instance.shipperLocationProfiles?.toJson(),
    };

DeleteLocation$Mutation _$DeleteLocation$MutationFromJson(
    Map<String, dynamic> json) {
  return DeleteLocation$Mutation()
    ..deleteLocation = json['deleteLocation'] as String;
}

Map<String, dynamic> _$DeleteLocation$MutationToJson(
        DeleteLocation$Mutation instance) =>
    <String, dynamic>{
      'deleteLocation': instance.deleteLocation,
    };

SignIn$Mutation$VerifyPhone _$SignIn$Mutation$VerifyPhoneFromJson(
    Map<String, dynamic> json) {
  return SignIn$Mutation$VerifyPhone()
    ..accessToken = json['access_token'] as String
    ..expiresAt = json['expires_at'] as String;
}

Map<String, dynamic> _$SignIn$Mutation$VerifyPhoneToJson(
        SignIn$Mutation$VerifyPhone instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_at': instance.expiresAt,
    };

SignIn$Mutation _$SignIn$MutationFromJson(Map<String, dynamic> json) {
  return SignIn$Mutation()
    ..verifyPhone = json['verifyPhone'] == null
        ? null
        : SignIn$Mutation$VerifyPhone.fromJson(
            json['verifyPhone'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignIn$MutationToJson(SignIn$Mutation instance) =>
    <String, dynamic>{
      'verifyPhone': instance.verifyPhone?.toJson(),
    };

Me$Query$Me$Shipper$Address _$Me$Query$Me$Shipper$AddressFromJson(
    Map<String, dynamic> json) {
  return Me$Query$Me$Shipper$Address()
    ..address = json['address'] as String
    ..address2 = json['address2'] as String
    ..city = json['city'] as String
    ..state = json['state'] as String
    ..zipCode = json['zip_code'] as int;
}

Map<String, dynamic> _$Me$Query$Me$Shipper$AddressToJson(
        Me$Query$Me$Shipper$Address instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };

Me$Query$Me$Shipper$PrimaryContact _$Me$Query$Me$Shipper$PrimaryContactFromJson(
    Map<String, dynamic> json) {
  return Me$Query$Me$Shipper$PrimaryContact()
    ..fullname = json['fullname'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String;
}

Map<String, dynamic> _$Me$Query$Me$Shipper$PrimaryContactToJson(
        Me$Query$Me$Shipper$PrimaryContact instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
    };

Me$Query$Me$Shipper$BillingContact _$Me$Query$Me$Shipper$BillingContactFromJson(
    Map<String, dynamic> json) {
  return Me$Query$Me$Shipper$BillingContact()
    ..fullname = json['fullname'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String;
}

Map<String, dynamic> _$Me$Query$Me$Shipper$BillingContactToJson(
        Me$Query$Me$Shipper$BillingContact instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
    };

Me$Query$Me$Shipper$BillingAddress _$Me$Query$Me$Shipper$BillingAddressFromJson(
    Map<String, dynamic> json) {
  return Me$Query$Me$Shipper$BillingAddress()
    ..address = json['address'] as String
    ..address2 = json['address2'] as String
    ..city = json['city'] as String
    ..state = json['state'] as String
    ..zipCode = json['zip_code'] as int;
}

Map<String, dynamic> _$Me$Query$Me$Shipper$BillingAddressToJson(
        Me$Query$Me$Shipper$BillingAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };

Me$Query$Me$Shipper$Users$Meta _$Me$Query$Me$Shipper$Users$MetaFromJson(
    Map<String, dynamic> json) {
  return Me$Query$Me$Shipper$Users$Meta()
    ..miles = (json['miles'] as num)?.toDouble();
}

Map<String, dynamic> _$Me$Query$Me$Shipper$Users$MetaToJson(
        Me$Query$Me$Shipper$Users$Meta instance) =>
    <String, dynamic>{
      'miles': instance.miles,
    };

Me$Query$Me$Shipper$Users _$Me$Query$Me$Shipper$UsersFromJson(
    Map<String, dynamic> json) {
  return Me$Query$Me$Shipper$Users()
    ..id = json['id'] as String
    ..firstname = json['firstname'] as String
    ..lastname = json['lastname'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String
    ..role = _$enumDecodeNullable(_$UserRolesEnumEnumMap, json['role'],
        unknownValue: UserRolesEnum.artemisUnknown)
    ..meta = json['meta'] == null
        ? null
        : Me$Query$Me$Shipper$Users$Meta.fromJson(
            json['meta'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Me$Query$Me$Shipper$UsersToJson(
        Me$Query$Me$Shipper$Users instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'role': _$UserRolesEnumEnumMap[instance.role],
      'meta': instance.meta?.toJson(),
    };

const _$UserRolesEnumEnumMap = {
  UserRolesEnum.all: 'ALL',
  UserRolesEnum.carrierDriver: 'CARRIER_DRIVER',
  UserRolesEnum.carrierOwnerOperator: 'CARRIER_OWNER_OPERATOR',
  UserRolesEnum.carrierDispatchOffice: 'CARRIER_DISPATCH_OFFICE',
  UserRolesEnum.carrierDispatchDriver: 'CARRIER_DISPATCH_DRIVER',
  UserRolesEnum.shipper: 'SHIPPER',
  UserRolesEnum.shipperAssistant: 'SHIPPER_ASSISTANT',
  UserRolesEnum.admin: 'ADMIN',
  UserRolesEnum.adminAssistant: 'ADMIN_ASSISTANT',
  UserRolesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Me$Query$Me$Shipper _$Me$Query$Me$ShipperFromJson(Map<String, dynamic> json) {
  return Me$Query$Me$Shipper()
    ..id = json['id'] as String
    ..verified = json['verified'] as bool
    ..name = json['name'] as String
    ..tinEinNumber = json['tin_ein_number'] as String
    ..address = json['address'] == null
        ? null
        : Me$Query$Me$Shipper$Address.fromJson(
            json['address'] as Map<String, dynamic>)
    ..primaryContact = json['primary_contact'] == null
        ? null
        : Me$Query$Me$Shipper$PrimaryContact.fromJson(
            json['primary_contact'] as Map<String, dynamic>)
    ..billingContact = json['billing_contact'] == null
        ? null
        : Me$Query$Me$Shipper$BillingContact.fromJson(
            json['billing_contact'] as Map<String, dynamic>)
    ..billingAddress = json['billing_address'] == null
        ? null
        : Me$Query$Me$Shipper$BillingAddress.fromJson(
            json['billing_address'] as Map<String, dynamic>)
    ..users = (json['users'] as List)
        ?.map((e) => e == null
            ? null
            : Me$Query$Me$Shipper$Users.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Me$Query$Me$ShipperToJson(
        Me$Query$Me$Shipper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verified': instance.verified,
      'name': instance.name,
      'tin_ein_number': instance.tinEinNumber,
      'address': instance.address?.toJson(),
      'primary_contact': instance.primaryContact?.toJson(),
      'billing_contact': instance.billingContact?.toJson(),
      'billing_address': instance.billingAddress?.toJson(),
      'users': instance.users?.map((e) => e?.toJson())?.toList(),
    };

Me$Query$Me _$Me$Query$MeFromJson(Map<String, dynamic> json) {
  return Me$Query$Me()
    ..id = json['id'] as String
    ..companyId = json['company_id'] as String
    ..firstname = json['firstname'] as String
    ..lastname = json['lastname'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String
    ..role = _$enumDecodeNullable(_$UserRolesEnumEnumMap, json['role'],
        unknownValue: UserRolesEnum.artemisUnknown)
    ..type = json['type'] as String
    ..shipper = json['shipper'] == null
        ? null
        : Me$Query$Me$Shipper.fromJson(json['shipper'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Me$Query$MeToJson(Me$Query$Me instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'role': _$UserRolesEnumEnumMap[instance.role],
      'type': instance.type,
      'shipper': instance.shipper?.toJson(),
    };

Me$Query _$Me$QueryFromJson(Map<String, dynamic> json) {
  return Me$Query()
    ..me = json['me'] == null
        ? null
        : Me$Query$Me.fromJson(json['me'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Me$QueryToJson(Me$Query instance) => <String, dynamic>{
      'me': instance.me?.toJson(),
    };

MeShort$Query$Me$Shipper _$MeShort$Query$Me$ShipperFromJson(
    Map<String, dynamic> json) {
  return MeShort$Query$Me$Shipper()
    ..id = json['id'] as String
    ..verified = json['verified'] as bool
    ..name = json['name'] as String;
}

Map<String, dynamic> _$MeShort$Query$Me$ShipperToJson(
        MeShort$Query$Me$Shipper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verified': instance.verified,
      'name': instance.name,
    };

MeShort$Query$Me _$MeShort$Query$MeFromJson(Map<String, dynamic> json) {
  return MeShort$Query$Me()
    ..id = json['id'] as String
    ..firstname = json['firstname'] as String
    ..lastname = json['lastname'] as String
    ..role = _$enumDecodeNullable(_$UserRolesEnumEnumMap, json['role'],
        unknownValue: UserRolesEnum.artemisUnknown)
    ..type = json['type'] as String
    ..shipper = json['shipper'] == null
        ? null
        : MeShort$Query$Me$Shipper.fromJson(
            json['shipper'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MeShort$Query$MeToJson(MeShort$Query$Me instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'role': _$UserRolesEnumEnumMap[instance.role],
      'type': instance.type,
      'shipper': instance.shipper?.toJson(),
    };

MeShort$Query _$MeShort$QueryFromJson(Map<String, dynamic> json) {
  return MeShort$Query()
    ..me = json['me'] == null
        ? null
        : MeShort$Query$Me.fromJson(json['me'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MeShort$QueryToJson(MeShort$Query instance) =>
    <String, dynamic>{
      'me': instance.me?.toJson(),
    };

UserShipment$Query$UserShipment$Items$HandlingPiece
    _$UserShipment$Query$UserShipment$Items$HandlingPieceFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Items$HandlingPiece()
    ..pieceType = _$enumDecodeNullable(
        _$ItemPieceTypesEnumEnumMap, json['piece_type'],
        unknownValue: ItemPieceTypesEnum.artemisUnknown)
    ..pieceCount = json['piece_count'] as int;
}

Map<String, dynamic>
    _$UserShipment$Query$UserShipment$Items$HandlingPieceToJson(
            UserShipment$Query$UserShipment$Items$HandlingPiece instance) =>
        <String, dynamic>{
          'piece_type': _$ItemPieceTypesEnumEnumMap[instance.pieceType],
          'piece_count': instance.pieceCount,
        };

const _$ItemPieceTypesEnumEnumMap = {
  ItemPieceTypesEnum.pallets: 'PALLETS',
  ItemPieceTypesEnum.palletsOversize: 'PALLETS_OVERSIZE',
  ItemPieceTypesEnum.bags: 'BAGS',
  ItemPieceTypesEnum.bales: 'BALES',
  ItemPieceTypesEnum.boxes: 'BOXES',
  ItemPieceTypesEnum.bundles: 'BUNDLES',
  ItemPieceTypesEnum.containers: 'CONTAINERS',
  ItemPieceTypesEnum.crates: 'CRATES',
  ItemPieceTypesEnum.rolls: 'ROLLS',
  ItemPieceTypesEnum.totes: 'TOTES',
  ItemPieceTypesEnum.other: 'OTHER',
  ItemPieceTypesEnum.notPackage: 'NOT_PACKAGE',
  ItemPieceTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipment$Query$UserShipment$Items$Units
    _$UserShipment$Query$UserShipment$Items$UnitsFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Items$Units()
    ..unitType = _$enumDecodeNullable(
        _$ItemUnitTypesEnumEnumMap, json['unit_type'],
        unknownValue: ItemUnitTypesEnum.artemisUnknown)
    ..unitCount = json['unit_count'] as int;
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$Items$UnitsToJson(
        UserShipment$Query$UserShipment$Items$Units instance) =>
    <String, dynamic>{
      'unit_type': _$ItemUnitTypesEnumEnumMap[instance.unitType],
      'unit_count': instance.unitCount,
    };

const _$ItemUnitTypesEnumEnumMap = {
  ItemUnitTypesEnum.units: 'UNITS',
  ItemUnitTypesEnum.cases: 'CASES',
  ItemUnitTypesEnum.caseEquivalents: 'CASE_EQUIVALENTS',
  ItemUnitTypesEnum.kegs: 'KEGS',
  ItemUnitTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipment$Query$UserShipment$Items$Weight
    _$UserShipment$Query$UserShipment$Items$WeightFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Items$Weight()
    ..weight = json['weight'] as int
    ..weightUnit = _$enumDecodeNullable(
        _$WeightUnitTypesEnumEnumMap, json['weight_unit'],
        unknownValue: WeightUnitTypesEnum.artemisUnknown);
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$Items$WeightToJson(
        UserShipment$Query$UserShipment$Items$Weight instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'weight_unit': _$WeightUnitTypesEnumEnumMap[instance.weightUnit],
    };

const _$WeightUnitTypesEnumEnumMap = {
  WeightUnitTypesEnum.lb: 'LB',
  WeightUnitTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipment$Query$UserShipment$Items
    _$UserShipment$Query$UserShipment$ItemsFromJson(Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Items()
    ..id = json['id'] as String
    ..description = json['description'] as String
    ..handlingPiece = json['handling_piece'] == null
        ? null
        : UserShipment$Query$UserShipment$Items$HandlingPiece.fromJson(
            json['handling_piece'] as Map<String, dynamic>)
    ..units = json['units'] == null
        ? null
        : UserShipment$Query$UserShipment$Items$Units.fromJson(
            json['units'] as Map<String, dynamic>)
    ..weight = json['weight'] == null
        ? null
        : UserShipment$Query$UserShipment$Items$Weight.fromJson(
            json['weight'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$ItemsToJson(
        UserShipment$Query$UserShipment$Items instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'handling_piece': instance.handlingPiece?.toJson(),
      'units': instance.units?.toJson(),
      'weight': instance.weight?.toJson(),
    };

UserShipment$Query$UserShipment$Trailer
    _$UserShipment$Query$UserShipment$TrailerFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Trailer()
    ..temperatureMax = json['temperature_max'] as int
    ..temperatureMin = json['temperature_min'] as int
    ..temperatureUnit = _$enumDecodeNullable(
        _$TemperatureUnitsEnumEnumMap, json['temperature_unit'],
        unknownValue: TemperatureUnitsEnum.artemisUnknown);
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$TrailerToJson(
        UserShipment$Query$UserShipment$Trailer instance) =>
    <String, dynamic>{
      'temperature_max': instance.temperatureMax,
      'temperature_min': instance.temperatureMin,
      'temperature_unit':
          _$TemperatureUnitsEnumEnumMap[instance.temperatureUnit],
    };

const _$TemperatureUnitsEnumEnumMap = {
  TemperatureUnitsEnum.f: 'F',
  TemperatureUnitsEnum.c: 'C',
  TemperatureUnitsEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipment$Query$UserShipment$Offer$Bid
    _$UserShipment$Query$UserShipment$Offer$BidFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Offer$Bid()
    ..type = _$enumDecodeNullable(_$BidTypeEnumEnumMap, json['type'],
        unknownValue: BidTypeEnum.artemisUnknown)
    ..cents = json['cents'] as String;
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$Offer$BidToJson(
        UserShipment$Query$UserShipment$Offer$Bid instance) =>
    <String, dynamic>{
      'type': _$BidTypeEnumEnumMap[instance.type],
      'cents': instance.cents,
    };

UserShipment$Query$UserShipment$Offer
    _$UserShipment$Query$UserShipment$OfferFromJson(Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Offer()
    ..bid = (json['bid'] as List)
        ?.map((e) => e == null
            ? null
            : UserShipment$Query$UserShipment$Offer$Bid.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$OfferToJson(
        UserShipment$Query$UserShipment$Offer instance) =>
    <String, dynamic>{
      'bid': instance.bid?.map((e) => e?.toJson())?.toList(),
    };

UserShipment$Query$UserShipment$Stops$LocationProfile$Address
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$AddressFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Stops$LocationProfile$Address()
    ..full = json['full'] as String
    ..state = json['state'] as String
    ..city = json['city'] as String
    ..street = json['street'] as String
    ..streetNumber = json['street_number'] as int
    ..placeId = json['place_id'] as String;
}

Map<String, dynamic>
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$AddressToJson(
            UserShipment$Query$UserShipment$Stops$LocationProfile$Address
                instance) =>
        <String, dynamic>{
          'full': instance.full,
          'state': instance.state,
          'city': instance.city,
          'street': instance.street,
          'street_number': instance.streetNumber,
          'place_id': instance.placeId,
        };

UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$CoordinatesFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lng = (json['lng'] as num)?.toDouble();
}

Map<String, dynamic>
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$CoordinatesToJson(
            UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates
                instance) =>
        <String, dynamic>{
          'lat': instance.lat,
          'lng': instance.lng,
        };

UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContactFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact()
    ..contactName = json['contact_name'] as String
    ..phoneNumber = json['phone_number'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic>
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContactToJson(
            UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact
                instance) =>
        <String, dynamic>{
          'contact_name': instance.contactName,
          'phone_number': instance.phoneNumber,
          'email': instance.email,
        };

UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContactFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact()
    ..contactName = json['contact_name'] as String
    ..phoneNumber = json['phone_number'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic>
    _$UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContactToJson(
            UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact
                instance) =>
        <String, dynamic>{
          'contact_name': instance.contactName,
          'phone_number': instance.phoneNumber,
          'email': instance.email,
        };

UserShipment$Query$UserShipment$Stops$LocationProfile
    _$UserShipment$Query$UserShipment$Stops$LocationProfileFromJson(
        Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Stops$LocationProfile()
    ..address = json['address'] == null
        ? null
        : UserShipment$Query$UserShipment$Stops$LocationProfile$Address
            .fromJson(json['address'] as Map<String, dynamic>)
    ..coordinates = json['coordinates'] == null
        ? null
        : UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates
            .fromJson(json['coordinates'] as Map<String, dynamic>)
    ..schedulingContact = json['scheduling_contact'] == null
        ? null
        : UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact
            .fromJson(json['scheduling_contact'] as Map<String, dynamic>)
    ..operationalContact = json['operational_contact'] == null
        ? null
        : UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact
            .fromJson(json['operational_contact'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$UserShipment$Query$UserShipment$Stops$LocationProfileToJson(
            UserShipment$Query$UserShipment$Stops$LocationProfile instance) =>
        <String, dynamic>{
          'address': instance.address?.toJson(),
          'coordinates': instance.coordinates?.toJson(),
          'scheduling_contact': instance.schedulingContact?.toJson(),
          'operational_contact': instance.operationalContact?.toJson(),
        };

UserShipment$Query$UserShipment$Stops
    _$UserShipment$Query$UserShipment$StopsFromJson(Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment$Stops()
    ..id = json['id'] as String
    ..locationProfileId = json['location_profile_id'] as String
    ..type = _$enumDecodeNullable(_$StopTypesEnumEnumMap, json['type'],
        unknownValue: StopTypesEnum.artemisUnknown)
    ..appointmentType = _$enumDecodeNullable(
        _$AppointmentTypesEnumEnumMap, json['appointment_type'],
        unknownValue: AppointmentTypesEnum.artemisUnknown)
    ..startTime = json['start_time'] as String
    ..endTime = json['end_time'] as String
    ..locationProfile = json['location_profile'] == null
        ? null
        : UserShipment$Query$UserShipment$Stops$LocationProfile.fromJson(
            json['location_profile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipment$Query$UserShipment$StopsToJson(
        UserShipment$Query$UserShipment$Stops instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_profile_id': instance.locationProfileId,
      'type': _$StopTypesEnumEnumMap[instance.type],
      'appointment_type':
          _$AppointmentTypesEnumEnumMap[instance.appointmentType],
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'location_profile': instance.locationProfile?.toJson(),
    };

const _$StopTypesEnumEnumMap = {
  StopTypesEnum.pickup: 'PICKUP',
  StopTypesEnum.kw$RETURN: 'RETURN',
  StopTypesEnum.dropoff: 'DROPOFF',
  StopTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$AppointmentTypesEnumEnumMap = {
  AppointmentTypesEnum.firstComeFirstTake: 'FIRST_COME_FIRST_TAKE',
  AppointmentTypesEnum.alreadyMade: 'ALREADY_MADE',
  AppointmentTypesEnum.toBeMade: 'TO_BE_MADE',
  AppointmentTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipment$Query$UserShipment _$UserShipment$Query$UserShipmentFromJson(
    Map<String, dynamic> json) {
  return UserShipment$Query$UserShipment()
    ..uuid = json['uuid'] as String
    ..shortName = json['short_name'] as String
    ..shipperId = json['shipper_id'] as String
    ..driverId = json['driver_id'] as String
    ..carrierId = json['carrier_id'] as String
    ..state = _$enumDecodeNullable(_$ShipmentStatusEnumEnumMap, json['state'],
        unknownValue: ShipmentStatusEnum.artemisUnknown)
    ..items = (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : UserShipment$Query$UserShipment$Items.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..requestedTruckTypes = (json['requested_truck_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TruckTypesEnumEnumMap, e,
            unknownValue: TruckTypesEnum.artemisUnknown))
        ?.toList()
    ..trailer = json['trailer'] == null
        ? null
        : UserShipment$Query$UserShipment$Trailer.fromJson(
            json['trailer'] as Map<String, dynamic>)
    ..routeDistanceMiles = (json['route_distance_miles'] as num)?.toDouble()
    ..routeDurationMinutes = json['route_duration_minutes'] as int
    ..loadDescription = json['load_description'] as String
    ..accessorials = (json['accessorials'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AccessorialsEnumEnumMap, e,
            unknownValue: AccessorialsEnum.artemisUnknown))
        ?.toList()
    ..offer = json['offer'] == null
        ? null
        : UserShipment$Query$UserShipment$Offer.fromJson(
            json['offer'] as Map<String, dynamic>)
    ..stops = (json['stops'] as List)
        ?.map((e) => e == null
            ? null
            : UserShipment$Query$UserShipment$Stops.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserShipment$Query$UserShipmentToJson(
        UserShipment$Query$UserShipment instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'short_name': instance.shortName,
      'shipper_id': instance.shipperId,
      'driver_id': instance.driverId,
      'carrier_id': instance.carrierId,
      'state': _$ShipmentStatusEnumEnumMap[instance.state],
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'requested_truck_types': instance.requestedTruckTypes
          ?.map((e) => _$TruckTypesEnumEnumMap[e])
          ?.toList(),
      'trailer': instance.trailer?.toJson(),
      'route_distance_miles': instance.routeDistanceMiles,
      'route_duration_minutes': instance.routeDurationMinutes,
      'load_description': instance.loadDescription,
      'accessorials': instance.accessorials
          ?.map((e) => _$AccessorialsEnumEnumMap[e])
          ?.toList(),
      'offer': instance.offer?.toJson(),
      'stops': instance.stops?.map((e) => e?.toJson())?.toList(),
    };

const _$AccessorialsEnumEnumMap = {
  AccessorialsEnum.driverAssist: 'DRIVER_ASSIST',
  AccessorialsEnum.foodGradeTrailer: 'FOOD_GRADE_TRAILER',
  AccessorialsEnum.loadBarsLoadLocks: 'LOAD_BARS_LOAD_LOCKS',
  AccessorialsEnum.pipeStakes: 'PIPE_STAKES',
  AccessorialsEnum.ppe: 'PPE',
  AccessorialsEnum.straps: 'STRAPS',
  AccessorialsEnum.twicRequired: 'TWIC_REQUIRED',
  AccessorialsEnum.foodGrade: 'FOOD_GRADE',
  AccessorialsEnum.trailer10YearsOrNewer: 'TRAILER_10_YEARS_OR_NEWER',
  AccessorialsEnum.loadBars: 'LOAD_BARS',
  AccessorialsEnum.shipperRequiresMaskGloves: 'SHIPPER_REQUIRES_MASK_GLOVES',
  AccessorialsEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

UserShipment$Query _$UserShipment$QueryFromJson(Map<String, dynamic> json) {
  return UserShipment$Query()
    ..userShipment = json['userShipment'] == null
        ? null
        : UserShipment$Query$UserShipment.fromJson(
            json['userShipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserShipment$QueryToJson(UserShipment$Query instance) =>
    <String, dynamic>{
      'userShipment': instance.userShipment?.toJson(),
    };

Offers$Query$Offers$Data$Shipment _$Offers$Query$Offers$Data$ShipmentFromJson(
    Map<String, dynamic> json) {
  return Offers$Query$Offers$Data$Shipment()..id = json['id'] as String;
}

Map<String, dynamic> _$Offers$Query$Offers$Data$ShipmentToJson(
        Offers$Query$Offers$Data$Shipment instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Offers$Query$Offers$Data _$Offers$Query$Offers$DataFromJson(
    Map<String, dynamic> json) {
  return Offers$Query$Offers$Data()
    ..id = json['id'] as String
    ..shipment = json['shipment'] == null
        ? null
        : Offers$Query$Offers$Data$Shipment.fromJson(
            json['shipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offers$Query$Offers$DataToJson(
        Offers$Query$Offers$Data instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipment': instance.shipment?.toJson(),
    };

Offers$Query$Offers$PaginatorInfo _$Offers$Query$Offers$PaginatorInfoFromJson(
    Map<String, dynamic> json) {
  return Offers$Query$Offers$PaginatorInfo()
    ..currentPage = json['currentPage'] as int
    ..lastPage = json['lastPage'] as int
    ..perPage = json['perPage'] as int
    ..total = json['total'] as int
    ..count = json['count'] as int;
}

Map<String, dynamic> _$Offers$Query$Offers$PaginatorInfoToJson(
        Offers$Query$Offers$PaginatorInfo instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'total': instance.total,
      'count': instance.count,
    };

Offers$Query$Offers _$Offers$Query$OffersFromJson(Map<String, dynamic> json) {
  return Offers$Query$Offers()
    ..data = (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Offers$Query$Offers$Data.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..paginatorInfo = json['paginatorInfo'] == null
        ? null
        : Offers$Query$Offers$PaginatorInfo.fromJson(
            json['paginatorInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offers$Query$OffersToJson(
        Offers$Query$Offers instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'paginatorInfo': instance.paginatorInfo?.toJson(),
    };

Offers$Query _$Offers$QueryFromJson(Map<String, dynamic> json) {
  return Offers$Query()
    ..offers = json['offers'] == null
        ? null
        : Offers$Query$Offers.fromJson(json['offers'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offers$QueryToJson(Offers$Query instance) =>
    <String, dynamic>{
      'offers': instance.offers?.toJson(),
    };

DeleteShipper$Mutation _$DeleteShipper$MutationFromJson(
    Map<String, dynamic> json) {
  return DeleteShipper$Mutation()
    ..deleteShipperUser = json['deleteShipperUser'] as String;
}

Map<String, dynamic> _$DeleteShipper$MutationToJson(
        DeleteShipper$Mutation instance) =>
    <String, dynamic>{
      'deleteShipperUser': instance.deleteShipperUser,
    };

GetQuote$Mutation$RequestShipmentQuote
    _$GetQuote$Mutation$RequestShipmentQuoteFromJson(
        Map<String, dynamic> json) {
  return GetQuote$Mutation$RequestShipmentQuote()..id = json['id'] as String;
}

Map<String, dynamic> _$GetQuote$Mutation$RequestShipmentQuoteToJson(
        GetQuote$Mutation$RequestShipmentQuote instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetQuote$Mutation _$GetQuote$MutationFromJson(Map<String, dynamic> json) {
  return GetQuote$Mutation()
    ..requestShipmentQuote = json['requestShipmentQuote'] == null
        ? null
        : GetQuote$Mutation$RequestShipmentQuote.fromJson(
            json['requestShipmentQuote'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetQuote$MutationToJson(GetQuote$Mutation instance) =>
    <String, dynamic>{
      'requestShipmentQuote': instance.requestShipmentQuote?.toJson(),
    };

ShipperVerify$Mutation _$ShipperVerify$MutationFromJson(
    Map<String, dynamic> json) {
  return ShipperVerify$Mutation()
    ..requestShipperDocumentVerification =
        json['requestShipperDocumentVerification'] as String;
}

Map<String, dynamic> _$ShipperVerify$MutationToJson(
        ShipperVerify$Mutation instance) =>
    <String, dynamic>{
      'requestShipperDocumentVerification':
          instance.requestShipperDocumentVerification,
    };

SignUp$Mutation$CreateShipperUser _$SignUp$Mutation$CreateShipperUserFromJson(
    Map<String, dynamic> json) {
  return SignUp$Mutation$CreateShipperUser()..id = json['id'] as String;
}

Map<String, dynamic> _$SignUp$Mutation$CreateShipperUserToJson(
        SignUp$Mutation$CreateShipperUser instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SignUp$Mutation _$SignUp$MutationFromJson(Map<String, dynamic> json) {
  return SignUp$Mutation()
    ..createShipperUser = json['createShipperUser'] == null
        ? null
        : SignUp$Mutation$CreateShipperUser.fromJson(
            json['createShipperUser'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SignUp$MutationToJson(SignUp$Mutation instance) =>
    <String, dynamic>{
      'createShipperUser': instance.createShipperUser?.toJson(),
    };

AddLocation$Mutation$AddLocation _$AddLocation$Mutation$AddLocationFromJson(
    Map<String, dynamic> json) {
  return AddLocation$Mutation$AddLocation()..id = json['id'] as String;
}

Map<String, dynamic> _$AddLocation$Mutation$AddLocationToJson(
        AddLocation$Mutation$AddLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

AddLocation$Mutation _$AddLocation$MutationFromJson(Map<String, dynamic> json) {
  return AddLocation$Mutation()
    ..addLocation = json['addLocation'] == null
        ? null
        : AddLocation$Mutation$AddLocation.fromJson(
            json['addLocation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AddLocation$MutationToJson(
        AddLocation$Mutation instance) =>
    <String, dynamic>{
      'addLocation': instance.addLocation?.toJson(),
    };

CreateLocationProfileInput _$CreateLocationProfileInputFromJson(
    Map<String, dynamic> json) {
  return CreateLocationProfileInput(
    locationName: json['location_name'] as String,
    coordinates: json['coordinates'] == null
        ? null
        : CoordinatesInput.fromJson(
            json['coordinates'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : AddressInput.fromJson(json['address'] as Map<String, dynamic>),
    operationalContact: json['operational_contact'] == null
        ? null
        : ContactInput.fromJson(
            json['operational_contact'] as Map<String, dynamic>),
    schedulingContact: json['scheduling_contact'] == null
        ? null
        : ContactInput.fromJson(
            json['scheduling_contact'] as Map<String, dynamic>),
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$CreateLocationProfileInputToJson(
        CreateLocationProfileInput instance) =>
    <String, dynamic>{
      'location_name': instance.locationName,
      'coordinates': instance.coordinates?.toJson(),
      'address': instance.address?.toJson(),
      'operational_contact': instance.operationalContact?.toJson(),
      'scheduling_contact': instance.schedulingContact?.toJson(),
      'notes': instance.notes,
    };

UpdateShipper$Mutation$UpdateShipper
    _$UpdateShipper$Mutation$UpdateShipperFromJson(Map<String, dynamic> json) {
  return UpdateShipper$Mutation$UpdateShipper()..id = json['id'] as String;
}

Map<String, dynamic> _$UpdateShipper$Mutation$UpdateShipperToJson(
        UpdateShipper$Mutation$UpdateShipper instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateShipper$Mutation _$UpdateShipper$MutationFromJson(
    Map<String, dynamic> json) {
  return UpdateShipper$Mutation()
    ..updateShipper = json['updateShipper'] == null
        ? null
        : UpdateShipper$Mutation$UpdateShipper.fromJson(
            json['updateShipper'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateShipper$MutationToJson(
        UpdateShipper$Mutation instance) =>
    <String, dynamic>{
      'updateShipper': instance.updateShipper?.toJson(),
    };

UpdateShipperInput _$UpdateShipperInputFromJson(Map<String, dynamic> json) {
  return UpdateShipperInput(
    address: json['address'] == null
        ? null
        : ShipperAddressInput.fromJson(json['address'] as Map<String, dynamic>),
    billingAddress: json['billing_address'] == null
        ? null
        : BillingAddressInput.fromJson(
            json['billing_address'] as Map<String, dynamic>),
    primaryContact: json['primary_contact'] == null
        ? null
        : PrimaryContactInput.fromJson(
            json['primary_contact'] as Map<String, dynamic>),
    billingContact: json['billing_contact'] == null
        ? null
        : BillingContactInput.fromJson(
            json['billing_contact'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateShipperInputToJson(UpdateShipperInput instance) =>
    <String, dynamic>{
      'address': instance.address?.toJson(),
      'billing_address': instance.billingAddress?.toJson(),
      'primary_contact': instance.primaryContact?.toJson(),
      'billing_contact': instance.billingContact?.toJson(),
    };

ShipperAddressInput _$ShipperAddressInputFromJson(Map<String, dynamic> json) {
  return ShipperAddressInput(
    address: json['address'] as String,
    address2: json['address2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zip_code'] as int,
  );
}

Map<String, dynamic> _$ShipperAddressInputToJson(
        ShipperAddressInput instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };

BillingAddressInput _$BillingAddressInputFromJson(Map<String, dynamic> json) {
  return BillingAddressInput(
    address: json['address'] as String,
    address2: json['address2'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zip_code'] as int,
  );
}

Map<String, dynamic> _$BillingAddressInputToJson(
        BillingAddressInput instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };

PrimaryContactInput _$PrimaryContactInputFromJson(Map<String, dynamic> json) {
  return PrimaryContactInput(
    fullname: json['fullname'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$PrimaryContactInputToJson(
        PrimaryContactInput instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
    };

BillingContactInput _$BillingContactInputFromJson(Map<String, dynamic> json) {
  return BillingContactInput(
    fullname: json['fullname'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$BillingContactInputToJson(
        BillingContactInput instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
    };

Offer$Query$Offer$Bid$Carrier$Contact
    _$Offer$Query$Offer$Bid$Carrier$ContactFromJson(Map<String, dynamic> json) {
  return Offer$Query$Offer$Bid$Carrier$Contact()
    ..phone = json['phone'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Bid$Carrier$ContactToJson(
        Offer$Query$Offer$Bid$Carrier$Contact instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };

Offer$Query$Offer$Bid$Carrier _$Offer$Query$Offer$Bid$CarrierFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Bid$Carrier()
    ..id = json['id'] as String
    ..verified = json['verified'] as bool
    ..name = json['name'] as String
    ..mcDotNumber = json['mc_dot_number'] as String
    ..contact = json['contact'] == null
        ? null
        : Offer$Query$Offer$Bid$Carrier$Contact.fromJson(
            json['contact'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$Query$Offer$Bid$CarrierToJson(
        Offer$Query$Offer$Bid$Carrier instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verified': instance.verified,
      'name': instance.name,
      'mc_dot_number': instance.mcDotNumber,
      'contact': instance.contact?.toJson(),
    };

Offer$Query$Offer$Bid _$Offer$Query$Offer$BidFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Bid()
    ..type = _$enumDecodeNullable(_$BidTypeEnumEnumMap, json['type'],
        unknownValue: BidTypeEnum.artemisUnknown)
    ..cents = json['cents'] as String
    ..carrierId = json['carrier_id'] as String
    ..carrier = json['carrier'] == null
        ? null
        : Offer$Query$Offer$Bid$Carrier.fromJson(
            json['carrier'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$Query$Offer$BidToJson(
        Offer$Query$Offer$Bid instance) =>
    <String, dynamic>{
      'type': _$BidTypeEnumEnumMap[instance.type],
      'cents': instance.cents,
      'carrier_id': instance.carrierId,
      'carrier': instance.carrier?.toJson(),
    };

Offer$Query$Offer$Shipment$Shipper$Address
    _$Offer$Query$Offer$Shipment$Shipper$AddressFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Shipper$Address()
    ..address = json['address'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Shipper$AddressToJson(
        Offer$Query$Offer$Shipment$Shipper$Address instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

Offer$Query$Offer$Shipment$Shipper$PrimaryContact
    _$Offer$Query$Offer$Shipment$Shipper$PrimaryContactFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Shipper$PrimaryContact()
    ..fullname = json['fullname'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Shipper$PrimaryContactToJson(
        Offer$Query$Offer$Shipment$Shipper$PrimaryContact instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
    };

Offer$Query$Offer$Shipment$Shipper _$Offer$Query$Offer$Shipment$ShipperFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Shipper()
    ..name = json['name'] as String
    ..tinEinNumber = json['tin_ein_number'] as String
    ..verified = json['verified'] as bool
    ..address = json['address'] == null
        ? null
        : Offer$Query$Offer$Shipment$Shipper$Address.fromJson(
            json['address'] as Map<String, dynamic>)
    ..primaryContact = json['primary_contact'] == null
        ? null
        : Offer$Query$Offer$Shipment$Shipper$PrimaryContact.fromJson(
            json['primary_contact'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$ShipperToJson(
        Offer$Query$Offer$Shipment$Shipper instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tin_ein_number': instance.tinEinNumber,
      'verified': instance.verified,
      'address': instance.address?.toJson(),
      'primary_contact': instance.primaryContact?.toJson(),
    };

Offer$Query$Offer$Shipment$Driver _$Offer$Query$Offer$Shipment$DriverFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Driver()
    ..id = json['id'] as String
    ..firstname = json['firstname'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$DriverToJson(
        Offer$Query$Offer$Shipment$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
    };

Offer$Query$Offer$Shipment$Path$Coordinates
    _$Offer$Query$Offer$Shipment$Path$CoordinatesFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Path$Coordinates()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lng = (json['lng'] as num)?.toDouble();
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Path$CoordinatesToJson(
        Offer$Query$Offer$Shipment$Path$Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Offer$Query$Offer$Shipment$Path _$Offer$Query$Offer$Shipment$PathFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Path()
    ..id = json['id'] as String
    ..orderIndex = json['order_index'] as int
    ..coordinates = json['coordinates'] == null
        ? null
        : Offer$Query$Offer$Shipment$Path$Coordinates.fromJson(
            json['coordinates'] as Map<String, dynamic>)
    ..createdAt = json['created_at'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$PathToJson(
        Offer$Query$Offer$Shipment$Path instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_index': instance.orderIndex,
      'coordinates': instance.coordinates?.toJson(),
      'created_at': instance.createdAt,
    };

Offer$Query$Offer$Shipment$Rate _$Offer$Query$Offer$Shipment$RateFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Rate()
    ..id = json['id'] as String
    ..rate = json['rate'] as int
    ..comment = json['comment'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$RateToJson(
        Offer$Query$Offer$Shipment$Rate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'comment': instance.comment,
    };

Offer$Query$Offer$Shipment$Trailer _$Offer$Query$Offer$Shipment$TrailerFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Trailer()
    ..temperatureMax = json['temperature_max'] as int
    ..temperatureMin = json['temperature_min'] as int
    ..temperatureUnit = _$enumDecodeNullable(
        _$TemperatureUnitsEnumEnumMap, json['temperature_unit'],
        unknownValue: TemperatureUnitsEnum.artemisUnknown);
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$TrailerToJson(
        Offer$Query$Offer$Shipment$Trailer instance) =>
    <String, dynamic>{
      'temperature_max': instance.temperatureMax,
      'temperature_min': instance.temperatureMin,
      'temperature_unit':
          _$TemperatureUnitsEnumEnumMap[instance.temperatureUnit],
    };

Offer$Query$Offer$Shipment$Items$HandlingPiece
    _$Offer$Query$Offer$Shipment$Items$HandlingPieceFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Items$HandlingPiece()
    ..pieceType = _$enumDecodeNullable(
        _$ItemPieceTypesEnumEnumMap, json['piece_type'],
        unknownValue: ItemPieceTypesEnum.artemisUnknown)
    ..pieceCount = json['piece_count'] as int;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Items$HandlingPieceToJson(
        Offer$Query$Offer$Shipment$Items$HandlingPiece instance) =>
    <String, dynamic>{
      'piece_type': _$ItemPieceTypesEnumEnumMap[instance.pieceType],
      'piece_count': instance.pieceCount,
    };

Offer$Query$Offer$Shipment$Items$Units
    _$Offer$Query$Offer$Shipment$Items$UnitsFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Items$Units()
    ..unitType = _$enumDecodeNullable(
        _$ItemUnitTypesEnumEnumMap, json['unit_type'],
        unknownValue: ItemUnitTypesEnum.artemisUnknown)
    ..unitCount = json['unit_count'] as int;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Items$UnitsToJson(
        Offer$Query$Offer$Shipment$Items$Units instance) =>
    <String, dynamic>{
      'unit_type': _$ItemUnitTypesEnumEnumMap[instance.unitType],
      'unit_count': instance.unitCount,
    };

Offer$Query$Offer$Shipment$Items$Weight
    _$Offer$Query$Offer$Shipment$Items$WeightFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Items$Weight()
    ..weight = json['weight'] as int
    ..weightUnit = _$enumDecodeNullable(
        _$WeightUnitTypesEnumEnumMap, json['weight_unit'],
        unknownValue: WeightUnitTypesEnum.artemisUnknown);
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Items$WeightToJson(
        Offer$Query$Offer$Shipment$Items$Weight instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'weight_unit': _$WeightUnitTypesEnumEnumMap[instance.weightUnit],
    };

Offer$Query$Offer$Shipment$Items _$Offer$Query$Offer$Shipment$ItemsFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Items()
    ..id = json['id'] as String
    ..handlingPiece = json['handling_piece'] == null
        ? null
        : Offer$Query$Offer$Shipment$Items$HandlingPiece.fromJson(
            json['handling_piece'] as Map<String, dynamic>)
    ..units = json['units'] == null
        ? null
        : Offer$Query$Offer$Shipment$Items$Units.fromJson(
            json['units'] as Map<String, dynamic>)
    ..weight = json['weight'] == null
        ? null
        : Offer$Query$Offer$Shipment$Items$Weight.fromJson(
            json['weight'] as Map<String, dynamic>)
    ..description = json['description'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$ItemsToJson(
        Offer$Query$Offer$Shipment$Items instance) =>
    <String, dynamic>{
      'id': instance.id,
      'handling_piece': instance.handlingPiece?.toJson(),
      'units': instance.units?.toJson(),
      'weight': instance.weight?.toJson(),
      'description': instance.description,
    };

Offer$Query$Offer$Shipment$Documents
    _$Offer$Query$Offer$Shipment$DocumentsFromJson(Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Documents()
    ..id = json['id'] as String
    ..stopId = json['stop_id'] as String
    ..shipmentUuid = json['shipment_uuid'] as String
    ..carrierId = json['carrier_id'] as String
    ..userId = json['user_id'] as String
    ..url = json['url'] as String
    ..name = json['name'] as String
    ..fileType = json['file_type'] as String
    ..mimeType = json['mime_type'] as String
    ..approved = json['approved'] as bool
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$DocumentsToJson(
        Offer$Query$Offer$Shipment$Documents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stop_id': instance.stopId,
      'shipment_uuid': instance.shipmentUuid,
      'carrier_id': instance.carrierId,
      'user_id': instance.userId,
      'url': instance.url,
      'name': instance.name,
      'file_type': instance.fileType,
      'mime_type': instance.mimeType,
      'approved': instance.approved,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$CoordinatesFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates()
    ..lat = (json['lat'] as num)?.toDouble()
    ..lng = (json['lng'] as num)?.toDouble();
}

Map<String, dynamic>
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$CoordinatesToJson(
            Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates
                instance) =>
        <String, dynamic>{
          'lat': instance.lat,
          'lng': instance.lng,
        };

Offer$Query$Offer$Shipment$Stops$LocationProfile$Address
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$AddressFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Stops$LocationProfile$Address()
    ..full = json['full'] as String
    ..city = json['city'] as String
    ..state = json['state'] as String
    ..street = json['street'] as String
    ..streetNumber = json['street_number'] as int
    ..placeId = json['place_id'] as String;
}

Map<String,
    dynamic> _$Offer$Query$Offer$Shipment$Stops$LocationProfile$AddressToJson(
        Offer$Query$Offer$Shipment$Stops$LocationProfile$Address instance) =>
    <String, dynamic>{
      'full': instance.full,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'street_number': instance.streetNumber,
      'place_id': instance.placeId,
    };

Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContactFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact()
    ..contactName = json['contact_name'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phone_number'] as String
    ..notes = json['notes'] as String;
}

Map<String, dynamic>
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContactToJson(
            Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact
                instance) =>
        <String, dynamic>{
          'contact_name': instance.contactName,
          'email': instance.email,
          'phone_number': instance.phoneNumber,
          'notes': instance.notes,
        };

Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContactFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact()
    ..contactName = json['contact_name'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phone_number'] as String
    ..notes = json['notes'] as String;
}

Map<String, dynamic>
    _$Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContactToJson(
            Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact
                instance) =>
        <String, dynamic>{
          'contact_name': instance.contactName,
          'email': instance.email,
          'phone_number': instance.phoneNumber,
          'notes': instance.notes,
        };

Offer$Query$Offer$Shipment$Stops$LocationProfile
    _$Offer$Query$Offer$Shipment$Stops$LocationProfileFromJson(
        Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Stops$LocationProfile()
    ..locationName = json['location_name'] as String
    ..coordinates = json['coordinates'] == null
        ? null
        : Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates.fromJson(
            json['coordinates'] as Map<String, dynamic>)
    ..notes = json['notes'] as String
    ..address = json['address'] == null
        ? null
        : Offer$Query$Offer$Shipment$Stops$LocationProfile$Address.fromJson(
            json['address'] as Map<String, dynamic>)
    ..operationalContact = json['operational_contact'] == null
        ? null
        : Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact
            .fromJson(json['operational_contact'] as Map<String, dynamic>)
    ..schedulingContact = json['scheduling_contact'] == null
        ? null
        : Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact
            .fromJson(json['scheduling_contact'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$Stops$LocationProfileToJson(
        Offer$Query$Offer$Shipment$Stops$LocationProfile instance) =>
    <String, dynamic>{
      'location_name': instance.locationName,
      'coordinates': instance.coordinates?.toJson(),
      'notes': instance.notes,
      'address': instance.address?.toJson(),
      'operational_contact': instance.operationalContact?.toJson(),
      'scheduling_contact': instance.schedulingContact?.toJson(),
    };

Offer$Query$Offer$Shipment$Stops _$Offer$Query$Offer$Shipment$StopsFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment$Stops()
    ..id = json['id'] as String
    ..orderIndex = json['order_index'] as int
    ..appointmentType = _$enumDecodeNullable(
        _$AppointmentTypesEnumEnumMap, json['appointment_type'],
        unknownValue: AppointmentTypesEnum.artemisUnknown)
    ..startTime = json['start_time'] as String
    ..endTime = json['end_time'] as String
    ..startedAt = json['started_at'] as String
    ..completedAt = json['completed_at'] as String
    ..type = _$enumDecodeNullable(_$StopTypesEnumEnumMap, json['type'],
        unknownValue: StopTypesEnum.artemisUnknown)
    ..loadingType = json['loading_type'] as String
    ..locationProfile = json['location_profile'] == null
        ? null
        : Offer$Query$Offer$Shipment$Stops$LocationProfile.fromJson(
            json['location_profile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$Query$Offer$Shipment$StopsToJson(
        Offer$Query$Offer$Shipment$Stops instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_index': instance.orderIndex,
      'appointment_type':
          _$AppointmentTypesEnumEnumMap[instance.appointmentType],
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'type': _$StopTypesEnumEnumMap[instance.type],
      'loading_type': instance.loadingType,
      'location_profile': instance.locationProfile?.toJson(),
    };

Offer$Query$Offer$Shipment _$Offer$Query$Offer$ShipmentFromJson(
    Map<String, dynamic> json) {
  return Offer$Query$Offer$Shipment()
    ..id = json['id'] as String
    ..uuid = json['uuid'] as String
    ..shortName = json['short_name'] as String
    ..shipper = json['shipper'] == null
        ? null
        : Offer$Query$Offer$Shipment$Shipper.fromJson(
            json['shipper'] as Map<String, dynamic>)
    ..driver = json['driver'] == null
        ? null
        : Offer$Query$Offer$Shipment$Driver.fromJson(
            json['driver'] as Map<String, dynamic>)
    ..driverId = json['driver_id'] as String
    ..carrierId = json['carrier_id'] as String
    ..carrierAssigned = json['carrier_assigned'] as bool
    ..driverAssigned = json['driver_assigned'] as bool
    ..routeDistanceMiles = (json['route_distance_miles'] as num)?.toDouble()
    ..routeDurationMinutes = json['route_duration_minutes'] as int
    ..requestedTruckTypes = (json['requested_truck_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TruckTypesEnumEnumMap, e,
            unknownValue: TruckTypesEnum.artemisUnknown))
        ?.toList()
    ..accessorials = (json['accessorials'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AccessorialsEnumEnumMap, e,
            unknownValue: AccessorialsEnum.artemisUnknown))
        ?.toList()
    ..loadDescription = json['load_description'] as String
    ..state = _$enumDecodeNullable(_$ShipmentStatusEnumEnumMap, json['state'],
        unknownValue: ShipmentStatusEnum.artemisUnknown)
    ..path = (json['path'] as List)
        ?.map((e) => e == null
            ? null
            : Offer$Query$Offer$Shipment$Path.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..rate =
        json['rate'] == null ? null : Offer$Query$Offer$Shipment$Rate.fromJson(json['rate'] as Map<String, dynamic>)
    ..trailer = json['trailer'] == null ? null : Offer$Query$Offer$Shipment$Trailer.fromJson(json['trailer'] as Map<String, dynamic>)
    ..items = (json['items'] as List)?.map((e) => e == null ? null : Offer$Query$Offer$Shipment$Items.fromJson(e as Map<String, dynamic>))?.toList()
    ..documents = (json['documents'] as List)?.map((e) => e == null ? null : Offer$Query$Offer$Shipment$Documents.fromJson(e as Map<String, dynamic>))?.toList()
    ..stops = (json['stops'] as List)?.map((e) => e == null ? null : Offer$Query$Offer$Shipment$Stops.fromJson(e as Map<String, dynamic>))?.toList();
}

Map<String, dynamic> _$Offer$Query$Offer$ShipmentToJson(
        Offer$Query$Offer$Shipment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'short_name': instance.shortName,
      'shipper': instance.shipper?.toJson(),
      'driver': instance.driver?.toJson(),
      'driver_id': instance.driverId,
      'carrier_id': instance.carrierId,
      'carrier_assigned': instance.carrierAssigned,
      'driver_assigned': instance.driverAssigned,
      'route_distance_miles': instance.routeDistanceMiles,
      'route_duration_minutes': instance.routeDurationMinutes,
      'requested_truck_types': instance.requestedTruckTypes
          ?.map((e) => _$TruckTypesEnumEnumMap[e])
          ?.toList(),
      'accessorials': instance.accessorials
          ?.map((e) => _$AccessorialsEnumEnumMap[e])
          ?.toList(),
      'load_description': instance.loadDescription,
      'state': _$ShipmentStatusEnumEnumMap[instance.state],
      'path': instance.path?.map((e) => e?.toJson())?.toList(),
      'rate': instance.rate?.toJson(),
      'trailer': instance.trailer?.toJson(),
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'documents': instance.documents?.map((e) => e?.toJson())?.toList(),
      'stops': instance.stops?.map((e) => e?.toJson())?.toList(),
    };

Offer$Query$Offer _$Offer$Query$OfferFromJson(Map<String, dynamic> json) {
  return Offer$Query$Offer()
    ..carrierAcceptedBid = json['carrier_accepted_bid'] as bool
    ..uuid = json['uuid'] as String
    ..bid = (json['bid'] as List)
        ?.map((e) => e == null
            ? null
            : Offer$Query$Offer$Bid.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..shipment = json['shipment'] == null
        ? null
        : Offer$Query$Offer$Shipment.fromJson(
            json['shipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$Query$OfferToJson(Offer$Query$Offer instance) =>
    <String, dynamic>{
      'carrier_accepted_bid': instance.carrierAcceptedBid,
      'uuid': instance.uuid,
      'bid': instance.bid?.map((e) => e?.toJson())?.toList(),
      'shipment': instance.shipment?.toJson(),
    };

Offer$Query _$Offer$QueryFromJson(Map<String, dynamic> json) {
  return Offer$Query()
    ..offer = json['offer'] == null
        ? null
        : Offer$Query$Offer.fromJson(json['offer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Offer$QueryToJson(Offer$Query instance) =>
    <String, dynamic>{
      'offer': instance.offer?.toJson(),
    };

UpdateOffer$Mutation$UpdateShipment
    _$UpdateOffer$Mutation$UpdateShipmentFromJson(Map<String, dynamic> json) {
  return UpdateOffer$Mutation$UpdateShipment()
    ..id = json['id'] as String
    ..uuid = json['uuid'] as String;
}

Map<String, dynamic> _$UpdateOffer$Mutation$UpdateShipmentToJson(
        UpdateOffer$Mutation$UpdateShipment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
    };

UpdateOffer$Mutation _$UpdateOffer$MutationFromJson(Map<String, dynamic> json) {
  return UpdateOffer$Mutation()
    ..updateShipment = json['updateShipment'] == null
        ? null
        : UpdateOffer$Mutation$UpdateShipment.fromJson(
            json['updateShipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateOffer$MutationToJson(
        UpdateOffer$Mutation instance) =>
    <String, dynamic>{
      'updateShipment': instance.updateShipment?.toJson(),
    };

CreateStopInput _$CreateStopInputFromJson(Map<String, dynamic> json) {
  return CreateStopInput(
    locationProfileId: json['location_profile_id'] as String,
    appointmentType: _$enumDecodeNullable(
        _$AppointmentTypesEnumEnumMap, json['appointment_type'],
        unknownValue: AppointmentTypesEnum.artemisUnknown),
    startTime: json['start_time'] as String,
    endTime: json['end_time'] as String,
    type: _$enumDecodeNullable(_$StopTypesEnumEnumMap, json['type'],
        unknownValue: StopTypesEnum.artemisUnknown),
    loadingType: _$enumDecodeNullable(
        _$LoadingTypesEnumEnumMap, json['loading_type'],
        unknownValue: LoadingTypesEnum.artemisUnknown),
    locationInput: json['location_input'] == null
        ? null
        : LocationInput.fromJson(
            json['location_input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateStopInputToJson(CreateStopInput instance) =>
    <String, dynamic>{
      'location_profile_id': instance.locationProfileId,
      'appointment_type':
          _$AppointmentTypesEnumEnumMap[instance.appointmentType],
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'type': _$StopTypesEnumEnumMap[instance.type],
      'loading_type': _$LoadingTypesEnumEnumMap[instance.loadingType],
      'location_input': instance.locationInput?.toJson(),
    };

const _$LoadingTypesEnumEnumMap = {
  LoadingTypesEnum.live: 'LIVE',
  LoadingTypesEnum.emptyTrailer: 'EMPTY_TRAILER',
  LoadingTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

LocationInput _$LocationInputFromJson(Map<String, dynamic> json) {
  return LocationInput(
    locationName: json['location_name'] as String,
    coordinates: json['coordinates'] == null
        ? null
        : CoordinatesInput.fromJson(
            json['coordinates'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : AddressInput.fromJson(json['address'] as Map<String, dynamic>),
    operationalContact: json['operational_contact'] == null
        ? null
        : ContactInput.fromJson(
            json['operational_contact'] as Map<String, dynamic>),
    schedulingContact: json['scheduling_contact'] == null
        ? null
        : ContactInput.fromJson(
            json['scheduling_contact'] as Map<String, dynamic>),
    notes: json['notes'] as String,
  );
}

Map<String, dynamic> _$LocationInputToJson(LocationInput instance) =>
    <String, dynamic>{
      'location_name': instance.locationName,
      'coordinates': instance.coordinates?.toJson(),
      'address': instance.address?.toJson(),
      'operational_contact': instance.operationalContact?.toJson(),
      'scheduling_contact': instance.schedulingContact?.toJson(),
      'notes': instance.notes,
    };

ItemInput _$ItemInputFromJson(Map<String, dynamic> json) {
  return ItemInput(
    description: json['description'] as String,
    handlingPiece: json['handling_piece'] == null
        ? null
        : HandlingPieceInput.fromJson(
            json['handling_piece'] as Map<String, dynamic>),
    units: json['units'] == null
        ? null
        : UnitInput.fromJson(json['units'] as Map<String, dynamic>),
    weight: json['weight'] == null
        ? null
        : WeightInput.fromJson(json['weight'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemInputToJson(ItemInput instance) => <String, dynamic>{
      'description': instance.description,
      'handling_piece': instance.handlingPiece?.toJson(),
      'units': instance.units?.toJson(),
      'weight': instance.weight?.toJson(),
    };

HandlingPieceInput _$HandlingPieceInputFromJson(Map<String, dynamic> json) {
  return HandlingPieceInput(
    pieceType: _$enumDecodeNullable(
        _$ItemPieceTypesEnumEnumMap, json['piece_type'],
        unknownValue: ItemPieceTypesEnum.artemisUnknown),
    pieceCount: json['piece_count'] as int,
  );
}

Map<String, dynamic> _$HandlingPieceInputToJson(HandlingPieceInput instance) =>
    <String, dynamic>{
      'piece_type': _$ItemPieceTypesEnumEnumMap[instance.pieceType],
      'piece_count': instance.pieceCount,
    };

UnitInput _$UnitInputFromJson(Map<String, dynamic> json) {
  return UnitInput(
    unitType: _$enumDecodeNullable(
        _$ItemUnitTypesEnumEnumMap, json['unit_type'],
        unknownValue: ItemUnitTypesEnum.artemisUnknown),
    unitCount: json['unit_count'] as int,
  );
}

Map<String, dynamic> _$UnitInputToJson(UnitInput instance) => <String, dynamic>{
      'unit_type': _$ItemUnitTypesEnumEnumMap[instance.unitType],
      'unit_count': instance.unitCount,
    };

WeightInput _$WeightInputFromJson(Map<String, dynamic> json) {
  return WeightInput(
    weight: json['weight'] as int,
    weightUnit: _$enumDecodeNullable(
        _$WeightUnitTypesEnumEnumMap, json['weight_unit'],
        unknownValue: WeightUnitTypesEnum.artemisUnknown),
  );
}

Map<String, dynamic> _$WeightInputToJson(WeightInput instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'weight_unit': _$WeightUnitTypesEnumEnumMap[instance.weightUnit],
    };

TrailerInput _$TrailerInputFromJson(Map<String, dynamic> json) {
  return TrailerInput(
    temperatureMax: json['temperature_max'] as int,
    temperatureMin: json['temperature_min'] as int,
    temperatureUnit: _$enumDecodeNullable(
        _$TemperatureUnitsEnumEnumMap, json['temperature_unit'],
        unknownValue: TemperatureUnitsEnum.artemisUnknown),
  );
}

Map<String, dynamic> _$TrailerInputToJson(TrailerInput instance) =>
    <String, dynamic>{
      'temperature_max': instance.temperatureMax,
      'temperature_min': instance.temperatureMin,
      'temperature_unit':
          _$TemperatureUnitsEnumEnumMap[instance.temperatureUnit],
    };

UpdateShipmentInput _$UpdateShipmentInputFromJson(Map<String, dynamic> json) {
  return UpdateShipmentInput(
    shortName: json['short_name'] as String,
    requestedTruckTypes: (json['requested_truck_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TruckTypesEnumEnumMap, e,
            unknownValue: TruckTypesEnum.artemisUnknown))
        ?.toList(),
    accessorials: (json['accessorials'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AccessorialsEnumEnumMap, e,
            unknownValue: AccessorialsEnum.artemisUnknown))
        ?.toList(),
    loadDescription: json['load_description'] as String,
    routeDistanceMiles: (json['route_distance_miles'] as num)?.toDouble(),
    routeDurationMinutes: json['route_duration_minutes'] as int,
    stops: (json['stops'] as List)
        ?.map((e) => e == null
            ? null
            : CreateStopInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ItemInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailer: json['trailer'] == null
        ? null
        : TrailerInput.fromJson(json['trailer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateShipmentInputToJson(
        UpdateShipmentInput instance) =>
    <String, dynamic>{
      'short_name': instance.shortName,
      'requested_truck_types': instance.requestedTruckTypes
          ?.map((e) => _$TruckTypesEnumEnumMap[e])
          ?.toList(),
      'accessorials': instance.accessorials
          ?.map((e) => _$AccessorialsEnumEnumMap[e])
          ?.toList(),
      'load_description': instance.loadDescription,
      'route_distance_miles': instance.routeDistanceMiles,
      'route_duration_minutes': instance.routeDurationMinutes,
      'stops': instance.stops?.map((e) => e?.toJson())?.toList(),
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'trailer': instance.trailer?.toJson(),
    };

CreateShipment$Mutation$CreateOffer
    _$CreateShipment$Mutation$CreateOfferFromJson(Map<String, dynamic> json) {
  return CreateShipment$Mutation$CreateOffer()
    ..id = json['id'] as String
    ..uuid = json['uuid'] as String;
}

Map<String, dynamic> _$CreateShipment$Mutation$CreateOfferToJson(
        CreateShipment$Mutation$CreateOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
    };

CreateShipment$Mutation _$CreateShipment$MutationFromJson(
    Map<String, dynamic> json) {
  return CreateShipment$Mutation()
    ..createOffer = json['createOffer'] == null
        ? null
        : CreateShipment$Mutation$CreateOffer.fromJson(
            json['createOffer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateShipment$MutationToJson(
        CreateShipment$Mutation instance) =>
    <String, dynamic>{
      'createOffer': instance.createOffer?.toJson(),
    };

OfferInput _$OfferInputFromJson(Map<String, dynamic> json) {
  return OfferInput(
    openPrice: json['open_price'] as int,
    shipment: json['shipment'] == null
        ? null
        : CreateShipmentInput.fromJson(
            json['shipment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OfferInputToJson(OfferInput instance) =>
    <String, dynamic>{
      'open_price': instance.openPrice,
      'shipment': instance.shipment?.toJson(),
    };

CreateShipmentInput _$CreateShipmentInputFromJson(Map<String, dynamic> json) {
  return CreateShipmentInput(
    shortName: json['short_name'] as String,
    requestedTruckTypes: (json['requested_truck_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TruckTypesEnumEnumMap, e,
            unknownValue: TruckTypesEnum.artemisUnknown))
        ?.toList(),
    accessorials: (json['accessorials'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AccessorialsEnumEnumMap, e,
            unknownValue: AccessorialsEnum.artemisUnknown))
        ?.toList(),
    loadDescription: json['load_description'] as String,
    routeDistanceMiles: (json['route_distance_miles'] as num)?.toDouble(),
    routeDurationMinutes: json['route_duration_minutes'] as int,
    stops: (json['stops'] as List)
        ?.map((e) => e == null
            ? null
            : CreateStopInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : ItemInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailer: json['trailer'] == null
        ? null
        : TrailerInput.fromJson(json['trailer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateShipmentInputToJson(
        CreateShipmentInput instance) =>
    <String, dynamic>{
      'short_name': instance.shortName,
      'requested_truck_types': instance.requestedTruckTypes
          ?.map((e) => _$TruckTypesEnumEnumMap[e])
          ?.toList(),
      'accessorials': instance.accessorials
          ?.map((e) => _$AccessorialsEnumEnumMap[e])
          ?.toList(),
      'load_description': instance.loadDescription,
      'route_distance_miles': instance.routeDistanceMiles,
      'route_duration_minutes': instance.routeDurationMinutes,
      'stops': instance.stops?.map((e) => e?.toJson())?.toList(),
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'trailer': instance.trailer?.toJson(),
    };

RejectShipment$Mutation$RejectShipment
    _$RejectShipment$Mutation$RejectShipmentFromJson(
        Map<String, dynamic> json) {
  return RejectShipment$Mutation$RejectShipment()..id = json['id'] as String;
}

Map<String, dynamic> _$RejectShipment$Mutation$RejectShipmentToJson(
        RejectShipment$Mutation$RejectShipment instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

RejectShipment$Mutation _$RejectShipment$MutationFromJson(
    Map<String, dynamic> json) {
  return RejectShipment$Mutation()
    ..rejectShipment = json['rejectShipment'] == null
        ? null
        : RejectShipment$Mutation$RejectShipment.fromJson(
            json['rejectShipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RejectShipment$MutationToJson(
        RejectShipment$Mutation instance) =>
    <String, dynamic>{
      'rejectShipment': instance.rejectShipment?.toJson(),
    };

BookShipment$Mutation$AcceptAdminPrice
    _$BookShipment$Mutation$AcceptAdminPriceFromJson(
        Map<String, dynamic> json) {
  return BookShipment$Mutation$AcceptAdminPrice()..id = json['id'] as String;
}

Map<String, dynamic> _$BookShipment$Mutation$AcceptAdminPriceToJson(
        BookShipment$Mutation$AcceptAdminPrice instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

BookShipment$Mutation _$BookShipment$MutationFromJson(
    Map<String, dynamic> json) {
  return BookShipment$Mutation()
    ..acceptAdminPrice = json['acceptAdminPrice'] == null
        ? null
        : BookShipment$Mutation$AcceptAdminPrice.fromJson(
            json['acceptAdminPrice'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BookShipment$MutationToJson(
        BookShipment$Mutation instance) =>
    <String, dynamic>{
      'acceptAdminPrice': instance.acceptAdminPrice?.toJson(),
    };

AssignCarrierToShipment$Mutation$AssignCarrierToShipment
    _$AssignCarrierToShipment$Mutation$AssignCarrierToShipmentFromJson(
        Map<String, dynamic> json) {
  return AssignCarrierToShipment$Mutation$AssignCarrierToShipment()
    ..id = json['id'] as String;
}

Map<String,
    dynamic> _$AssignCarrierToShipment$Mutation$AssignCarrierToShipmentToJson(
        AssignCarrierToShipment$Mutation$AssignCarrierToShipment instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

AssignCarrierToShipment$Mutation _$AssignCarrierToShipment$MutationFromJson(
    Map<String, dynamic> json) {
  return AssignCarrierToShipment$Mutation()
    ..assignCarrierToShipment = json['assignCarrierToShipment'] == null
        ? null
        : AssignCarrierToShipment$Mutation$AssignCarrierToShipment.fromJson(
            json['assignCarrierToShipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AssignCarrierToShipment$MutationToJson(
        AssignCarrierToShipment$Mutation instance) =>
    <String, dynamic>{
      'assignCarrierToShipment': instance.assignCarrierToShipment?.toJson(),
    };

UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment
    _$UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipmentFromJson(
        Map<String, dynamic> json) {
  return UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipmentToJson(
            UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
        };

UnAssignCarrierToShipment$Mutation _$UnAssignCarrierToShipment$MutationFromJson(
    Map<String, dynamic> json) {
  return UnAssignCarrierToShipment$Mutation()
    ..unAssignCarrierFromShipment = json['unAssignCarrierFromShipment'] == null
        ? null
        : UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment
            .fromJson(
                json['unAssignCarrierFromShipment'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UnAssignCarrierToShipment$MutationToJson(
        UnAssignCarrierToShipment$Mutation instance) =>
    <String, dynamic>{
      'unAssignCarrierFromShipment':
          instance.unAssignCarrierFromShipment?.toJson(),
    };

UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens
    _$UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokensFromJson(
        Map<String, dynamic> json) {
  return UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokensToJson(
            UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens instance) =>
        <String, dynamic>{
          'id': instance.id,
        };

UpdateUserDeviceTokens$Mutation _$UpdateUserDeviceTokens$MutationFromJson(
    Map<String, dynamic> json) {
  return UpdateUserDeviceTokens$Mutation()
    ..updateUserDeviceTokens = json['updateUserDeviceTokens'] == null
        ? null
        : UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens.fromJson(
            json['updateUserDeviceTokens'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUserDeviceTokens$MutationToJson(
        UpdateUserDeviceTokens$Mutation instance) =>
    <String, dynamic>{
      'updateUserDeviceTokens': instance.updateUserDeviceTokens?.toJson(),
    };

UpdateShipperUserArguments _$UpdateShipperUserArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateShipperUserArguments(
    id: json['id'] as String,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$UpdateShipperUserArgumentsToJson(
        UpdateShipperUserArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
    };

SendOtpArguments _$SendOtpArgumentsFromJson(Map<String, dynamic> json) {
  return SendOtpArguments(
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$SendOtpArgumentsToJson(SendOtpArguments instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };

NotificationsArguments _$NotificationsArgumentsFromJson(
    Map<String, dynamic> json) {
  return NotificationsArguments(
    first: json['first'] as int,
    page: json['page'] as int,
    unread: json['unread'] as bool,
  );
}

Map<String, dynamic> _$NotificationsArgumentsToJson(
        NotificationsArguments instance) =>
    <String, dynamic>{
      'first': instance.first,
      'page': instance.page,
      'unread': instance.unread,
    };

NotificationSubsciptionArguments _$NotificationSubsciptionArgumentsFromJson(
    Map<String, dynamic> json) {
  return NotificationSubsciptionArguments(
    subscribed: json['subscribed'] as bool,
  );
}

Map<String, dynamic> _$NotificationSubsciptionArgumentsToJson(
        NotificationSubsciptionArguments instance) =>
    <String, dynamic>{
      'subscribed': instance.subscribed,
    };

SubscribeNotificationArguments _$SubscribeNotificationArgumentsFromJson(
    Map<String, dynamic> json) {
  return SubscribeNotificationArguments(
    type: _$enumDecodeNullable(_$NotificationsTypeEnumEnumMap, json['type'],
        unknownValue: NotificationsTypeEnum.artemisUnknown),
    channel: json['channel'] as String,
  );
}

Map<String, dynamic> _$SubscribeNotificationArgumentsToJson(
        SubscribeNotificationArguments instance) =>
    <String, dynamic>{
      'type': _$NotificationsTypeEnumEnumMap[instance.type],
      'channel': instance.channel,
    };

UnSubscribeNotificationArguments _$UnSubscribeNotificationArgumentsFromJson(
    Map<String, dynamic> json) {
  return UnSubscribeNotificationArguments(
    type: _$enumDecodeNullable(_$NotificationsTypeEnumEnumMap, json['type'],
        unknownValue: NotificationsTypeEnum.artemisUnknown),
    channel: json['channel'] as String,
  );
}

Map<String, dynamic> _$UnSubscribeNotificationArgumentsToJson(
        UnSubscribeNotificationArguments instance) =>
    <String, dynamic>{
      'type': _$NotificationsTypeEnumEnumMap[instance.type],
      'channel': instance.channel,
    };

EditLocationArguments _$EditLocationArgumentsFromJson(
    Map<String, dynamic> json) {
  return EditLocationArguments(
    id: json['id'] as String,
    input: json['input'] == null
        ? null
        : UpdateLocationProfileInput.fromJson(
            json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EditLocationArgumentsToJson(
        EditLocationArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'input': instance.input?.toJson(),
    };

UserShipmentsArguments _$UserShipmentsArgumentsFromJson(
    Map<String, dynamic> json) {
  return UserShipmentsArguments(
    requested_truck_types: (json['requested_truck_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TruckTypesEnumEnumMap, e,
            unknownValue: TruckTypesEnum.artemisUnknown))
        ?.toList(),
    states: (json['states'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ShipmentStatusEnumEnumMap, e,
            unknownValue: ShipmentStatusEnum.artemisUnknown))
        ?.toList(),
    first: json['first'] as int,
    page: json['page'] as int,
  );
}

Map<String, dynamic> _$UserShipmentsArgumentsToJson(
        UserShipmentsArguments instance) =>
    <String, dynamic>{
      'requested_truck_types': instance.requested_truck_types
          ?.map((e) => _$TruckTypesEnumEnumMap[e])
          ?.toList(),
      'states':
          instance.states?.map((e) => _$ShipmentStatusEnumEnumMap[e])?.toList(),
      'first': instance.first,
      'page': instance.page,
    };

AddShipperArguments _$AddShipperArgumentsFromJson(Map<String, dynamic> json) {
  return AddShipperArguments(
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$AddShipperArgumentsToJson(
        AddShipperArguments instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
    };

GetEstimationArguments _$GetEstimationArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetEstimationArguments(
    locations: (json['locations'] as List)
        ?.map((e) => e == null
            ? null
            : LocationCollectionInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetEstimationArgumentsToJson(
        GetEstimationArguments instance) =>
    <String, dynamic>{
      'locations': instance.locations?.map((e) => e?.toJson())?.toList(),
    };

UserLocationsArguments _$UserLocationsArgumentsFromJson(
    Map<String, dynamic> json) {
  return UserLocationsArguments(
    name: json['name'] as String,
    first: json['first'] as int,
    page: json['page'] as int,
  );
}

Map<String, dynamic> _$UserLocationsArgumentsToJson(
        UserLocationsArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'first': instance.first,
      'page': instance.page,
    };

DeleteLocationArguments _$DeleteLocationArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteLocationArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteLocationArgumentsToJson(
        DeleteLocationArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SignInArguments _$SignInArgumentsFromJson(Map<String, dynamic> json) {
  return SignInArguments(
    phone: json['phone'] as String,
    otp: json['otp'] as String,
  );
}

Map<String, dynamic> _$SignInArgumentsToJson(SignInArguments instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'otp': instance.otp,
    };

UserShipmentArguments _$UserShipmentArgumentsFromJson(
    Map<String, dynamic> json) {
  return UserShipmentArguments(
    id: json['id'] as String,
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$UserShipmentArgumentsToJson(
        UserShipmentArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
    };

OffersArguments _$OffersArgumentsFromJson(Map<String, dynamic> json) {
  return OffersArguments(
    first: json['first'] as int,
    page: json['page'] as int,
    shipper_id: json['shipper_id'] as String,
    sort: _$enumDecodeNullable(_$SortTypesEnumEnumMap, json['sort'],
        unknownValue: SortTypesEnum.artemisUnknown),
    state: _$enumDecodeNullable(_$ShipmentStatusEnumEnumMap, json['state'],
        unknownValue: ShipmentStatusEnum.artemisUnknown),
  );
}

Map<String, dynamic> _$OffersArgumentsToJson(OffersArguments instance) =>
    <String, dynamic>{
      'first': instance.first,
      'page': instance.page,
      'shipper_id': instance.shipper_id,
      'sort': _$SortTypesEnumEnumMap[instance.sort],
      'state': _$ShipmentStatusEnumEnumMap[instance.state],
    };

const _$SortTypesEnumEnumMap = {
  SortTypesEnum.createdAt: 'CREATED_AT',
  SortTypesEnum.updatedAt: 'UPDATED_AT',
  SortTypesEnum.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

DeleteShipperArguments _$DeleteShipperArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteShipperArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteShipperArgumentsToJson(
        DeleteShipperArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetQuoteArguments _$GetQuoteArgumentsFromJson(Map<String, dynamic> json) {
  return GetQuoteArguments(
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$GetQuoteArgumentsToJson(GetQuoteArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
    };

SignUpArguments _$SignUpArgumentsFromJson(Map<String, dynamic> json) {
  return SignUpArguments(
    company_name: json['company_name'] as String,
    email: json['email'] as String,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    phone: json['phone'] as String,
    tin_ein_number: json['tin_ein_number'] as String,
    applied_tc_version: (json['applied_tc_version'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SignUpArgumentsToJson(SignUpArguments instance) =>
    <String, dynamic>{
      'company_name': instance.company_name,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone': instance.phone,
      'tin_ein_number': instance.tin_ein_number,
      'applied_tc_version': instance.applied_tc_version,
    };

AddLocationArguments _$AddLocationArgumentsFromJson(Map<String, dynamic> json) {
  return AddLocationArguments(
    input: json['input'] == null
        ? null
        : CreateLocationProfileInput.fromJson(
            json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddLocationArgumentsToJson(
        AddLocationArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

UpdateShipperArguments _$UpdateShipperArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateShipperArguments(
    input: json['input'] == null
        ? null
        : UpdateShipperInput.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateShipperArgumentsToJson(
        UpdateShipperArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

OfferArguments _$OfferArgumentsFromJson(Map<String, dynamic> json) {
  return OfferArguments(
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$OfferArgumentsToJson(OfferArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
    };

UpdateOfferArguments _$UpdateOfferArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateOfferArguments(
    uuid: json['uuid'] as String,
    shipment: json['shipment'] == null
        ? null
        : UpdateShipmentInput.fromJson(
            json['shipment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateOfferArgumentsToJson(
        UpdateOfferArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'shipment': instance.shipment?.toJson(),
    };

CreateShipmentArguments _$CreateShipmentArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateShipmentArguments(
    input: json['input'] == null
        ? null
        : OfferInput.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateShipmentArgumentsToJson(
        CreateShipmentArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

RejectShipmentArguments _$RejectShipmentArgumentsFromJson(
    Map<String, dynamic> json) {
  return RejectShipmentArguments(
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$RejectShipmentArgumentsToJson(
        RejectShipmentArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
    };

BookShipmentArguments _$BookShipmentArgumentsFromJson(
    Map<String, dynamic> json) {
  return BookShipmentArguments(
    uuid: json['uuid'] as String,
  );
}

Map<String, dynamic> _$BookShipmentArgumentsToJson(
        BookShipmentArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
    };

AssignCarrierToShipmentArguments _$AssignCarrierToShipmentArgumentsFromJson(
    Map<String, dynamic> json) {
  return AssignCarrierToShipmentArguments(
    uuid: json['uuid'] as String,
    carrier_id: json['carrier_id'] as String,
  );
}

Map<String, dynamic> _$AssignCarrierToShipmentArgumentsToJson(
        AssignCarrierToShipmentArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'carrier_id': instance.carrier_id,
    };

UnAssignCarrierToShipmentArguments _$UnAssignCarrierToShipmentArgumentsFromJson(
    Map<String, dynamic> json) {
  return UnAssignCarrierToShipmentArguments(
    uuid: json['uuid'] as String,
    carrier_id: json['carrier_id'] as String,
  );
}

Map<String, dynamic> _$UnAssignCarrierToShipmentArgumentsToJson(
        UnAssignCarrierToShipmentArguments instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'carrier_id': instance.carrier_id,
    };

UpdateUserDeviceTokensArguments _$UpdateUserDeviceTokensArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateUserDeviceTokensArguments(
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UpdateUserDeviceTokensArgumentsToJson(
        UpdateUserDeviceTokensArguments instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

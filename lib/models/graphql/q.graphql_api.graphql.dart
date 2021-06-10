// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'q.graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateShipperUser$Mutation$UpdateShipperUser with EquatableMixin {
  UpdateShipperUser$Mutation$UpdateShipperUser();

  factory UpdateShipperUser$Mutation$UpdateShipperUser.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateShipperUser$Mutation$UpdateShipperUserFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$UpdateShipperUser$Mutation$UpdateShipperUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateShipperUser$Mutation with EquatableMixin {
  UpdateShipperUser$Mutation();

  factory UpdateShipperUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateShipperUser$MutationFromJson(json);

  UpdateShipperUser$Mutation$UpdateShipperUser updateShipperUser;

  @override
  List<Object> get props => [updateShipperUser];
  Map<String, dynamic> toJson() => _$UpdateShipperUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendOtp$Mutation with EquatableMixin {
  SendOtp$Mutation();

  factory SendOtp$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendOtp$MutationFromJson(json);

  String result;

  @override
  List<Object> get props => [result];
  Map<String, dynamic> toJson() => _$SendOtp$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$Query$UserNotifications$Data$Data with EquatableMixin {
  Notifications$Query$UserNotifications$Data$Data();

  factory Notifications$Query$UserNotifications$Data$Data.fromJson(
          Map<String, dynamic> json) =>
      _$Notifications$Query$UserNotifications$Data$DataFromJson(json);

  String title;

  String body;

  @override
  List<Object> get props => [title, body];
  Map<String, dynamic> toJson() =>
      _$Notifications$Query$UserNotifications$Data$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$Query$UserNotifications$Data with EquatableMixin {
  Notifications$Query$UserNotifications$Data();

  factory Notifications$Query$UserNotifications$Data.fromJson(
          Map<String, dynamic> json) =>
      _$Notifications$Query$UserNotifications$DataFromJson(json);

  String id;

  Notifications$Query$UserNotifications$Data$Data data;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'read_at')
  String readAt;

  @override
  List<Object> get props => [id, data, createdAt, readAt];
  Map<String, dynamic> toJson() =>
      _$Notifications$Query$UserNotifications$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$Query$UserNotifications$PaginatorInfo with EquatableMixin {
  Notifications$Query$UserNotifications$PaginatorInfo();

  factory Notifications$Query$UserNotifications$PaginatorInfo.fromJson(
          Map<String, dynamic> json) =>
      _$Notifications$Query$UserNotifications$PaginatorInfoFromJson(json);

  int currentPage;

  int lastPage;

  int perPage;

  int total;

  int count;

  @override
  List<Object> get props => [currentPage, lastPage, perPage, total, count];
  Map<String, dynamic> toJson() =>
      _$Notifications$Query$UserNotifications$PaginatorInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$Query$UserNotifications with EquatableMixin {
  Notifications$Query$UserNotifications();

  factory Notifications$Query$UserNotifications.fromJson(
          Map<String, dynamic> json) =>
      _$Notifications$Query$UserNotificationsFromJson(json);

  List<Notifications$Query$UserNotifications$Data> data;

  Notifications$Query$UserNotifications$PaginatorInfo paginatorInfo;

  @override
  List<Object> get props => [data, paginatorInfo];
  Map<String, dynamic> toJson() =>
      _$Notifications$Query$UserNotificationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Notifications$Query with EquatableMixin {
  Notifications$Query();

  factory Notifications$Query.fromJson(Map<String, dynamic> json) =>
      _$Notifications$QueryFromJson(json);

  Notifications$Query$UserNotifications userNotifications;

  @override
  List<Object> get props => [userNotifications];
  Map<String, dynamic> toJson() => _$Notifications$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationSubsciption$Query$UserNotificationSubscriptions
    with EquatableMixin {
  NotificationSubsciption$Query$UserNotificationSubscriptions();

  factory NotificationSubsciption$Query$UserNotificationSubscriptions.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationSubsciption$Query$UserNotificationSubscriptionsFromJson(
          json);

  String channel;

  @JsonKey(name: 'is_subscribed')
  bool isSubscribed;

  @JsonKey(unknownEnumValue: NotificationsTypeEnum.artemisUnknown)
  NotificationsTypeEnum type;

  @override
  List<Object> get props => [channel, isSubscribed, type];
  Map<String, dynamic> toJson() =>
      _$NotificationSubsciption$Query$UserNotificationSubscriptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NotificationSubsciption$Query with EquatableMixin {
  NotificationSubsciption$Query();

  factory NotificationSubsciption$Query.fromJson(Map<String, dynamic> json) =>
      _$NotificationSubsciption$QueryFromJson(json);

  List<NotificationSubsciption$Query$UserNotificationSubscriptions>
      userNotificationSubscriptions;

  @override
  List<Object> get props => [userNotificationSubscriptions];
  Map<String, dynamic> toJson() => _$NotificationSubsciption$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubscribeNotification$Mutation with EquatableMixin {
  SubscribeNotification$Mutation();

  factory SubscribeNotification$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SubscribeNotification$MutationFromJson(json);

  String subscribeNotification;

  @override
  List<Object> get props => [subscribeNotification];
  Map<String, dynamic> toJson() => _$SubscribeNotification$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnSubscribeNotification$Mutation with EquatableMixin {
  UnSubscribeNotification$Mutation();

  factory UnSubscribeNotification$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$UnSubscribeNotification$MutationFromJson(json);

  String unSubscribeNotification;

  @override
  List<Object> get props => [unSubscribeNotification];
  Map<String, dynamic> toJson() =>
      _$UnSubscribeNotification$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EditLocation$Mutation$EditLocation with EquatableMixin {
  EditLocation$Mutation$EditLocation();

  factory EditLocation$Mutation$EditLocation.fromJson(
          Map<String, dynamic> json) =>
      _$EditLocation$Mutation$EditLocationFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$EditLocation$Mutation$EditLocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EditLocation$Mutation with EquatableMixin {
  EditLocation$Mutation();

  factory EditLocation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$EditLocation$MutationFromJson(json);

  EditLocation$Mutation$EditLocation editLocation;

  @override
  List<Object> get props => [editLocation];
  Map<String, dynamic> toJson() => _$EditLocation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CoordinatesInput with EquatableMixin {
  CoordinatesInput({@required this.lat, @required this.lng});

  factory CoordinatesInput.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesInputFromJson(json);

  double lat;

  double lng;

  @override
  List<Object> get props => [lat, lng];
  Map<String, dynamic> toJson() => _$CoordinatesInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddressInput with EquatableMixin {
  AddressInput(
      {@required this.full,
      this.city,
      this.state,
      this.street,
      this.streetNumber,
      this.placeId});

  factory AddressInput.fromJson(Map<String, dynamic> json) =>
      _$AddressInputFromJson(json);

  String full;

  String city;

  String state;

  String street;

  @JsonKey(name: 'street_number')
  int streetNumber;

  @JsonKey(name: 'place_id')
  String placeId;

  @override
  List<Object> get props => [full, city, state, street, streetNumber, placeId];
  Map<String, dynamic> toJson() => _$AddressInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ContactInput with EquatableMixin {
  ContactInput({this.contactName, this.email, this.phoneNumber, this.notes});

  factory ContactInput.fromJson(Map<String, dynamic> json) =>
      _$ContactInputFromJson(json);

  @JsonKey(name: 'contact_name')
  String contactName;

  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String notes;

  @override
  List<Object> get props => [contactName, email, phoneNumber, notes];
  Map<String, dynamic> toJson() => _$ContactInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateLocationProfileInput with EquatableMixin {
  UpdateLocationProfileInput(
      {this.locationName,
      this.coordinates,
      this.address,
      this.operationalContact,
      this.schedulingContact,
      this.notes});

  factory UpdateLocationProfileInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationProfileInputFromJson(json);

  @JsonKey(name: 'location_name')
  String locationName;

  CoordinatesInput coordinates;

  AddressInput address;

  @JsonKey(name: 'operational_contact')
  ContactInput operationalContact;

  @JsonKey(name: 'scheduling_contact')
  ContactInput schedulingContact;

  String notes;

  @override
  List<Object> get props => [
        locationName,
        coordinates,
        address,
        operationalContact,
        schedulingContact,
        notes
      ];
  Map<String, dynamic> toJson() => _$UpdateLocationProfileInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier
    with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier();

  factory UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Offer$Bid$CarrierFromJson(json);

  String id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Offer$Bid$CarrierToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Offer$Bid with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Offer$Bid();

  factory UserShipments$Query$UserShipments$Data$Offer$Bid.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Offer$BidFromJson(json);

  @JsonKey(unknownEnumValue: BidTypeEnum.artemisUnknown)
  BidTypeEnum type;

  String cents;

  UserShipments$Query$UserShipments$Data$Offer$Bid$Carrier carrier;

  @override
  List<Object> get props => [type, cents, carrier];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Offer$BidToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver
    with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver();

  factory UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Offer$Shipment$DriverFromJson(
          json);

  String firstname;

  @override
  List<Object> get props => [firstname];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Offer$Shipment$DriverToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Offer$Shipment
    with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Offer$Shipment();

  factory UserShipments$Query$UserShipments$Data$Offer$Shipment.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Offer$ShipmentFromJson(json);

  @JsonKey(name: 'carrier_id')
  String carrierId;

  UserShipments$Query$UserShipments$Data$Offer$Shipment$Driver driver;

  @override
  List<Object> get props => [carrierId, driver];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Offer$ShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Offer with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Offer();

  factory UserShipments$Query$UserShipments$Data$Offer.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$OfferFromJson(json);

  List<UserShipments$Query$UserShipments$Data$Offer$Bid> bid;

  UserShipments$Query$UserShipments$Data$Offer$Shipment shipment;

  @override
  List<Object> get props => [bid, shipment];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$OfferToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates
    with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates();

  factory UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$CoordinatesFromJson(
          json);

  double lat;

  double lng;

  @override
  List<Object> get props => [lat, lng];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$CoordinatesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address
    with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address();

  factory UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$AddressFromJson(
          json);

  String full;

  String city;

  String state;

  String street;

  @override
  List<Object> get props => [full, city, state, street];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Stops$LocationProfile$AddressToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Stops$LocationProfile
    with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Stops$LocationProfile();

  factory UserShipments$Query$UserShipments$Data$Stops$LocationProfile.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$Stops$LocationProfileFromJson(
          json);

  UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Coordinates
      coordinates;

  UserShipments$Query$UserShipments$Data$Stops$LocationProfile$Address address;

  @override
  List<Object> get props => [coordinates, address];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$Stops$LocationProfileToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data$Stops with EquatableMixin {
  UserShipments$Query$UserShipments$Data$Stops();

  factory UserShipments$Query$UserShipments$Data$Stops.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$Data$StopsFromJson(json);

  @JsonKey(name: 'start_time')
  String startTime;

  @JsonKey(name: 'end_time')
  String endTime;

  @JsonKey(name: 'location_profile')
  UserShipments$Query$UserShipments$Data$Stops$LocationProfile locationProfile;

  @override
  List<Object> get props => [startTime, endTime, locationProfile];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$Data$StopsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$Data with EquatableMixin {
  UserShipments$Query$UserShipments$Data();

  factory UserShipments$Query$UserShipments$Data.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$DataFromJson(json);

  String id;

  String uuid;

  @JsonKey(unknownEnumValue: ShipmentStatusEnum.artemisUnknown)
  ShipmentStatusEnum state;

  @JsonKey(name: 'short_name')
  String shortName;

  @JsonKey(name: 'route_distance_miles')
  double routeDistanceMiles;

  @JsonKey(name: 'route_duration_minutes')
  int routeDurationMinutes;

  @JsonKey(
      name: 'requested_truck_types',
      unknownEnumValue: TruckTypesEnum.artemisUnknown)
  List<TruckTypesEnum> requestedTruckTypes;

  UserShipments$Query$UserShipments$Data$Offer offer;

  List<UserShipments$Query$UserShipments$Data$Stops> stops;

  @override
  List<Object> get props => [
        id,
        uuid,
        state,
        shortName,
        routeDistanceMiles,
        routeDurationMinutes,
        requestedTruckTypes,
        offer,
        stops
      ];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments$PaginatorInfo with EquatableMixin {
  UserShipments$Query$UserShipments$PaginatorInfo();

  factory UserShipments$Query$UserShipments$PaginatorInfo.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipments$PaginatorInfoFromJson(json);

  int count;

  int currentPage;

  bool hasMorePages;

  int firstItem;

  int lastItem;

  int lastPage;

  int perPage;

  int total;

  @override
  List<Object> get props => [
        count,
        currentPage,
        hasMorePages,
        firstItem,
        lastItem,
        lastPage,
        perPage,
        total
      ];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipments$PaginatorInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query$UserShipments with EquatableMixin {
  UserShipments$Query$UserShipments();

  factory UserShipments$Query$UserShipments.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipments$Query$UserShipmentsFromJson(json);

  List<UserShipments$Query$UserShipments$Data> data;

  UserShipments$Query$UserShipments$PaginatorInfo paginatorInfo;

  @override
  List<Object> get props => [data, paginatorInfo];
  Map<String, dynamic> toJson() =>
      _$UserShipments$Query$UserShipmentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipments$Query with EquatableMixin {
  UserShipments$Query();

  factory UserShipments$Query.fromJson(Map<String, dynamic> json) =>
      _$UserShipments$QueryFromJson(json);

  UserShipments$Query$UserShipments userShipments;

  @override
  List<Object> get props => [userShipments];
  Map<String, dynamic> toJson() => _$UserShipments$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddShipper$Mutation$AddShipperUser with EquatableMixin {
  AddShipper$Mutation$AddShipperUser();

  factory AddShipper$Mutation$AddShipperUser.fromJson(
          Map<String, dynamic> json) =>
      _$AddShipper$Mutation$AddShipperUserFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$AddShipper$Mutation$AddShipperUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddShipper$Mutation with EquatableMixin {
  AddShipper$Mutation();

  factory AddShipper$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AddShipper$MutationFromJson(json);

  List<AddShipper$Mutation$AddShipperUser> addShipperUser;

  @override
  List<Object> get props => [addShipperUser];
  Map<String, dynamic> toJson() => _$AddShipper$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetEstimation$Query$GetEstimations with EquatableMixin {
  GetEstimation$Query$GetEstimations();

  factory GetEstimation$Query$GetEstimations.fromJson(
          Map<String, dynamic> json) =>
      _$GetEstimation$Query$GetEstimationsFromJson(json);

  @JsonKey(name: 'route_distance_miles')
  double routeDistanceMiles;

  @JsonKey(name: 'route_duration_minutes')
  int routeDurationMinutes;

  @override
  List<Object> get props => [routeDistanceMiles, routeDurationMinutes];
  Map<String, dynamic> toJson() =>
      _$GetEstimation$Query$GetEstimationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetEstimation$Query with EquatableMixin {
  GetEstimation$Query();

  factory GetEstimation$Query.fromJson(Map<String, dynamic> json) =>
      _$GetEstimation$QueryFromJson(json);

  GetEstimation$Query$GetEstimations getEstimations;

  @override
  List<Object> get props => [getEstimations];
  Map<String, dynamic> toJson() => _$GetEstimation$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LocationCollectionInput with EquatableMixin {
  LocationCollectionInput({@required this.coordinates, this.placeId});

  factory LocationCollectionInput.fromJson(Map<String, dynamic> json) =>
      _$LocationCollectionInputFromJson(json);

  CoordinatesInput coordinates;

  @JsonKey(name: 'place_id')
  String placeId;

  @override
  List<Object> get props => [coordinates, placeId];
  Map<String, dynamic> toJson() => _$LocationCollectionInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles$Data$Address
    with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles$Data$Address();

  factory UserLocations$Query$ShipperLocationProfiles$Data$Address.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$AddressFromJson(json);

  String full;

  String city;

  String state;

  @override
  List<Object> get props => [full, city, state];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles$Data$Coordinates
    with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles$Data$Coordinates();

  factory UserLocations$Query$ShipperLocationProfiles$Data$Coordinates.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$CoordinatesFromJson(
          json);

  double lat;

  double lng;

  @override
  List<Object> get props => [lat, lng];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$CoordinatesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact
    with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact();

  factory UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$OperationalContactFromJson(
          json);

  @JsonKey(name: 'contact_name')
  String contactName;

  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String notes;

  @override
  List<Object> get props => [contactName, email, phoneNumber, notes];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$OperationalContactToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact
    with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact();

  factory UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContactFromJson(
          json);

  @JsonKey(name: 'contact_name')
  String contactName;

  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String notes;

  @override
  List<Object> get props => [contactName, email, phoneNumber, notes];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContactToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles$Data with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles$Data();

  factory UserLocations$Query$ShipperLocationProfiles$Data.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfiles$DataFromJson(json);

  String id;

  @JsonKey(name: 'shipper_id')
  String shipperId;

  @JsonKey(name: 'location_name')
  String locationName;

  UserLocations$Query$ShipperLocationProfiles$Data$Address address;

  UserLocations$Query$ShipperLocationProfiles$Data$Coordinates coordinates;

  @JsonKey(name: 'operational_contact')
  UserLocations$Query$ShipperLocationProfiles$Data$OperationalContact
      operationalContact;

  @JsonKey(name: 'scheduling_contact')
  UserLocations$Query$ShipperLocationProfiles$Data$SchedulingContact
      schedulingContact;

  @override
  List<Object> get props => [
        id,
        shipperId,
        locationName,
        address,
        coordinates,
        operationalContact,
        schedulingContact
      ];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfiles$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles$PaginatorInfo
    with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles$PaginatorInfo();

  factory UserLocations$Query$ShipperLocationProfiles$PaginatorInfo.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfiles$PaginatorInfoFromJson(json);

  int count;

  int currentPage;

  bool hasMorePages;

  int firstItem;

  int lastItem;

  int lastPage;

  int perPage;

  int total;

  @override
  List<Object> get props => [
        count,
        currentPage,
        hasMorePages,
        firstItem,
        lastItem,
        lastPage,
        perPage,
        total
      ];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfiles$PaginatorInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query$ShipperLocationProfiles with EquatableMixin {
  UserLocations$Query$ShipperLocationProfiles();

  factory UserLocations$Query$ShipperLocationProfiles.fromJson(
          Map<String, dynamic> json) =>
      _$UserLocations$Query$ShipperLocationProfilesFromJson(json);

  List<UserLocations$Query$ShipperLocationProfiles$Data> data;

  UserLocations$Query$ShipperLocationProfiles$PaginatorInfo paginatorInfo;

  @override
  List<Object> get props => [data, paginatorInfo];
  Map<String, dynamic> toJson() =>
      _$UserLocations$Query$ShipperLocationProfilesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserLocations$Query with EquatableMixin {
  UserLocations$Query();

  factory UserLocations$Query.fromJson(Map<String, dynamic> json) =>
      _$UserLocations$QueryFromJson(json);

  UserLocations$Query$ShipperLocationProfiles shipperLocationProfiles;

  @override
  List<Object> get props => [shipperLocationProfiles];
  Map<String, dynamic> toJson() => _$UserLocations$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteLocation$Mutation with EquatableMixin {
  DeleteLocation$Mutation();

  factory DeleteLocation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteLocation$MutationFromJson(json);

  String deleteLocation;

  @override
  List<Object> get props => [deleteLocation];
  Map<String, dynamic> toJson() => _$DeleteLocation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation$VerifyPhone with EquatableMixin {
  SignIn$Mutation$VerifyPhone();

  factory SignIn$Mutation$VerifyPhone.fromJson(Map<String, dynamic> json) =>
      _$SignIn$Mutation$VerifyPhoneFromJson(json);

  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'expires_at')
  String expiresAt;

  @override
  List<Object> get props => [accessToken, expiresAt];
  Map<String, dynamic> toJson() => _$SignIn$Mutation$VerifyPhoneToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation with EquatableMixin {
  SignIn$Mutation();

  factory SignIn$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignIn$MutationFromJson(json);

  SignIn$Mutation$VerifyPhone verifyPhone;

  @override
  List<Object> get props => [verifyPhone];
  Map<String, dynamic> toJson() => _$SignIn$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper$Address with EquatableMixin {
  Me$Query$Me$Shipper$Address();

  factory Me$Query$Me$Shipper$Address.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$Me$Shipper$AddressFromJson(json);

  String address;

  String address2;

  String city;

  String state;

  @JsonKey(name: 'zip_code')
  int zipCode;

  @override
  List<Object> get props => [address, address2, city, state, zipCode];
  Map<String, dynamic> toJson() => _$Me$Query$Me$Shipper$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper$PrimaryContact with EquatableMixin {
  Me$Query$Me$Shipper$PrimaryContact();

  factory Me$Query$Me$Shipper$PrimaryContact.fromJson(
          Map<String, dynamic> json) =>
      _$Me$Query$Me$Shipper$PrimaryContactFromJson(json);

  String fullname;

  String email;

  String phone;

  @override
  List<Object> get props => [fullname, email, phone];
  Map<String, dynamic> toJson() =>
      _$Me$Query$Me$Shipper$PrimaryContactToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper$BillingContact with EquatableMixin {
  Me$Query$Me$Shipper$BillingContact();

  factory Me$Query$Me$Shipper$BillingContact.fromJson(
          Map<String, dynamic> json) =>
      _$Me$Query$Me$Shipper$BillingContactFromJson(json);

  String fullname;

  String email;

  String phone;

  @override
  List<Object> get props => [fullname, email, phone];
  Map<String, dynamic> toJson() =>
      _$Me$Query$Me$Shipper$BillingContactToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper$BillingAddress with EquatableMixin {
  Me$Query$Me$Shipper$BillingAddress();

  factory Me$Query$Me$Shipper$BillingAddress.fromJson(
          Map<String, dynamic> json) =>
      _$Me$Query$Me$Shipper$BillingAddressFromJson(json);

  String address;

  String address2;

  String city;

  String state;

  @JsonKey(name: 'zip_code')
  int zipCode;

  @override
  List<Object> get props => [address, address2, city, state, zipCode];
  Map<String, dynamic> toJson() =>
      _$Me$Query$Me$Shipper$BillingAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper$Users$Meta with EquatableMixin {
  Me$Query$Me$Shipper$Users$Meta();

  factory Me$Query$Me$Shipper$Users$Meta.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$Me$Shipper$Users$MetaFromJson(json);

  double miles;

  @override
  List<Object> get props => [miles];
  Map<String, dynamic> toJson() => _$Me$Query$Me$Shipper$Users$MetaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper$Users with EquatableMixin {
  Me$Query$Me$Shipper$Users();

  factory Me$Query$Me$Shipper$Users.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$Me$Shipper$UsersFromJson(json);

  String id;

  String firstname;

  String lastname;

  String email;

  String phone;

  @JsonKey(unknownEnumValue: UserRolesEnum.artemisUnknown)
  UserRolesEnum role;

  Me$Query$Me$Shipper$Users$Meta meta;

  @override
  List<Object> get props => [id, firstname, lastname, email, phone, role, meta];
  Map<String, dynamic> toJson() => _$Me$Query$Me$Shipper$UsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me$Shipper with EquatableMixin {
  Me$Query$Me$Shipper();

  factory Me$Query$Me$Shipper.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$Me$ShipperFromJson(json);

  String id;

  bool verified;

  String name;

  @JsonKey(name: 'tin_ein_number')
  String tinEinNumber;

  Me$Query$Me$Shipper$Address address;

  @JsonKey(name: 'primary_contact')
  Me$Query$Me$Shipper$PrimaryContact primaryContact;

  @JsonKey(name: 'billing_contact')
  Me$Query$Me$Shipper$BillingContact billingContact;

  @JsonKey(name: 'billing_address')
  Me$Query$Me$Shipper$BillingAddress billingAddress;

  List<Me$Query$Me$Shipper$Users> users;

  @override
  List<Object> get props => [
        id,
        verified,
        name,
        tinEinNumber,
        address,
        primaryContact,
        billingContact,
        billingAddress,
        users
      ];
  Map<String, dynamic> toJson() => _$Me$Query$Me$ShipperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Me with EquatableMixin {
  Me$Query$Me();

  factory Me$Query$Me.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$MeFromJson(json);

  String id;

  @JsonKey(name: 'company_id')
  String companyId;

  String firstname;

  String lastname;

  String email;

  String phone;

  @JsonKey(unknownEnumValue: UserRolesEnum.artemisUnknown)
  UserRolesEnum role;

  String type;

  Me$Query$Me$Shipper shipper;

  @override
  List<Object> get props =>
      [id, companyId, firstname, lastname, email, phone, role, type, shipper];
  Map<String, dynamic> toJson() => _$Me$Query$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query with EquatableMixin {
  Me$Query();

  factory Me$Query.fromJson(Map<String, dynamic> json) =>
      _$Me$QueryFromJson(json);

  Me$Query$Me me;

  @override
  List<Object> get props => [me];
  Map<String, dynamic> toJson() => _$Me$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MeShort$Query$Me$Shipper with EquatableMixin {
  MeShort$Query$Me$Shipper();

  factory MeShort$Query$Me$Shipper.fromJson(Map<String, dynamic> json) =>
      _$MeShort$Query$Me$ShipperFromJson(json);

  String id;

  bool verified;

  String name;

  @override
  List<Object> get props => [id, verified, name];
  Map<String, dynamic> toJson() => _$MeShort$Query$Me$ShipperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MeShort$Query$Me with EquatableMixin {
  MeShort$Query$Me();

  factory MeShort$Query$Me.fromJson(Map<String, dynamic> json) =>
      _$MeShort$Query$MeFromJson(json);

  String id;

  String firstname;

  String lastname;

  @JsonKey(unknownEnumValue: UserRolesEnum.artemisUnknown)
  UserRolesEnum role;

  String type;

  MeShort$Query$Me$Shipper shipper;

  @override
  List<Object> get props => [id, firstname, lastname, role, type, shipper];
  Map<String, dynamic> toJson() => _$MeShort$Query$MeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MeShort$Query with EquatableMixin {
  MeShort$Query();

  factory MeShort$Query.fromJson(Map<String, dynamic> json) =>
      _$MeShort$QueryFromJson(json);

  MeShort$Query$Me me;

  @override
  List<Object> get props => [me];
  Map<String, dynamic> toJson() => _$MeShort$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Items$HandlingPiece with EquatableMixin {
  UserShipment$Query$UserShipment$Items$HandlingPiece();

  factory UserShipment$Query$UserShipment$Items$HandlingPiece.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Items$HandlingPieceFromJson(json);

  @JsonKey(
      name: 'piece_type', unknownEnumValue: ItemPieceTypesEnum.artemisUnknown)
  ItemPieceTypesEnum pieceType;

  @JsonKey(name: 'piece_count')
  int pieceCount;

  @override
  List<Object> get props => [pieceType, pieceCount];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Items$HandlingPieceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Items$Units with EquatableMixin {
  UserShipment$Query$UserShipment$Items$Units();

  factory UserShipment$Query$UserShipment$Items$Units.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Items$UnitsFromJson(json);

  @JsonKey(
      name: 'unit_type', unknownEnumValue: ItemUnitTypesEnum.artemisUnknown)
  ItemUnitTypesEnum unitType;

  @JsonKey(name: 'unit_count')
  int unitCount;

  @override
  List<Object> get props => [unitType, unitCount];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Items$UnitsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Items$Weight with EquatableMixin {
  UserShipment$Query$UserShipment$Items$Weight();

  factory UserShipment$Query$UserShipment$Items$Weight.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Items$WeightFromJson(json);

  int weight;

  @JsonKey(
      name: 'weight_unit', unknownEnumValue: WeightUnitTypesEnum.artemisUnknown)
  WeightUnitTypesEnum weightUnit;

  @override
  List<Object> get props => [weight, weightUnit];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Items$WeightToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Items with EquatableMixin {
  UserShipment$Query$UserShipment$Items();

  factory UserShipment$Query$UserShipment$Items.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$ItemsFromJson(json);

  String id;

  String description;

  @JsonKey(name: 'handling_piece')
  UserShipment$Query$UserShipment$Items$HandlingPiece handlingPiece;

  UserShipment$Query$UserShipment$Items$Units units;

  UserShipment$Query$UserShipment$Items$Weight weight;

  @override
  List<Object> get props => [id, description, handlingPiece, units, weight];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$ItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Trailer with EquatableMixin {
  UserShipment$Query$UserShipment$Trailer();

  factory UserShipment$Query$UserShipment$Trailer.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$TrailerFromJson(json);

  @JsonKey(name: 'temperature_max')
  int temperatureMax;

  @JsonKey(name: 'temperature_min')
  int temperatureMin;

  @JsonKey(
      name: 'temperature_unit',
      unknownEnumValue: TemperatureUnitsEnum.artemisUnknown)
  TemperatureUnitsEnum temperatureUnit;

  @override
  List<Object> get props => [temperatureMax, temperatureMin, temperatureUnit];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$TrailerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Offer$Bid with EquatableMixin {
  UserShipment$Query$UserShipment$Offer$Bid();

  factory UserShipment$Query$UserShipment$Offer$Bid.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Offer$BidFromJson(json);

  @JsonKey(unknownEnumValue: BidTypeEnum.artemisUnknown)
  BidTypeEnum type;

  String cents;

  @override
  List<Object> get props => [type, cents];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Offer$BidToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Offer with EquatableMixin {
  UserShipment$Query$UserShipment$Offer();

  factory UserShipment$Query$UserShipment$Offer.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$OfferFromJson(json);

  List<UserShipment$Query$UserShipment$Offer$Bid> bid;

  @override
  List<Object> get props => [bid];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$OfferToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Stops$LocationProfile$Address
    with EquatableMixin {
  UserShipment$Query$UserShipment$Stops$LocationProfile$Address();

  factory UserShipment$Query$UserShipment$Stops$LocationProfile$Address.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$AddressFromJson(
          json);

  String full;

  String state;

  String city;

  String street;

  @JsonKey(name: 'street_number')
  int streetNumber;

  @JsonKey(name: 'place_id')
  String placeId;

  @override
  List<Object> get props => [full, state, city, street, streetNumber, placeId];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$AddressToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates
    with EquatableMixin {
  UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates();

  factory UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$CoordinatesFromJson(
          json);

  double lat;

  double lng;

  @override
  List<Object> get props => [lat, lng];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$CoordinatesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact
    with EquatableMixin {
  UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact();

  factory UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContactFromJson(
          json);

  @JsonKey(name: 'contact_name')
  String contactName;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String email;

  @override
  List<Object> get props => [contactName, phoneNumber, email];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContactToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact
    with EquatableMixin {
  UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact();

  factory UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContactFromJson(
          json);

  @JsonKey(name: 'contact_name')
  String contactName;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String email;

  @override
  List<Object> get props => [contactName, phoneNumber, email];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContactToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Stops$LocationProfile
    with EquatableMixin {
  UserShipment$Query$UserShipment$Stops$LocationProfile();

  factory UserShipment$Query$UserShipment$Stops$LocationProfile.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfileFromJson(json);

  UserShipment$Query$UserShipment$Stops$LocationProfile$Address address;

  UserShipment$Query$UserShipment$Stops$LocationProfile$Coordinates coordinates;

  @JsonKey(name: 'scheduling_contact')
  UserShipment$Query$UserShipment$Stops$LocationProfile$SchedulingContact
      schedulingContact;

  @JsonKey(name: 'operational_contact')
  UserShipment$Query$UserShipment$Stops$LocationProfile$OperationalContact
      operationalContact;

  @override
  List<Object> get props =>
      [address, coordinates, schedulingContact, operationalContact];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$Stops$LocationProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment$Stops with EquatableMixin {
  UserShipment$Query$UserShipment$Stops();

  factory UserShipment$Query$UserShipment$Stops.fromJson(
          Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipment$StopsFromJson(json);

  String id;

  @JsonKey(name: 'location_profile_id')
  String locationProfileId;

  @JsonKey(unknownEnumValue: StopTypesEnum.artemisUnknown)
  StopTypesEnum type;

  @JsonKey(
      name: 'appointment_type',
      unknownEnumValue: AppointmentTypesEnum.artemisUnknown)
  AppointmentTypesEnum appointmentType;

  @JsonKey(name: 'start_time')
  String startTime;

  @JsonKey(name: 'end_time')
  String endTime;

  @JsonKey(name: 'location_profile')
  UserShipment$Query$UserShipment$Stops$LocationProfile locationProfile;

  @override
  List<Object> get props => [
        id,
        locationProfileId,
        type,
        appointmentType,
        startTime,
        endTime,
        locationProfile
      ];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipment$StopsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query$UserShipment with EquatableMixin {
  UserShipment$Query$UserShipment();

  factory UserShipment$Query$UserShipment.fromJson(Map<String, dynamic> json) =>
      _$UserShipment$Query$UserShipmentFromJson(json);

  String uuid;

  @JsonKey(name: 'short_name')
  String shortName;

  @JsonKey(name: 'shipper_id')
  String shipperId;

  @JsonKey(name: 'driver_id')
  String driverId;

  @JsonKey(name: 'carrier_id')
  String carrierId;

  @JsonKey(unknownEnumValue: ShipmentStatusEnum.artemisUnknown)
  ShipmentStatusEnum state;

  List<UserShipment$Query$UserShipment$Items> items;

  @JsonKey(
      name: 'requested_truck_types',
      unknownEnumValue: TruckTypesEnum.artemisUnknown)
  List<TruckTypesEnum> requestedTruckTypes;

  UserShipment$Query$UserShipment$Trailer trailer;

  @JsonKey(name: 'route_distance_miles')
  double routeDistanceMiles;

  @JsonKey(name: 'route_duration_minutes')
  int routeDurationMinutes;

  @JsonKey(name: 'load_description')
  String loadDescription;

  @JsonKey(unknownEnumValue: AccessorialsEnum.artemisUnknown)
  List<AccessorialsEnum> accessorials;

  UserShipment$Query$UserShipment$Offer offer;

  List<UserShipment$Query$UserShipment$Stops> stops;

  @override
  List<Object> get props => [
        uuid,
        shortName,
        shipperId,
        driverId,
        carrierId,
        state,
        items,
        requestedTruckTypes,
        trailer,
        routeDistanceMiles,
        routeDurationMinutes,
        loadDescription,
        accessorials,
        offer,
        stops
      ];
  Map<String, dynamic> toJson() =>
      _$UserShipment$Query$UserShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserShipment$Query with EquatableMixin {
  UserShipment$Query();

  factory UserShipment$Query.fromJson(Map<String, dynamic> json) =>
      _$UserShipment$QueryFromJson(json);

  UserShipment$Query$UserShipment userShipment;

  @override
  List<Object> get props => [userShipment];
  Map<String, dynamic> toJson() => _$UserShipment$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offers$Query$Offers$Data$Shipment with EquatableMixin {
  Offers$Query$Offers$Data$Shipment();

  factory Offers$Query$Offers$Data$Shipment.fromJson(
          Map<String, dynamic> json) =>
      _$Offers$Query$Offers$Data$ShipmentFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$Offers$Query$Offers$Data$ShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offers$Query$Offers$Data with EquatableMixin {
  Offers$Query$Offers$Data();

  factory Offers$Query$Offers$Data.fromJson(Map<String, dynamic> json) =>
      _$Offers$Query$Offers$DataFromJson(json);

  String id;

  Offers$Query$Offers$Data$Shipment shipment;

  @override
  List<Object> get props => [id, shipment];
  Map<String, dynamic> toJson() => _$Offers$Query$Offers$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offers$Query$Offers$PaginatorInfo with EquatableMixin {
  Offers$Query$Offers$PaginatorInfo();

  factory Offers$Query$Offers$PaginatorInfo.fromJson(
          Map<String, dynamic> json) =>
      _$Offers$Query$Offers$PaginatorInfoFromJson(json);

  int currentPage;

  int lastPage;

  int perPage;

  int total;

  int count;

  @override
  List<Object> get props => [currentPage, lastPage, perPage, total, count];
  Map<String, dynamic> toJson() =>
      _$Offers$Query$Offers$PaginatorInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offers$Query$Offers with EquatableMixin {
  Offers$Query$Offers();

  factory Offers$Query$Offers.fromJson(Map<String, dynamic> json) =>
      _$Offers$Query$OffersFromJson(json);

  List<Offers$Query$Offers$Data> data;

  Offers$Query$Offers$PaginatorInfo paginatorInfo;

  @override
  List<Object> get props => [data, paginatorInfo];
  Map<String, dynamic> toJson() => _$Offers$Query$OffersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offers$Query with EquatableMixin {
  Offers$Query();

  factory Offers$Query.fromJson(Map<String, dynamic> json) =>
      _$Offers$QueryFromJson(json);

  Offers$Query$Offers offers;

  @override
  List<Object> get props => [offers];
  Map<String, dynamic> toJson() => _$Offers$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteShipper$Mutation with EquatableMixin {
  DeleteShipper$Mutation();

  factory DeleteShipper$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteShipper$MutationFromJson(json);

  String deleteShipperUser;

  @override
  List<Object> get props => [deleteShipperUser];
  Map<String, dynamic> toJson() => _$DeleteShipper$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuote$Mutation$RequestShipmentQuote with EquatableMixin {
  GetQuote$Mutation$RequestShipmentQuote();

  factory GetQuote$Mutation$RequestShipmentQuote.fromJson(
          Map<String, dynamic> json) =>
      _$GetQuote$Mutation$RequestShipmentQuoteFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$GetQuote$Mutation$RequestShipmentQuoteToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuote$Mutation with EquatableMixin {
  GetQuote$Mutation();

  factory GetQuote$Mutation.fromJson(Map<String, dynamic> json) =>
      _$GetQuote$MutationFromJson(json);

  GetQuote$Mutation$RequestShipmentQuote requestShipmentQuote;

  @override
  List<Object> get props => [requestShipmentQuote];
  Map<String, dynamic> toJson() => _$GetQuote$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipperVerify$Mutation with EquatableMixin {
  ShipperVerify$Mutation();

  factory ShipperVerify$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ShipperVerify$MutationFromJson(json);

  String requestShipperDocumentVerification;

  @override
  List<Object> get props => [requestShipperDocumentVerification];
  Map<String, dynamic> toJson() => _$ShipperVerify$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUp$Mutation$CreateShipperUser with EquatableMixin {
  SignUp$Mutation$CreateShipperUser();

  factory SignUp$Mutation$CreateShipperUser.fromJson(
          Map<String, dynamic> json) =>
      _$SignUp$Mutation$CreateShipperUserFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$SignUp$Mutation$CreateShipperUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignUp$Mutation with EquatableMixin {
  SignUp$Mutation();

  factory SignUp$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignUp$MutationFromJson(json);

  SignUp$Mutation$CreateShipperUser createShipperUser;

  @override
  List<Object> get props => [createShipperUser];
  Map<String, dynamic> toJson() => _$SignUp$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddLocation$Mutation$AddLocation with EquatableMixin {
  AddLocation$Mutation$AddLocation();

  factory AddLocation$Mutation$AddLocation.fromJson(
          Map<String, dynamic> json) =>
      _$AddLocation$Mutation$AddLocationFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$AddLocation$Mutation$AddLocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddLocation$Mutation with EquatableMixin {
  AddLocation$Mutation();

  factory AddLocation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AddLocation$MutationFromJson(json);

  AddLocation$Mutation$AddLocation addLocation;

  @override
  List<Object> get props => [addLocation];
  Map<String, dynamic> toJson() => _$AddLocation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateLocationProfileInput with EquatableMixin {
  CreateLocationProfileInput(
      {@required this.locationName,
      @required this.coordinates,
      @required this.address,
      this.operationalContact,
      this.schedulingContact,
      this.notes});

  factory CreateLocationProfileInput.fromJson(Map<String, dynamic> json) =>
      _$CreateLocationProfileInputFromJson(json);

  @JsonKey(name: 'location_name')
  String locationName;

  CoordinatesInput coordinates;

  AddressInput address;

  @JsonKey(name: 'operational_contact')
  ContactInput operationalContact;

  @JsonKey(name: 'scheduling_contact')
  ContactInput schedulingContact;

  String notes;

  @override
  List<Object> get props => [
        locationName,
        coordinates,
        address,
        operationalContact,
        schedulingContact,
        notes
      ];
  Map<String, dynamic> toJson() => _$CreateLocationProfileInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateShipper$Mutation$UpdateShipper with EquatableMixin {
  UpdateShipper$Mutation$UpdateShipper();

  factory UpdateShipper$Mutation$UpdateShipper.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateShipper$Mutation$UpdateShipperFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$UpdateShipper$Mutation$UpdateShipperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateShipper$Mutation with EquatableMixin {
  UpdateShipper$Mutation();

  factory UpdateShipper$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateShipper$MutationFromJson(json);

  UpdateShipper$Mutation$UpdateShipper updateShipper;

  @override
  List<Object> get props => [updateShipper];
  Map<String, dynamic> toJson() => _$UpdateShipper$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateShipperInput with EquatableMixin {
  UpdateShipperInput(
      {this.address,
      this.billingAddress,
      this.primaryContact,
      this.billingContact});

  factory UpdateShipperInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateShipperInputFromJson(json);

  ShipperAddressInput address;

  @JsonKey(name: 'billing_address')
  BillingAddressInput billingAddress;

  @JsonKey(name: 'primary_contact')
  PrimaryContactInput primaryContact;

  @JsonKey(name: 'billing_contact')
  BillingContactInput billingContact;

  @override
  List<Object> get props =>
      [address, billingAddress, primaryContact, billingContact];
  Map<String, dynamic> toJson() => _$UpdateShipperInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipperAddressInput with EquatableMixin {
  ShipperAddressInput(
      {@required this.address,
      this.address2,
      @required this.city,
      @required this.state,
      @required this.zipCode});

  factory ShipperAddressInput.fromJson(Map<String, dynamic> json) =>
      _$ShipperAddressInputFromJson(json);

  String address;

  String address2;

  String city;

  String state;

  @JsonKey(name: 'zip_code')
  int zipCode;

  @override
  List<Object> get props => [address, address2, city, state, zipCode];
  Map<String, dynamic> toJson() => _$ShipperAddressInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BillingAddressInput with EquatableMixin {
  BillingAddressInput(
      {this.address, this.address2, this.city, this.state, this.zipCode});

  factory BillingAddressInput.fromJson(Map<String, dynamic> json) =>
      _$BillingAddressInputFromJson(json);

  String address;

  String address2;

  String city;

  String state;

  @JsonKey(name: 'zip_code')
  int zipCode;

  @override
  List<Object> get props => [address, address2, city, state, zipCode];
  Map<String, dynamic> toJson() => _$BillingAddressInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PrimaryContactInput with EquatableMixin {
  PrimaryContactInput({this.fullname, this.email, this.phone});

  factory PrimaryContactInput.fromJson(Map<String, dynamic> json) =>
      _$PrimaryContactInputFromJson(json);

  String fullname;

  String email;

  String phone;

  @override
  List<Object> get props => [fullname, email, phone];
  Map<String, dynamic> toJson() => _$PrimaryContactInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BillingContactInput with EquatableMixin {
  BillingContactInput({this.fullname, this.email, this.phone});

  factory BillingContactInput.fromJson(Map<String, dynamic> json) =>
      _$BillingContactInputFromJson(json);

  String fullname;

  String email;

  String phone;

  @override
  List<Object> get props => [fullname, email, phone];
  Map<String, dynamic> toJson() => _$BillingContactInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Bid$Carrier$Contact with EquatableMixin {
  Offer$Query$Offer$Bid$Carrier$Contact();

  factory Offer$Query$Offer$Bid$Carrier$Contact.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Bid$Carrier$ContactFromJson(json);

  String phone;

  @override
  List<Object> get props => [phone];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Bid$Carrier$ContactToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Bid$Carrier with EquatableMixin {
  Offer$Query$Offer$Bid$Carrier();

  factory Offer$Query$Offer$Bid$Carrier.fromJson(Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Bid$CarrierFromJson(json);

  String id;

  bool verified;

  String name;

  @JsonKey(name: 'mc_dot_number')
  String mcDotNumber;

  Offer$Query$Offer$Bid$Carrier$Contact contact;

  @override
  List<Object> get props => [id, verified, name, mcDotNumber, contact];
  Map<String, dynamic> toJson() => _$Offer$Query$Offer$Bid$CarrierToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Bid with EquatableMixin {
  Offer$Query$Offer$Bid();

  factory Offer$Query$Offer$Bid.fromJson(Map<String, dynamic> json) =>
      _$Offer$Query$Offer$BidFromJson(json);

  @JsonKey(unknownEnumValue: BidTypeEnum.artemisUnknown)
  BidTypeEnum type;

  String cents;

  @JsonKey(name: 'carrier_id')
  String carrierId;

  Offer$Query$Offer$Bid$Carrier carrier;

  @override
  List<Object> get props => [type, cents, carrierId, carrier];
  Map<String, dynamic> toJson() => _$Offer$Query$Offer$BidToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Shipper$Address with EquatableMixin {
  Offer$Query$Offer$Shipment$Shipper$Address();

  factory Offer$Query$Offer$Shipment$Shipper$Address.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Shipper$AddressFromJson(json);

  String address;

  @override
  List<Object> get props => [address];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Shipper$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Shipper$PrimaryContact with EquatableMixin {
  Offer$Query$Offer$Shipment$Shipper$PrimaryContact();

  factory Offer$Query$Offer$Shipment$Shipper$PrimaryContact.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Shipper$PrimaryContactFromJson(json);

  String fullname;

  String email;

  String phone;

  @override
  List<Object> get props => [fullname, email, phone];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Shipper$PrimaryContactToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Shipper with EquatableMixin {
  Offer$Query$Offer$Shipment$Shipper();

  factory Offer$Query$Offer$Shipment$Shipper.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$ShipperFromJson(json);

  String name;

  @JsonKey(name: 'tin_ein_number')
  String tinEinNumber;

  bool verified;

  Offer$Query$Offer$Shipment$Shipper$Address address;

  @JsonKey(name: 'primary_contact')
  Offer$Query$Offer$Shipment$Shipper$PrimaryContact primaryContact;

  @override
  List<Object> get props =>
      [name, tinEinNumber, verified, address, primaryContact];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$ShipperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Driver with EquatableMixin {
  Offer$Query$Offer$Shipment$Driver();

  factory Offer$Query$Offer$Shipment$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$DriverFromJson(json);

  String id;

  String firstname;

  @override
  List<Object> get props => [id, firstname];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Path$Coordinates with EquatableMixin {
  Offer$Query$Offer$Shipment$Path$Coordinates();

  factory Offer$Query$Offer$Shipment$Path$Coordinates.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Path$CoordinatesFromJson(json);

  double lat;

  double lng;

  @override
  List<Object> get props => [lat, lng];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Path$CoordinatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Path with EquatableMixin {
  Offer$Query$Offer$Shipment$Path();

  factory Offer$Query$Offer$Shipment$Path.fromJson(Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$PathFromJson(json);

  String id;

  @JsonKey(name: 'order_index')
  int orderIndex;

  Offer$Query$Offer$Shipment$Path$Coordinates coordinates;

  @JsonKey(name: 'created_at')
  String createdAt;

  @override
  List<Object> get props => [id, orderIndex, coordinates, createdAt];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$PathToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Rate with EquatableMixin {
  Offer$Query$Offer$Shipment$Rate();

  factory Offer$Query$Offer$Shipment$Rate.fromJson(Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$RateFromJson(json);

  String id;

  int rate;

  String comment;

  @override
  List<Object> get props => [id, rate, comment];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$RateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Trailer with EquatableMixin {
  Offer$Query$Offer$Shipment$Trailer();

  factory Offer$Query$Offer$Shipment$Trailer.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$TrailerFromJson(json);

  @JsonKey(name: 'temperature_max')
  int temperatureMax;

  @JsonKey(name: 'temperature_min')
  int temperatureMin;

  @JsonKey(
      name: 'temperature_unit',
      unknownEnumValue: TemperatureUnitsEnum.artemisUnknown)
  TemperatureUnitsEnum temperatureUnit;

  @override
  List<Object> get props => [temperatureMax, temperatureMin, temperatureUnit];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$TrailerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Items$HandlingPiece with EquatableMixin {
  Offer$Query$Offer$Shipment$Items$HandlingPiece();

  factory Offer$Query$Offer$Shipment$Items$HandlingPiece.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Items$HandlingPieceFromJson(json);

  @JsonKey(
      name: 'piece_type', unknownEnumValue: ItemPieceTypesEnum.artemisUnknown)
  ItemPieceTypesEnum pieceType;

  @JsonKey(name: 'piece_count')
  int pieceCount;

  @override
  List<Object> get props => [pieceType, pieceCount];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Items$HandlingPieceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Items$Units with EquatableMixin {
  Offer$Query$Offer$Shipment$Items$Units();

  factory Offer$Query$Offer$Shipment$Items$Units.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Items$UnitsFromJson(json);

  @JsonKey(
      name: 'unit_type', unknownEnumValue: ItemUnitTypesEnum.artemisUnknown)
  ItemUnitTypesEnum unitType;

  @JsonKey(name: 'unit_count')
  int unitCount;

  @override
  List<Object> get props => [unitType, unitCount];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Items$UnitsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Items$Weight with EquatableMixin {
  Offer$Query$Offer$Shipment$Items$Weight();

  factory Offer$Query$Offer$Shipment$Items$Weight.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Items$WeightFromJson(json);

  int weight;

  @JsonKey(
      name: 'weight_unit', unknownEnumValue: WeightUnitTypesEnum.artemisUnknown)
  WeightUnitTypesEnum weightUnit;

  @override
  List<Object> get props => [weight, weightUnit];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Items$WeightToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Items with EquatableMixin {
  Offer$Query$Offer$Shipment$Items();

  factory Offer$Query$Offer$Shipment$Items.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$ItemsFromJson(json);

  String id;

  @JsonKey(name: 'handling_piece')
  Offer$Query$Offer$Shipment$Items$HandlingPiece handlingPiece;

  Offer$Query$Offer$Shipment$Items$Units units;

  Offer$Query$Offer$Shipment$Items$Weight weight;

  String description;

  @override
  List<Object> get props => [id, handlingPiece, units, weight, description];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$ItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Documents with EquatableMixin {
  Offer$Query$Offer$Shipment$Documents();

  factory Offer$Query$Offer$Shipment$Documents.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$DocumentsFromJson(json);

  String id;

  @JsonKey(name: 'stop_id')
  String stopId;

  @JsonKey(name: 'shipment_uuid')
  String shipmentUuid;

  @JsonKey(name: 'carrier_id')
  String carrierId;

  @JsonKey(name: 'user_id')
  String userId;

  String url;

  String name;

  @JsonKey(name: 'file_type')
  String fileType;

  @JsonKey(name: 'mime_type')
  String mimeType;

  bool approved;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @override
  List<Object> get props => [
        id,
        stopId,
        shipmentUuid,
        carrierId,
        userId,
        url,
        name,
        fileType,
        mimeType,
        approved,
        createdAt,
        updatedAt
      ];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$DocumentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates
    with EquatableMixin {
  Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates();

  factory Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$CoordinatesFromJson(
          json);

  double lat;

  double lng;

  @override
  List<Object> get props => [lat, lng];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$CoordinatesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Stops$LocationProfile$Address
    with EquatableMixin {
  Offer$Query$Offer$Shipment$Stops$LocationProfile$Address();

  factory Offer$Query$Offer$Shipment$Stops$LocationProfile$Address.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$AddressFromJson(json);

  String full;

  String city;

  String state;

  String street;

  @JsonKey(name: 'street_number')
  int streetNumber;

  @JsonKey(name: 'place_id')
  String placeId;

  @override
  List<Object> get props => [full, city, state, street, streetNumber, placeId];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact
    with EquatableMixin {
  Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact();

  factory Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContactFromJson(
          json);

  @JsonKey(name: 'contact_name')
  String contactName;

  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String notes;

  @override
  List<Object> get props => [contactName, email, phoneNumber, notes];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContactToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact
    with EquatableMixin {
  Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact();

  factory Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContactFromJson(
          json);

  @JsonKey(name: 'contact_name')
  String contactName;

  String email;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  String notes;

  @override
  List<Object> get props => [contactName, email, phoneNumber, notes];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContactToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Stops$LocationProfile with EquatableMixin {
  Offer$Query$Offer$Shipment$Stops$LocationProfile();

  factory Offer$Query$Offer$Shipment$Stops$LocationProfile.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfileFromJson(json);

  @JsonKey(name: 'location_name')
  String locationName;

  Offer$Query$Offer$Shipment$Stops$LocationProfile$Coordinates coordinates;

  String notes;

  Offer$Query$Offer$Shipment$Stops$LocationProfile$Address address;

  @JsonKey(name: 'operational_contact')
  Offer$Query$Offer$Shipment$Stops$LocationProfile$OperationalContact
      operationalContact;

  @JsonKey(name: 'scheduling_contact')
  Offer$Query$Offer$Shipment$Stops$LocationProfile$SchedulingContact
      schedulingContact;

  @override
  List<Object> get props => [
        locationName,
        coordinates,
        notes,
        address,
        operationalContact,
        schedulingContact
      ];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$Stops$LocationProfileToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment$Stops with EquatableMixin {
  Offer$Query$Offer$Shipment$Stops();

  factory Offer$Query$Offer$Shipment$Stops.fromJson(
          Map<String, dynamic> json) =>
      _$Offer$Query$Offer$Shipment$StopsFromJson(json);

  String id;

  @JsonKey(name: 'order_index')
  int orderIndex;

  @JsonKey(
      name: 'appointment_type',
      unknownEnumValue: AppointmentTypesEnum.artemisUnknown)
  AppointmentTypesEnum appointmentType;

  @JsonKey(name: 'start_time')
  String startTime;

  @JsonKey(name: 'end_time')
  String endTime;

  @JsonKey(name: 'started_at')
  String startedAt;

  @JsonKey(name: 'completed_at')
  String completedAt;

  @JsonKey(unknownEnumValue: StopTypesEnum.artemisUnknown)
  StopTypesEnum type;

  @JsonKey(name: 'loading_type')
  String loadingType;

  @JsonKey(name: 'location_profile')
  Offer$Query$Offer$Shipment$Stops$LocationProfile locationProfile;

  @override
  List<Object> get props => [
        id,
        orderIndex,
        appointmentType,
        startTime,
        endTime,
        startedAt,
        completedAt,
        type,
        loadingType,
        locationProfile
      ];
  Map<String, dynamic> toJson() =>
      _$Offer$Query$Offer$Shipment$StopsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer$Shipment with EquatableMixin {
  Offer$Query$Offer$Shipment();

  factory Offer$Query$Offer$Shipment.fromJson(Map<String, dynamic> json) =>
      _$Offer$Query$Offer$ShipmentFromJson(json);

  String id;

  String uuid;

  @JsonKey(name: 'short_name')
  String shortName;

  Offer$Query$Offer$Shipment$Shipper shipper;

  Offer$Query$Offer$Shipment$Driver driver;

  @JsonKey(name: 'driver_id')
  String driverId;

  @JsonKey(name: 'carrier_id')
  String carrierId;

  @JsonKey(name: 'carrier_assigned')
  bool carrierAssigned;

  @JsonKey(name: 'driver_assigned')
  bool driverAssigned;

  @JsonKey(name: 'route_distance_miles')
  double routeDistanceMiles;

  @JsonKey(name: 'route_duration_minutes')
  int routeDurationMinutes;

  @JsonKey(
      name: 'requested_truck_types',
      unknownEnumValue: TruckTypesEnum.artemisUnknown)
  List<TruckTypesEnum> requestedTruckTypes;

  @JsonKey(unknownEnumValue: AccessorialsEnum.artemisUnknown)
  List<AccessorialsEnum> accessorials;

  @JsonKey(name: 'load_description')
  String loadDescription;

  @JsonKey(unknownEnumValue: ShipmentStatusEnum.artemisUnknown)
  ShipmentStatusEnum state;

  List<Offer$Query$Offer$Shipment$Path> path;

  Offer$Query$Offer$Shipment$Rate rate;

  Offer$Query$Offer$Shipment$Trailer trailer;

  List<Offer$Query$Offer$Shipment$Items> items;

  List<Offer$Query$Offer$Shipment$Documents> documents;

  List<Offer$Query$Offer$Shipment$Stops> stops;

  @override
  List<Object> get props => [
        id,
        uuid,
        shortName,
        shipper,
        driver,
        driverId,
        carrierId,
        carrierAssigned,
        driverAssigned,
        routeDistanceMiles,
        routeDurationMinutes,
        requestedTruckTypes,
        accessorials,
        loadDescription,
        state,
        path,
        rate,
        trailer,
        items,
        documents,
        stops
      ];
  Map<String, dynamic> toJson() => _$Offer$Query$Offer$ShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query$Offer with EquatableMixin {
  Offer$Query$Offer();

  factory Offer$Query$Offer.fromJson(Map<String, dynamic> json) =>
      _$Offer$Query$OfferFromJson(json);

  @JsonKey(name: 'carrier_accepted_bid')
  bool carrierAcceptedBid;

  String uuid;

  List<Offer$Query$Offer$Bid> bid;

  Offer$Query$Offer$Shipment shipment;

  @override
  List<Object> get props => [carrierAcceptedBid, uuid, bid, shipment];
  Map<String, dynamic> toJson() => _$Offer$Query$OfferToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Offer$Query with EquatableMixin {
  Offer$Query();

  factory Offer$Query.fromJson(Map<String, dynamic> json) =>
      _$Offer$QueryFromJson(json);

  Offer$Query$Offer offer;

  @override
  List<Object> get props => [offer];
  Map<String, dynamic> toJson() => _$Offer$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOffer$Mutation$UpdateShipment with EquatableMixin {
  UpdateOffer$Mutation$UpdateShipment();

  factory UpdateOffer$Mutation$UpdateShipment.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOffer$Mutation$UpdateShipmentFromJson(json);

  String id;

  String uuid;

  @override
  List<Object> get props => [id, uuid];
  Map<String, dynamic> toJson() =>
      _$UpdateOffer$Mutation$UpdateShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOffer$Mutation with EquatableMixin {
  UpdateOffer$Mutation();

  factory UpdateOffer$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateOffer$MutationFromJson(json);

  UpdateOffer$Mutation$UpdateShipment updateShipment;

  @override
  List<Object> get props => [updateShipment];
  Map<String, dynamic> toJson() => _$UpdateOffer$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateStopInput with EquatableMixin {
  CreateStopInput(
      {this.locationProfileId,
      @required this.appointmentType,
      @required this.startTime,
      this.endTime,
      @required this.type,
      @required this.loadingType,
      @required this.locationInput});

  factory CreateStopInput.fromJson(Map<String, dynamic> json) =>
      _$CreateStopInputFromJson(json);

  @JsonKey(name: 'location_profile_id')
  String locationProfileId;

  @JsonKey(
      name: 'appointment_type',
      unknownEnumValue: AppointmentTypesEnum.artemisUnknown)
  AppointmentTypesEnum appointmentType;

  @JsonKey(name: 'start_time')
  String startTime;

  @JsonKey(name: 'end_time')
  String endTime;

  @JsonKey(unknownEnumValue: StopTypesEnum.artemisUnknown)
  StopTypesEnum type;

  @JsonKey(
      name: 'loading_type', unknownEnumValue: LoadingTypesEnum.artemisUnknown)
  LoadingTypesEnum loadingType;

  @JsonKey(name: 'location_input')
  LocationInput locationInput;

  @override
  List<Object> get props => [
        locationProfileId,
        appointmentType,
        startTime,
        endTime,
        type,
        loadingType,
        locationInput
      ];
  Map<String, dynamic> toJson() => _$CreateStopInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LocationInput with EquatableMixin {
  LocationInput(
      {@required this.locationName,
      @required this.coordinates,
      @required this.address,
      this.operationalContact,
      this.schedulingContact,
      this.notes});

  factory LocationInput.fromJson(Map<String, dynamic> json) =>
      _$LocationInputFromJson(json);

  @JsonKey(name: 'location_name')
  String locationName;

  CoordinatesInput coordinates;

  AddressInput address;

  @JsonKey(name: 'operational_contact')
  ContactInput operationalContact;

  @JsonKey(name: 'scheduling_contact')
  ContactInput schedulingContact;

  String notes;

  @override
  List<Object> get props => [
        locationName,
        coordinates,
        address,
        operationalContact,
        schedulingContact,
        notes
      ];
  Map<String, dynamic> toJson() => _$LocationInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItemInput with EquatableMixin {
  ItemInput({this.description, this.handlingPiece, this.units, this.weight});

  factory ItemInput.fromJson(Map<String, dynamic> json) =>
      _$ItemInputFromJson(json);

  String description;

  @JsonKey(name: 'handling_piece')
  HandlingPieceInput handlingPiece;

  UnitInput units;

  WeightInput weight;

  @override
  List<Object> get props => [description, handlingPiece, units, weight];
  Map<String, dynamic> toJson() => _$ItemInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HandlingPieceInput with EquatableMixin {
  HandlingPieceInput({@required this.pieceType, @required this.pieceCount});

  factory HandlingPieceInput.fromJson(Map<String, dynamic> json) =>
      _$HandlingPieceInputFromJson(json);

  @JsonKey(
      name: 'piece_type', unknownEnumValue: ItemPieceTypesEnum.artemisUnknown)
  ItemPieceTypesEnum pieceType;

  @JsonKey(name: 'piece_count')
  int pieceCount;

  @override
  List<Object> get props => [pieceType, pieceCount];
  Map<String, dynamic> toJson() => _$HandlingPieceInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnitInput with EquatableMixin {
  UnitInput({@required this.unitType, @required this.unitCount});

  factory UnitInput.fromJson(Map<String, dynamic> json) =>
      _$UnitInputFromJson(json);

  @JsonKey(
      name: 'unit_type', unknownEnumValue: ItemUnitTypesEnum.artemisUnknown)
  ItemUnitTypesEnum unitType;

  @JsonKey(name: 'unit_count')
  int unitCount;

  @override
  List<Object> get props => [unitType, unitCount];
  Map<String, dynamic> toJson() => _$UnitInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WeightInput with EquatableMixin {
  WeightInput({@required this.weight, @required this.weightUnit});

  factory WeightInput.fromJson(Map<String, dynamic> json) =>
      _$WeightInputFromJson(json);

  int weight;

  @JsonKey(
      name: 'weight_unit', unknownEnumValue: WeightUnitTypesEnum.artemisUnknown)
  WeightUnitTypesEnum weightUnit;

  @override
  List<Object> get props => [weight, weightUnit];
  Map<String, dynamic> toJson() => _$WeightInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TrailerInput with EquatableMixin {
  TrailerInput(
      {@required this.temperatureMax,
      @required this.temperatureMin,
      @required this.temperatureUnit});

  factory TrailerInput.fromJson(Map<String, dynamic> json) =>
      _$TrailerInputFromJson(json);

  @JsonKey(name: 'temperature_max')
  int temperatureMax;

  @JsonKey(name: 'temperature_min')
  int temperatureMin;

  @JsonKey(
      name: 'temperature_unit',
      unknownEnumValue: TemperatureUnitsEnum.artemisUnknown)
  TemperatureUnitsEnum temperatureUnit;

  @override
  List<Object> get props => [temperatureMax, temperatureMin, temperatureUnit];
  Map<String, dynamic> toJson() => _$TrailerInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateShipmentInput with EquatableMixin {
  UpdateShipmentInput(
      {this.shortName,
      this.requestedTruckTypes,
      this.accessorials,
      this.loadDescription,
      this.routeDistanceMiles,
      this.routeDurationMinutes,
      this.stops,
      this.items,
      this.trailer});

  factory UpdateShipmentInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateShipmentInputFromJson(json);

  @JsonKey(name: 'short_name')
  String shortName;

  @JsonKey(
      name: 'requested_truck_types',
      unknownEnumValue: TruckTypesEnum.artemisUnknown)
  List<TruckTypesEnum> requestedTruckTypes;

  @JsonKey(unknownEnumValue: AccessorialsEnum.artemisUnknown)
  List<AccessorialsEnum> accessorials;

  @JsonKey(name: 'load_description')
  String loadDescription;

  @JsonKey(name: 'route_distance_miles')
  double routeDistanceMiles;

  @JsonKey(name: 'route_duration_minutes')
  int routeDurationMinutes;

  List<CreateStopInput> stops;

  List<ItemInput> items;

  TrailerInput trailer;

  @override
  List<Object> get props => [
        shortName,
        requestedTruckTypes,
        accessorials,
        loadDescription,
        routeDistanceMiles,
        routeDurationMinutes,
        stops,
        items,
        trailer
      ];
  Map<String, dynamic> toJson() => _$UpdateShipmentInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateShipment$Mutation$CreateOffer with EquatableMixin {
  CreateShipment$Mutation$CreateOffer();

  factory CreateShipment$Mutation$CreateOffer.fromJson(
          Map<String, dynamic> json) =>
      _$CreateShipment$Mutation$CreateOfferFromJson(json);

  String id;

  String uuid;

  @override
  List<Object> get props => [id, uuid];
  Map<String, dynamic> toJson() =>
      _$CreateShipment$Mutation$CreateOfferToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateShipment$Mutation with EquatableMixin {
  CreateShipment$Mutation();

  factory CreateShipment$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateShipment$MutationFromJson(json);

  CreateShipment$Mutation$CreateOffer createOffer;

  @override
  List<Object> get props => [createOffer];
  Map<String, dynamic> toJson() => _$CreateShipment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OfferInput with EquatableMixin {
  OfferInput({this.openPrice, this.shipment});

  factory OfferInput.fromJson(Map<String, dynamic> json) =>
      _$OfferInputFromJson(json);

  @JsonKey(name: 'open_price')
  int openPrice;

  CreateShipmentInput shipment;

  @override
  List<Object> get props => [openPrice, shipment];
  Map<String, dynamic> toJson() => _$OfferInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateShipmentInput with EquatableMixin {
  CreateShipmentInput(
      {this.shortName,
      @required this.requestedTruckTypes,
      this.accessorials,
      this.loadDescription,
      this.routeDistanceMiles,
      this.routeDurationMinutes,
      @required this.stops,
      this.items,
      this.trailer});

  factory CreateShipmentInput.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentInputFromJson(json);

  @JsonKey(name: 'short_name')
  String shortName;

  @JsonKey(
      name: 'requested_truck_types',
      unknownEnumValue: TruckTypesEnum.artemisUnknown)
  List<TruckTypesEnum> requestedTruckTypes;

  @JsonKey(unknownEnumValue: AccessorialsEnum.artemisUnknown)
  List<AccessorialsEnum> accessorials;

  @JsonKey(name: 'load_description')
  String loadDescription;

  @JsonKey(name: 'route_distance_miles')
  double routeDistanceMiles;

  @JsonKey(name: 'route_duration_minutes')
  int routeDurationMinutes;

  List<CreateStopInput> stops;

  List<ItemInput> items;

  TrailerInput trailer;

  @override
  List<Object> get props => [
        shortName,
        requestedTruckTypes,
        accessorials,
        loadDescription,
        routeDistanceMiles,
        routeDurationMinutes,
        stops,
        items,
        trailer
      ];
  Map<String, dynamic> toJson() => _$CreateShipmentInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RejectShipment$Mutation$RejectShipment with EquatableMixin {
  RejectShipment$Mutation$RejectShipment();

  factory RejectShipment$Mutation$RejectShipment.fromJson(
          Map<String, dynamic> json) =>
      _$RejectShipment$Mutation$RejectShipmentFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$RejectShipment$Mutation$RejectShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RejectShipment$Mutation with EquatableMixin {
  RejectShipment$Mutation();

  factory RejectShipment$Mutation.fromJson(Map<String, dynamic> json) =>
      _$RejectShipment$MutationFromJson(json);

  RejectShipment$Mutation$RejectShipment rejectShipment;

  @override
  List<Object> get props => [rejectShipment];
  Map<String, dynamic> toJson() => _$RejectShipment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BookShipment$Mutation$AcceptAdminPrice with EquatableMixin {
  BookShipment$Mutation$AcceptAdminPrice();

  factory BookShipment$Mutation$AcceptAdminPrice.fromJson(
          Map<String, dynamic> json) =>
      _$BookShipment$Mutation$AcceptAdminPriceFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$BookShipment$Mutation$AcceptAdminPriceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BookShipment$Mutation with EquatableMixin {
  BookShipment$Mutation();

  factory BookShipment$Mutation.fromJson(Map<String, dynamic> json) =>
      _$BookShipment$MutationFromJson(json);

  BookShipment$Mutation$AcceptAdminPrice acceptAdminPrice;

  @override
  List<Object> get props => [acceptAdminPrice];
  Map<String, dynamic> toJson() => _$BookShipment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignCarrierToShipment$Mutation$AssignCarrierToShipment
    with EquatableMixin {
  AssignCarrierToShipment$Mutation$AssignCarrierToShipment();

  factory AssignCarrierToShipment$Mutation$AssignCarrierToShipment.fromJson(
          Map<String, dynamic> json) =>
      _$AssignCarrierToShipment$Mutation$AssignCarrierToShipmentFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$AssignCarrierToShipment$Mutation$AssignCarrierToShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignCarrierToShipment$Mutation with EquatableMixin {
  AssignCarrierToShipment$Mutation();

  factory AssignCarrierToShipment$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$AssignCarrierToShipment$MutationFromJson(json);

  AssignCarrierToShipment$Mutation$AssignCarrierToShipment
      assignCarrierToShipment;

  @override
  List<Object> get props => [assignCarrierToShipment];
  Map<String, dynamic> toJson() =>
      _$AssignCarrierToShipment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment
    with EquatableMixin {
  UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment();

  factory UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment.fromJson(
          Map<String, dynamic> json) =>
      _$UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipmentFromJson(
          json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipmentToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UnAssignCarrierToShipment$Mutation with EquatableMixin {
  UnAssignCarrierToShipment$Mutation();

  factory UnAssignCarrierToShipment$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$UnAssignCarrierToShipment$MutationFromJson(json);

  UnAssignCarrierToShipment$Mutation$UnAssignCarrierFromShipment
      unAssignCarrierFromShipment;

  @override
  List<Object> get props => [unAssignCarrierFromShipment];
  Map<String, dynamic> toJson() =>
      _$UnAssignCarrierToShipment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens
    with EquatableMixin {
  UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens();

  factory UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokensFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() =>
      _$UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokensToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserDeviceTokens$Mutation with EquatableMixin {
  UpdateUserDeviceTokens$Mutation();

  factory UpdateUserDeviceTokens$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDeviceTokens$MutationFromJson(json);

  UpdateUserDeviceTokens$Mutation$UpdateUserDeviceTokens updateUserDeviceTokens;

  @override
  List<Object> get props => [updateUserDeviceTokens];
  Map<String, dynamic> toJson() =>
      _$UpdateUserDeviceTokens$MutationToJson(this);
}

enum NotificationsTypeEnum {
  @JsonValue('QUOTE_REQUESTED')
  quoteRequested,
  @JsonValue('PRICE_DEFINED')
  priceDefined,
  @JsonValue('PRICE_ACCEPTED')
  priceAccepted,
  @JsonValue('CARRIER_ACCEPTED_OFFER')
  carrierAcceptedOffer,
  @JsonValue('CARRIER_ASSIGNED')
  carrierAssigned,
  @JsonValue('DRIVER_ASSIGNED')
  driverAssigned,
  @JsonValue('SHIPMENT_DISPATCHED')
  shipmentDispatched,
  @JsonValue('SHIPMENT_REJECTED')
  shipmentRejected,
  @JsonValue('SHIPMENT_AT_PICKUP')
  shipmentAtPickup,
  @JsonValue('SHIPMENT_IN_TRANSIT')
  shipmentInTransit,
  @JsonValue('SHIPMENT_AT_DROPOFF')
  shipmentAtDropoff,
  @JsonValue('SHIPMENT_DELIVERED')
  shipmentDelivered,
  @JsonValue('SHIPMENT_FINISHED')
  shipmentFinished,
  @JsonValue('SHIPMENT_COMPLETED')
  shipmentCompleted,
  @JsonValue('COMPANY_DOCUMENT_VERIFICATION_REQUESTED')
  companyDocumentVerificationRequested,
  @JsonValue('PAYMENT_IN_PROGRESS')
  paymentInProgress,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum TruckTypesEnum {
  @JsonValue('DRY_VAN')
  dryVan,
  @JsonValue('REEFER')
  reefer,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum BidTypeEnum {
  @JsonValue('OPEN_PRICE')
  openPrice,
  @JsonValue('ADMIN_PRICE')
  adminPrice,
  @JsonValue('SHIPPER_PRICE')
  shipperPrice,
  @JsonValue('BID')
  bid,
  @JsonValue('ACCEPT')
  accept,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ShipmentStatusEnum {
  @JsonValue('CREATED')
  created,
  @JsonValue('REQUEST_IN_PROGRESS')
  requestInProgress,
  @JsonValue('REJECTED_BY_SHIPPER')
  rejectedByShipper,
  @JsonValue('PRICE_DEFINED')
  priceDefined,
  @JsonValue('PRICE_ACCEPTED')
  priceAccepted,
  @JsonValue('UNASSIGNED')
  unassigned,
  @JsonValue('CARRIER_ASSIGNED')
  carrierAssigned,
  @JsonValue('DRIVER_ASSIGNED')
  driverAssigned,
  @JsonValue('DISPATCHED')
  dispatched,
  @JsonValue('AT_PICKUP')
  atPickup,
  @JsonValue('IN_TRANSIT')
  inTransit,
  @JsonValue('AT_DELIVERY')
  atDelivery,
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('PENDING')
  pending,
  @JsonValue('FINISHED')
  finished,
  @JsonValue('PAYMENT_IN_PROGRESS')
  paymentInProgress,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('ALERTS')
  alerts,
  @JsonValue('EXCEPTIONS')
  exceptions,
  @JsonValue('WARNINGS')
  warnings,
  @JsonValue('ALL')
  all,
  @JsonValue('ARCHIVED')
  archived,
  @JsonValue('TRASH')
  trash,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum UserRolesEnum {
  @JsonValue('ALL')
  all,
  @JsonValue('CARRIER_DRIVER')
  carrierDriver,
  @JsonValue('CARRIER_OWNER_OPERATOR')
  carrierOwnerOperator,
  @JsonValue('CARRIER_DISPATCH_OFFICE')
  carrierDispatchOffice,
  @JsonValue('CARRIER_DISPATCH_DRIVER')
  carrierDispatchDriver,
  @JsonValue('SHIPPER')
  shipper,
  @JsonValue('SHIPPER_ASSISTANT')
  shipperAssistant,
  @JsonValue('ADMIN')
  admin,
  @JsonValue('ADMIN_ASSISTANT')
  adminAssistant,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum AppointmentTypesEnum {
  @JsonValue('FIRST_COME_FIRST_TAKE')
  firstComeFirstTake,
  @JsonValue('ALREADY_MADE')
  alreadyMade,
  @JsonValue('TO_BE_MADE')
  toBeMade,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum StopTypesEnum {
  @JsonValue('PICKUP')
  pickup,
  @JsonValue('RETURN')
  kw$RETURN,
  @JsonValue('DROPOFF')
  dropoff,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ItemPieceTypesEnum {
  @JsonValue('PALLETS')
  pallets,
  @JsonValue('PALLETS_OVERSIZE')
  palletsOversize,
  @JsonValue('BAGS')
  bags,
  @JsonValue('BALES')
  bales,
  @JsonValue('BOXES')
  boxes,
  @JsonValue('BUNDLES')
  bundles,
  @JsonValue('CONTAINERS')
  containers,
  @JsonValue('CRATES')
  crates,
  @JsonValue('ROLLS')
  rolls,
  @JsonValue('TOTES')
  totes,
  @JsonValue('OTHER')
  other,
  @JsonValue('NOT_PACKAGE')
  notPackage,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ItemUnitTypesEnum {
  @JsonValue('UNITS')
  units,
  @JsonValue('CASES')
  cases,
  @JsonValue('CASE_EQUIVALENTS')
  caseEquivalents,
  @JsonValue('KEGS')
  kegs,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum WeightUnitTypesEnum {
  @JsonValue('LB')
  lb,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum TemperatureUnitsEnum {
  @JsonValue('F')
  f,
  @JsonValue('C')
  c,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum AccessorialsEnum {
  @JsonValue('DRIVER_ASSIST')
  driverAssist,
  @JsonValue('FOOD_GRADE_TRAILER')
  foodGradeTrailer,
  @JsonValue('LOAD_BARS_LOAD_LOCKS')
  loadBarsLoadLocks,
  @JsonValue('PIPE_STAKES')
  pipeStakes,
  @JsonValue('PPE')
  ppe,
  @JsonValue('STRAPS')
  straps,
  @JsonValue('TWIC_REQUIRED')
  twicRequired,
  @JsonValue('FOOD_GRADE')
  foodGrade,
  @JsonValue('TRAILER_10_YEARS_OR_NEWER')
  trailer10YearsOrNewer,
  @JsonValue('LOAD_BARS')
  loadBars,
  @JsonValue('SHIPPER_REQUIRES_MASK_GLOVES')
  shipperRequiresMaskGloves,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum SortTypesEnum {
  @JsonValue('CREATED_AT')
  createdAt,
  @JsonValue('UPDATED_AT')
  updatedAt,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum LoadingTypesEnum {
  @JsonValue('LIVE')
  live,
  @JsonValue('EMPTY_TRAILER')
  emptyTrailer,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class UpdateShipperUserArguments extends JsonSerializable with EquatableMixin {
  UpdateShipperUserArguments(
      {@required this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.phone});

  @override
  factory UpdateShipperUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateShipperUserArgumentsFromJson(json);

  final String id;

  final String firstname;

  final String lastname;

  final String email;

  final String phone;

  @override
  List<Object> get props => [id, firstname, lastname, email, phone];
  @override
  Map<String, dynamic> toJson() => _$UpdateShipperUserArgumentsToJson(this);
}

class UpdateShipperUserMutation extends GraphQLQuery<UpdateShipperUser$Mutation,
    UpdateShipperUserArguments> {
  UpdateShipperUserMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'updateShipperUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'firstname')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'lastname')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'phone')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'updateShipperUser'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id'))),
                ArgumentNode(
                    name: NameNode(value: 'firstname'),
                    value: VariableNode(name: NameNode(value: 'firstname'))),
                ArgumentNode(
                    name: NameNode(value: 'lastname'),
                    value: VariableNode(name: NameNode(value: 'lastname'))),
                ArgumentNode(
                    name: NameNode(value: 'email'),
                    value: VariableNode(name: NameNode(value: 'email'))),
                ArgumentNode(
                    name: NameNode(value: 'phone'),
                    value: VariableNode(name: NameNode(value: 'phone')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'updateShipperUser';

  @override
  final UpdateShipperUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateShipperUser$Mutation parse(Map<String, dynamic> json) =>
      UpdateShipperUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendOtpArguments extends JsonSerializable with EquatableMixin {
  SendOtpArguments({@required this.phone});

  @override
  factory SendOtpArguments.fromJson(Map<String, dynamic> json) =>
      _$SendOtpArgumentsFromJson(json);

  final String phone;

  @override
  List<Object> get props => [phone];
  @override
  Map<String, dynamic> toJson() => _$SendOtpArgumentsToJson(this);
}

class SendOtpMutation extends GraphQLQuery<SendOtp$Mutation, SendOtpArguments> {
  SendOtpMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'sendOtp'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'phone')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'requestPhoneVerification'),
              alias: NameNode(value: 'result'),
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'phone'),
                    value: VariableNode(name: NameNode(value: 'phone')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'sendOtp';

  @override
  final SendOtpArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SendOtp$Mutation parse(Map<String, dynamic> json) =>
      SendOtp$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NotificationsArguments extends JsonSerializable with EquatableMixin {
  NotificationsArguments({@required this.first, this.page, this.unread});

  @override
  factory NotificationsArguments.fromJson(Map<String, dynamic> json) =>
      _$NotificationsArgumentsFromJson(json);

  final int first;

  final int page;

  final bool unread;

  @override
  List<Object> get props => [first, page, unread];
  @override
  Map<String, dynamic> toJson() => _$NotificationsArgumentsToJson(this);
}

class NotificationsQuery
    extends GraphQLQuery<Notifications$Query, NotificationsArguments> {
  NotificationsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'notifications'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'first')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'page')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'unread')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'userNotifications'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: VariableNode(name: NameNode(value: 'first'))),
                ArgumentNode(
                    name: NameNode(value: 'page'),
                    value: VariableNode(name: NameNode(value: 'page'))),
                ArgumentNode(
                    name: NameNode(value: 'unread'),
                    value: VariableNode(name: NameNode(value: 'unread')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'data'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'data'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'title'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'body'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'created_at'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'read_at'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'paginatorInfo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'currentPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'lastPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'perPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'total'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'count'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'notifications';

  @override
  final NotificationsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Notifications$Query parse(Map<String, dynamic> json) =>
      Notifications$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NotificationSubsciptionArguments extends JsonSerializable
    with EquatableMixin {
  NotificationSubsciptionArguments({this.subscribed});

  @override
  factory NotificationSubsciptionArguments.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationSubsciptionArgumentsFromJson(json);

  final bool subscribed;

  @override
  List<Object> get props => [subscribed];
  @override
  Map<String, dynamic> toJson() =>
      _$NotificationSubsciptionArgumentsToJson(this);
}

class NotificationSubsciptionQuery extends GraphQLQuery<
    NotificationSubsciption$Query, NotificationSubsciptionArguments> {
  NotificationSubsciptionQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'notificationSubsciption'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'subscribed')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'userNotificationSubscriptions'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'subscribed'),
                    value: VariableNode(name: NameNode(value: 'subscribed')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'channel'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'is_subscribed'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'notificationSubsciption';

  @override
  final NotificationSubsciptionArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  NotificationSubsciption$Query parse(Map<String, dynamic> json) =>
      NotificationSubsciption$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SubscribeNotificationArguments extends JsonSerializable
    with EquatableMixin {
  SubscribeNotificationArguments({@required this.type, @required this.channel});

  @override
  factory SubscribeNotificationArguments.fromJson(Map<String, dynamic> json) =>
      _$SubscribeNotificationArgumentsFromJson(json);

  @JsonKey(unknownEnumValue: NotificationsTypeEnum.artemisUnknown)
  final NotificationsTypeEnum type;

  final String channel;

  @override
  List<Object> get props => [type, channel];
  @override
  Map<String, dynamic> toJson() => _$SubscribeNotificationArgumentsToJson(this);
}

class SubscribeNotificationMutation extends GraphQLQuery<
    SubscribeNotification$Mutation, SubscribeNotificationArguments> {
  SubscribeNotificationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'subscribeNotification'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'type')),
              type: NamedTypeNode(
                  name: NameNode(value: 'NotificationsTypeEnum'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'channel')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'subscribeNotification'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'type'),
                    value: VariableNode(name: NameNode(value: 'type'))),
                ArgumentNode(
                    name: NameNode(value: 'channel'),
                    value: VariableNode(name: NameNode(value: 'channel')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'subscribeNotification';

  @override
  final SubscribeNotificationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SubscribeNotification$Mutation parse(Map<String, dynamic> json) =>
      SubscribeNotification$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UnSubscribeNotificationArguments extends JsonSerializable
    with EquatableMixin {
  UnSubscribeNotificationArguments(
      {@required this.type, @required this.channel});

  @override
  factory UnSubscribeNotificationArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UnSubscribeNotificationArgumentsFromJson(json);

  @JsonKey(unknownEnumValue: NotificationsTypeEnum.artemisUnknown)
  final NotificationsTypeEnum type;

  final String channel;

  @override
  List<Object> get props => [type, channel];
  @override
  Map<String, dynamic> toJson() =>
      _$UnSubscribeNotificationArgumentsToJson(this);
}

class UnSubscribeNotificationMutation extends GraphQLQuery<
    UnSubscribeNotification$Mutation, UnSubscribeNotificationArguments> {
  UnSubscribeNotificationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'unSubscribeNotification'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'type')),
              type: NamedTypeNode(
                  name: NameNode(value: 'NotificationsTypeEnum'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'channel')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'unSubscribeNotification'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'type'),
                    value: VariableNode(name: NameNode(value: 'type'))),
                ArgumentNode(
                    name: NameNode(value: 'channel'),
                    value: VariableNode(name: NameNode(value: 'channel')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'unSubscribeNotification';

  @override
  final UnSubscribeNotificationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UnSubscribeNotification$Mutation parse(Map<String, dynamic> json) =>
      UnSubscribeNotification$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class EditLocationArguments extends JsonSerializable with EquatableMixin {
  EditLocationArguments({@required this.id, @required this.input});

  @override
  factory EditLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$EditLocationArgumentsFromJson(json);

  final String id;

  final UpdateLocationProfileInput input;

  @override
  List<Object> get props => [id, input];
  @override
  Map<String, dynamic> toJson() => _$EditLocationArgumentsToJson(this);
}

class EditLocationMutation
    extends GraphQLQuery<EditLocation$Mutation, EditLocationArguments> {
  EditLocationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'editLocation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'UpdateLocationProfileInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'editLocation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id'))),
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'editLocation';

  @override
  final EditLocationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  EditLocation$Mutation parse(Map<String, dynamic> json) =>
      EditLocation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UserShipmentsArguments extends JsonSerializable with EquatableMixin {
  UserShipmentsArguments(
      {this.requested_truck_types,
      this.states,
      @required this.first,
      this.page});

  @override
  factory UserShipmentsArguments.fromJson(Map<String, dynamic> json) =>
      _$UserShipmentsArgumentsFromJson(json);

  @JsonKey(unknownEnumValue: TruckTypesEnum.artemisUnknown)
  final List<TruckTypesEnum> requested_truck_types;

  @JsonKey(unknownEnumValue: ShipmentStatusEnum.artemisUnknown)
  final List<ShipmentStatusEnum> states;

  final int first;

  final int page;

  @override
  List<Object> get props => [requested_truck_types, states, first, page];
  @override
  Map<String, dynamic> toJson() => _$UserShipmentsArgumentsToJson(this);
}

class UserShipmentsQuery
    extends GraphQLQuery<UserShipments$Query, UserShipmentsArguments> {
  UserShipmentsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'userShipments'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable:
                  VariableNode(name: NameNode(value: 'requested_truck_types')),
              type: ListTypeNode(
                  type: NamedTypeNode(
                      name: NameNode(value: 'TruckTypesEnum'), isNonNull: true),
                  isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'states')),
              type: ListTypeNode(
                  type: NamedTypeNode(
                      name: NameNode(value: 'ShipmentStatusEnum'),
                      isNonNull: true),
                  isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'first')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'page')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'userShipments'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'requested_truck_types'),
                    value: VariableNode(
                        name: NameNode(value: 'requested_truck_types'))),
                ArgumentNode(
                    name: NameNode(value: 'states'),
                    value: VariableNode(name: NameNode(value: 'states'))),
                ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: VariableNode(name: NameNode(value: 'first'))),
                ArgumentNode(
                    name: NameNode(value: 'page'),
                    value: VariableNode(name: NameNode(value: 'page')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'data'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'uuid'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'state'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'short_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'route_distance_miles'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'route_duration_minutes'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'requested_truck_types'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'offer'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'bid'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'type'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'cents'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'carrier'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'id'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ]))
                                ])),
                            FieldNode(
                                name: NameNode(value: 'shipment'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'carrier_id'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'driver'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'firstname'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ]))
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: 'stops'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'start_time'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'end_time'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'location_profile'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'coordinates'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'lat'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'lng'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'address'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'full'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'city'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'state'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'street'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ]))
                                ]))
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'paginatorInfo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'count'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'currentPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'hasMorePages'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'firstItem'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'lastItem'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'lastPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'perPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'total'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'userShipments';

  @override
  final UserShipmentsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UserShipments$Query parse(Map<String, dynamic> json) =>
      UserShipments$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddShipperArguments extends JsonSerializable with EquatableMixin {
  AddShipperArguments(
      {@required this.firstname,
      @required this.lastname,
      this.email,
      @required this.phone});

  @override
  factory AddShipperArguments.fromJson(Map<String, dynamic> json) =>
      _$AddShipperArgumentsFromJson(json);

  final String firstname;

  final String lastname;

  final String email;

  final String phone;

  @override
  List<Object> get props => [firstname, lastname, email, phone];
  @override
  Map<String, dynamic> toJson() => _$AddShipperArgumentsToJson(this);
}

class AddShipperMutation
    extends GraphQLQuery<AddShipper$Mutation, AddShipperArguments> {
  AddShipperMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'addShipper'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'firstname')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'lastname')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'phone')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'addShipperUser'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'firstname'),
                    value: VariableNode(name: NameNode(value: 'firstname'))),
                ArgumentNode(
                    name: NameNode(value: 'lastname'),
                    value: VariableNode(name: NameNode(value: 'lastname'))),
                ArgumentNode(
                    name: NameNode(value: 'email'),
                    value: VariableNode(name: NameNode(value: 'email'))),
                ArgumentNode(
                    name: NameNode(value: 'phone'),
                    value: VariableNode(name: NameNode(value: 'phone')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'addShipper';

  @override
  final AddShipperArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddShipper$Mutation parse(Map<String, dynamic> json) =>
      AddShipper$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetEstimationArguments extends JsonSerializable with EquatableMixin {
  GetEstimationArguments({@required this.locations});

  @override
  factory GetEstimationArguments.fromJson(Map<String, dynamic> json) =>
      _$GetEstimationArgumentsFromJson(json);

  final List<LocationCollectionInput> locations;

  @override
  List<Object> get props => [locations];
  @override
  Map<String, dynamic> toJson() => _$GetEstimationArgumentsToJson(this);
}

class GetEstimationQuery
    extends GraphQLQuery<GetEstimation$Query, GetEstimationArguments> {
  GetEstimationQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getEstimation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'locations')),
              type: ListTypeNode(
                  type: NamedTypeNode(
                      name: NameNode(value: 'LocationCollectionInput'),
                      isNonNull: false),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'getEstimations'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'locations'),
                    value: VariableNode(name: NameNode(value: 'locations')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'route_distance_miles'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'route_duration_minutes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getEstimation';

  @override
  final GetEstimationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetEstimation$Query parse(Map<String, dynamic> json) =>
      GetEstimation$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UserLocationsArguments extends JsonSerializable with EquatableMixin {
  UserLocationsArguments({this.name, @required this.first, this.page});

  @override
  factory UserLocationsArguments.fromJson(Map<String, dynamic> json) =>
      _$UserLocationsArgumentsFromJson(json);

  final String name;

  final int first;

  final int page;

  @override
  List<Object> get props => [name, first, page];
  @override
  Map<String, dynamic> toJson() => _$UserLocationsArgumentsToJson(this);
}

class UserLocationsQuery
    extends GraphQLQuery<UserLocations$Query, UserLocationsArguments> {
  UserLocationsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'userLocations'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'first')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'page')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'shipperLocationProfiles'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'name'),
                    value: VariableNode(name: NameNode(value: 'name'))),
                ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: VariableNode(name: NameNode(value: 'first'))),
                ArgumentNode(
                    name: NameNode(value: 'page'),
                    value: VariableNode(name: NameNode(value: 'page')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'data'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shipper_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'location_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'address'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'full'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'city'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'state'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'coordinates'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'lat'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'lng'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'operational_contact'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'contact_name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'email'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'phone_number'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'notes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'scheduling_contact'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'contact_name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'email'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'phone_number'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'notes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'paginatorInfo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'count'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'currentPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'hasMorePages'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'firstItem'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'lastItem'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'lastPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'perPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'total'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'userLocations';

  @override
  final UserLocationsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UserLocations$Query parse(Map<String, dynamic> json) =>
      UserLocations$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteLocationArguments extends JsonSerializable with EquatableMixin {
  DeleteLocationArguments({@required this.id});

  @override
  factory DeleteLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteLocationArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteLocationArgumentsToJson(this);
}

class DeleteLocationMutation
    extends GraphQLQuery<DeleteLocation$Mutation, DeleteLocationArguments> {
  DeleteLocationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'deleteLocation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'deleteLocation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'deleteLocation';

  @override
  final DeleteLocationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  DeleteLocation$Mutation parse(Map<String, dynamic> json) =>
      DeleteLocation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignInArguments extends JsonSerializable with EquatableMixin {
  SignInArguments({@required this.phone, @required this.otp});

  @override
  factory SignInArguments.fromJson(Map<String, dynamic> json) =>
      _$SignInArgumentsFromJson(json);

  final String phone;

  final String otp;

  @override
  List<Object> get props => [phone, otp];
  @override
  Map<String, dynamic> toJson() => _$SignInArgumentsToJson(this);
}

class SignInMutation extends GraphQLQuery<SignIn$Mutation, SignInArguments> {
  SignInMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'signIn'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'phone')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'otp')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'verifyPhone'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'phone'),
                    value: VariableNode(name: NameNode(value: 'phone'))),
                ArgumentNode(
                    name: NameNode(value: 'otp'),
                    value: VariableNode(name: NameNode(value: 'otp'))),
                ArgumentNode(
                    name: NameNode(value: 'remember_me'),
                    value: BooleanValueNode(value: true))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'access_token'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'expires_at'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'signIn';

  @override
  final SignInArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SignIn$Mutation parse(Map<String, dynamic> json) =>
      SignIn$Mutation.fromJson(json);
}

class MeQuery extends GraphQLQuery<Me$Query, JsonSerializable> {
  MeQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'me'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'me'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'company_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'firstname'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'lastname'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'phone'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'role'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shipper'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'verified'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'tin_ein_number'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'address'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'address'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'address2'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'city'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'state'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'zip_code'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'primary_contact'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'fullname'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'email'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'phone'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'billing_contact'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'fullname'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'email'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'phone'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'billing_address'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'address'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'address2'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'city'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'state'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'zip_code'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'users'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'firstname'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'lastname'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'email'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'phone'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'role'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'meta'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'miles'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'me';

  @override
  List<Object> get props => [document, operationName];
  @override
  Me$Query parse(Map<String, dynamic> json) => Me$Query.fromJson(json);
}

class MeShortQuery extends GraphQLQuery<MeShort$Query, JsonSerializable> {
  MeShortQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'meShort'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'me'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'firstname'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'lastname'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'role'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shipper'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'verified'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'meShort';

  @override
  List<Object> get props => [document, operationName];
  @override
  MeShort$Query parse(Map<String, dynamic> json) =>
      MeShort$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UserShipmentArguments extends JsonSerializable with EquatableMixin {
  UserShipmentArguments({this.id, this.uuid});

  @override
  factory UserShipmentArguments.fromJson(Map<String, dynamic> json) =>
      _$UserShipmentArgumentsFromJson(json);

  final String id;

  final String uuid;

  @override
  List<Object> get props => [id, uuid];
  @override
  Map<String, dynamic> toJson() => _$UserShipmentArgumentsToJson(this);
}

class UserShipmentQuery
    extends GraphQLQuery<UserShipment$Query, UserShipmentArguments> {
  UserShipmentQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'userShipment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'userShipment'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id'))),
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'short_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shipper_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'driver_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'carrier_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'state'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'items'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'description'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'handling_piece'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'piece_type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'piece_count'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'units'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'unit_type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'unit_count'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'weight'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'weight'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'weight_unit'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'requested_truck_types'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'trailer'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'temperature_max'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'temperature_min'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'temperature_unit'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'route_distance_miles'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'route_duration_minutes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'load_description'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'accessorials'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'offer'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'bid'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'cents'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'stops'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'location_profile_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'type'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'appointment_type'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'start_time'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'end_time'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'location_profile'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'address'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'full'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'state'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'city'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'street'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'street_number'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'place_id'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'coordinates'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'lat'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'lng'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'scheduling_contact'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'contact_name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'phone_number'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'email'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'operational_contact'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'contact_name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'phone_number'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'email'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'userShipment';

  @override
  final UserShipmentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UserShipment$Query parse(Map<String, dynamic> json) =>
      UserShipment$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class OffersArguments extends JsonSerializable with EquatableMixin {
  OffersArguments(
      {@required this.first,
      this.page,
      this.shipper_id,
      this.sort,
      this.state});

  @override
  factory OffersArguments.fromJson(Map<String, dynamic> json) =>
      _$OffersArgumentsFromJson(json);

  final int first;

  final int page;

  final String shipper_id;

  @JsonKey(unknownEnumValue: SortTypesEnum.artemisUnknown)
  final SortTypesEnum sort;

  @JsonKey(unknownEnumValue: ShipmentStatusEnum.artemisUnknown)
  final ShipmentStatusEnum state;

  @override
  List<Object> get props => [first, page, shipper_id, sort, state];
  @override
  Map<String, dynamic> toJson() => _$OffersArgumentsToJson(this);
}

class OffersQuery extends GraphQLQuery<Offers$Query, OffersArguments> {
  OffersQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'offers'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'first')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'page')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'shipper_id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'sort')),
              type: NamedTypeNode(
                  name: NameNode(value: 'SortTypesEnum'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'state')),
              type: NamedTypeNode(
                  name: NameNode(value: 'ShipmentStatusEnum'),
                  isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'offers'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: VariableNode(name: NameNode(value: 'first'))),
                ArgumentNode(
                    name: NameNode(value: 'page'),
                    value: VariableNode(name: NameNode(value: 'page'))),
                ArgumentNode(
                    name: NameNode(value: 'shipper_id'),
                    value: VariableNode(name: NameNode(value: 'shipper_id'))),
                ArgumentNode(
                    name: NameNode(value: 'sort'),
                    value: VariableNode(name: NameNode(value: 'sort'))),
                ArgumentNode(
                    name: NameNode(value: 'state'),
                    value: VariableNode(name: NameNode(value: 'state')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'data'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shipment'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'paginatorInfo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'currentPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'lastPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'perPage'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'total'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'count'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'offers';

  @override
  final OffersArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Offers$Query parse(Map<String, dynamic> json) => Offers$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteShipperArguments extends JsonSerializable with EquatableMixin {
  DeleteShipperArguments({@required this.id});

  @override
  factory DeleteShipperArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteShipperArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteShipperArgumentsToJson(this);
}

class DeleteShipperMutation
    extends GraphQLQuery<DeleteShipper$Mutation, DeleteShipperArguments> {
  DeleteShipperMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'deleteShipper'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'deleteShipperUser'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'user_id'),
                    value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'deleteShipper';

  @override
  final DeleteShipperArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  DeleteShipper$Mutation parse(Map<String, dynamic> json) =>
      DeleteShipper$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetQuoteArguments extends JsonSerializable with EquatableMixin {
  GetQuoteArguments({@required this.uuid});

  @override
  factory GetQuoteArguments.fromJson(Map<String, dynamic> json) =>
      _$GetQuoteArgumentsFromJson(json);

  final String uuid;

  @override
  List<Object> get props => [uuid];
  @override
  Map<String, dynamic> toJson() => _$GetQuoteArgumentsToJson(this);
}

class GetQuoteMutation
    extends GraphQLQuery<GetQuote$Mutation, GetQuoteArguments> {
  GetQuoteMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'getQuote'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'requestShipmentQuote'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'getQuote';

  @override
  final GetQuoteArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetQuote$Mutation parse(Map<String, dynamic> json) =>
      GetQuote$Mutation.fromJson(json);
}

class ShipperVerifyMutation
    extends GraphQLQuery<ShipperVerify$Mutation, JsonSerializable> {
  ShipperVerifyMutation();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'shipperVerify'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'requestShipperDocumentVerification'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'shipperVerify';

  @override
  List<Object> get props => [document, operationName];
  @override
  ShipperVerify$Mutation parse(Map<String, dynamic> json) =>
      ShipperVerify$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignUpArguments extends JsonSerializable with EquatableMixin {
  SignUpArguments(
      {@required this.company_name,
      @required this.email,
      @required this.firstname,
      @required this.lastname,
      @required this.phone,
      @required this.tin_ein_number,
      this.applied_tc_version});

  @override
  factory SignUpArguments.fromJson(Map<String, dynamic> json) =>
      _$SignUpArgumentsFromJson(json);

  final String company_name;

  final String email;

  final String firstname;

  final String lastname;

  final String phone;

  final String tin_ein_number;

  final double applied_tc_version;

  @override
  List<Object> get props => [
        company_name,
        email,
        firstname,
        lastname,
        phone,
        tin_ein_number,
        applied_tc_version
      ];
  @override
  Map<String, dynamic> toJson() => _$SignUpArgumentsToJson(this);
}

class SignUpMutation extends GraphQLQuery<SignUp$Mutation, SignUpArguments> {
  SignUpMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'signUp'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'company_name')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'firstname')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'lastname')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'phone')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'tin_ein_number')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable:
                  VariableNode(name: NameNode(value: 'applied_tc_version')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Float'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createShipperUser'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'company_name'),
                    value: VariableNode(name: NameNode(value: 'company_name'))),
                ArgumentNode(
                    name: NameNode(value: 'email'),
                    value: VariableNode(name: NameNode(value: 'email'))),
                ArgumentNode(
                    name: NameNode(value: 'firstname'),
                    value: VariableNode(name: NameNode(value: 'firstname'))),
                ArgumentNode(
                    name: NameNode(value: 'lastname'),
                    value: VariableNode(name: NameNode(value: 'lastname'))),
                ArgumentNode(
                    name: NameNode(value: 'phone'),
                    value: VariableNode(name: NameNode(value: 'phone'))),
                ArgumentNode(
                    name: NameNode(value: 'tin_ein_number'),
                    value:
                        VariableNode(name: NameNode(value: 'tin_ein_number'))),
                ArgumentNode(
                    name: NameNode(value: 'applied_tc_version'),
                    value: VariableNode(
                        name: NameNode(value: 'applied_tc_version')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'signUp';

  @override
  final SignUpArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SignUp$Mutation parse(Map<String, dynamic> json) =>
      SignUp$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddLocationArguments extends JsonSerializable with EquatableMixin {
  AddLocationArguments({@required this.input});

  @override
  factory AddLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$AddLocationArgumentsFromJson(json);

  final CreateLocationProfileInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$AddLocationArgumentsToJson(this);
}

class AddLocationMutation
    extends GraphQLQuery<AddLocation$Mutation, AddLocationArguments> {
  AddLocationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'addLocation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'CreateLocationProfileInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'addLocation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'addLocation';

  @override
  final AddLocationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddLocation$Mutation parse(Map<String, dynamic> json) =>
      AddLocation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateShipperArguments extends JsonSerializable with EquatableMixin {
  UpdateShipperArguments({@required this.input});

  @override
  factory UpdateShipperArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateShipperArgumentsFromJson(json);

  final UpdateShipperInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UpdateShipperArgumentsToJson(this);
}

class UpdateShipperMutation
    extends GraphQLQuery<UpdateShipper$Mutation, UpdateShipperArguments> {
  UpdateShipperMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'updateShipper'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'UpdateShipperInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'updateShipper'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'updateShipper';

  @override
  final UpdateShipperArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateShipper$Mutation parse(Map<String, dynamic> json) =>
      UpdateShipper$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class OfferArguments extends JsonSerializable with EquatableMixin {
  OfferArguments({this.uuid});

  @override
  factory OfferArguments.fromJson(Map<String, dynamic> json) =>
      _$OfferArgumentsFromJson(json);

  final String uuid;

  @override
  List<Object> get props => [uuid];
  @override
  Map<String, dynamic> toJson() => _$OfferArgumentsToJson(this);
}

class OfferQuery extends GraphQLQuery<Offer$Query, OfferArguments> {
  OfferQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Offer'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'offer'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'carrier_accepted_bid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'bid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'type'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'cents'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'carrier_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'carrier'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'verified'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'mc_dot_number'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'contact'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'phone'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'shipment'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'uuid'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'short_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shipper'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'tin_ein_number'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'verified'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'address'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'address'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'primary_contact'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'fullname'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'email'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'phone'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ])),
                      FieldNode(
                          name: NameNode(value: 'driver'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'firstname'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'driver_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'carrier_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'carrier_assigned'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'driver_assigned'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'route_distance_miles'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'route_duration_minutes'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'requested_truck_types'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'accessorials'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'load_description'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'state'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'path'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'order_index'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'coordinates'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'lat'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'lng'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'created_at'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'rate'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'rate'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'comment'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'trailer'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'temperature_max'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'temperature_min'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'temperature_unit'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'items'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'handling_piece'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'piece_type'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'piece_count'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'units'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'unit_type'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'unit_count'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'weight'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'weight'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'weight_unit'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'description'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'documents'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'stop_id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'shipment_uuid'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'carrier_id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'user_id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'url'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'file_type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'mime_type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'approved'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'created_at'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'updated_at'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'stops'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'order_index'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'appointment_type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'start_time'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'end_time'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'started_at'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'completed_at'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'loading_type'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'location_profile'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'location_name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'coordinates'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'lat'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'lng'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(value: 'notes'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'address'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name: NameNode(value: 'full'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'city'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'state'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'street'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(
                                                value: 'street_number'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'place_id'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name: NameNode(
                                          value: 'operational_contact'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name:
                                                NameNode(value: 'contact_name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'email'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name:
                                                NameNode(value: 'phone_number'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'notes'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ])),
                                  FieldNode(
                                      name:
                                          NameNode(value: 'scheduling_contact'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet:
                                          SelectionSetNode(selections: [
                                        FieldNode(
                                            name:
                                                NameNode(value: 'contact_name'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'email'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name:
                                                NameNode(value: 'phone_number'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null),
                                        FieldNode(
                                            name: NameNode(value: 'notes'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null)
                                      ]))
                                ]))
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Offer';

  @override
  final OfferArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Offer$Query parse(Map<String, dynamic> json) => Offer$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateOfferArguments extends JsonSerializable with EquatableMixin {
  UpdateOfferArguments({@required this.uuid, @required this.shipment});

  @override
  factory UpdateOfferArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateOfferArgumentsFromJson(json);

  final String uuid;

  final UpdateShipmentInput shipment;

  @override
  List<Object> get props => [uuid, shipment];
  @override
  Map<String, dynamic> toJson() => _$UpdateOfferArgumentsToJson(this);
}

class UpdateOfferMutation
    extends GraphQLQuery<UpdateOffer$Mutation, UpdateOfferArguments> {
  UpdateOfferMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'updateOffer'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'shipment')),
              type: NamedTypeNode(
                  name: NameNode(value: 'UpdateShipmentInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'updateShipment'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid'))),
                ArgumentNode(
                    name: NameNode(value: 'shipment'),
                    value: VariableNode(name: NameNode(value: 'shipment')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'updateOffer';

  @override
  final UpdateOfferArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateOffer$Mutation parse(Map<String, dynamic> json) =>
      UpdateOffer$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateShipmentArguments extends JsonSerializable with EquatableMixin {
  CreateShipmentArguments({@required this.input});

  @override
  factory CreateShipmentArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentArgumentsFromJson(json);

  final OfferInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateShipmentArgumentsToJson(this);
}

class CreateShipmentMutation
    extends GraphQLQuery<CreateShipment$Mutation, CreateShipmentArguments> {
  CreateShipmentMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateShipment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'OfferInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createOffer'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'input'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'uuid'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateShipment';

  @override
  final CreateShipmentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateShipment$Mutation parse(Map<String, dynamic> json) =>
      CreateShipment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RejectShipmentArguments extends JsonSerializable with EquatableMixin {
  RejectShipmentArguments({@required this.uuid});

  @override
  factory RejectShipmentArguments.fromJson(Map<String, dynamic> json) =>
      _$RejectShipmentArgumentsFromJson(json);

  final String uuid;

  @override
  List<Object> get props => [uuid];
  @override
  Map<String, dynamic> toJson() => _$RejectShipmentArgumentsToJson(this);
}

class RejectShipmentMutation
    extends GraphQLQuery<RejectShipment$Mutation, RejectShipmentArguments> {
  RejectShipmentMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'rejectShipment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'rejectShipment'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'rejectShipment';

  @override
  final RejectShipmentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  RejectShipment$Mutation parse(Map<String, dynamic> json) =>
      RejectShipment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class BookShipmentArguments extends JsonSerializable with EquatableMixin {
  BookShipmentArguments({@required this.uuid});

  @override
  factory BookShipmentArguments.fromJson(Map<String, dynamic> json) =>
      _$BookShipmentArgumentsFromJson(json);

  final String uuid;

  @override
  List<Object> get props => [uuid];
  @override
  Map<String, dynamic> toJson() => _$BookShipmentArgumentsToJson(this);
}

class BookShipmentMutation
    extends GraphQLQuery<BookShipment$Mutation, BookShipmentArguments> {
  BookShipmentMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'bookShipment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'acceptAdminPrice'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'bookShipment';

  @override
  final BookShipmentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  BookShipment$Mutation parse(Map<String, dynamic> json) =>
      BookShipment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AssignCarrierToShipmentArguments extends JsonSerializable
    with EquatableMixin {
  AssignCarrierToShipmentArguments(
      {@required this.uuid, @required this.carrier_id});

  @override
  factory AssignCarrierToShipmentArguments.fromJson(
          Map<String, dynamic> json) =>
      _$AssignCarrierToShipmentArgumentsFromJson(json);

  final String uuid;

  final String carrier_id;

  @override
  List<Object> get props => [uuid, carrier_id];
  @override
  Map<String, dynamic> toJson() =>
      _$AssignCarrierToShipmentArgumentsToJson(this);
}

class AssignCarrierToShipmentMutation extends GraphQLQuery<
    AssignCarrierToShipment$Mutation, AssignCarrierToShipmentArguments> {
  AssignCarrierToShipmentMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'AssignCarrierToShipment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'carrier_id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'assignCarrierToShipment'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid'))),
                ArgumentNode(
                    name: NameNode(value: 'carrier_id'),
                    value: VariableNode(name: NameNode(value: 'carrier_id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'AssignCarrierToShipment';

  @override
  final AssignCarrierToShipmentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AssignCarrierToShipment$Mutation parse(Map<String, dynamic> json) =>
      AssignCarrierToShipment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UnAssignCarrierToShipmentArguments extends JsonSerializable
    with EquatableMixin {
  UnAssignCarrierToShipmentArguments(
      {@required this.uuid, @required this.carrier_id});

  @override
  factory UnAssignCarrierToShipmentArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UnAssignCarrierToShipmentArgumentsFromJson(json);

  final String uuid;

  final String carrier_id;

  @override
  List<Object> get props => [uuid, carrier_id];
  @override
  Map<String, dynamic> toJson() =>
      _$UnAssignCarrierToShipmentArgumentsToJson(this);
}

class UnAssignCarrierToShipmentMutation extends GraphQLQuery<
    UnAssignCarrierToShipment$Mutation, UnAssignCarrierToShipmentArguments> {
  UnAssignCarrierToShipmentMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'UnAssignCarrierToShipment'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'uuid')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'carrier_id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'unAssignCarrierFromShipment'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'uuid'),
                    value: VariableNode(name: NameNode(value: 'uuid'))),
                ArgumentNode(
                    name: NameNode(value: 'carrier_id'),
                    value: VariableNode(name: NameNode(value: 'carrier_id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'UnAssignCarrierToShipment';

  @override
  final UnAssignCarrierToShipmentArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UnAssignCarrierToShipment$Mutation parse(Map<String, dynamic> json) =>
      UnAssignCarrierToShipment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserDeviceTokensArguments extends JsonSerializable
    with EquatableMixin {
  UpdateUserDeviceTokensArguments({@required this.token});

  @override
  factory UpdateUserDeviceTokensArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDeviceTokensArgumentsFromJson(json);

  final String token;

  @override
  List<Object> get props => [token];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUserDeviceTokensArgumentsToJson(this);
}

class UpdateUserDeviceTokensMutation extends GraphQLQuery<
    UpdateUserDeviceTokens$Mutation, UpdateUserDeviceTokensArguments> {
  UpdateUserDeviceTokensMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'updateUserDeviceTokens'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'token')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'updateUserDeviceTokens'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'token'),
                    value: VariableNode(name: NameNode(value: 'token')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'updateUserDeviceTokens';

  @override
  final UpdateUserDeviceTokensArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateUserDeviceTokens$Mutation parse(Map<String, dynamic> json) =>
      UpdateUserDeviceTokens$Mutation.fromJson(json);
}

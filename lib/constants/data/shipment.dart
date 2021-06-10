class GqlOffer {
  static String offersSearch = '''
  query (\$first: Int!, \$page: Int, \$offer_id: [ID!]) {
    offersSearch(first: \$first, page: \$page, offer_id: \$offer_id) {
      paginatorInfo {
        count
        currentPage
        firstItem
        total
        hasMorePages
      }
      data {
        carrier_accepted_bid
        bid {
          type
          cents
        }
        shipment {
          id
          uuid
          shipper_id
          state
          driver_assigned
          route_distance_miles
          route_duration_minutes
          requested_truck_types
          load_description
          short_name
          stops {
            id
            start_time
            end_time
            location_profile {
              location_name
              address {
                full
                city
                state
              }
            }
          }
          shipper {
            name
            tin_ein_number
          }
        }
      }
    }
  }
  ''';

  static String offer = '''
  query (\$uuid: String) {
    me {
      id
    }
    company: userCarrier {
      id
      verified
      users {
        id
        firstname
        lastname
        email
        phone
        role
        meta {
          miles
          minutes
          completed_shipment
        }
      }
    }
    offer(uuid: \$uuid) {
      carrier_accepted_bid
      uuid
      bid {
        type
        cents
        carrier_id
      }
      shipment {
        id
        uuid
        short_name
        shipper {
          name
          tin_ein_number
          address {
            address
          }
          primary_contact {
            fullname
            email
            phone
          }
        }
        driver_id
        carrier_id
        carrier_assigned
        driver_assigned
        route_distance_miles
        route_duration_minutes
        requested_truck_types
        accessorials
        load_description
        state
        path {
          id
          order_index
          coordinates {
            lat
            lng
          }
          created_at
        }
        rate {
          id
          rate
          comment
        }
        trailer {
          temperature_max
          temperature_min
          temperature_unit
        }
        items {
          id
          handling_piece {
            piece_type
            piece_count
          }
          units {
            unit_type
            unit_count
          }
          weight {
            weight
            weight_unit
          }
          description
        }
        documents {
          id
          stop_id
          shipment_uuid
          carrier_id
          user_id
          url
          name
          file_type
          mime_type
          approved
          created_at
          updated_at
        }
        stops {
          id
          order_index
          appointment_type
          start_time
          end_time
          started_at
          completed_at
          type
          loading_type
          location_profile {
            location_name
            coordinates {
              lat
              lng
            }
            notes
            address {
              full
              city
              state
              street
              street_number
              place_id
            }
            operational_contact {
              contact_name
              email
              phone_number
              notes
            }
            scheduling_contact {
              contact_name
              email
              phone_number
              notes
            }
          }
        }
      }
    }
  }
  ''';

  static String acceptOffer = '''
  mutation(\$uuid: String!) {
    acceptOffer(uuid: \$uuid) {
      id
    }
  }
  ''';

  static String assignDriverToShipment = '''
  mutation(\$uuid: String!, \$user_id: ID!) {
    assignDriverToShipment(uuid: \$uuid, user_id: \$user_id) {
      uuid
    }
  }
  ''';

  static String unAssignDriverFromShipment = '''
  mutation(\$uuid: String!, \$user_id: ID!) {
    unAssignDriverFromShipment(uuid: \$uuid, user_id: \$user_id) {
      uuid
    }
  }
  ''';

  static String setShipmentDispatched = '''
  mutation(\$uuid: String!) {
    setShipmentDispatched(uuid: \$uuid) {
      uuid
    }
  }
  ''';

  static String startJob = '''
  mutation(\$stop_id: ID!) {
    startJob(stop_id: \$stop_id) {
      id
    }
  }
  ''';

  static String completeJob = '''
  mutation(\$stop_id: ID!) {
    completeJob(stop_id: \$stop_id) {
      id
    }
  }
  ''';

  static String uploadShipmentDocument = '''
  mutation(\$uuid: String!, \$stop_id: ID!, \$file: Upload!, \$type: ShipmentDocumentTypesEnum!, \$name: String!) {
    uploadShipmentDocument(uuid: \$uuid, stop_id: \$stop_id, file: \$file, type: \$type, name: \$name) {
      id
    }
  }
  ''';
}

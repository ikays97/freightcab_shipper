class CarrierAddress {
  String state;
  String city;
  int zipCode;
  String address;
  String address2;

  CarrierAddress({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    state = json['state'] ?? '';
    city = json['city'] ?? '';
    zipCode = json['zip_code'] ?? 0;
    address = json['address'] ?? '';
    address2 = json['address2'] ?? '';
  }

  static Map<String, String> states = {
    'FL': 'Florida',
    'NH': 'New Hampshire',
    'MI': 'Michigan',
    'VT': 'Vermont',
    'ME': 'Maine',
    'RI': 'Rhode Island',
    'NY': 'New York',
    'PA': 'Pennsylvania',
    'NJ': 'New Jersey',
    'DE': 'Delaware',
    'MD': 'Maryland',
    'VA': 'Virginia',
    'WV': 'West Virginia',
    'OH': 'Ohio',
    'IN': 'Indiana',
    'IL': 'Illinois',
    'CT': 'Connecticut',
    'WI': 'Wisconsin',
    'NC': 'North Carolina',
    'DC': 'Washington DC',
    'MA': 'Massachusetts',
    'TN': 'Tennessee',
    'AR': 'Arkansas',
    'MO': 'Missouri',
    'GA': 'Georgia',
    'SC': 'South Carolina',
    'KY': 'Kentucky',
    'AL': 'Alabama',
    'LS': 'Louisiana',
    'MS': 'Mississippi',
    'IA': 'Iowa',
    'MN': 'Minnesota',
    'OK': 'Oklahoma',
    'TX': 'Texas',
    'NM': 'New Mexico',
    'KS': 'Kansas',
    'NE': 'Nebraska',
    'SD': 'South Dakota',
    'ND': 'North Dakota',
    'WY': 'Wyoming',
    'MT': 'Montana',
    'CO': 'Colorado',
    'ID': 'Idaho',
    'UT': 'Utah',
    'AZ': 'Arizona',
    'NV': 'Nevada',
    'OR': 'Oregon',
    'WA': 'Washington',
    'CA': 'California',
  };
}

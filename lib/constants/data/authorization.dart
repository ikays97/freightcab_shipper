class Authorization {
  static String updateUserDeviceTokens = '''
  mutation(\$token: String!) {
    updateUserDeviceTokens(token: \$token) {
      id
      device_tokens
    }
  }
  ''';
}
import 'dart:async';
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";
import 'package:graphql/client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

final graphqlClient = GraphQLClient(
  cache: GraphQLCache(store: InMemoryStore()),
  link: AuthLinkMy(
    getToken: () => SharedPreferences.getInstance().then((prefs) {
      final token = prefs.getString('token');
      return token != null ? 'Bearer $token' : null;
    }, onError: (e) => null),
  ).concat(
    // HttpLink('http://192.168.31.139/graphql'),
    HttpLink('https://api.freightcab.com/graphql'),
  ),
);

String uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final String typeName = object['__typename'] as String;
    final String id = object['id']?.toString();
    if (typeName != null && id != null) {
      return <String>[typeName, id].join('/');
    }
  }
  return null;
}

class AuthLinkMy extends Link {
  AuthLinkMy({
    @required this.getToken,
    this.headerKey = 'Authorization',
  });

  /// Authentication callback. Note – must include prefixes, e.g. `'Bearer $token'`
  final FutureOr<String> Function() getToken;

  /// Header key to set to the result of [getToken]
  final String headerKey;

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) async* {
    final token = await getToken();
    if (token != null) {
      request = request.updateContextEntry<HttpLinkHeaders>(
        (headers) => HttpLinkHeaders(
          headers: <String, String>{
            ...headers?.headers ?? <String, String>{},
            headerKey: token,
          },
        ),
      );
    }
    if (forward != null) {
      yield* forward(request);
    }
  }
}

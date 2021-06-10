class Notification {
  String id;
  String title;
  String body;
  DateTime readAt;
  DateTime createdAt;

  Notification({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    id = json['id'] ?? '';
    title = json['data']['title'] ?? '';
    body = json['data']['body'] ?? '';
    readAt = DateTime.tryParse(json['read_at'] ?? '');
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
  }
}

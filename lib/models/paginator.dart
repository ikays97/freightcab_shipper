class Paginator {
  int count;
  int currentPage;
  int firstItem;
  bool hasMorePages;
  int lastItem;
  int lastPage;
  int perPage;
  int total;

  Paginator({Map<String, dynamic> json}) {
    if (json == null) {
      return;
    }

    count = json['count'] ?? 0;
    currentPage = json['currentPage'];
    firstItem = json['firstItem'];
    hasMorePages = json['hasMorePages'] ?? false;
    lastItem = json['lastItem'] ?? 0;
    lastPage = json['lastPage'] ?? 0;
    perPage = json['perPage'] ?? 0;
    total = json['total'] ?? 0;
  }
}

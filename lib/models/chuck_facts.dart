class ChuckFacts {
  final String iconUrl;
  final String id;
  final String url;
  final String value;

  ChuckFacts({this.iconUrl, this.id, this.url, this.value});

  @override
  String toString() {
    return 'ChuckFacts{iconUrl: $iconUrl, id: $id, url: $url, value: $value}';
  }
}
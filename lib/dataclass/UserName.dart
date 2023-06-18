class Username {
  final String name;
  Username({required this.name});

  factory Username.fromJson(Map<String, dynamic> json) {
    return Username(
      name: json['name'] as String,
    );
  }
}

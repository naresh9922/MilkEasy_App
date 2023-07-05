class Username {
  final String name;
  final String email;
  Username({required this.name, required this.email});

  factory Username.fromJson(Map<String, dynamic> json) {
    return Username(
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}

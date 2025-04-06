// User class
class User {
  final int id;
  final String firstName;
  final String lastName;
  final Hair hair;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.hair,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      hair: Hair.fromJson(json['hair']),
    );
  }

  // Method to convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'hair': hair.toJson(),
    };
  }
}

// Hair class (for nested hair object)
class Hair {
  final String color;
  final String type;

  Hair({
    required this.color,
    required this.type,
  });

  // Factory constructor to create a Hair from JSON
  factory Hair.fromJson(Map<String, dynamic> json) {
    return Hair(
      color: json['color'],
      type: json['type'],
    );
  }

  // Method to convert Hair to JSON
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'type': type,
    };
  }
}

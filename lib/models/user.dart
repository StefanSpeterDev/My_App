class User {
  String firstName;
  String lastName;
  int age;
  int id;

  User({this.firstName, this.lastName, this.age, this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstname'],
      lastName: json['lastname'],
      age: json['age'],
      id: json['id']
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "age": age,
  };

}
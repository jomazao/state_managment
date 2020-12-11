class User {
  String name;
  String lastName;
  String document;
  String documentId;

  User({
    this.name,
    this.lastName,
    this.document,
    this.documentId,
  });

  factory User.fromMap(Map<String, dynamic> map, String documentId) {
    return User(
      name: map['name'],
      lastName: map['lastName'],
      document: map['last'],
      documentId: documentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'document': document,
    };
  }
}

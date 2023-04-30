class PatientModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photoUrl;

  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
    };
  }

  PatientModel.fromMap(Map<String, dynamic> addressMap)
      : id = addressMap['id'],
        name = addressMap['name'],
        email = addressMap['email'],
        phone = addressMap['phone'],
        photoUrl = addressMap['photoUrl'];
}

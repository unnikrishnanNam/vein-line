class DoctorModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final int? experience;
  final String? photoUrl;
  final String? certificate;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.experience,
    required this.photoUrl,
    required this.certificate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'experience': experience,
      'photoUrl': photoUrl,
      'certificate': certificate,
    };
  }

  DoctorModel.fromMap(Map<String, dynamic> addressMap)
      : id = addressMap['id'],
        name = addressMap['name'],
        email = addressMap['email'],
        phone = addressMap['phone'],
        experience = addressMap['experience'],
        photoUrl = addressMap['photoUrl'],
        certificate = addressMap['certificate'];
}

class Uzivatel {
  String? email; // Email address
  String? firstName; // First name
  String? lastName; // Last name
  DateTime? dateOfBirth; // Date of birth
  String? phoneNumber; // Phone number
  String profilePhoto; // Profile photo URL

  Uzivatel({
    this.email,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.profilePhoto = 'assets/images/profilepicturedefault.jpg', // Default profile photo
  });

  // Convert Uzivatel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'profilePhoto': profilePhoto,
    };
  }

  // Create Uzivatel from Firestore document
  factory Uzivatel.fromFirestore(Map<String, dynamic> data) {
    return Uzivatel(
      email: data['email'] as String?,
      firstName: data['firstName'] as String?,
      lastName: data['lastName'] as String?,
      dateOfBirth: data['dateOfBirth'] != null
          ? DateTime.parse(data['dateOfBirth'])
          : null,
      phoneNumber: data['phoneNumber'] as String?,
      profilePhoto: data['profilePhoto'] as String? ?? '',
    );
  }
}

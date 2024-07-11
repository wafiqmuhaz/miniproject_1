// class User dan class terkait (Alamat, Geolokasi, Nama)
// yang mewakili struktur data pengguna/user.
class User {
  final Address address;
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final String phone;

  User({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

// fromJson: menata ulang properti User yang dihasilkan Pengguna dari JSON.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      address: Address.fromJson(json['address']),
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: Name.fromJson(json['name']),
      phone: json['phone'],
    );
  }
}

class Address {
  final Geolocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      geolocation: Geolocation.fromJson(json['geolocation']),
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
    );
  }
}

class Geolocation {
  final String lat;
  final String long;

  Geolocation({required this.lat, required this.long});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat'],
      long: json['long'],
    );
  }
}

class Name {
  final String firstname;
  final String lastname;

  Name({required this.firstname, required this.lastname});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}

import 'dart:convert';

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final DateTime birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final Hair hair;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;
  final Crypto crypto;
  final String role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'birthDate': birthDate.millisecondsSinceEpoch,
      'image': image,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'hair': hair.toMap(),
      'ip': ip,
      'address': address.toMap(),
      'macAddress': macAddress,
      'university': university,
      'bank': bank.toMap(),
      'company': company.toMap(),
      'ein': ein,
      'ssn': ssn,
      'userAgent': userAgent,
      'crypto': crypto.toMap(),
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      maidenName: map['maidenName'],
      age: map['age'],
      gender: map['gender'],
      email: map['email'],
      phone: map['phone'],
      username: map['username'],
      password: map['password'],
      birthDate: DateTime.parse(
        map['birthDate']
            .split('-')
            .map((part) => part.padLeft(2, '0'))
            .join('-'),
      ),
      image: map['image'],
      bloodGroup: map['bloodGroup'],
      height: map['height'],
      weight: map['weight'],
      eyeColor: map['eyeColor'],
      hair: Hair.fromMap(map['hair']),
      ip: map['ip'],
      address: Address.fromMap(map['address']),
      macAddress: map['macAddress'],
      university: map['university'],
      bank: Bank.fromMap(map['bank']),
      company: Company.fromMap(map['company']),
      ein: map['ein'],
      ssn: map['ssn'],
      userAgent: map['userAgent'],
      crypto: Crypto.fromMap(map['crypto']),
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, maidenName: $maidenName, age: $age, gender: $gender, email: $email, phone: $phone, username: $username, password: $password, birthDate: $birthDate, image: $image, bloodGroup: $bloodGroup, height: $height, weight: $weight, eyeColor: $eyeColor, hair: $hair, ip: $ip, address: $address, macAddress: $macAddress, university: $university, bank: $bank, company: $company, ein: $ein, ssn: $ssn, userAgent: $userAgent, crypto: $crypto, role: $role)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.maidenName == maidenName &&
        other.age == age &&
        other.gender == gender &&
        other.email == email &&
        other.phone == phone &&
        other.username == username &&
        other.password == password &&
        other.birthDate == birthDate &&
        other.image == image &&
        other.bloodGroup == bloodGroup &&
        other.height == height &&
        other.weight == weight &&
        other.eyeColor == eyeColor &&
        other.hair == hair &&
        other.ip == ip &&
        other.address == address &&
        other.macAddress == macAddress &&
        other.university == university &&
        other.bank == bank &&
        other.company == company &&
        other.ein == ein &&
        other.ssn == ssn &&
        other.userAgent == userAgent &&
        other.crypto == crypto &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        maidenName.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        username.hashCode ^
        password.hashCode ^
        birthDate.hashCode ^
        image.hashCode ^
        bloodGroup.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        eyeColor.hashCode ^
        hair.hashCode ^
        ip.hashCode ^
        address.hashCode ^
        macAddress.hashCode ^
        university.hashCode ^
        bank.hashCode ^
        company.hashCode ^
        ein.hashCode ^
        ssn.hashCode ^
        userAgent.hashCode ^
        crypto.hashCode ^
        role.hashCode;
  }
}

class Hair {
  final String color;
  final String type;
  Hair({required this.color, required this.type});

  Hair copyWith({String? color, String? type}) {
    return Hair(color: color ?? this.color, type: type ?? this.type);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'color': color, 'type': type};
  }

  factory Hair.fromMap(Map<String, dynamic> map) {
    return Hair(color: map['color'], type: map['type']);
  }

  String toJson() => json.encode(toMap());

  factory Hair.fromJson(String source) => Hair.fromMap(json.decode(source));

  @override
  String toString() => 'Hair(color: $color, type: $type)';

  @override
  bool operator ==(covariant Hair other) {
    if (identical(this, other)) return true;

    return other.color == color && other.type == type;
  }

  @override
  int get hashCode => color.hashCode ^ type.hashCode;
}

class Bank {
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cardExpire': cardExpire,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'currency': currency,
      'iban': iban,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      cardExpire: map['cardExpire'],
      cardNumber: map['cardNumber'],
      cardType: map['cardType'],
      currency: map['currency'],
      iban: map['iban'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Bank(cardExpire: $cardExpire, cardNumber: $cardNumber, cardType: $cardType, currency: $currency, iban: $iban)';
  }

  @override
  bool operator ==(covariant Bank other) {
    if (identical(this, other)) return true;

    return other.cardExpire == cardExpire &&
        other.cardNumber == cardNumber &&
        other.cardType == cardType &&
        other.currency == currency &&
        other.iban == iban;
  }

  @override
  int get hashCode {
    return cardExpire.hashCode ^
        cardNumber.hashCode ^
        cardType.hashCode ^
        currency.hashCode ^
        iban.hashCode;
  }
}

class Address {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final Coordinates coordinates;
  final String country;
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) {
    return Address(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      postalCode: postalCode ?? this.postalCode,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'state': state,
      'stateCode': stateCode,
      'postalCode': postalCode,
      'coordinates': coordinates.toMap(),
      'country': country,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['address'],
      city: map['city'],
      state: map['state'],
      stateCode: map['stateCode'],
      postalCode: map['postalCode'],
      coordinates: Coordinates.fromMap(map['coordinates']),
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(address: $address, city: $city, state: $state, stateCode: $stateCode, postalCode: $postalCode, coordinates: $coordinates, country: $country)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.city == city &&
        other.state == state &&
        other.stateCode == stateCode &&
        other.postalCode == postalCode &&
        other.coordinates == coordinates &&
        other.country == country;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        stateCode.hashCode ^
        postalCode.hashCode ^
        coordinates.hashCode ^
        country.hashCode;
  }
}

class Company {
  final String department;
  final String name;
  final String title;
  final Address address;
  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address? address,
  }) {
    return Company(
      department: department ?? this.department,
      name: name ?? this.name,
      title: title ?? this.title,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'department': department,
      'name': name,
      'title': title,
      'address': address.toMap(),
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      department: map['department'],
      name: map['name'],
      title: map['title'],
      address: Address.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Company(department: $department, name: $name, title: $title, address: $address)';
  }

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.department == department &&
        other.name == name &&
        other.title == title &&
        other.address == address;
  }

  @override
  int get hashCode {
    return department.hashCode ^
        name.hashCode ^
        title.hashCode ^
        address.hashCode;
  }
}

class Crypto {
  final String coin;
  final String wallet;
  final String network;
  Crypto({required this.coin, required this.wallet, required this.network});

  Crypto copyWith({String? coin, String? wallet, String? network}) {
    return Crypto(
      coin: coin ?? this.coin,
      wallet: wallet ?? this.wallet,
      network: network ?? this.network,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coin': coin,
      'wallet': wallet,
      'network': network,
    };
  }

  factory Crypto.fromMap(Map<String, dynamic> map) {
    return Crypto(
      coin: map['coin'],
      wallet: map['wallet'],
      network: map['network'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Crypto.fromJson(String source) => Crypto.fromMap(json.decode(source));

  @override
  String toString() =>
      'Crypto(coin: $coin, wallet: $wallet, network: $network)';

  @override
  bool operator ==(covariant Crypto other) {
    if (identical(this, other)) return true;

    return other.coin == coin &&
        other.wallet == wallet &&
        other.network == network;
  }

  @override
  int get hashCode => coin.hashCode ^ wallet.hashCode ^ network.hashCode;
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({required this.lat, required this.lng});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'lat': lat, 'lng': lng};
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(lat: map['lat'], lng: map['lng']);
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source));

  @override
  String toString() => 'Coordinates(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Coordinates other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}

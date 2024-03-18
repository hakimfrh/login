class User {
    String nama;
    String alamat;
    String tanggalLahir;
    String jenisKelamin;
    String username;
    String password;
    int? id;

    User({
        required this.nama,
        required this.alamat,
        required this.tanggalLahir,
        required this.jenisKelamin,
        required this.username,
        required this.password,
        this.id,
    });

    


    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] as int?,
        nama: json["nama"],
        alamat: json["alamat"],
        tanggalLahir: json["tanggalLahir"],
        jenisKelamin: json["jenisKelamin"],
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "alamat": alamat,
        "tanggalLahir": tanggalLahir,
        "jenisKelamin": jenisKelamin,
        "username": username,
        "password": password,
    };
}

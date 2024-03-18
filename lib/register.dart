import 'package:flutter/material.dart';
import 'package:login/database/sql_user.dart';
// import 'package:login/navigation_drawer.dart';
import 'package:login/model/user.dart';
import 'package:login/login.dart';

final _formKey = GlobalKey<FormState>();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller:
                      _namaController, //mengendalikan nilai yang dimasukkan ke dalam TextFormField
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    labelText: 'Nama',
                    hintText: 'ex:siti nur',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (name) =>
                      name!.isEmpty ? 'Harap isi kolom ini' : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _alamatController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.map),
                    labelText: 'Alamat',
                    hintText: 'ex:Jember',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (alamat) =>
                      alamat!.isEmpty ? 'Harap isi kolom ini' : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _tanggalController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month),
                    labelText: 'Tanggal Lahir',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  readOnly: true,
                  onTap: _selectDate,
                  validator: (tanggal) =>
                      tanggal!.isEmpty ? 'Harap isi kolom ini' : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16.0),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(
                              255, 36, 36, 36)), // Add border here
                      borderRadius: BorderRadius.circular(
                          10.0), // Optional: Add border radius
                    ),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        hintText: 'Jenis Kelamin',
                        hintStyle: TextStyle(
                          color: Theme.of(context).hintColor,
                        ),
                        prefixIcon: const Icon(Icons.male), // Add icon here
                        border: InputBorder.none,
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'Username',
                    hintText: 'ex:sitibayy',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (username) => username!.isEmpty
                      ? 'Harap isi kolom ini'
                      : username.length < 5
                          ? 'Usernane minimal 5 karakter'
                          : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  obscureText: _isPasswordHidden,
                  validator: (password) => password!.isEmpty
                      ? 'Harap isi kolom ini'
                      : password.length < 5
                          ? 'Password minimal 5 karakter'
                          : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                // Forgot Password Link
                const SizedBox(height: 20.10),
                ElevatedButton(
                  onPressed: _btnRegister,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(double.infinity, 50.0),
                      backgroundColor: const Color(0xFF512E67)),
                  child: const Text('Daftar',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 255, 255, 255))),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sudah Punya Akun?'),
                    const SizedBox(
                      width: 5,
                    ), // Don't have an account link
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//objek controller
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  String? _gender;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(2005), lastDate: DateTime(2050));

    if (picked != null) {
      setState(() {
        _tanggalController.text = picked.toString().split(" ")[0];
      });
    }
  }

  final List<String> items = [
    'Laki-Laki',
    'Perempuan',
  ];

  void _btnRegister() {
    if (_formKey.currentState!.validate()) {
      _showAlertDialog();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Periksa Kembali Data")));
    }
  }

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apakah data yang dimasukkan sudah benar ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Benar'),
              onPressed: () {
                Navigator.of(context).pop();
                _register();
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _register() async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Menambakhan User")));

    //inisialisasi variabel dari controller.
    String nama = _namaController.text;
    String alamat = _alamatController.text;
    String tanggalLahir = _tanggalController.text;
    String jenisKelamin = _gender ?? 'Gatau';
    String username = _usernameController.text;
    String password = _passwordController.text;

//objek
    User user = User(
        nama: nama,
        alamat: alamat,
        tanggalLahir: tanggalLahir,
        jenisKelamin: jenisKelamin,
        username: username,
        password: password);

    final dbUser = UserDatabase();
    await dbUser.initializeDatabase();
    dbUser.register(user);
    
  }
}

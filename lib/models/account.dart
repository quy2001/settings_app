class Account{
  int? id;
  String? email;
  String? password;

  Account({this.id, this.email, this.password});

  Map<String, dynamic> toMap(Account user){
    return{
      'id': user.id,
      'email': user.email,
      'password': user.password
    };
  }
}
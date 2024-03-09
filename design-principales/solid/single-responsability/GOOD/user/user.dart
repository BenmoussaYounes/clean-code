// GOOD example
// This class has only one responsibility
class User {
  int id;
  String name;
  String email;
  String password;

  User(this.id, this.name, this.email, this.password);

  set setName(String name) => this.name = name;

  set setEmail(String email) => this.email = email;

  set setPassword(String password) => this.password = password;

  get getId => id;

  get getName => name;

  get getEmail => email;

  get getPassword => password;
}

// This class has only one responsibility and one reason to change
// example changing the name of user class to person
// example changing the name attribute to fullName
// example changing the email attribute to emailAddress
// ...
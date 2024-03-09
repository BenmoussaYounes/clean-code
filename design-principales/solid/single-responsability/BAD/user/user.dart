// BAD example OF SINGLE RESPONSIBILITY PRINCIPLE
// This class has more than one responsibility, it should be divided into two classes
class User {
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);

  // DB operations
  void save() {
    print('Saving user');
  }

  // Email operations
  void sendEmail() {
    print('Sending email');
  }

  void login() {
    print('Logging in');
  }

  void logout() {
    print('Logging out');
  }

  void delete() {
    print('Deleting user');
  }

  void update() {
    print('Updating user');
  }
}

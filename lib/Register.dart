class Register
{
  String _username;
  String _email;
  String _first_name;
  String _second_name;
  String _DOB;
  final DateTime _DateCreated=new DateTime.now();
  String _sex;
  String _profile_pic_url;
  List<String> _interests;

 // Register(this._username, this._email, this._first_name, this._second_name,
   //   this._DOB, this._sex, this._profile_pic_url, this._interests);
  
  Register(this._username, this._email, this._first_name, this._second_name,
    this._DOB, this._sex, this._profile_pic_url, this._interests);
  
  List get interest => _interests;
  set interest(List interest){
    _interests=interest;
  }

  String get profile_pic_url => _profile_pic_url;

  set profile_pic_url(String value) {
    _profile_pic_url = value;
  }

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  DateTime get DateCreated => _DateCreated;


  String get DOB => _DOB;

  set DOB(String value) {
    _DOB = value;
  }

  String get second_name => _second_name;

  set second_name(String value) {
    _second_name = value;
  }

  String get first_name => _first_name;

  set first_name(String value) {
    _first_name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }


  @override
  String toString() {
    return 'Register{_username: $_username, _email: $_email, _first_name: $_first_name, _second_name: $_second_name, _DOB: $_DOB, _DateCreated: $_DateCreated, _sex: $_sex, _profile_pic_url: $_profile_pic_url, _interests: $_interests}';
  }


}
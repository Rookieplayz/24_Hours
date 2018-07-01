import 'package:flutter/material.dart';
class LoginForm extends StatefulWidget
{
  LoginForm({
    this.validator,
    this.mainColor,
    this.onFieldSubmission,
    this.onSaved,
    this.passwordKey,
    this.subColor,
    this.usernameFieldKey,
    this.formkey,
    this.users,
    this.emails,
});
  final Key usernameFieldKey;
  final String password_hintText;
  final String username_hintText;
  final Color mainColor;
  final Color subColor;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String>validator;
  final ValueChanged<String>onFieldSubmission;
  final GlobalKey<FormState> formkey;
  final GlobalKey<FormFieldState<String>> passwordKey;
  final List<String> users;
  final List<String> emails;


  _CreateLoginForm createState() => new _CreateLoginForm();

}


class _CreateLoginForm extends State<LoginForm>{
  bool _autovalidate=false;
  bool _validname=false;

  var myController;
  TextEditingController _controller = new TextEditingController();
  TextEditingController _controller2= new TextEditingController();

  var usernameMessage= new Text('');
  var errUsername= new Text('');

  bool _obscureText=true;

   var _validform=false;



  bool _validPassword=false;

  String _validateName(String value)
  {
    if(value.isEmpty)
      return 'Field is Empty!';
    if(!(widget.users.contains(value.toLowerCase())||widget.emails.contains(value.toLowerCase())))
      return 'User: $value Does not Exist!';
    return null;
  }
  String _validatePassword(String value)
  {
    if(value.isEmpty)
      return 'Field is Empty!';
    return null;
  }
  void _handleSubmitted() {

    final FormState form = widget.formkey.currentState;

    if (!form.validate()) {

     // _autovalidate = true; // Start validating on every change.


    } else {

      form.save();
      print('Home');

    }

  }
  @override
  void initState(){
    super.initState();
    _controller.addListener(onChange);
    _controller2.addListener(onChange);
    //_textFocus.addListener(onChange);
  }
  @override
  Widget build(BuildContext context) {

    return new SafeArea(
      top: false,
      bottom: false,
      child: new Form(
        key: widget.formkey,
      autovalidate: _autovalidate,
      child: new SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Container(
        padding: const EdgeInsets.only(left:12.0,bottom: 12.0),
        height: 80.0,
        decoration: new BoxDecoration (
          borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
          border: new Border.all(color: _validname ? Colors.green:Colors.midnightAccent ,width: 3.5,style: BorderStyle.solid),
          color: Colors.transparent,
        ),
        child:new TextFormField(
          key: widget.usernameFieldKey,
          controller: _controller,
          validator: _validateName,

          style: new TextStyle(
            fontFamily: 'Jua',
            fontSize: 18.0,
            color: Colors.white
          ),
          decoration: new InputDecoration(
            border: InputBorder.none,
            filled: false,
            icon: _validname ? const Icon(Icons.check_circle,color: Colors.green):const Icon(Icons.person,color: Colors.midnightTextPrimary),

            hintText: 'Enter Username or Email',
            labelText: "Username/Email",
            hintStyle: new TextStyle(fontFamily: 'Jua',color: Colors.white30,fontSize: 18.0),
            labelStyle:  new TextStyle(fontFamily: 'Jua',color: Colors.midnightTextPrimary),
          ),


        ),

        ),
        usernameMessage,
        new Padding(padding: const EdgeInsets.only(top: 9.0)),
        new Container(
          padding: const EdgeInsets.only(left:12.0,bottom: 12.0,right: 12.0),
          height: 80.0,
          decoration: new BoxDecoration (

            borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
            border: new Border.all(color: _validPassword ? Colors.green:Colors.midnightAccent ,width: 3.5,style: BorderStyle.solid),
            color: Colors.transparent,
          ),
          child:new TextFormField(

          key: widget.passwordKey,
          obscureText: _obscureText,
          onSaved: widget.onSaved,
          validator: _validatePassword,
          controller: _controller2,

          style: new TextStyle(
              color: Colors.white,fontSize: 24.0
          ),

          decoration: new InputDecoration(
            border: InputBorder.none,
            filled: false,
            icon: _validPassword ? const Icon(Icons.lock_open,color: Colors.green):const Icon(Icons.lock,color: Colors.midnightTextPrimary),

            hintText: 'Enter Password',
            labelText: "Password",
            hintStyle: new TextStyle(fontFamily: 'Jua',color: Colors.white30,fontSize: 18.0),
            labelStyle:  new TextStyle(fontFamily: 'Jua',color: Colors.midnightTextPrimary),

            suffixIcon: new GestureDetector(
              onTap: () {

                setState(() {

                  _obscureText = !_obscureText;

                });

              },

              child: new Icon(_obscureText ? Icons.visibility : Icons.visibility_off,color: Colors.midnightAccent,),

            ),
          ),
        ),
        ),
        new Padding(padding: const EdgeInsets.only(top: 9.0)),
        errUsername,
        new Padding(padding: const EdgeInsets.only(top: 60.0)),
        new SizedBox(
          width: 340.0,
          height: 50.0,
          child: new  RaisedButton(onPressed:_validPassword && _validform ? _handleSubmitted:null ,
            child: new Text(
              'Confirm',
              style: new TextStyle(
                fontFamily: 'Jua',
                letterSpacing: 1.0,
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),

            shape: new RoundedRectangleBorder(side: new BorderSide(
              color: Colors.midnightAccent,
              width: 2.0,

            ),
                borderRadius:new BorderRadius.circular(20.0)


            ),
            color: Colors.midnightAccent,
            elevation: 10.0,



          ),
        ),
      ],

      ),
      ),
      ),
    );

  }


  void onChange() {
    String text = _controller.text;
    String text2 = _controller2.text;


    // bool hasFocus = _textFocus.hasFocus;
    //do your text transforming
    print("input A: $text \nInput B: $text2");
    if (text.isNotEmpty && text2.isNotEmpty) {
      print('true');

      setState(() {
        _validform = true;
        _validPassword = _correctPassword(text2);
        _validname = true;
      });
    }
    else {
      print('false');

      setState(() {
        _validform = false;
      });
    }
    if (text2.isNotEmpty && !_correctPassword(text2))
      setState(() {
        errUsername = new Text('Oops wrong Password!', style: new TextStyle(
            color: Colors.red, fontFamily: 'Jua', fontSize: 14.0),
          textAlign: TextAlign.center,);
      });
    else setState(() {
      errUsername = new Text('');
    });

    String username = text.toLowerCase();
    print("Usernames: ${widget.users} \nUsername: $username");
    if (text.isEmpty) {
      usernameMessage = new Text('');
    }
    else {
      (widget.users.contains(text.toLowerCase) ||
          widget.users.contains(text.toLowerCase())) ? setState(() {
        _validname = true;
        usernameMessage = new Text('');
      }) : setState(() {
        _validname = false;
        usernameMessage = new Text('User Does not Exists!',
          style: new TextStyle(
              color: Colors.red, fontFamily: 'Jua', fontSize: 14.0),
          textAlign: TextAlign.center,);
      });
    }
  }

  bool _correctPassword(String text2) {
    return text2=='Sonyerics12';
  }
}
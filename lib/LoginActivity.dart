import 'package:flutter/material.dart';
import 'package:twenty_four_hours/InputFields.dart';
import 'package:twenty_four_hours/Login.dart';
import 'package:twenty_four_hours/LoginForm.dart';
import 'package:twenty_four_hours/RegisterActivity.dart';

class LoginActivityMain extends StatefulWidget
{



  @override
  _LoginActivity  createState() => new _LoginActivity();


}

class _LoginActivity extends State<LoginActivityMain> with SingleTickerProviderStateMixin {

  Choice _selectedChoice = choices[0]; // The app's "state".
  List<String> _usernamees=[];
  List<String>_emails=[];
  bool enableButton=false;
  int emptyFields=2;
 static var ub_color=Colors.midnightAccent;
  static var usernameIcon=new Icon(
    Icons.person_outline,
    color: Colors.white,
  );
  var passwordIcon=new Icon(
    Icons.lock,
    color: Colors.orange,
  );

  var myController;
  static TextEditingController _controller = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();

  var usernameForm=  new Form(
    key: _formKey,
    child: new Container(
      padding: const EdgeInsets.only(left:12.0,top: 8.0),
      height: 60.0,
      decoration: new BoxDecoration (
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        border: new Border.all(color: Colors.green,width: 2.5,style: BorderStyle.solid),
        color: Colors.transparent,
      ),
      child: new TextFormField(
        obscureText: false,

        controller: _controller,
        //focusNode: _textFocus,
        validator:(value){if(_checkIfUsernameisValid(value))return usernsmeErr;},
        style:  TextStyle(

          color: Colors.white,
          fontFamily: 'Jua',
          letterSpacing: 1.0,
          fontSize: 18.0,

        ),

        decoration: new InputDecoration(

          icon: usernameIcon,
          border: InputBorder.none,

          labelText:'Username or Email',

          labelStyle:  TextStyle(color: Colors.midnightTextPrimary, fontSize: 18.0),


        ),
      ),
    ),
  );


      FocusNode _textFocus = new FocusNode();

  bool _obsecureText=true;

  var _passwordKey;
 // Login login=new Login();
  void populateLists()
  {
    _usernamees.add('Ollie');
    _emails.add('olamidepeters@gmail.com');
    List<String>temp=new List<String>();
    List<String>temp2=new List<String>();

    for(String s in _usernamees)
      {
        temp.add(s.toLowerCase());
      }
      _usernamees.clear();
    _usernamees.addAll(temp);

    for(String s in _emails)
    {
      temp.add(s.toLowerCase());
    }
    _emails.clear();
    _emails.addAll(temp);


    //Get usernames and emails from database

  }
@override
void initState(){
    super.initState();
    populateLists();
    _controller.addListener(onChange);
    //_textFocus.addListener(onChange);
}
  void _navTo(Object obj)
  {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => obj),
    );
  }

  void _returnTo()
  {
    Navigator.pop(
        context,
    );
  }
  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
      print(choice.title);
      if(_selectedChoice.title=='Register')
        {
          _returnTo();
          _navTo(new RegisterMain());
        }
    });
  }
   CurvedAnimation curve ;
   AnimationController controller;
  void tickAnimation({Duration dur= const Duration(milliseconds: 500)})
  {
    controller = new AnimationController(
        duration: dur,vsync: this,);

    curve=Tween(begin: 0.0,end: 500).animate(controller)
    ..addListener((){setState(() {
      //frame update
    });
    });
    controller.forward();
    @override
    void dispose()
    {
      controller.dispose();
      super.dispose();
    }
    //curve=new CurvedAnimation(parent: null, curve: Curves.bounceIn);
  }
  static String usernsmeErr='Empty Field!';
 static  bool _checkIfUsernameisValid(String val)
  {
    if(val.isEmpty)
      {
        usernsmeErr='Empty Field';
        return false;
      }

    else {
      usernsmeErr='User not Found!';
      return false;
    }
  }

  void _checkIfExistingUser()
  {
    String user=textEditingController.text;
    setState(() {
      if(user.isNotEmpty)
        {
          if(_usernamees.contains(user)||_emails.contains(user))
            {
              usernameField=new InputFieldArea(
                  hint: "Username/Email",
                  obscure: false,
                  icon: Icons.beenhere,
                  color: Colors.green,
                  hint_color: Colors.midnightTextPrimary,
                  fontFamily: 'Jua',
                  letterSpacing: 1.0,
                  fontSize: 18.0,
                  containerHeight:60.0,

              );
            }
            else {
            usernameField=new InputFieldArea(
                hint: "Username/Email",
                obscure: false,
                icon: Icons.person_outline,
                color: Colors.red,
                hint_color: Colors.midnightTextPrimary,
                fontFamily: 'Jua',
                letterSpacing: 1.0,
                fontSize: 18.0,
                containerHeight:60.0,
                neg_validatorBool:!(_usernamees.contains(user)||_emails.contains(user)),
                errMsg:'This user does not exist'
            );
          }
        }
        else
          {

          }
    });
  }
  void onChange(){
    String text = _controller.text;
    String pass=_controller2.text;

   // bool hasFocus = _textFocus.hasFocus;
    //do your text transforming
    String username=text.toLowerCase();
    print("Usernames: $_usernamees \nUsername: $username\nPassword: $pass");

    setState(
            () {
    if(_usernamees.contains(username)||_emails.contains(username)){

    print('true');}
    else
      {
        usernameIcon=new Icon(
          Icons.person_outline,
          color: Colors.white,
        );
      }
    //_controller.text = newText;
    _controller.selection = new TextSelection(
        //baseOffset: newText.length,
        //extentOffset: newText.length
    );
  });
        }

  InputFieldArea usernameField;
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();
  TextEditingController textEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
     usernameField=new InputFieldArea(
      hint: "Username/Email",
      obscure: false,
      icon: Icons.person_outline,
      color: Colors.white,
      hint_color: Colors.midnightTextPrimary,
      fontFamily: 'Jua',
      letterSpacing: 1.0,
      fontSize: 18.0,
      containerHeight:60.0,

    );
    //var icns=[new Icon(Icons.person_outline),new Icon(Icons.check_circle)]
    List<Widget> menu = <Widget>[
      new IconButton(
        icon: new Icon(choices[0].icon),
        color: new Color.fromRGBO(255, 215, 0, 1.0),
        onPressed: () {
          _select(choices[0]);
        },
      ),

      // overflow menu
      new PopupMenuButton<Choice>(
        onSelected: _select,
        itemBuilder: (BuildContext context)=><PopupMenuEntry<Choice>> [

            PopupMenuItem<Choice>(
              value: new Choice(title:'home',icon:Icons.home),
              child: new Row(
             // crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
              new Text(
                  choices[1].title,
              style: new TextStyle(
                color: Colors.mainscreenDark,
                fontFamily: 'Exo-Light',
                fontWeight: FontWeight.bold
              ),
              ),
              new IconButton(
                    icon: new Icon(choices[1].icon),
                )
              ],

            ),
            ),

        ],
      ),



    ];

    return new Scaffold(
      appBar: new AppBar(

        actions: menu,
        title: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          new Container(
            padding:const EdgeInsets.all(5.0),
          child: new Text(
            "Login",
        style: new TextStyle(
          color: Colors.midnightAccent,
          fontSize: 22.0,
          fontFamily: 'ExoLight',
          fontWeight: FontWeight.bold,
        )
        ),
          ),
        new Container(
          padding:const EdgeInsets.only(bottom:1.0),
        child:new Text(
        'Welcome back!',
    style: new TextStyle(
    color: Colors.white,
    fontSize: 14.0,
   // fontFamily: 'ExoLight',
    )
        ),
        ),
        ],
        ),

        backgroundColor: Colors.mainscreenDark


      ),
          
      body: new Container(
        color: Colors.midnight_main,
        padding: EdgeInsets.only(top:70.0,left: 10.0,right: 10.0),

   child: SafeArea(
    top: false,
    bottom: false,
    child: new SingleChildScrollView(
        //child: new SingleChildScrollView(
          //padding: const EdgeInsets.only(top:150.0,left: 16.0,right: 16.0),
          child:new Container(
              padding: const EdgeInsets.only(top:150.0,left: 16.0,right: 16.0),
            height: 1000.0,
          decoration: new BoxDecoration (
              borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
              color: Colors.mainscreenDark,
              boxShadow: [new BoxShadow(color: Colors.black12,offset: new Offset(0.5, 1.0),blurRadius: 5.0,spreadRadius: 3.0),]
          ),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new LoginForm(
                  passwordKey: _passwordKey,
                  users: _usernamees,
                  emails: _emails,

                ),
              ],
            ),
          )


        ),
        ),
    //),



    ),
      ),
    );}
}


class ChoiceCard extends StatelessWidget{
  const ChoiceCard({Key key,this.choice}):super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle=Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.yellow,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              choice.icon,
              size: 120.0,
            color: new Color.fromRGBO(255, 215, 0, 1.0),///Gold
            ),
            new Text(choice.title,style: textStyle,),
          ],
        ),
      ),
    );
  }


}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

  const List<Choice> choices=const <Choice>[
    const Choice(title: 'Register',icon: Icons.account_circle),
    const Choice(title:'Sign in as Guest',icon: Icons.home),
    const Choice(title:'Login',icon: Icons.exit_to_app)
  ];
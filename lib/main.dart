import 'package:cf_api/user.dart';
import 'package:cf_api/info.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home' : (context)=>Home(),
    '/info' : (context)=>Info(),
  },
  home : Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username="";
  final myController = TextEditingController(); 
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CF Profile'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child : Form(
              key : _formkey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  TextFormField(
                      controller:  myController,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (data){
                        username = data;
                    },
                      validator: (data){
                      if(data.isEmpty || data.contains(' '))
                      {
                          return 'Plese enter valid username';
                      }
                      return null;
                    },
                  ),
                  Padding( 
                    padding : const EdgeInsets.symmetric(vertical : 16.0),
                    child : RaisedButton(
                        onPressed: () async{
                          if(_formkey.currentState.validate())
                          {
                             User instance = User(username: username);
                             await instance.getInfo();
                             if(!instance.isItOk){
                               print('user doesn\'t exists');
                               _showDialog();
                             }
                             else{
                               Navigator.pushReplacementNamed(context, '/info' , arguments: {'data' : instance.data});
                             }
                          }
                          else{
                            print('username is not valid');
                          }
                        },
                        child : Text('Search'),
                    ),  
                  )
              ],
            ),
          ),
        ),
    );
  }
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            elevation: 24.0,
            //to make circular alert box
            // shape: CircleBorder(side : BorderSide.none),
            backgroundColor: Colors.blue[900],
            title: Text(
                      "Enter valid username",
                      style: TextStyle(
                        color : Colors.white70,
                      ),
                    ),
            content: Text("$username doesn\'t exits" , 
                      style: TextStyle(
                      color : Colors.white70,
                      ),
                    ),
            actions: <Widget>[
               FlatButton(
                child: Text("Close",
                style: TextStyle(
                  color : Colors.white70,
                ),
                ),
                onPressed: () {
                  //deleting content of text field 
                  // myController.clear();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
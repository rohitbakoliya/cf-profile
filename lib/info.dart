import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {

  Map info = {};
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    info = data['data']['result'][0];
    Color color = Colors.black;
    String rank = info['rank'];
    
    if(rank=='newbie'){
        color = Colors.grey;
    }
    else if(rank=='pupil'){
      color = Colors.green;
    }
    else if(rank=='specialist'){
        color = Colors.lightBlue[400];
    }
    else if(rank=='expert'){
      color = Colors.blue[900];
    }
    else if(rank=='master'){
      color = Colors.orange[300];
    }
    else if(rank=='candidate master'){
      color = Colors.purple;
    }
    else if(rank=='international master'){
      color = Colors.orange[500];
    }
    else if(rank=='grandmaster'){
      color = Colors.red[400];
    }
    else if(rank=='international grandmaster'){
      color = Colors.red[700];
    }
    else{
      //for Legendary grandmaster
      color = Colors.red[900];
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('User Info'),
          backgroundColor: color,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding : EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage : NetworkImage('https:' + info['titlePhoto']),
                  radius: 60,
                ),
              ),
              SizedBox(height: 30),
              Center(
                 child:  Text('${info["handle"]}' , style: TextStyle(
                     fontSize: 26,
                     color : color,
                    ),
                   ),
              ),
              SizedBox(height: 20),
              Center(
                 child:  Text('Rating : ${info["rating"]}' , style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20),
              Center(
                 child:  Text('Rank : ${info["rank"]}' , style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20),
              Center(
                 child:  Text('Max Rating : ${info["maxRating"]}' , style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20),
              Center(
                 child:  Text('Max Rank : ${info["maxRank"]}' , style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20),
              Center(
                 child:  Text('Full Name  : ${info["firstName"]} ${info["lastName"]}' , style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 20),
              Center(
                 child:  Text('Organization : ${info["organization"]}' , style: TextStyle(fontSize: 20),),
              ),   
              SizedBox(height: 20),
              Center(
                 child:  Text('Country : ${info["country"]}' , style: TextStyle(fontSize: 20),),
              ),   
              SizedBox(height: 20),
              Center(
                 child:  Text('Frineds Count : ${info["friendOfCount"]}' , style: TextStyle(fontSize: 20),),
              ), 
            ],
          ),
        ),
    );
  }
}
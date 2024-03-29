import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New contact"),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
              }
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                  ),
                  hintText: "Name",
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return "El texto no puede estar vacio";
                  }
                  return null;
                },
                onSaved: (String value){
                  controller.value = TextEditingValue(text: "");
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                  ),
                  hintText: "Phone",
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return "El texto no puede estar vacio";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail,
                  ),
                  hintText: "Mail",
                ),
                validator: (String value){
                  if(value.isEmpty){
                    return "El texto no puede estar vacio";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

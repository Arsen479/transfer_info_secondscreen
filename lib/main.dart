import 'package:flutter/material.dart';
import 'package:flutter_application_16_11_2024/secondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controllerName;
  late TextEditingController controllerAdress;
  late TextEditingController controllerAge;
  bool flag = true;
  bool male = false;
  bool female = false;
  String? gend;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerAdress = TextEditingController();
    controllerAge = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                keyboardType: TextInputType.name,
                obscureText: false,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerAdress,
                keyboardType: TextInputType.streetAddress,
                obscureText: flag,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Adress',
                  suffixIcon: IconButton(
                    onPressed: () {
                      flag = !flag;
                      setState(() {});
                    },
                    icon: Icon(changevisible(flag)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controllerAge,
                keyboardType: TextInputType.number,
                obscureText: false,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Text(
                'Choose gender',
                style: TextStyle(fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      female = !female;
                      setState(() {});
                    },
                    icon: Icon(Icons.female),
                    color: female == true ? Colors.pink : Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      male = !male;
                      setState(() {});
                    },
                    icon: Icon(Icons.male),
                    color: male == true ? Colors.blue : Colors.black,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 6,
                  ),
                  Text('Female'),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Male'),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Secondscreen(
                          name: controllerName.text.isNotEmpty
                              ? controllerName.text
                              : 'unknown',
                          adress: controllerAdress.text.isNotEmpty
                              ? controllerAdress.text
                              : 'unknown',
                          age: controllerAge.text.isNotEmpty
                              ? int.parse(controllerAge.text)
                              : 0,
                          gender:
                              male == true ? gend = 'male' : gend = 'female',
                        ),
                      ),
                    );
                  },
                  child: Text('Tap to next page'))
            ],
          ),
        ),
      ),
    );
  }
}

IconData changevisible(bool flags) {
  return flags == false ? Icons.remove_red_eye : Icons.remove_red_eye_outlined;
}

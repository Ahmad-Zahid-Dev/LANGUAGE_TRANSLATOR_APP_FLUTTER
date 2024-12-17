import 'package:flutter/material.dart';
import 'package:translator/translator.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var languages = ['en', 'ur' , 'hi' , 'fr' , 'ar' , 'bn','gu' , 'mr' ,'ne' , 'ru' , 'uz'];
  final outputController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  final inputController = TextEditingController();
  String inputText = '';
  String inputLanguage = 'en';
  String outputLanguage = 'ur';

  Future<void> translatedText() async {
    
      final translated = await translator.translate(inputText, from: inputLanguage, to: outputLanguage);
      setState(() {
        outputController.text = translated.text;
      });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1, bottom: 12, left: 5, right: 5),
                  child: Image.asset('assets/Images/translator2.png',
                    width: 300, height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: inputController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Enter your text here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        inputText = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: DropdownButton<String>(
                        items: languages.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: inputLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            inputLanguage = newValue!;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.forward),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DropdownButton<String>(
                        items: languages.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: outputLanguage,
                        onChanged: (newValue) {
                          setState(() {
                            outputLanguage = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        child: Text('Translate', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
                        onPressed: ()  async {
                          await translatedText();
                        },
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                        
                        child: Text('   Reset   ' , style: TextStyle(fontSize: 20, fontWeight:FontWeight.w500,fontStyle: FontStyle.italic ),),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                          ), 
                          onPressed: () {
                           setState(() {
                             inputText = '';
                             inputLanguage = 'en';
                             outputLanguage = 'ur';
                             inputController.text = '';
                             outputController.text = '';
                           });
                            
                          },                  
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    
                    style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),
                    
                    controller: outputController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Output will be here...',
                     labelStyle: TextStyle(fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
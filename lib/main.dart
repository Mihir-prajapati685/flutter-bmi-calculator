import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  double min = 100;
  double max = 200;
  RangeValues getvalue = RangeValues(150, 170);

  double min1 = 10;
  double max2 = 100;
  RangeValues forweight = RangeValues(30, 70);

  double min2 = 0;
  double max3 = 100;
  RangeValues forage = RangeValues(1, 100);

  bool boolformale=false;
  bool boolforfemale=false;

  void calculatebmiformale(){
    double heightincm=getvalue.start/100;
    double weight=forweight.start;
    double bmiresult=weight/(heightincm*heightincm);

     String category;
    if(bmiresult<18.5){
      category='Underweight';
    }else if(bmiresult>=18.5 && bmiresult<24.9){
      category='normal';
    }else if(bmiresult>=25 && bmiresult<29.9){
      category='overweight';
    }else{
      category='obese';
    }
    showDialog(context: context, builder:(context){
      return AlertDialog(
        title: Text('BMI RESULT'),
        content: Text('your BMI is ${bmiresult.toStringAsFixed(2)}\nCategory:$category'),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text('Ok')),
        ],
      );
    });
  }
  void calculatebmiforfemale(){
    double heightincm=getvalue.start/100;
    double weight=forweight.start;
    double bmiresult=weight/(heightincm*heightincm);

    String category;
    if(bmiresult<18.5){
      category='Underweight';
    }else if(bmiresult>=18.5 && bmiresult<24.9){
      category='normal';
    }else if(bmiresult>=25 && bmiresult<29.9){
      category='overweight';
    }else{
      category='obese';
    }
    showDialog(context: context, builder:(context){
      return AlertDialog(
        title: Text('BMI RESULT'),
        content:  Text('your BMI is ${bmiresult.toStringAsFixed(2)}\nCategory:$category'),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text('Ok')),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels label = RangeLabels(
      getvalue.start.toStringAsFixed(1),
      getvalue.end.toStringAsFixed(1),
    );
    RangeLabels labelforw = RangeLabels(
      forweight.start.toStringAsFixed(1),
      forweight.end.toStringAsFixed(1),
    );
    RangeLabels labelforage = RangeLabels(
      forage.start.toStringAsFixed(1),
      forage.end.toStringAsFixed(1),
    );
    return Scaffold(
      backgroundColor: const Color(0xFF131325),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    boolformale=true;
                    boolforfemale=false;
                  });
                },
                child:Container(
                  height: 170,
                  width: 160,
                  decoration: BoxDecoration(
                    color: boolformale==true?Color(0x11114EFF)
                        :Color(0x60623FF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: boolformale==true?Color(0x11114EFF):Color(0x60623FF),
                        blurRadius: 4,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child:Center(
                    child:Container(
                      height: 100,
                      width: 100,
                      child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSA1zygA3rubv-VK0DrVcQ02Po79kJhXo_A&s",
                      fit: BoxFit.cover,
                      ),

                    )
                  )

                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    boolforfemale=true;
                    boolformale=false;
                  });
                },
                child: Container(
                  height: 170,
                  width: 160,
                  decoration: BoxDecoration(
                    color: boolforfemale==true?Color(0x11114EFF)
                        :Color(0x60623FF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0x60623FF),
                        blurRadius: 9,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                    child:Center(
                        child:Container(
                          height: 100,
                          width: 100,
                          child:Image.network("https://thumbs.dreamstime.com/z/female-user-icon-flat-style-long-shadow-transparent-b-background-130891875.jpg",
                            fit: BoxFit.cover,
                          ),

                        )
                    )
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                color: const Color(0x60623FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 20),
                    child: Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${getvalue.start}',
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const TextSpan(
                          text: ' CM',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RangeSlider(
                    labels: label,
                    divisions: 100,
                    max: max,
                    min: min,
                    activeColor: Colors.green,
                    inactiveColor: Colors.green.shade100,
                    values: getvalue,
                    onChanged: (newValues) {
                      setState(() {
                        getvalue = newValues;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 170,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0x60623FF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0x60623FF),
                      blurRadius: 9,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${forweight.start}',
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const TextSpan(
                            text: ' KG',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RangeSlider(
                      labels: labelforw,
                      divisions: 100,
                      min: min1,
                      max: max2,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green.shade100,
                      values: forweight,
                      onChanged: (newValues) {
                        setState(() {
                          forweight = newValues;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 170,
                width: 160,
                decoration: BoxDecoration(
                  color: const Color(0x60623FF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0x60623FF),
                      blurRadius: 9,
                      spreadRadius: 1,
                    ),
                  ],

                ),
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${forage.start.round()}',
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    RangeSlider(
                        labels: labelforage,
                        divisions: 100,
                        min: min2,
                        max: max3,
                        activeColor: Colors.green,
                        inactiveColor:Colors.green[100],
                        values: forage, onChanged: (newvalue){
                      setState(() {
                        forage=newvalue;
                      });
                    }),
                  ],
                )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Container(
              height: 60,
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if(boolformale){
                    calculatebmiformale();
                  }else if(boolforfemale){
                    calculatebmiforfemale();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

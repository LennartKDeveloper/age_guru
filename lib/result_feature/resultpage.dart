import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:count_number/count_number.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.title, required this.age});
  final int age;
  final String title;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  int _number = 0;
  late CountNumber _countNumber;
  bool showBadge = false;

  @override
  void initState() {
    _countNumber = CountNumber(
      velocity: 30,
      startValue: 0,
      endValue: 20,
      onUpdate: (value) => setState(() => _number = value as int),
    );
    super.initState();
  }

  @override
  void dispose() {
    _countNumber.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _countNumber.start();

    final List <BoxShadow> myBoxShadow = [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 5,
                  offset: const Offset(-2, -2),
                  color:  Colors.black.withOpacity(0.5),
                ),
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                  color:  Colors.black.withOpacity(0.5),
                ),
              ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        shadowColor: Colors.transparent,
        
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        
        title: Center(child: Text(widget.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
      ),



      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [Center(
          child:  Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 50),
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
                boxShadow: myBoxShadow,
              ),
              child:  Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                     const Gap(10),

                     Image.asset('lib/input_feature/assets/guru_icon.png',height: 140,),
                  
                     const Gap(25),
                  
                     const Padding(
                       padding:  EdgeInsets.only(left: 5,right: 5),
                       child:  Text("I've come to a conclusion. Am I correct?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),textAlign: TextAlign.center,),
                     ),
                  
                      const Gap(50),
                  
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Stack(
                          children: [
                            Animate(
                               effects: const [
                                  RotateEffect(duration: Duration(milliseconds: 8000), begin: -2,end: 0, curve: Curves.easeOutExpo), //Curves.easeOutExpo
                                  ScaleEffect(duration: Duration(milliseconds: 4000), begin: Offset(0.65, 0.65),curve: Curves.easeOutExpo),
                               ],
                              child: Container(decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            
                                            gradient: const LinearGradient(
                                              stops: [0.1, 0.9],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [Colors.deepPurple, Colors.pink]
                                              ),
                                            boxShadow: myBoxShadow,
                                          ),),
                            ),
                        
                        
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade300,
                                            //boxShadow: myBoxShadow,
                                          ),),
                            ),
                            Center(child:  Text(((_number * widget.age) ~/ 20).toString() , style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: 7),)),
                          ],
                        ),
                      ),
                      
                      const Gap(50),
                  
                      Container(
                        width: 150,
                        height: 40,
                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.grey.shade300,
                                          boxShadow: myBoxShadow,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Icon(Icons.restart_alt_rounded, color: Theme.of(context).primaryColor,),
                            Gap(10),
                             Text("Retry", style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 17, letterSpacing: 2),)
                          ],
                        ),
                      ),

                      const Gap(25),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        ),]
      ),
    );
  }
}

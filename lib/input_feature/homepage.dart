import 'package:age_guru/input_feature/bloc/input_bloc.dart';
import 'package:age_guru/input_feature/bloc/input_event.dart';
import 'package:age_guru/input_feature/bloc/input_state.dart';
import 'package:age_guru/input_feature/repository/guessAgeApi.dart';
import 'package:age_guru/result_feature/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;



  
  @override
  Widget build(BuildContext context) {
  final nameController = TextEditingController();
    
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

    return BlocProvider(
      create: (context) => InputBloc(ageApi: GuessAgeApi()),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    
        appBar: AppBar(
          shadowColor: Colors.transparent,
          
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          
          title: Center(child: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
        ),
    
    
    
        body: ListView(
          children: [
            Center(
            child:  Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 100, bottom: 100),
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
                    
                       const Text("Enter your name and i'll guess your age.", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),textAlign: TextAlign.center,),
                    
                        const Gap(50),

                        BlocBuilder<InputBloc, InputState>(
                         builder: (context, state) {
                            return TextField(
                               
                               controller: nameController,
                               style: TextStyle(color: Colors.grey.shade800),
                               decoration: InputDecoration(
                               suffixIcon: state is InputFailure? Icon(Icons.clear_rounded, color: Colors.red.shade700,) :Icon(null),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: state is InputFailure?Colors.red.shade700: Colors.white, width:  state is InputFailure?3:1),
                                     borderRadius: BorderRadius.circular(12),
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: state is InputFailure?Colors.red.shade700:Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(12),
                                   ),
                                   fillColor: Colors.grey.shade200,
                                   filled: true,
                                   hintText: "Your name",
                                   hintStyle: TextStyle(color: Colors.grey[500])),
                             );
                           }
                       ),
    
                        const Gap(25),

                        BlocConsumer<InputBloc, InputState>(
                                      listener: (context, state) {
                                        if (state is InputSuccess) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                      builder: (context) => ResultPage(title: "Result          ",age: state.age),
                                            ),
                                          );
                                        } 
                                      },
                                      builder: (context, state) {
                                        if (state is InputLoading) {
                                          return CircularProgressIndicator(color: Theme.of(context).primaryColor, strokeWidth: 8,);
                                        }
                                        return  GestureDetector(
                                                                onTap:() => context.read<InputBloc>().add(NameSubmitted(nameController.text)),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25, right: 25),
                                                                  child: Container(
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                      color: Theme.of(context).primaryColor, 
                                                                      boxShadow: myBoxShadow,
                                                                      borderRadius: BorderRadius.circular(12),
                                                                      ),
                                                                    child: const  Center(child: Text("Generate", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 15, letterSpacing: 2),)),
                                                                  ),
                                                                ),
                                        );
                                      },
                                    ),
              
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
          ),]
        ),
      ),
    );
  }
}

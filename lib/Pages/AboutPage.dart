import 'package:flutter/material.dart';
import 'package:gdsc_task/Utils/MyRoutes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  final String des="Tic Tac Toe is a classic two-player strategy game where players take turns marking 'X' and 'O' on a 3x3 grid to try and form a line of their symbol horizontally, vertically, or diagonally to win.";

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text("ABOUT",style: TextStyle(fontSize: 50,color: Colors.lightGreen,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 30,
            ),
            Align(alignment: Alignment.centerLeft,
              child: Padding(padding: EdgeInsets.all(15.0),
                  child: Text(" DESCRIPTION:",style: TextStyle(fontWeight: FontWeight.bold),)),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(des,style: TextStyle(fontWeight: FontWeight.bold,),)),
            SizedBox(
              height: 100,
            ),
            Text("'GDSC App Development Submission'",style: TextStyle(fontWeight:FontWeight.w900 ),),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: ()
              {
                Navigator.pushNamed(context,MyRoutes.HomePage);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: Text("HOME",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.cyanAccent),),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),


          ]
      ),






    );




  }
}

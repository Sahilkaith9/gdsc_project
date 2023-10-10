import 'package:flutter/material.dart';
import 'package:gdsc_task/Utils/MyRoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {



    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Text("TIK TAC TOE",style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold),),
            SizedBox(
              height: 70,
            ),
            Container
              ( height: 250,width: 250,
              child: Image.asset("assets/images/img.png",),
            ),
          SizedBox(
              height:80 ,
            ),

            InkWell(
              onTap: (){

                Navigator.pushNamed(context, MyRoutes.game);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child:Text("PLAY",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 50,
            ),
            InkWell(
              onTap: ()
              {
                Navigator.pushNamed(context,MyRoutes.AboutPage);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: 100,
                height: 50,
                alignment: Alignment.center,
                child: Text("ABOUT",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.cyanAccent),),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),



          ],
        ),
      ),
    );

  }
}

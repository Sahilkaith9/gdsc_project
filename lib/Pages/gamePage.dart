import 'dart:async';
import 'package:flutter/material.dart';


class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  List<String>displayXO=['','','','','','','','',''];
  List<int>matchedIndexes=[];
  int attempts=0;
  bool oturn=true;
  String resultDeclaration='';
  int oScore=0;
  int xScore=0;
  int filledBoxes=0;
  bool winnerFound =false;
  static const maxSeconds=60;
  int seconds=maxSeconds;
  Timer?timer;

  void startTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(seconds>0)
        {
          seconds--;
        }
        else{
          stopTimer();
        }
      });
    });
  }
  void stopTimer(){
    resetTimer();
    timer?.cancel();
  }
  void resetTimer()=>seconds=maxSeconds;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          Text("Player O",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                          Text(oScore.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.blue),)
                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Player X",style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                          Text(xScore.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),)
                        ],
                      )
                    ],
                  ),
                )
            ),
            SizedBox(height: 100,),
            Expanded(
              flex: 3,
              child: Container(
                width: 258,height: 258,
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder:(context, index) {
                  return GestureDetector(
                    onTap: ()
                    {
                      _tapped(index);
                    },
                    child: Container(decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 5,color:Colors.black
                        ),
                        color:matchedIndexes.contains(index)?Colors.cyan:Colors.lightGreen //color for the box

                    ),
                      child: Center(
                          child: Text(displayXO[index],style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)
                      ),
                    ),
                  );
                },
                  itemCount: 9,),
              ),


            ),
            Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(resultDeclaration,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.cyan),
                      ),
                      SizedBox(height: 10,),
                      _builtTimer()
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );

  }
  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if(isRunning){
      setState(() {
        if (oturn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
        }
        else if (!oturn && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
        }
        oturn = !oturn;
        _checkWinner();
      }

      );
    }

  }

  void _checkWinner()  {
    //checking first row
    if (displayXO[0]==displayXO[1]&&displayXO[0]==displayXO[2]&&displayXO[0]!=''){
      setState(() {
        resultDeclaration ='Player' + " " + displayXO[0]+" "+ 'Wins!';
        matchedIndexes.addAll([0,1,2]);
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }// checking second row
    if (displayXO[3]==displayXO[4]&&displayXO[3]==displayXO[5]&&displayXO[3]!=''){
      setState(() {
        resultDeclaration ='Player' +" "+ " "+  displayXO[3]+" "+ 'Wins!';
        matchedIndexes.addAll([3,4,5]);
        stopTimer();
        _updateScore(displayXO[3]);
      });
    }//checking third row
    if (displayXO[6]==displayXO[7]&&displayXO[6]==displayXO[8]&&displayXO[6]!=''){
      setState(() {
        resultDeclaration ='Player' +" "+" "+  displayXO[6]+" "+ 'Wins!';
        matchedIndexes.addAll([6,7,8]);
        stopTimer();
        _updateScore(displayXO[6]);
      });
    }//checking 1 column
    if (displayXO[0]==displayXO[3]&&displayXO[0]==displayXO[6]&&displayXO[0]!=''){
      setState(() {
        resultDeclaration ='Player'+" "+" "+  displayXO[0]+ " "+'Wins!';
        matchedIndexes.addAll([0,3,6]);
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }//checking 2 column
    if (displayXO[1]==displayXO[4]&&displayXO[1]==displayXO[7]&&displayXO[1]!=''){
      setState(() {
        resultDeclaration ='Player' +" "+" " + displayXO[1]+" "+ 'Wins!';
        matchedIndexes.addAll([1,4,7]);
        stopTimer();
        _updateScore(displayXO[1]);
      });
    }//checking 3 column
    if (displayXO[2]==displayXO[5]&&displayXO[2]==displayXO[8]&&displayXO[2]!=''){
      setState(() {
        resultDeclaration ='Player' +" "+" "+  displayXO[2]+ " "+ 'Wins!';
        matchedIndexes.addAll([2,5,8]);
        stopTimer();
        _updateScore(displayXO[2]);
      });
    }//checking diagonal
    if (displayXO[0]==displayXO[4]&&displayXO[0]==displayXO[8]&&displayXO[0]!=''){
      setState(() {
        resultDeclaration ='Player' +" "+" "+  displayXO[0]+ " "+'Wins!';
        matchedIndexes.addAll([0,4,8]);
        stopTimer();
        _updateScore(displayXO[0]);
      });
    }
    //checking diagonal
    if (displayXO[6]==displayXO[4]&&displayXO[6]==displayXO[2]&&displayXO[6]!='') {
      setState(() {
        resultDeclaration = 'Player' +" "+" "+ displayXO[6] +" "+ 'Wins!';
        matchedIndexes.addAll([6,4,2]);
        stopTimer();
        _updateScore(displayXO[6]);
      });
    }
    if(!winnerFound &&filledBoxes==9){
      setState(() {
        resultDeclaration='Nobody Wins';
      });
    }

  }
  void _updateScore(String winner){
    if(winner=='O'){
      oScore++;
    }
    else if(winner =='X'){
      xScore++;
    }
    winnerFound=true;
  }
  void _clearBoard()
  {
    setState(() {
      for(int i=0;i<9;i++)
      {
        displayXO[i]='';
      }
      resultDeclaration='';
    });
    filledBoxes=0;
  }
  Widget _builtTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning ?SizedBox(
      width: 100,height: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1-seconds/maxSeconds,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            strokeWidth: 8.0,
            backgroundColor: Colors.white,

          ),
          Center(
            child: Text('$seconds',style: TextStyle(fontWeight: FontWeight.bold,fontSize:30),),
          )
        ],
      ),
    ):
    ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen,padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16)),
        onPressed: (){
          startTimer();
          _clearBoard();
          attempts++;

        },
        child:Text( attempts==0 ? "START": "PLAY AGAIN!"));
  }

}


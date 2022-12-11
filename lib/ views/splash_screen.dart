import 'package:arsplashscreen/constants.dart';
import 'package:arsplashscreen/login.dart';
import 'package:arsplashscreen/register.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _arController;
  bool copAnimated = false;
  bool animatearText = false;

  @override
  void initState() {
    super.initState();
   _arController = AnimationController(vsync: this);
    _arController.addListener(() {
     if (_arController.value > 0.7) {
       _arController.stop();
    copAnimated = true;
        setState(() {});
          Future.delayed(const Duration(seconds: 3), () {
            animatearText = true;
            setState(() {});
          });
        }
    });
    }

  @override
  void dispose() {
    super.dispose();
    _arController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Colors.lightBlue[300],
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds:3),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(copAnimated ? 40.0 : 0.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Visibility(
                   visible: !copAnimated,
                  child: Lottie.asset(
                    'assets/watch.json',
                    controller: _arController,
                    onLoaded: (composition) {
                      _arController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image.asset(
                    'assets/watches.jpg',
                    height: 190.0,
                    width: 190.0,
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: AnimatedOpacity(
                    opacity: animatearText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      'W A T C H',
                      style: TextStyle(fontSize: 50.0, color: Colors.lightBlue),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 30,),

            Container(
                       height: 50,
                         decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       gradient:  LinearGradient(
                       colors: [
                       Color.fromRGBO(105, 105, 104, 1),
                         Color.fromRGBO(128, 128, 128, .6),
                       ],
                       ),
                      ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                        builder:(context)=>login())
                    );
                  },
                  child:Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                      ),
                )
            ),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(105, 105, 104, 1),
                            Color.fromRGBO(128, 128, 128, .6),
                          ]
                      )
                  ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder:(context)=>register())
                        );
                      },
                      child:Center(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ),
        ),
                SizedBox(height: 70,)
              ]
          ),
        )
    );
  }
}
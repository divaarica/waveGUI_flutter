import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:camera/camera.dart';
import 'package:wave_project/main.dart';
import 'package:wave_project/widget/card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraController controller;//un controller permet de gerer un des parametre d' un widget hors de son contexte de base
  PageController pageController=PageController();
  int value=0;

  @override
  void initState() {//fonction de base
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.max); //on lui affecte la liste des camera
    controller.initialize().then((_) { //on initialise le controller de camera,
      if (!mounted) {//on verifie si c'est bien monte
        return;
      }
      setState(() {});
    }).catchError((Object e) { //cath error pour les autorisation
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() { //fermer ,le controller,tout les element qu'on a creer , car la camera n'a pas le droit de tourner en arriere plan
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              Stack(
                children: [
                  Center(
                    child: AspectRatio(
                        aspectRatio: MediaQuery.of(context).size.width / //media query nous donne toutes les informaaton de la taille de l'ecran pour nous permetre de bien faire la ratio , le rograge de la  camera en fonction de l'ecran
                            MediaQuery.of(context).size.height,
                        child: CameraPreview(controller)),
                  ),
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.srcOut),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              backgroundBlendMode: BlendMode.dstOut
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(30),
                            height: 300,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                child: Center(
                  child: RotatedBox(quarterTurns:1,child: CardWidget(isClickable: false,)),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 30),
            child:  AnimatedToggleSwitch<int>.size(
              current: value,
              style: ToggleStyle(
                backgroundColor: Colors.black,
                indicatorColor: Colors.grey,
                borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(25.0),
                indicatorBorderRadius: BorderRadius.zero,
              ),
              values: const [0, 1],
              iconOpacity: 1.0,
              selectedIconScale: 1.0,
              indicatorSize: const Size.fromWidth(150),
              iconAnimationType: AnimationType.onHover,
              styleAnimationType: AnimationType.onHover,
              spacing: 2.0,
              customSeparatorBuilder: (context, local, global) {
                final opacity =
                ((global.position - local.position).abs() - 0.5)
                    .clamp(0.0, 1.0);
                return VerticalDivider(
                    indent: 10.0,
                    endIndent: 10.0,
                    color: Colors.white38.withOpacity(opacity));
              },
              customIconBuilder: (context, local, global) {
                final text = const ['Scanner un code', 'Ma carte'][local.index];
                return Center(
                    child: Text(text,
                        style: TextStyle(
                            color: Color.lerp(Colors.white, Colors.white,
                                local.animationValue))));
              },
              borderWidth: 0.0,
              onChanged: (i) => setState(() {
                value = i;
                pageController.animateToPage(value, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
              }),
            ),
          )
        ],
      ),
    );
  }
}

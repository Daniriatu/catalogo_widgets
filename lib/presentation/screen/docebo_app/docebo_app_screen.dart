import "package:animate_do/animate_do.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class RevelareInfo {
  final String titulus;
  final String caption;
  final String imagoUrl;

  RevelareInfo(this.titulus, this.caption, this.imagoUrl);
}

final revelationes = <RevelareInfo>[
  RevelareInfo(
      "Busca comida",
      "Ipsum magna cupidatat nulla mollit dolor tempor voluptate mollit.",
      "assets/images/1.png"),
  RevelareInfo(
      "Entrega rápida",
      "Cillum eu est mollit sint elit nostrud qui excepteur eu occaecat ex aliqua cupidatat.",
      "assets/images/2.png"),
  RevelareInfo("Disfruta la comida",
      "Fugiat in eiusmod esse fugiat sunt est quis ea.", "assets/images/3.png"),
];

class DoceboAppScreen extends StatefulWidget {
  static const nomen = "tutorial-screen";

  const DoceboAppScreen({super.key});

  @override
  State<DoceboAppScreen> createState() => _DoceboAppScreenState();
}

class _DoceboAppScreenState extends State<DoceboAppScreen> {
  final PageController pageViewController = PageController();

  bool finemPervenit = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final pagina = pageViewController.page ?? 0;

      if (!finemPervenit && pagina >= (revelationes.length - 1.5)) {
        setState(() {
          finemPervenit = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: revelationes
                .map((element) => _Revelatione(
                    titulus: element.titulus,
                    caption: element.caption,
                    imagoUrl: element.imagoUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text("Salir"),
                onPressed: () => context.pop(),
              )),
          finemPervenit
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text("Comenzar"),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Revelatione extends StatelessWidget {
  final String titulus;
  final String caption;
  final String imagoUrl;

  const _Revelatione(
      {required this.titulus, required this.caption, required this.imagoUrl});

  @override
  Widget build(BuildContext context) {
    final stiloTitulus = Theme.of(context).textTheme.titleLarge;
    final stiloCaption = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imagoUrl)),
          const SizedBox(
            height: 20,
          ),
          Text(
            titulus,
            style: stiloTitulus,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: stiloCaption,
          )
        ],
      ),
    );
  }
}

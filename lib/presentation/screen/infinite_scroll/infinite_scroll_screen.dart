import "package:animate_do/animate_do.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class InfiniteScrollScreen extends StatefulWidget {
  static const nomen = "infinite-screen";

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imaginesIds = [1, 2, 3, 4, 5];

  bool oneratusEst = false;

  bool factumEst = true;

  final ScrollController scrollController = ScrollController();

  void quinceImaginesAddo() {
    final finalisId = imaginesIds.last;

    // imaginesIds.add(finalisId + 1);

    imaginesIds.addAll([1, 2, 3, 4, 5].map((e) => finalisId + e));
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        vadeProximamPagina();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();

    factumEst = false;
  }

  Future vadeProximamPagina() async {
    if (oneratusEst) return;

    oneratusEst = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    quinceImaginesAddo();

    oneratusEst = false;

    if (!factumEst) return;

    setState(() {});

    movereScrollAdDescendit();
  }

  Future<void> cumRenovat() async {
    oneratusEst = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    if (!factumEst) return;

    oneratusEst = false;

    final finalisId = imaginesIds.last;

    imaginesIds.clear();

    imaginesIds.add(finalisId + 1);

    quinceImaginesAddo();

    setState(() {});
  }

  void movereScrollAdDescendit() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: cumRenovat,
          edgeOffset: 10,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imaginesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage("assets/images/jar-loading.gif"),
                image: NetworkImage(
                    "https://picsum.photos/id/${imaginesIds[index]}/500/300"),
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: oneratusEst
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}

import 'package:app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: whiteColor,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  bottom: PreferredSize(
                    preferredSize: size * 0.05,
                    child: Container(
                        padding: EdgeInsets.all(size.height * 0.03),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(size.height * 0.04),
                              topRight: Radius.circular(size.height * 0.04)),
                        ),
                        child: Text(
                          "❔ استثمارتك",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )),
                  ),
                  pinned: true,
                  stretch: true,
                  //! Add Stack Here .............................
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.white, //whiteColor,
                      height: size.height * 0.6,
                      child: Column(children: [
                        Stack(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.02,
                              vertical: size.height * 0.04,
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(children: const [
                                      Icon(Icons.search),
                                      SizedBox(width: 8),
                                      Icon(Icons.notifications),
                                    ])
                                  ]),
                            ),
                          ),
                        ])
                      ]),
                    ),
                  ),
                  expandedHeight: 400,
                ),
              ],
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  color: whiteColor,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

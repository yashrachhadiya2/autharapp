import 'package:autharapp/controller/homeController.dart';
import 'package:autharapp/modal/firebase.dart';
import 'package:autharapp/modal/modalScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  List<ModalData> alldataList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Brows",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/add');
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: readData(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              alldataList.clear();
              List<QueryDocumentSnapshot> list = snapshot.data!.docs;
              for (var d1 in list) {
                Map m1 = d1.data() as Map<String, dynamic>;
                String key = d1.id;
                String autharname = m1['Authar'];
                String about = m1['About'];
                String book = m1['Book'];
                String ratings = m1['Ratings'];
                String year = m1['Year'];
                ModalData modalData = ModalData(
                  AutharName: autharname,
                  About: about,
                  Book: book,
                  Ratings: ratings,
                  Year: year,
                );
                alldataList.add(modalData);
              }

              return ListView.builder(
                  itemCount: alldataList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 60),
                                child: Text(
                                  "${alldataList[index].AutharName}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 100),
                                child: Row(
                                  children: [
                                    Text("⭐⭐⭐⭐⭐"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("${alldataList[index].Ratings}"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Text("${alldataList[index].Book}"),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(left: 60, top: 50),
                          height: 225,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10,
                                  offset: Offset(0, 0))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 76, left: 30),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    imageUrl: "${alldataList[index].image}"),


                              ),
                            ),
                            height: 170,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                      ],
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

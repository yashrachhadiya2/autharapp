import 'package:cloud_firestore/cloud_firestore.dart';

void insertData(String Authar, String About, String Book, String Ratings , String Year,String image) {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference collectionReference = firebaseFirestore.collection(
      "Authar");

  collectionReference.add(
      {"Authar": "$Authar", "About": "$About", "Book": "$Book", "Ratings": "$Ratings","Year":"$Year","image":"$image"}).then((
      value) => print("Success")).catchError((errore) =>
      print("Errore $errore"));
}

Stream<QuerySnapshot<Map<String, dynamic>>> readData(){
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  return firebaseFirestore.collection("Authar").snapshots();
}

//
// void updateData(String key,String id , String name,String mobile,String std){
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   firebaseFirestore.collection("Student").doc("$key").set({"id":"$id","name":"$name","std":"$std","mobile":"$mobile"});
// }
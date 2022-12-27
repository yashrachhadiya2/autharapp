import 'package:autharapp/modal/firebase.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAuthor = TextEditingController();
  TextEditingController txtBook = TextEditingController();
  TextEditingController txtRating = TextEditingController();
  TextEditingController txtYear = TextEditingController();
  TextEditingController txtimglink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Book",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: 'Authar Name',
                    prefixIcon: Icon(Icons.person_rounded),
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: txtAuthor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: 'About Author',
                      prefixIcon: Icon(Icons.edit),
                  ),
                ),
                SizedBox(height: 15,),

                TextField(
                  controller: txtBook,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: 'About Book',
                      prefixIcon: Icon(Icons.menu_book),
                  ),
                ),
                SizedBox(height: 15,),

                TextField(
                  controller: txtRating,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: 'Ratings',
                      prefixIcon: Icon(Icons.star),
                  ),
                ),
                SizedBox(height: 15,),

                TextField(
                  controller: txtYear,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: 'Publish Year',
                      prefixIcon: Icon(Icons.calendar_month)
                  ),
                ),
                SizedBox(height: 15,),

                TextField(
                  controller: txtimglink,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      hintText: 'image link',
                      prefixIcon: Icon(Icons.image),
                  ),
                ),

                // ElevatedButton(onPressed: (){
                //
                //
                //
                // },
                //   child: Text("Add Photo",style: TextStyle(
                //     fontSize: 25,
                //   ),),
                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),),
                SizedBox(height: 30,),

                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(onPressed: (){


                    insertData(txtName.text, txtAuthor.text, txtBook.text, txtRating.text, txtYear.text,txtimglink.text);

                  },
                    child: Text("Finish",style: TextStyle(
                      fontSize: 25,
                    ),),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

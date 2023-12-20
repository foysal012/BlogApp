


import 'package:blog_app/provider/auth_services.dart';
import 'package:blog_app/provider/blog_list_services.dart';
import 'package:blog_app/screen/add_new_blog.dart';
import 'package:blog_app/screen/blog_api3(delete_blog).dart';
import 'package:blog_app/screen/update_blog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {



    var authServices = Provider.of<AuthServices>(context, listen: false);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        padding: EdgeInsets.only(
          left: 20,
          right: 20
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              SizedBox(
                height: height * 0.04,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                      onPressed: (){
                        //authServices.setSignOut(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Color(0xff4AA4D6),)
                  ),

                  Text("HomePage",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4AA4D6),
                      fontSize: 25,
                      letterSpacing: 2,
                    ),
                  ),

                  IconButton(
                      onPressed: (){
                        authServices.setSignOut(context);
                      },
                      icon: Icon(Icons.logout, color: Color(0xff4AA4D6),)
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.01,
              ),

              FutureBuilder(
                  //future: getAllBlog(),
                  future: BlogListServices().getAllBlog(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("No Blog Found there"),
                        ],
                      );
                    }

                    else if(snapshot.connectionState == ConnectionState.waiting){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         CircularProgressIndicator(color: Color(0xff4AA4D6),),
                         Text("Loading..."),
                        ],
                      );
                    }

                    else{
                      return Container(
                        child: Column(

                          children: [

                            Text("page No: ${snapshot.data["data"]["blogs"]["current_page"]}"),

                            ListView.builder(
                              //scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                //reverse: true,
                                itemCount: 20,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: InkWell(
                                      onTap: (){
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                                top: 2,
                                                bottom: 2
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xff4AA4D6),
                                                  width: 5,
                                                )
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Id: ${snapshot.data["data"]["blogs"]["data"][index]["id"].toString()}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text("Category Id: ${snapshot.data["data"]["blogs"]["data"][index]["category_id"].toString()}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Text("${snapshot.data["data"]["blogs"]["data"][index]["title"].toString()}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text("${snapshot.data["data"]["blogs"]["data"][index]["sub_title"].toString()}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                  ),
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("${snapshot.data["data"]["blogs"]["data"][index]["slug"].toString()}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    Text("${snapshot.data["data"]["blogs"]["data"][index]["date"].toString()}",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Text("${snapshot.data["data"]["blogs"]["data"][index]["description"].toString()}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                          Positioned(
                                              top: 12,
                                              right: 28,
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateBlog(
                                                      titleController: snapshot.data["data"]["blogs"]["data"][index]["title"],
                                                      subTitleController: snapshot.data["data"]["blogs"]["data"][index]["sub_title"],
                                                      slugController: snapshot.data["data"]["blogs"]["data"][index]["slug"],
                                                      descriptionController: snapshot.data["data"]["blogs"]["data"][index]["description"],
                                                      category_idController: snapshot.data["data"]["blogs"]["data"][index]["category_id"].toString(),
                                                      dateController: snapshot.data["data"]["blogs"]["data"][index]["date"],
                                                      postIdController: snapshot.data["data"]["blogs"]["data"][index]["id"].toString(),
                                                    )));
                                                  },
                                                  icon: Icon(Icons.edit, color: Colors.green, size: 25,)
                                              )
                                          ),

                                          Positioned(
                                              top: 12,
                                              right: 2,
                                              child: IconButton(
                                                  onPressed: () async{
                                                   await BlogApi3.deleteBlogPost(snapshot.data["data"]["blogs"]["data"][index]["id"]);
                                                   setState(() {

                                                   });
                                                  },
                                                  icon: Icon(Icons.delete, color: Colors.red, size: 25,)
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    }
                  }
              ),

              SizedBox(
                height: height * 0.01,
              ),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewBlog()));
          },
      child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xff4AA4D6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(Icons.add, size: 35,)),
      ),
    );
  }
}

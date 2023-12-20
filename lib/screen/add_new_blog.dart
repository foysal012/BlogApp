import 'package:blog_app/screen/blog_api(add_blog).dart';
import 'package:blog_app/widget/my_text_field.dart';
import 'package:flutter/material.dart';

class AddNewBlog extends StatefulWidget {
  const AddNewBlog({Key? key}) : super(key: key);

  @override
  State<AddNewBlog> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlog> {

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController slugController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController category_idController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController tagsController = TextEditingController();

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
            left: 20,
            right: 20
        ),
        color: Colors.grey[300],
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: height * 0.04,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back, color: Color(0xff4AA4D6), size: 35,)
                  ),
                  
                  Text("Add New Blog",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4AA4D6),
                    fontSize: 25,
                    letterSpacing: 2,
                  ),
                  ),

                  IconButton(
                      onPressed: () async{
                        await BlogApi.createBlogPost(
                          title: titleController.text.toString(),
                          subTitle: subTitleController.text.toString(),
                          slug: slugController.text.toString(),
                          description: descriptionController.text.toString(),
                          categoryId: int.parse(category_idController.text.toString()),
                          date: DateTime.now(),
                          tags: ['flutter', 'http'],
                        ).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("successfully added")));
                        }).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      },
                      icon: Icon(Icons.save, color: Color(0xff4AA4D6), size: 35,)
                  ),
                ],
              ),

              SizedBox(height: height * 0.05,),


              MyTextFieldWidget(
                  nameController: titleController,
                  text1: "Title",
                  text2: "title...",
              ),

              SizedBox(height: height * 0.01,),

              MyTextFieldWidget(
                nameController: subTitleController,
                text1: "Sub Title",
                text2: "sub title...",
              ),

              SizedBox(height: height * 0.01,),

              MyTextFieldWidget(
                nameController: slugController,
                text1: "Slug",
                text2: "slug...",
              ),

              SizedBox(height: height * 0.01,),

              MyTextFieldWidget(
                nameController: descriptionController,
                text1: "Description",
                text2: "description...",
              ),

              SizedBox(height: height * 0.01,),

              MyTextFieldWidget(
                nameController: category_idController,
                text1: "Category_id",
                text2: "category_id...",
              ),

              SizedBox(height: height * 0.01,),

              MyTextFieldWidget(
                nameController: dateController,
                text1: "Date",
                text2: "date...",
              ),

              SizedBox(height: height * 0.01,),

              MyTextFieldWidget(
                nameController: tagsController,
                text1: "Tags",
                text2: "tags...",
              ),

            ],
          ),
        ),
      ),
    );
  }
}

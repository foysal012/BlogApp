import 'package:blog_app/screen/blog_api(add_blog).dart';
import 'package:blog_app/screen/blog_api2(update_blog).dart';
import 'package:blog_app/widget/my_text_field.dart';
import 'package:flutter/material.dart';

class UpdateBlog extends StatefulWidget {
   UpdateBlog({Key? key, this.titleController, this.subTitleController,
     this.slugController, this.category_idController, this.descriptionController,
     this.dateController, this.postIdController}) : super(key: key);

   String? titleController;
   String? subTitleController;
   String? slugController;
   String? descriptionController;
   String? category_idController;
   String? dateController;
   String? postIdController;

  @override
  State<UpdateBlog> createState() => _UpdateBlogState();
}

class _UpdateBlogState extends State<UpdateBlog> {

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
    titleController.text = widget.titleController.toString();
    subTitleController.text = widget.subTitleController.toString();
    slugController.text = widget.slugController.toString();
    descriptionController.text = widget.descriptionController.toString();
    category_idController.text = widget.category_idController.toString();
    dateController.text = widget.dateController.toString();
    //titleController.text = widget.titleController.toString();

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

                  Text("Update Blog",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4AA4D6),
                      fontSize: 25,
                      letterSpacing: 2,
                    ),
                  ),

                  IconButton(
                      onPressed: () async{
                        // await BlogApi.createBlogPost(
                        //   title: titleController.text.toString(),
                        //   subTitle: subTitleController.text.toString(),
                        //   slug: slugController.text.toString(),
                        //   description: descriptionController.text.toString(),
                        //   categoryId: int.parse(category_idController.text.toString()),
                        //   date: DateTime.now(),
                        //   tags: ['flutter', 'http'],
                        // ).then((value) {
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("successfully updated")));
                        //   titleController.clear();
                        //   subTitleController.clear();
                        //   slugController.clear();
                        //   descriptionController.clear();
                        //   category_idController.clear();
                        //   dateController.clear();
                        // }).whenComplete(() {
                        //   Navigator.of(context).pop();
                        // });

                        await BlogApi2.updateBlogPost(
                          // title: titleController.text.toString(),
                          // subTitle: subTitleController.text.toString(),
                          // slug: slugController.text.toString(),
                          // description: descriptionController.text.toString(),
                          // categoryId: int.parse(category_idController.text.toString()),
                          // date: DateTime.now(),
                          // tags: ['flutter', 'http'],

                          postId: int.parse(widget.postIdController.toString()),
                          title: titleController.text.toString(),
                          subTitle: subTitleController.text.toString(),
                          slug: slugController.text.toString(),
                          description: descriptionController.text.toString(),
                          categoryId: int.parse(category_idController.text.toString()),
                          date: DateTime.now(),
                          tags: ['flutter', 'http'],
                        ).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("successfully updated")));
                          //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.postIdController}")));
                          // titleController.clear();
                          // subTitleController.clear();
                          // slugController.clear();
                          // descriptionController.clear();
                          // category_idController.clear();
                          // dateController.clear();
                        }).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      },
                      icon: Icon(Icons.update, color: Color(0xff4AA4D6), size: 35,)
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

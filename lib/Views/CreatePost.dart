import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:todoapp_mobx/Store/TodoChange.dart';
import 'package:mobx/mobx.dart';
import 'package:todoapp_mobx/Store/index.dart';

class CreatePost extends StatefulWidget {

  final bool isEditing;
  final int docId;
  final String title,content;

  CreatePost(this.isEditing,this.docId,this.title,this.content);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  String title = '';
  String content = '';

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
    content = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = DateFormat('kk:mm').format(now);
    String date = DateFormat('d EEE, MMM').format(now);
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.deepPurple.shade300,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('Create',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          //save button
          floatingActionButton: FloatingActionButton.extended(
            onPressed: !widget.isEditing ? (){
              if(_formKey.currentState!.validate()) {
                if (content.length > 0) {

                  Map<String,String> data = {
                    'title': title,
                    'content': content,
                    'time': time.toString(),
                    'date': date.toString(),
                  };

                  todoStore.set(data);
                  //todoStore.insert();

                  print('entered data');
                  print(todoStore.posts);

                  Navigator.pop(context);
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Content cannot be empty'),
                  ));
                }
              }
              else
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error fill details properly'),
                ));
              }
            } : (){
              if(_formKey.currentState!.validate()) {
                if (content.length > 0) {

                  Map<String,String> data = {
                    'title': title,
                    'content': content,
                    'time': time.toString(),
                    'date': date.toString(),
                  };

                  todoStore.update(data, widget.docId);
                  Navigator.pop(context);
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Content cannot be empty'),
                  ));
                }
              }
              else
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error fill details properly'),
                ));
              }
            },
            backgroundColor: Colors.deepPurple.shade400,
            label: Text('Save',style: TextStyle(color: Colors.white),),
            icon: Icon(Icons.upload_sharp,color: Colors.white,),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height-80,
            width: MediaQuery.of(context).size.width,
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      margin: EdgeInsets.only(top: 15,left: 15,right: 15),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade500,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        //controller: _titlecontroller,
                        initialValue: title,
                        onSaved: (value){
                          //_formKey.currentState.save();
                          title = value.toString();
                          //_titlecontroller.text = value;
                        },
                        onChanged: (value){
                          title = value;
                          //_titlecontroller.text = value;
                        },
                        cursorColor: Colors.white60,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          enabled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelText: 'Title',
                          labelStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
                          counterStyle: TextStyle(color: Colors.white60),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.white60
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Colors.white60
                            ),
                          ),
                        ),
                        maxLength: 120,
                        style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                    //content
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade500,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          //controller: _contentcontroller,
                          initialValue: content,
                          maxLines: null,
                          onSaved: (value){
                            content = value.toString();
                          },
                          onChanged: (value){
                            content = value;
                          },
                          autofocus: true,
                          cursorColor: Colors.white60,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 16,color: Colors.white60,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                )),
          )
      ),
    );
  }
}

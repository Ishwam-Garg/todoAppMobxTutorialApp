import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todoapp_mobx/Store/index.dart';
import 'package:todoapp_mobx/Views/CreatePost.dart';
import 'package:todoapp_mobx/Store/TodoChange.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePost(false,0,'','')));
        },
        child: Icon(Icons.add),
      ),

      body: Observer(
        builder:(context) {
          print(todoStore.posts.length);
          print(todoStore.posts);
          return ListView.builder(
              itemCount: todoStore.posts.length,
              itemBuilder: (BuildContext context,int index){
                return TodoTile(
                    context,
                  '${todoStore.posts[index]['content']}',
                  '${todoStore.posts[index]['title']}',
                  '${todoStore.posts[index]['time']}',
                  '${todoStore.posts[index]['date']}',
                  todoStore.posts[index],
                  index
                );
              });
        }
      ),

    );
  }

  Widget TodoTile(BuildContext context,String content,String title,String time,String date,Map<String,String> data,int docId){
    return GestureDetector(
      onLongPress: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text('Action',style: TextStyle(color: Colors.white70),),
            backgroundColor: Colors.deepPurple.shade300,
            content: Text('You are about to delete this post',style: TextStyle(color: Colors.white60),),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.green.shade600,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('Discard',style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),))),
                    GestureDetector(
                        onTap: (){
                          //delete here
                          todoStore.delete(data);
                          Navigator.pop(context);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Colors.red.shade800,
                                  width: 1
                              ),
                            ),
                            child: Text('Delete',style: TextStyle(color: Colors.red.shade800,fontWeight: FontWeight.bold),))),
                  ],
                ),
              ),
            ],
          );
        }
        );
      },
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePost(true, docId, title, content)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 15,left: 15,right: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.purple.shade400,
        ),
        child: Stack(
          children: [
            Positioned(
              child: Text(
                date,
                style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
              ),
              left: 25,bottom: 10,),
            Positioned(
              child: Text(
                time,
                style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
              ),
              right: 15,bottom: 10,),
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 25,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //title
                  Text(title,style: TextStyle(
                    color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,
                  ),
                    maxLines: 1,overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 15,),
                  Text(content,
                    style: TextStyle(fontSize: 14,color: Colors.white70,fontWeight: FontWeight.bold),
                    maxLines: 10,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'TodoChange.g.dart';

class TodoStore = TodoPosts with _$TodoStore;

abstract class TodoPosts with Store{
  @observable
  ObservableList<Map<String,String>> posts = ObservableList();

  @observable
  Map<String,String> _data = {
    'title':'',
    'content':'',
    'date':'',
    'time':'',
  };

  @action
  void set(Map<String,String> data){
    posts.add(data);
    //_data = data;
  }

  @action
  void delete(Map<String,String> data){
    posts.remove(data);
  }

  @action
  void update(Map<String,String> data,int docId)
  {
    posts[docId] = data;
  }


}
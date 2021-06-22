// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoChange.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on TodoPosts, Store {
  final _$postsAtom = Atom(name: 'TodoPosts.posts');

  @override
  ObservableList<Map<String, String>> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Map<String, String>> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$_dataAtom = Atom(name: 'TodoPosts._data');

  @override
  Map<String, String> get _data {
    _$_dataAtom.reportRead();
    return super._data;
  }

  @override
  set _data(Map<String, String> value) {
    _$_dataAtom.reportWrite(value, super._data, () {
      super._data = value;
    });
  }

  final _$TodoPostsActionController = ActionController(name: 'TodoPosts');

  @override
  void set(Map<String, String> data) {
    final _$actionInfo =
        _$TodoPostsActionController.startAction(name: 'TodoPosts.set');
    try {
      return super.set(data);
    } finally {
      _$TodoPostsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(Map<String, String> data) {
    final _$actionInfo =
        _$TodoPostsActionController.startAction(name: 'TodoPosts.delete');
    try {
      return super.delete(data);
    } finally {
      _$TodoPostsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(Map<String, String> data, int docId) {
    final _$actionInfo =
        _$TodoPostsActionController.startAction(name: 'TodoPosts.update');
    try {
      return super.update(data, docId);
    } finally {
      _$TodoPostsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}

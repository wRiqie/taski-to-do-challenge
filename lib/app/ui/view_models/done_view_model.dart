import 'package:flutter/material.dart';

import '../../data/models/todo_model.dart';

class DoneViewModel extends ChangeNotifier {
  List<TodoModel> todos = [
    TodoModel(
      id: '1',
      title: 'My First Todo',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae libero euismod, vestibulum risus ac, interdum odio. Aliquam mi libero, tincidunt vitae pretium eu, tempor id nunc. Aliquam erat volutpat. Mauris sit amet nunc sit amet sem varius euismod feugiat sit amet mauris. Nam bibendum urna sagittis mauris consequat, sit amet interdum nunc bibendum. Nulla eget mi eget tellus elementum pulvinar. In vel ligula vestibulum, semper metus et',
      isChecked: true,
    ),
    TodoModel(
      id: '1',
      title: 'My First Todo',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae libero euismod, vestibulum risus ac, interdum odio. Aliquam mi libero, tincidunt vitae pretium eu, tempor id nunc. Aliquam erat volutpat. Mauris sit amet nunc sit amet sem varius euismod feugiat sit amet mauris. Nam bibendum urna sagittis mauris consequat, sit amet interdum nunc bibendum. Nulla eget mi eget tellus elementum pulvinar. In vel ligula vestibulum, semper metus et',
      isChecked: true,
    ),
    TodoModel(
      id: '1',
      title: 'My First Todo',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae libero euismod, vestibulum risus ac, interdum odio. Aliquam mi libero, tincidunt vitae pretium eu, tempor id nunc. Aliquam erat volutpat. Mauris sit amet nunc sit amet sem varius euismod feugiat sit amet mauris. Nam bibendum urna sagittis mauris consequat, sit amet interdum nunc bibendum. Nulla eget mi eget tellus elementum pulvinar. In vel ligula vestibulum, semper metus et',
      isChecked: true,
    ),
    TodoModel(
      id: '1',
      title: 'My First Todo',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae libero euismod, vestibulum risus ac, interdum odio. Aliquam mi libero, tincidunt vitae pretium eu, tempor id nunc. Aliquam erat volutpat. Mauris sit amet nunc sit amet sem varius euismod feugiat sit amet mauris. Nam bibendum urna sagittis mauris consequat, sit amet interdum nunc bibendum. Nulla eget mi eget tellus elementum pulvinar. In vel ligula vestibulum, semper metus et',
      isChecked: true,
    ),
  ];
}

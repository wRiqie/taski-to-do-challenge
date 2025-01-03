import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/data/models/todo_model.dart';
import 'package:taski_to_do_challenge/app/ui/widgets/custom_check_box_widget.dart';

class TodoCardWidget extends StatefulWidget {
  final TodoModel todo;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onToggle;
  const TodoCardWidget({
    super.key,
    required this.todo,
    this.onEdit,
    this.onDelete,
    this.onToggle,
  });

  @override
  State<TodoCardWidget> createState() => _TodoCardWidgetState();
}

class _TodoCardWidgetState extends State<TodoCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.onSurfaceVariant,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: isExpanded
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              CustomCheckBoxWidget(
                isChecked: widget.todo.isChecked,
                onTap: widget.onToggle,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Visibility(
                      visible: isExpanded,
                      child: Text(
                        widget.todo.description.trim().isNotEmpty
                            ? widget.todo.description
                            : 'No description',
                        style: TextStyle(
                          color: colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !isExpanded,
                child: PopupMenuButton<String>(
                  child: Icon(
                    Icons.more_horiz,
                    color: colorScheme.secondary,
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<String>(
                        onTap: widget.onEdit,
                        child: const Text('Edit'),
                      ),
                      PopupMenuItem<String>(
                        onTap: widget.onDelete,
                        child: const Text('Delete'),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

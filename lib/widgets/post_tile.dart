import 'package:flutter/material.dart';
import 'package:spotify/models/post.dart';

class PostTile extends StatefulWidget {
  final Post post;

  const PostTile({super.key, required this.post});

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Theme.of(context).colorScheme.primary),
              SizedBox(
                width: 10,
              ),
              Text(widget.post.name,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 5,
              ),
              Text('@${widget.post.username}',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.post.message,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QueueOverview extends StatefulWidget {
  const QueueOverview({super.key});

  @override
  State<QueueOverview> createState() => _QueueOverviewState();
}

class _QueueOverviewState extends State<QueueOverview> {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(40),
      child: Text("Queue Overview page"),);
  }
}
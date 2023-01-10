import 'package:{{app_name}}/data/models/person_model.dart';
import 'package:flutter/material.dart';

class PersonWidget extends StatelessWidget {
  final PersonModel model;
  const PersonWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: Text(model.name),
    );
  }
}

import 'package:asynchronous_programming/core/utils/formatter/formatter.dart';
import 'package:asynchronous_programming/src/models/user_model.dart';
import 'package:asynchronous_programming/src/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.user,
  });

  final UserModel user;

  static String name = "details";
  static String path = "/details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(user.avatar),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "Company",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(user.company),
              const SizedBox(height: 16),
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(user.description),
              const SizedBox(height: 16),
              Text(
                "Created at",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(dateFormatter(user.createdAt)),
              const SizedBox(height: 24),
              ActionButton(
                onPressed: () {
                  context.pop(user.name);
                },
                child: const Text("SELECT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

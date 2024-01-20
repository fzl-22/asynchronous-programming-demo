import 'package:asynchronous_programming/core/exceptions/exception.dart';
import 'package:asynchronous_programming/src/models/user_model.dart';
import 'package:asynchronous_programming/src/services/user_remote_service.dart';
import 'package:asynchronous_programming/src/widgets/user_separator.dart';
import 'package:asynchronous_programming/src/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String name = "home";
  static String path = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _users = <UserModel>[];
  bool _isLoading = false;
  String _errorMessage = "";
  String _selectedUser = "";

  Future<void> _fetchUsers() async {
    _setLoader(true);
    try {
      final fetchedUsers = await UserRemoteService.fetchUsers();
      _users.addAll(fetchedUsers);
    } on APIException catch (e) {
      _errorMessage = "Error: ${e.message}";
    } finally {
      _setLoader(false);
    }
  }

  void _setLoader(bool loader) {
    setState(() {
      _isLoading = loader;
    });
  }

  void _onNavigateToDetails(UserModel user) async {
    final selectedUser = await context.pushNamed(
      "details",
      extra: user,
    );

    if (selectedUser == null) {
      return;
    }

    setState(() {
      _selectedUser = selectedUser.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Text("Selected User: $_selectedUser"),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _fetchUsers,
              child: _isLoading
                  ? _buildLoading()
                  : _errorMessage.isNotEmpty
                      ? _buildError()
                      : _buildContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _buildError() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            _errorMessage,
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget _buildContent() => ListView.separated(
        itemCount: _users.length,
        itemBuilder: (context, index) => UserTile(
          user: _users[index],
          onTap: () => _onNavigateToDetails(_users[index]),
        ),
        separatorBuilder: (context, index) => const UserSeparator(),
      );
}

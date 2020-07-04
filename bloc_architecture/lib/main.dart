import 'package:bloc_architecture/src/domain/blocs/books/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:bloc_architecture/src/data/BooksRepository.dart';
import 'package:bloc_architecture/src/data/net/BooksApiClient.dart';
import 'package:bloc_architecture/src/presentation/screens/BooksScreen.dart';
import 'package:bloc_architecture/src/resources/values/app_colors.dart';
import 'package:bloc_architecture/src/resources/values/app_strings.dart';

void main() {
  final BooksRepository repo = BooksRepository(
      booksApiClient: BooksApiClient(httpClient: http.Client()));
  runApp(App(repository: repo));
}

class App extends StatelessWidget {
  final BooksRepository repository;

  const App({
    Key key,
    @required this.repository,
  })  : assert(repository != null),
        super(key: key);

  Widget _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(AppStrings.APP_NAME)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.APP_NAME,
      theme: ThemeData(
        primarySwatch: AppColors.PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => BooksBloc(booksRepository: repository),
          child: Scaffold(appBar: _buildAppBar(), body: BooksScreen())),
    );
  }
}

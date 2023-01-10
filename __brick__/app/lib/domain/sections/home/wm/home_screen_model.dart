import 'package:{{app_name}}/data/models/person_model.dart';
import 'package:{{app_name}}/domain/services/executor.dart';
import 'package:{{app_name}}/domain/services/requester.dart';
import 'package:elementary/elementary.dart';

class HomeScreenModel extends ElementaryModel {
  final persons = EntityStateNotifier<List<PersonModel>>();

  void loadPersons() {
    execute<List<PersonModel>>(
      () => Requster.getListOfObjects<PersonModel>(
        '/people/',
        PersonModel.fromJson,
      ),
      onSuccess: (data) => persons.content(data!),
      onError: persons.error,
    );
  }
}

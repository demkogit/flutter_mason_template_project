import 'package:{{app_name}}/data/models/person_model.dart';
import 'package:{{app_name}}/domain/sections/home/wm/home_screen_model.dart';
import 'package:{{app_name}}/presentation/sections/home/home_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenWM extends WidgetModel<HomeScreen, HomeScreenModel> {
  HomeScreenWM(super.model);

  ListenableState<EntityState<List<PersonModel>>> get persons => model.persons;

  @override
  void initWidgetModel() {
    model.loadPersons();
    super.initWidgetModel();
  }
}

HomeScreenWM createHomeScreenWM(BuildContext _) =>
    HomeScreenWM(HomeScreenModel());

import 'package:elementary/elementary.dart';
import 'package:{{app_name}}/data/models/person_model.dart';
import 'package:{{app_name}}/domain/sections/home/wm/home_screen_wm.dart';
import 'package:{{app_name}}/presentation/sections/home/widgets/person_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ElementaryWidget<HomeScreenWM> {
  const HomeScreen({
    super.key,
  }) : super(createHomeScreenWM);

  @override
  Widget build(HomeScreenWM wm) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            EntityStateNotifierBuilder<List<PersonModel>>(
              listenableEntityState: wm.persons,
              loadingBuilder: (_, data) => const SliverToBoxAdapter(
                child: CircularProgressIndicator(),
              ),
              errorBuilder: (_, __, ___) => const SliverToBoxAdapter(
                child: Text('data'),
              ),
              builder: (_, persons) {
                return persons != null
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => PersonWidget(
                            model: persons[i],
                          ),
                          childCount: persons.length,
                        ),
                      )
                    : const SliverToBoxAdapter(
                        child: SizedBox(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

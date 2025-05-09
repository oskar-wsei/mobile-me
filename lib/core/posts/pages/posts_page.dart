import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/bloc/model_state.dart';
import 'package:mobile_me/core/posts/bloc/post_bloc.dart';
import 'package:mobile_me/core/posts/model/post_model.dart';
import 'package:mobile_me/core/posts/widgets/post_item_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/model_list_builder_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<PostBloc, ModelState>(
          builder: (context, state) {
            return ModelListBuilderWidget<PostModel, PostBloc>(
              state: state,
              title: 'Posts',
              icon: Icons.article,
              itemBuilder: (context, model) {
                return PostItemWidget(post: model);
              },
            );
          },
        ),
      ),
    );
  }
}

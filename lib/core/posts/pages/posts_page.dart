import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/posts/bloc/post_bloc.dart';
import 'package:mobile_me/core/posts/bloc/post_event.dart';
import 'package:mobile_me/core/posts/bloc/post_state.dart';
import 'package:mobile_me/core/posts/widgets/post_item_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/title_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PostErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is PostLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PostBloc>().add(PostLoadEvent());
                },
                child: Column(
                  children: [
                    TitleWidget(title: 'Posts', icon: Icons.article),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return PostItemWidget(post: state.posts[index]);
                          },
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

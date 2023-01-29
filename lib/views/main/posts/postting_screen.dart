// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/posts/create_post_model.dart';
import 'package:udemy_salon/models/posts/favarit_model.dart';
import 'package:udemy_salon/models/posts/post_list_model.dart';
import 'package:udemy_salon/views/atoms/rounded_button.dart';
import 'package:udemy_salon/views/main/posts/components/post_tile.dart';

class PosttingScreen extends ConsumerWidget {
  const PosttingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreatePostModel createPostModel = ref.watch(CreatePostProvider);
    final MainModel mainModel = ref.watch(mainProvider);
    final PostListModel postListModel = ref.watch(postListProvider);
    final FavoriteModel favoriteModel = ref.watch(favoriteProvider);
    final postDocs = postListModel.postDocs;
    return Scaffold(
      appBar: buildAppBar(),
      body: postListModel.postDocs.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: RoundedButton(
                    onPressed: () async => postListModel.onReload(),
                    widthRate: 0.5,
                    color: kPrimaryColor,
                    labelText: "リロード",
                    textSize: 16,
                  ),
                )
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    header: const WaterDropHeader(),
                    onRefresh: () async => postListModel.onRefresh(),
                    onLoading: () async => postListModel.onLoading(),
                    controller: postListModel.refreshController,
                    child: ListView.builder(
                      itemCount: postDocs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final postDoc = postDocs[index];
                        final Post post = Post.fromJson(postDoc.data()!);
                        return PostTile(
                          post: post,
                          mainModel: mainModel,
                          favoriteModel: favoriteModel,
                          postDoc: postDoc,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.new_label),
        onPressed: () => createPostModel.showPostFlashDialog(
            context: context, mainModel: mainModel),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('投稿'),
    );
  }
}

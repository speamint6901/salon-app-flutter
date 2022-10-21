// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:udemy_salon/atoms/rounded_button.dart';
import 'package:udemy_salon/atoms/user_image.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/create_post_model.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/models/post_list_model.dart';

class PosttingScreen extends ConsumerWidget {
  const PosttingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CreatePostModel createPostModel = ref.watch(CreatePostProvider);
    final MainModel mainModel = ref.watch(mainProvider);
    final PostListModel postListModel = ref.watch(postListProvider);
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
                        final doc = postDocs[index];
                        final Post post = Post.fromJson(doc.data()!);
                        return ListTile(
                          leading: UserImage(
                            userImageURL: post.imageURL,
                            length: 32,
                          ),
                          trailing: InkWell(
                            child: Icon(Icons.favorite),
                            onTap: () => {},
                          ),
                          title: Text(post.text),
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

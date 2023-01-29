// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:udemy_salon/constants/colors.dart';
import 'package:udemy_salon/domain/comments/comment.dart';
import 'package:udemy_salon/domain/post/post.dart';
import 'package:udemy_salon/models/comments/comment_list_model.dart';
import 'package:udemy_salon/models/comments/comment_model.dart';
import 'package:udemy_salon/models/main_model.dart';
import 'package:udemy_salon/views/atoms/rounded_button.dart';
import 'package:udemy_salon/views/main/comments/components/comment_tile.dart';

class CommentPage extends ConsumerWidget {
  const CommentPage({
    super.key,
    required this.post,
    required this.postDoc,
  });

  final Post post;
  final DocumentSnapshot<Map<String, dynamic>> postDoc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider);
    final CommentModel commentModel = ref.watch(commentProvider);
    final CommentListModel commentListModel = ref.watch(commentListProvider);
    final commentListDocs = commentListModel.commentDocs;
    return Scaffold(
      appBar: AppBar(
        title: Text('コメントページ'),
      ),
      body: commentListDocs.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: RoundedButton(
                    onPressed: () async =>
                        commentListModel.onReload(postDoc: postDoc),
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
                    onRefresh: () async =>
                        commentListModel.onRefresh(postDoc: postDoc),
                    onLoading: () async =>
                        commentListModel.onLoading(postDoc: postDoc),
                    controller: commentListModel.refreshController,
                    child: ListView.builder(
                      itemCount: commentListDocs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final commentListDoc = commentListDocs[index];
                        final Comment commnt =
                            Comment.fromJson(commentListDoc.data()!);
                        return CommentTile(
                          comment: commnt,
                          mainModel: mainModel,
                          commentListDoc: commentListDoc,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.new_label),
        onPressed: () => commentModel.showCommentFlashBar(
          context: context,
          mainModel: mainModel,
          postDoc: postDoc,
        ),
      ),
    );
  }
}

const functions = require("firebase-functions");

const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

const fireStore = admin.firestore();

exports.onFollowerCreate = functions.firestore.document('users/{uid}/followers/{followerUid}').onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await fireStore.collection('users').doc(newValue.followedUid).update({
            "followerCount" : admin.firestore.FieldValue.increment(1),
        });
        await fireStore.collection('users').doc(newValue.followerUid).update({
            "followingCount" : admin.firestore.FieldValue.increment(1),
        });
    }
)

exports.onFollowerDelete = functions.firestore.document('users/{uid}/followers/{followerUid}').onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await fireStore.collection('users').doc(newValue.followedUid).update({
            "followerCount" : admin.firestore.FieldValue.increment(-1),
        });
        await fireStore.collection('users').doc(newValue.followerUid).update({
            "followingCount" : admin.firestore.FieldValue.increment(-1),
        });
    }
)

exports.onPostLikeCreate = functions.firestore.document('users/{uid}/posts/{postId}/postLikes/{activeUid}').onCreate(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            'likeCount' : admin.firestore.FieldValue.increment(1),
        })
    }
)

exports.onPostLikeDelete = functions.firestore.document('users/{uid}/posts/{postId}/postLikes/{activeUid}').onDelete(
    async (snap,_) => {
        const newValue = snap.data();
        await newValue.postRef.update({
            'likeCount' : admin.firestore.FieldValue.increment(-1),
        })
    }
)
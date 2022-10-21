# サロンAPPfirebase設計書

## ユーザー(サロン) テーブル群
|  users |    | |
| ---- | ---- | ---- |
|  userId  |  string  | |
|  userImage  |  string  | |
|  email  |  string  | |
|  password  |  string  | |
|  pref  |  string  | |
|  address  |  string  | |
|  salon_type  |  int  | |
|  userName  |  string  | |
|  point  |  int  | |
|  latitude  |  double  | 緯度 |  
|  longitude  |  double  | 経度 |
|  createdAt  |  Timestamp  | |
|  updatedAt  |  Timestamp  | |

|  users/images |    | |
| ---- | ---- | ---- |
|  imageId  |  string  | |
|  imageURL |  string  | |

|  users/menu |    | |
| ---- | ---- | ---- |
|  menuId  |  string  | |
|  menuName  |  string  | |
|  price  |  int  | 必要ポイント |
|  createdAt  |  Timestamp  | |
|  updatedAt  |  Timestamp  | |

## チャットテーブル群

|  rooms |    | |
| ---- | ---- | ---- |
|  roomId  |  string  | |
|  userMeta  |  json  |  {userName, userImage} |
|  ownerUid  |  string  | |
|  createdAt  |  Timestamp  | |
|  updatedAt  |  Timestamp  | |

|  rooms/messages | | |
| ---- | ---- | ---- |
|  messageId | string | |
|  sendUid | string | |
|  body | string | |
|  type | int | |
|  isRead | bool | 既読フラグ |

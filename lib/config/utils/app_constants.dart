class AppConstantsRemote{
  static const REQUEST_ALL_USERS = "https://jsonplaceholder.typicode.com/users";
  static const REQUEST_POSTS_FROM_USER = "https://jsonplaceholder.typicode.com/posts?userId=";
  static const REQUEST_ALBUMS_FROM_USER = "https://jsonplaceholder.typicode.com/albums?userId=";
  static const REQUEST_COMMENTS_FROM_POST = "https://jsonplaceholder.typicode.com/comments?postId=";
  static const REQUEST_PHOTOS_FROM_ALBUM = "https://jsonplaceholder.typicode.com/photos?albumId=";
  static const ADD_NEW_COMMENT = "https://jsonplaceholder.typicode.com/comments";
}

class AppConstantsLocal{
  static const USERS = "users";
  static const POSTS = "posts";
  static const ALBUMS = "albums";
  static const COMMENTS = "comments";
  static const PHOTOS = "photos";
}
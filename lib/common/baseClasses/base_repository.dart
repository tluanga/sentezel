abstract class BaseRepository<T> {
  //Get List-- Getting all the items in the list
  Future<List<T>> getList();

  //-----For Getting Single Item, id will be provided
  Future<T?> getItem({required int id});

  //------Adding a single Item-----------
  void add({required T payload});

  //------Updating a single Item-----------
  void update({required T payload});

  //-------Removing Single Item----------
  void remove({required id});
}

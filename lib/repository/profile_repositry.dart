
abstract class ProfileRepository {
  getProfile();

}


class ProfileRepositoryAPI extends ProfileRepository {
  @override
  getProfile() {
    throw UnimplementedError();
  }


}
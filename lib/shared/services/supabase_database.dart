import 'package:ta_caro/shared/models/user_model.dart';
import 'package:ta_caro/shared/services/app_database.dart';
import 'package:supabase/supabase.dart';

class SupaBaseDatabase implements AppDatabase {
  late final SupabaseClient client;

  SupaBaseDatabase() {
    init();
  }

  @override
  void init() {
    print('supaurl:  ${String.fromEnvironment('SUPABASEURL')}');
    print('supakey:  ${String.fromEnvironment('SUPABASEKEY')}');
    client = SupabaseClient(
      'https://cchjftviwakphajbpeez.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MDYxOTczOCwiZXhwIjoxOTU2MTk1NzM4fQ.t2JH_ITEY8wGk-nHlfR5oNl0t3DeyFGzDTLWYJ1sm9U',
      //const String.fromEnvironment("SUPABASEURL"),
      //const String.fromEnvironment("SUPABASEKEY"),
    );
    print('Database iniciada');
    print('supaurl:  ${client.supabaseUrl}');
    print('supakey:  ${client.supabaseKey}');
  }

  @override
  Future<UserModel> createAccount(
      {required String email,
      required String password,
      required String name}) async {
    final response = await client.auth.signUp(email, password);
    if (response.error == null) {
      final user = UserModel(id: response.user!.id, email: email, name: name);
      //final user = UserModel.fromMap(response.user!.toJson());
      await createUser(user);
      return user;
    } else {
      throw Exception(
          response.error?.message ?? "Não foi possivel criar conta");
    }
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      //final user = UserModel.fromMap(response.user!.toJson());
      final user = await getUser(response.user!.id);
      return user;
    } else {
      throw Exception(
          response.error?.message ?? "Não foi possivel fazer o login");
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final response = await client.from('users').insert(user.toMap()).execute();
    if (response.error == null) {
      return user;
    } else {
      throw Exception('Não foi possivel criar o usuario!');
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response =
        await client.from('users').select().filter('id', 'eq', id).execute();
    if (response.error == null) {
      final user = UserModel.fromMap(response.data[0]);
      return user;
    } else {
      throw Exception('Erro ao buscar usuario');
    }
  }
}

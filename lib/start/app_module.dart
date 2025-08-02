import 'package:cred_connect/core/core.dart';
import 'package:cred_connect/data/data.dart';
import 'package:cred_connect/domain/domain.dart';
import 'package:cred_connect/presentation/presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //Usecases
    i.addLazySingleton<LoginUsecase>(LoginUsecaseImp.new);
    i.addLazySingleton<CreateAccountUsecase>(CreateAccountUsecaseImp.new);

    //Repositories
    i.addLazySingleton<LoginRepository>(LoginRepositoryImp.new);
    i.addLazySingleton<CreateAccountRepository>(CreateAccountRepositoryImp.new);

    //Datasources
    i.addLazySingleton<LoginDatasource>(LoginDatasourceImp.new);
    i.addLazySingleton<CreateAccountDatasource>(CreateAccountDatasourceImp.new);

    //Controllers
    i.addLazySingleton(UserController.new);

    //Services
    i.addLazySingleton(LocalDatabaseService.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.loginPage, child: (ctx) => const LoginPage());

    super.routes(r);
  }
}

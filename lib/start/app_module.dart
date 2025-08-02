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
    i.addLazySingleton<GetUserDataUsecase>(GetUserDataUsecaseImp.new);
    i.addLazySingleton<GetBalanceUsecase>(GetBalanceUsecaseImp.new);
    i.addLazySingleton<GetCustomersUsecase>(GetCustomersUsecaseImp.new);
    i.addLazySingleton<CreateCustomerUsecase>(CreateCustomerUsecaseImp.new);
    i.addLazySingleton<CreateLoanUsecase>(CreateLoanUsecaseImp.new);
    i.addLazySingleton<GetLoansUsecase>(GetLoansUsecaseImp.new);

    //Repositories
    i.addLazySingleton<LoginRepository>(LoginRepositoryImp.new);
    i.addLazySingleton<CreateAccountRepository>(CreateAccountRepositoryImp.new);
    i.addLazySingleton<GetUserDataRepository>(GetUserDataRepositoryImp.new);
    i.addLazySingleton<GetBalanceRepository>(GetBalanceRepositoryImp.new);
    i.addLazySingleton<GetCustomersRepository>(GetCustomersRepositoryImp.new);
    i.addLazySingleton<CreateCustomerRepository>(
      CreateCustomerRepositoryImp.new,
    );
    i.addLazySingleton<CreateLoanRepository>(CreateLoanRepositoryImp.new);
    i.addLazySingleton<GetLoansRepository>(GetLoansRepositoryImp.new);

    //Datasources
    i.addLazySingleton<LoginDatasource>(LoginDatasourceImp.new);
    i.addLazySingleton<CreateAccountDatasource>(CreateAccountDatasourceImp.new);
    i.addLazySingleton<GetUserDataDatasource>(GetUserDataDatasourceImp.new);
    i.addLazySingleton<GetBalanceDatasource>(GetBalanceDatasourceImp.new);
    i.addLazySingleton<GetCustomersDatasource>(GetCustomersDatasourceImp.new);
    i.addLazySingleton<CreateCustomerDatasource>(
      CreateCustomerDatasourceImp.new,
    );
    i.addLazySingleton<CreateLoanDatasource>(CreateLoanDatasourceImp.new);
    i.addLazySingleton<GetLoansDatasource>(GetLoansDatasourceImp.new);

    //Controllers
    i.addLazySingleton(UserController.new);

    //Services
    i.addLazySingleton(LocalDatabaseService.new);
    i.addLazySingleton(UserSessionService.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.splashPage, child: (ctx) => const SplashPage());
    r.child(Routes.welcomePage, child: (ctx) => const WelcomePage());
    r.child(Routes.loginPage, child: (ctx) => const LoginPage());
    r.child(
      Routes.createAccountPage,
      child: (ctx) => const CreateAccountPage(),
    );
    r.child(Routes.homePage, child: (ctx) => const HomePage());
    r.child(Routes.amountPage, child: (ctx) => const AmountPage());
    r.child(Routes.createLoanPage, child: (ctx) => const CreateLoanPage());
    r.child(
      Routes.createCustomerPage,
      child: (ctx) => const CreateCustomerPage(),
    );
    r.child(Routes.successPage, child: (ctx) => const SuccessPage());

    super.routes(r);
  }
}

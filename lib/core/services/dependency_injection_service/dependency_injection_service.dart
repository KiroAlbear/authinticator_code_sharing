import 'package:code_grapper/imports.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjectionService {
  dynamic init() async {
    //////////////////////////////////////////////////////////////   Login
    getIt.registerSingleton<LoginRemoteDataSource>(
        LoginDataRemoteDataSourceImpl());

    getIt.registerSingleton<LoginRepository>(LoginRepositoryImpl(getIt()));

    getIt.registerSingleton<LoginUsecase>(LoginUsecase(getIt()));

    //////////////////////////////////////////////////////////////   Code
    getIt.registerSingleton<CodeRemoteDataSource>(
        CodeDataRemoteDataSourceImpl());

    getIt.registerSingleton<CodeRepository>(CodeRepositoryImpl(getIt()));

    getIt.registerSingleton<CodeUsecase>(CodeUsecase(getIt()));
    //////////////////////////////////////////////////////////////   AdminHome

    getIt.registerSingleton<AdminHomeRemoteDataSource>(
        AdminHomeDataRemoteDataSourceImpl());

    getIt.registerSingleton<AdminHomeRepository>(
        AdminHomeRepositoryImpl(getIt()));

    getIt.registerSingleton<AdminHomeUseCase>(AdminHomeUseCase(getIt()));

    getIt.registerSingleton<EnableDisableAllUsersUseCase>(
        EnableDisableAllUsersUseCase(getIt()));

    getIt.registerSingleton<EnableDisableUserUseCase>(
        EnableDisableUserUseCase(getIt()));

    getIt.registerSingleton<ResetUserUseCase>(ResetUserUseCase(getIt()));

    getIt.registerSingleton<DeleteUserUseCase>(DeleteUserUseCase(getIt()));

    //////////////////////////////////////////////////////////////   Profile
    getIt.registerSingleton<ProfileRemoteDataSource>(
        ProfileDataRemoteDataSourceImpl());

    getIt.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(getIt()));

    getIt.registerSingleton<ProfileUsecase>(ProfileUsecase(getIt()));

    getIt
        .registerSingleton<UpdateProfileUsecase>(UpdateProfileUsecase(getIt()));
    //////////////////////////////////////////////////////////////   RegisterUser

    getIt.registerSingleton<RegisterUserRemoteDataSource>(
        RegisterUserDataRemoteDataSourceImpl());

    getIt.registerSingleton<RegisterUserRepository>(
        RegisterUserRepositoryImpl(getIt()));

    getIt.registerSingleton<RegisterUserUsecase>(RegisterUserUsecase(getIt()));

    //////////////////////////////////////////////////////////////   RegisterAdmin

    getIt.registerSingleton<RegisterAdminRemoteDataSource>(
        RegisterAdminRemoteDataSourceImpl());

    getIt.registerSingleton<RegisterAdminRepository>(
        RegisterAdminRepositoryImpl(getIt()));

    getIt
        .registerSingleton<RegisterAdminUsecase>(RegisterAdminUsecase(getIt()));

    getIt.registerSingleton<SendEmailUsecase>(SendEmailUsecase(getIt()));

    //////////////////////////////////////////////////////////////
  }
}

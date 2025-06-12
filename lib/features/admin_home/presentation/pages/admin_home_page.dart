import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../imports.dart';

class AdminHomePage extends BaseStatefulPage {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePagePageState();
}

class _AdminHomePagePageState extends BaseState<AdminHomePage> {
  @override
  PreferredSizeWidget? appBar() => const CustomAppbar(
        title: "Home",
        hasBackButton: false,
      );

  @override
  bool containPadding() => false;

  @override
  void initState() {
    super.initState();
  }

  bool _isInitialized = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (!_isInitialized && ModalRoute.of(context)!.isCurrent) {
      _isInitialized = true;
      BlocProvider.of<AdminHomeBloc>(context).add(getAdminHomeEvent(
        requestModel: AdminHomeRequestModel(
          email: Constants.chosenAdmin.email,
          password: Constants.chosenAdmin.password,
        ),
      ));
    }
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              // title with refresh button
              const Padding(
                padding: EdgeInsetsDirectional.only(start: 16),
                child: Text(
                  "Users List",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              5.horizontalSpace,
              IconButton(
                icon: const Icon(Icons.refresh),
                color: Theme.of(context).primaryColor,
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor.withAlpha(20),
                ),
                onPressed: () {
                  BlocProvider.of<AdminHomeBloc>(context).add(getAdminHomeEvent(
                    requestModel: AdminHomeRequestModel(
                      email: Constants.chosenAdmin.email,
                      password: Constants.chosenAdmin.password,
                    ),
                  ));
                },
              ),
              const Spacer(),
              // block all users button
              // BlocBuilder<AdminHomeBloc, AdminHomeState>(
              //   builder: (context, state) {
              //     return IconButton(
              //       icon: Icon(
              //         Icons.lock,
              //       ),
              //       color: Theme.of(context).primaryColor,
              //       style: IconButton.styleFrom(
              //         backgroundColor:
              //             Theme.of(context).primaryColor.withAlpha(20),
              //       ),
              //       onPressed: () {
              //         BlocProvider.of<AdminHomeBloc>(context)
              //             .add(enableDisableAllUsersEvent(
              //           requestModel: EnableDisableAllUsersRequestModel(
              //             email: Constants.chosenAdmin.email,
              //             password: Constants.chosenAdmin.password,
              //             isActive: false,
              //           ),
              //         ));
              //       },
              //     );
              //   },
              // ),
            ],
          ),
          Expanded(
            child: ParentBloc<AdminHomeBloc, AdminHomeState>(
              emptyWidget: const EmptyUsersWidget(),
              builder: (AdminHomeState state) {
                return Container(
                  constraints: BoxConstraints(
                    maxWidth: AppDimensions.cardMaxWidth + 100,
                  ),
                  child: Stack(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount:
                            state.adminHomeResponseModel!.usersList.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return AdminUserItem(
                            userId: state.adminHomeResponseModel!
                                .usersList[index].userCode,
                            name: state
                                .adminHomeResponseModel!.usersList[index].name,
                            phone: state.adminHomeResponseModel!
                                .usersList[index].userPhone,
                            email: state
                                .adminHomeResponseModel!.usersList[index].email,
                            adminPassword: Constants.chosenAdmin.password,
                            expiryDate: state.adminHomeResponseModel!
                                .usersList[index].expiryDate,
                            lastLoginDate: state.adminHomeResponseModel!
                                .usersList[index].lastLoginDate,
                            startDate: state.adminHomeResponseModel!
                                .usersList[index].startDate,
                            endDate: state.adminHomeResponseModel!
                                .usersList[index].endDate,
                            requestedCodes: state.adminHomeResponseModel!
                                .usersList[index].loginCount,
                            daysLeft: state.adminHomeResponseModel!
                                .usersList[index].daysLeft,
                            isNew: state.adminHomeResponseModel!
                                    .usersList[index].firstLoginDate ==
                                null,
                            isBlocked: state.adminHomeResponseModel!
                                    .usersList[index].isActive ==
                                false,
                            isMaximumCodesReached: state.adminHomeResponseModel!
                                .usersList[index].isMaximumCodesReached,
                          );
                        },
                      ),
                      state.savingStatus == Status.loading
                          ? Container(
                              color: Colors.black.withAlpha(50),
                              child: const AppLoadingBar(),
                            )
                          : const SizedBox()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

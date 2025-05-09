import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/home/bloc/user_cubit.dart';
import 'package:mobile_me/core/home/bloc/user_state.dart';
import 'package:mobile_me/core/home/widgets/address_card_widget.dart';
import 'package:mobile_me/core/home/widgets/bank_info_card_widget.dart';
import 'package:mobile_me/core/home/widgets/company_card_widget.dart';
import 'package:mobile_me/core/home/widgets/contact_card_widget.dart';
import 'package:mobile_me/core/home/widgets/credentials_card_widget.dart';
import 'package:mobile_me/core/home/widgets/crypto_card_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _addressKey = GlobalKey();
  double? _addressHeight;

  @override
  Widget build(BuildContext context) {
    if (_addressHeight == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ctx = _addressKey.currentContext;
        if (ctx != null) {
          final box = ctx.findRenderObject() as RenderBox;
          final newHeight = box.size.height;
          if (newHeight != _addressHeight) {
            setState(() => _addressHeight = newHeight);
          }
        }
      });
    }

    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is UserLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<UserCubit>().loadUserData(state.user.id);
                },
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CredentialsCardWidget(user: state.user),
                          SizedBox(height: 10),
                          ContactCardWidget(user: state.user),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 180,
                            child: Row(
                              children: [
                                Expanded(
                                  child: AddressCardWidget(
                                    address: state.user.address,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 4,
                                      top: 4,
                                      right: 4,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'lib/common/assets/images/map.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          CompanyCardWidget(company: state.user.company),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: BankInfoCardWidget(
                                  bank: state.user.bank,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: CryptoCardWidget(
                                  crypto: state.user.crypto,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

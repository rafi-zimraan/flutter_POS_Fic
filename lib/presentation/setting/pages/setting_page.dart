import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/core/constants/colors.dart';
import 'package:flutter_pos_app/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_pos_app/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_pos_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter_pos_app/presentation/order/models/order_model.dart';
import 'package:flutter_pos_app/presentation/setting/pages/manage_printer_page.dart';
import 'package:flutter_pos_app/presentation/setting/pages/save_server_key_page.dart';
import 'package:flutter_pos_app/presentation/setting/pages/sync_data_page.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../../home/bloc/logout/logout_bloc.dart';
import 'manage_product_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  MenuButton(
                    iconPath: Assets.images.manageProduct.path,
                    label: 'Kelola Produk',
                    onPressed: () => context.push(const ManageProductPage()),
                    isImage: true,
                  ),
                  const SpaceWidth(15.0),
                  MenuButton(
                    iconPath: Assets.images.managePrinter.path,
                    label: 'Kelola Printer',
                    onPressed: () {
                      context.push(const ManagePrinterPage());
                    }, //=> context.push(const ManagePrinterPage()),
                    isImage: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  MenuButton(
                    iconPath: Assets.images.manageProduct.path,
                    label: 'QRIS Server Key',
                    onPressed: () => context.push(const SaveServerKeyPage()),
                    isImage: true,
                  ),
                  const SpaceWidth(15.0),
                  MenuButton(
                    iconPath: Assets.images.managePrinter.path,
                    label: 'Sinkronisasi Data',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SyncDataPage()));
                    }, //=> context.push(const ManagePrinterPage()),
                    isImage: true,
                  ),
                ],
              ),
            ),
            const SpaceHeight(60),
            const Divider(),
            BlocConsumer<LogoutBloc, LogoutState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  success: (_) {
                    AuthLocalDatasource().removeAuthData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                );
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                  child: const Text('Logout'),
                );
              },
            ),
            const Divider(),
          ],
        ));
  }
}

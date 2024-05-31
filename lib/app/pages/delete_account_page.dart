import 'package:fl_klikfilm/app/providers/categories/categories_provider.dart';
import 'package:fl_klikfilm/app/routes/app_router.dart';
import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/app/widgets/kf_animation_dialog.dart';
import 'package:fl_klikfilm/app/widgets/kf_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

class DeleteAccountPage extends HookConsumerWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final loginNotifier = ref.read(podLoginNotifier.notifier);
    // final local = ref.watch(localUserNotifierProvider);
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 397,
            decoration: BoxDecoration(
              color: KColors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 31,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apakah Anda yakin ingin menghapus akun Anda?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Penghapusan akun bersifat permanen. Semua data yang tersimpan akan terhapus dan tidak akan bisa diakses lagi setelah Anda menghapus akun ini.',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  'Data yang akan terhapus adalah',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 6),
                        SizedBox(width: 6),
                        Text(
                          'Aktivitas dan riwayat tontonan.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 6),
                        SizedBox(width: 6),
                        Text(
                          'Masa berlangganan dan pembayaran lainnya.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 6),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'KlikFilm point',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Icon(Icons.circle, color: Colors.white, size: 6),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Pembatalan keikutsertaan dari program berhadiah.',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return KfDialog(
                            subTitle: 'Delete Account',
                            description: 'Proses penghapuskan tidak '
                                'akan bisa dibatalkan setelah Anda mengkonfirmasinya',
                            confirmText: 'Delete',
                            onConfirm: () async {
                              await ref.read(accountDeletionProvider).then((response) async {
                                if (response.success) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return KfAnimationDialog.success(
                                        message: 'Penghapusan akun telah selesai',
                                      );
                                    },
                                  ).then((_) async {
                                    await ref
                                        .read(localUserNotifierProvider.notifier)
                                        .setLogout()
                                        .then((_) async {
                                      await ref
                                          .read(categoriesAsyncNotifier.notifier)
                                          .forceRefresh()
                                          .then((_) {
                                        return HomeRoute().go(context);
                                      });
                                    });
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return KfAnimationDialog.error(
                                        message: response.error?.desc ?? 'Something went wrong',
                                      );
                                    },
                                  );
                                }
                              });
                            },
                          );
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: KColors.crimson,
                    ),
                    child: Text(
                      'Delete Account',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => context.pop(),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: KColors.grey,
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

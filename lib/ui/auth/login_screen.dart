import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketing_apps/core/assets/assets.gen.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/custom_text_field.dart';
import 'package:ticketing_apps/core/components/spaces.dart';
import 'package:ticketing_apps/core/constants/colors.dart';
import 'package:ticketing_apps/core/data/local_datasources/auth_local_datasources.dart';
import 'package:ticketing_apps/core/extensions/build_context_ext.dart';
import 'package:ticketing_apps/ui/auth/bloc/auth_bloc.dart';
import 'package:ticketing_apps/ui/home/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          //bagian 1
          SizedBox(
            height: 200,
            child: Center(child: Assets.images.logoWhite.image(height: 55)),
          ),

          //bagian 2
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(20),
                ),
                child: ColoredBox(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 44,
                      horizontal: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: 'Email',
                          controller: emailController,
                          isOutlineBorder: false,
                        ),
                        SpaceHeight(36),
                        CustomTextField(
                          controller: passwordController,
                          label: 'Password',
                          isOutlineBorder: false,
                        ),
                        SpaceHeight(36),

                        BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            // TODO: implement listener
                            state.maybeMap(
                              orElse: () {},
                              success: (data) async {
                                await AuthlocalDatasource().saveAuthData(
                                  data.loginresponsemodel,
                                );
                                context.pushReplacement(MainScreen());
                              },
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Login Gagal: ${message.message}',
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            );
                          },
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return Button.filled(
                                    onPressed: () {
                                      context.read<AuthBloc>().add(
                                        AuthEvent.login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    },
                                    label: 'Login',
                                  );
                                },
                                loading: () {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        SpaceHeight(120),
                        Center(child: Assets.images.logo.image(height: 88)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

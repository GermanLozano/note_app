// CONSTRUCCION DEL CUERPO O BODY PARA LA SCRREN DEL PERFIL DE USUARIO

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/core/theme/app_color.dart';
import 'package:note_app/src/features/user/domain/entities/user_entity.dart';
import 'package:note_app/src/features/user/presentation/bloc/user_management/user_management_bloc.dart';

class ProfileUserBodyComponent extends StatelessWidget {
  const ProfileUserBodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserManagementBloc, UserManagementState, UserEntity>(
      selector: (state) {
        // SI EL ESTADO DEL USUARIO ES AUTENTICADO, ENTONCES
        if (state is UserAuthenticated) {
          return state.userEntity;
        } else {
          return const UserEntity(email: 'Invitado', password: '');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detalles de la cuenta',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Divider(height: 20,),

                      // DETALLES DE LA FILA
                      _DetailRow(
                        icon: Icons.email,
                        label: 'Email',
                        value: state.email,
                      ),
                      _DetailRow(
                        icon: Icons.vpn_key,
                        label: 'Token',
                        value: state.token,
                      ),
                      _DetailRow(
                        icon: Icons.circle,
                        label: 'Estado',
                        valueWidget: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.success.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            'Conectado',
                            style: TextStyle(color: AppColor.success),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// CLASE PARA EL DETALLE DE LAS FILAS 
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon, 
    required this.label, 
    this.value, 
    this.valueWidget
  });

  // PARAMETROS REQUERIDOS 
  final IconData icon;
  final String label;
  final String? value;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox( width: 10,),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          valueWidget ??
            Text(
              value ?? '',
              overflow:  TextOverflow.ellipsis,
            )
        ],
      ),
    );
  }
} 

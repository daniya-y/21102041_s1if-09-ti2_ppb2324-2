import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_03/view/add_contact_screen.dart';
import 'package:praktikum_03/viewmodel/contact_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddContactScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
          if (state is ContactLoaded) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.user.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffD2ECD6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.account_circle_rounded),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.user[index].name),
                          Text(
                            state.user[index].number.toString(),
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                          onTap: () {
                            context
                                .read<ContactCubit>()
                                .removeUser(index: index);
                          },
                          child: const Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            );
          } else if (state is ContactLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.group_outlined),
                Text('Your contact is empty'),
              ],
            ),
          );
        },
      ),
    );
  }
}
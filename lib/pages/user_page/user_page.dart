import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is UserLoaded) {
            final user = state.user;
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    "https://picsum.photos/200/300?random=${user.id}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Semi-transparan background
                  ),
                ),
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(80)),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                            "https://picsum.photos/200/300?random=${user.id}",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color.fromARGB(255, 255, 175, 55), Colors.yellow],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.name.firstname} ${user.name.lastname}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            color: Colors.black,
                            thickness: 3,
                          ),
                          Text(
                            'Designer @ ${user.address.street}, ${user.address.city}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            user.address.zipcode,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Text(
                            user.email,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Text(
                            user.phone,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(
                            color: Colors.black,
                            thickness: 3,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '542',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Following'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '98K',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Followers'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '100K',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Likes'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Hire Me'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const SizedBox(height: 16),
                          const Text(
                            'ABOUT',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Fashion designer and stylist, experience of about 3 years in fashion industry. Thus I would like to help out people who are truly willing.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'PROJECTS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Project design is a major first step towards a successful project. A project design is a strategic organization of ideas, materials, and processes for the purpose of achieving a goal.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'TOOLS',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Adobe Photoshop        Adobe Illustrator',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

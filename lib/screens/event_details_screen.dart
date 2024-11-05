import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_app_task/bloc/rspv/rspv_bloc.dart';
import 'package:flutter_web_app_task/bloc/rspv/rspv_event.dart';
import 'package:flutter_web_app_task/bloc/rspv/rspv_state.dart';
import 'package:flutter_web_app_task/utils/format_date.dart';
import 'package:flutter_web_app_task/widgets/app_button.dart';
import '../models/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  EventDetailScreen({super.key, required this.event});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag:
              'eventTitle_${event.title}', // Same unique tag for Hero animation
          child: Material(
            color: Colors.transparent,
            child: Text(
              event.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                _buildEventDescription(),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _nameController,
                  fieldName: "UserName",
                  validator: _validateName,
                ),
                _buildTextField(
                  controller: _emailController,
                  fieldName: "Email",
                  validator: _validateEmail,
                ),
                const SizedBox(height: 32),
                _buildRsvpButton(context),
                  const SizedBox(height: 32),
                _buildAttendeesList(), 
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventDescription() {
    return Column(
      children: [
        Text(
          event.description,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          DateFormater.formateDate(
            event.date,
          ),
          style: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String fieldName,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: fieldName),
      validator: validator,
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a name";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    // Define a regex pattern for validating email
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  Widget _buildRsvpButton(BuildContext context) {
    return BlocConsumer<RsvpBloc, RsvpState>(
      listener: (context, state) {
        if (state is RsvpError) {
          _showSnackBar(context, state.message, true);
        } else if (state is RsvpSuccess) {
          _handleSuccess(context);
        }
      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
              child: SubmitRsvpButton(
                buttonText: "Submit RSPV",
                isLoading: state is RsvpLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RsvpBloc>().add(
                          SubmitRsvpEvent(
                            _nameController.text,
                            _emailController.text,
                          ),
                        );
                  }
                },
              )),
        );
      },
    );
  }

  Widget _buildAttendeesList() {
  if (event.attendees.isEmpty) {
    return const Text("No attendees yet.", style: TextStyle(fontSize: 16));
  }

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Attendees:",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      ListView.builder(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: event.attendees.length,
        itemBuilder: (context, index) {
          final attendee = event.attendees[index];
          return ListTile(
            title: Text(attendee.username),
            subtitle: Text(attendee.email),
          );
        },
      ),
    ],
  );
}

  void _handleSuccess(BuildContext context) {
    _emailController.clear();
    _nameController.clear();
    _showSnackBar(
      context,
      "Thank you for your response! We’ve successfully received your RSVP",
      false,
    );
  }

  void _showSnackBar(BuildContext context, String message, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.all(16),
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    ));
  }
}

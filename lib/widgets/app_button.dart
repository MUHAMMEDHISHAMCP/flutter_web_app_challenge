import 'package:flutter/material.dart';

class SubmitRsvpButton extends StatelessWidget {
  const SubmitRsvpButton({super.key,required this.isLoading,required this.onPressed, this.buttonText});
 final void Function()? onPressed;
 final bool isLoading;
 final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
              onPressed: isLoading
                  ? null
                  : onPressed,
              icon: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Icon(Icons.event, color: Colors.white),
              label:  Text(buttonText?? "RSVP"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Background color
                foregroundColor: Colors.white, // Text and icon color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
  }
}
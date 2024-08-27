import 'package:flutter/material.dart';

class UserFeedbackFormScreen extends StatefulWidget {
  const UserFeedbackFormScreen({super.key});

  @override
  State<UserFeedbackFormScreen> createState() => _UserFeedbackFormScreenState();
}

class _UserFeedbackFormScreenState extends State<UserFeedbackFormScreen> {
  final _feedbackFormKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();
  int _rating = 1;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  String _getRatingLabel(int index) {
    switch (index) {
      case 0:
        return 'Poor';
      case 1:
        return 'Fair';
      case 2:
        return 'Good';
      case 3:
        return 'Very Good';
      case 4:
        return 'Excellent';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
        title: Text(
          'Give Feedback',
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _feedbackFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We’d Love Your Feedback!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  color: Colors.purple.shade500,
                  thickness: 2,
                ),
                Text(
                  'Your feedback fuels our passion to deliver exceptional rental experiences. Share your thoughts and be a part of our journey to excellence!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Rate your experience!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return Expanded(
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              _rating > index ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 35,
                            ),
                            onPressed: () => _setRating(index + 1),
                          ),
                          Text(
                            _getRatingLabel(index),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20),
                Text(
                  'How was your experience with our service?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                TextFormField(
                  controller: _feedbackController,
                  maxLines: 5, // Allows multiple lines
                  maxLength: 255,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your positive feedback here...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some feedback!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    // Action to be performed
                    if (_feedbackFormKey.currentState?.validate() ?? false) {
                      // Process the feedback
                      print('Rating: $_rating');
                      print('Feedback submitted: ${_feedbackController.text}');
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green, // Text color
                    padding: EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12), // Padding
                    minimumSize: Size(95, 45), // Minimum size
                  ),
                  child: Text(
                    'Submit Feedback',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ), // Text size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

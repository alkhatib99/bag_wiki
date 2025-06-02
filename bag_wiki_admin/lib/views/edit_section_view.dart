import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/section_controller.dart';
import '../models/section_model.dart';

class EditSectionView extends StatelessWidget {
  EditSectionView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SectionController controller = Get.find<SectionController>();
    
    // Initialize form fields if editing an existing section
    if (controller.isEditing.value && controller.selectedSection.value != null) {
      _titleController.text = controller.selectedSection.value!.title;
      _contentController.text = controller.selectedSection.value!.content;
      _imageUrlController.text = controller.selectedSection.value!.imageUrl;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          controller.isEditing.value ? 'Edit Section' : 'Create Section'
        )),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Section Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _contentController,
                        decoration: const InputDecoration(
                          labelText: 'Content',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 10,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter content';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _imageUrlController,
                        decoration: const InputDecoration(
                          labelText: 'Image URL',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an image URL';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      if (_imageUrlController.text.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Image Preview:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Text('Invalid image URL'),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final section = SectionModel(
                                  id: controller.isEditing.value
                                      ? controller.selectedSection.value!.id
                                      : null,
                                  title: _titleController.text,
                                  content: _contentController.text,
                                  imageUrl: _imageUrlController.text,
                                );
                                
                                if (controller.isEditing.value) {
                                  controller.updateSection(section);
                                } else {
                                  controller.createSection(section);
                                }
                              }
                            },
                            child: Text(
                              controller.isEditing.value ? 'Update' : 'Create'
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

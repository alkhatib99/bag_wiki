import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/section_controller.dart';
import '../models/section_model.dart';
import 'edit_section_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionController controller = Get.find<SectionController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bag Wiki Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.fetchSections(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (controller.sections.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'No sections found',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => _navigateToEditView(context, controller),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Section'),
                ),
              ],
            ),
          );
        }
        
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Website Sections',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _navigateToEditView(context, controller),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Section'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return constraints.maxWidth > 600
                        ? _buildGridView(controller)
                        : _buildListView(controller);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildGridView(SectionController controller) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: controller.sections.length,
      itemBuilder: (context, index) {
        return _buildSectionCard(context, controller.sections[index], controller);
      },
    );
  }

  Widget _buildListView(SectionController controller) {
    return ListView.builder(
      itemCount: controller.sections.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildSectionCard(context, controller.sections[index], controller),
        );
      },
    );
  }

  Widget _buildSectionCard(BuildContext context, SectionModel section, SectionController controller) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(section.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  section.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        controller.setSelectedSection(section);
                        Get.to(() => EditSectionView());
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _showDeleteConfirmation(context, section, controller),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToEditView(BuildContext context, SectionController controller) {
    controller.clearSelectedSection();
    Get.to(() => EditSectionView());
  }

  void _showDeleteConfirmation(BuildContext context, SectionModel section, SectionController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete "${section.title}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.deleteSection(section.id!);
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

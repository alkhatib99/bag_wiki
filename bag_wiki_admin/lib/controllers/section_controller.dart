import 'package:get/get.dart';
import '../models/section_model.dart';
import '../services/section_service.dart';

class SectionController extends GetxController {
  final SectionService _sectionService = SectionService();
  
  final RxList<SectionModel> sections = <SectionModel>[].obs;
  final Rx<SectionModel?> selectedSection = Rx<SectionModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isEditing = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchSections();
  }
  
  Future<void> fetchSections() async {
    try {
      isLoading.value = true;
      sections.value = await _sectionService.getSections();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load sections: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> getSection(int id) async {
    try {
      isLoading.value = true;
      selectedSection.value = await _sectionService.getSection(id);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load section: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> createSection(SectionModel section) async {
    try {
      isLoading.value = true;
      await _sectionService.createSection(section);
      await fetchSections();
      Get.back();
      Get.snackbar('Success', 'Section created successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create section: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> updateSection(SectionModel section) async {
    try {
      isLoading.value = true;
      await _sectionService.updateSection(section);
      await fetchSections();
      Get.back();
      Get.snackbar('Success', 'Section updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update section: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> deleteSection(int id) async {
    try {
      isLoading.value = true;
      await _sectionService.deleteSection(id);
      await fetchSections();
      Get.snackbar('Success', 'Section deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete section: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
  
  void setSelectedSection(SectionModel? section) {
    selectedSection.value = section;
    isEditing.value = section != null;
  }
  
  void clearSelectedSection() {
    selectedSection.value = null;
    isEditing.value = false;
  }
}

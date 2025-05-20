class SectionModel {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final List<FAQItem>? faqItems;

  SectionModel({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    this.faqItems,
  });
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}

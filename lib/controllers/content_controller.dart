import 'package:get/get.dart';
import 'package:bag_about_us/models/section_model.dart';

class ContentController extends GetxController {
  final RxList<SectionModel> sections = <SectionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSections();
  }

  void loadSections() {
    sections.value = [
      SectionModel(
        id: 'intro',
        title: 'BAG Intro',
        content:
            'BAG (Based Arabian Guild) is the leading Arabic Web3 gaming community — connecting players, builders, and investors into a collaborative and rewarding ecosystem where learning, gaming, and opportunity meet. BAG – Your Gateway to Web3.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'about',
        title: 'About Us',
        content:
            'Based Arabian Guild (BAG) is the leading Arabic Web3 gaming community, uniting passionate gamers, builders, and investors from across the Arab world. We\'re more than just a guild — we\'re building an ecosystem where education, exploration, and strategic collaboration thrive.\n\nOver the past months, BAG has evolved into a community-powered force, actively shaping the Web3 gaming landscape through weekly game nights, exclusive tournaments, strategic investments, airdrops, collaborations with top Web3 games, and educational campaigns.\n\nOur goal is to create a safe, active, and opportunity-rich environment for Arabic-speaking gamers and investors - whether you\'re discovering your first Web3 title or managing on-chain assets.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'vision',
        title: 'Our Vision',
        content:
            'Our vision is to establish BAG as the premier Web3 gaming community in the Arab world, fostering innovation, inclusivity, and economic opportunities through blockchain gaming. We aim to bridge the gap between traditional gaming and Web3, creating a vibrant ecosystem where players can learn, earn, and connect.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'team',
        title: 'The Team',
        content:
            'The BAG team consists of passionate Web3 enthusiasts, experienced gamers, and blockchain experts dedicated to building the future of gaming in the Arab world. Our diverse team brings together skills in community management, game development, blockchain technology, and strategic partnerships.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'links',
        title: 'Official Links',
        content: 'Connect with BAG through our official channels:' +
            '\n- Website: https://bagguild.com\n' +
            '\n- Discord: https://discord.gg/bagguild\n' +
            '\n- Twitter: https://twitter.com/BagGuild\n' +
            '\n- Telegram: https://t.me/bagguild\n' +
            '\n- Instagram: https://www.instagram.com/bagguild/\n' +
            '\n-NFT_Icon: https://dapp.bagguild.com/\n',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'faq',
        title: 'FAQ',
        content: "",
        // content: 'Frequently Asked Questions about BAG Guild:\n\n1. What is BAG Guild?\nBAG is the leading Arabic Web3 gaming community connecting players, builders, and investors.\n\n2. How can I join BAG?\nYou can join through our Discord or Telegram communities.\n\n3. What benefits do BAG members receive?\nMembers get access to exclusive tournaments, airdrops, educational resources, and networking opportunities.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
        faqItems: [
          FAQItem(
            question: 'What is BAG Guild?',
            answer:
                'BAG is the leading Arabic Web3 gaming community connecting players, builders, and investors.',
          ),
          FAQItem(
            question: 'How can I join BAG?',
            answer: 'You can join through our Discord or Telegram communities.',
          ),
          FAQItem(
            question: 'What benefits do BAG members receive?',
            answer:
                'Members get access to exclusive tournaments, airdrops, educational resources, and networking opportunities.',
          ),
        ],
      ),
      SectionModel(
        id: 'royals',
        title: 'BAG Royals',
        content:
            'BAG Royals are our premium NFT collection that provides holders with exclusive benefits within the BAG ecosystem. Royals enjoy enhanced rewards, governance rights, and special access to partnerships and events.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'investments',
        title: 'Strategic Investments',
        content:
            'BAG has made strategic investments in early-stage infrastructure, including nodes and tokens across multiple networks. These investments generate passive income for our community and strengthen our position in the Web3 ecosystem.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'dapp',
        title: 'Our DApp',
        content:
            'The BAG DApp is our Web3 platform for gamers and digital asset enthusiasts. It allows users to maximize their NFTs\' value and participate in the decentralized gaming ecosystem through a secure, elegant interface built for Web3 players, creators, and collectors.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'nomad',
        title: 'Nomad Point',
        content:
            'Nomad Point is BAG\'s innovative initiative to connect Web3 gaming communities across different regions, fostering collaboration and cultural exchange in the global blockchain gaming landscape.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'airdrop',
        title: 'Our Airdrop',
        content:
            'BAG regularly conducts airdrops for community members, distributing tokens, NFTs, and other digital assets as rewards for participation and loyalty. Our airdrop system is designed to be fair and inclusive, ensuring all active members have opportunities to benefit.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'vote-idea',
        title: 'Vote For Your Game (Idea)',
        content:
            'BAG empowers community members to propose and vote on games for future collaborations and events. This democratic approach ensures our focus remains aligned with community interests and preferences.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'vote-result',
        title: 'Vote For Your Game (Result)',
        content:
            'Results from our community voting initiatives are transparently shared and implemented, with winning games receiving focused attention through dedicated events, tournaments, and potential strategic partnerships.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'tokenomics',
        title: 'Tokenomics',
        content:
            'BAG\'s token economy is designed for sustainability and community value, with allocations for community rewards, ecosystem development, strategic partnerships, and team operations. Our tokenomics model prioritizes long-term growth and stability.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'partners',
        title: 'Our Partners',
        content:
            'BAG has established strategic partnerships with leading Web3 games, blockchain platforms, and gaming guilds to enhance opportunities for our community and strengthen our ecosystem.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'games',
        title: 'Games We\'ve Collabed With',
        content:
            'BAG has collaborated with numerous Web3 games, providing feedback, organizing tournaments, and creating specialized content to support game development and community engagement.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
      SectionModel(
        id: 'roadmap',
        title: 'Roadmap',
        content:
            'Our roadmap outlines BAG\'s strategic vision and planned milestones, including community growth targets, platform development, partnership expansions, and ecosystem enhancements for the coming quarters.',
        imageUrl: 'https://i.ibb.co/RTHrTtFn/BAG-Gulid-X-Bnr-01.png',
      ),
    ];
  }
}

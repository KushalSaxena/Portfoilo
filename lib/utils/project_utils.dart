class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String link;


  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.link,
  });

}

List<ProjectUtils> projects = [
  ProjectUtils(
      image: 'assets/projects/news_app.png',
      title: 'News App',
      subtitle: 'Built a dynamic Flutter News App featuring top headlines and categorized news options.',
      link: 'https://github.com/KushalSaxena/News-App',),
  ProjectUtils(
      image: 'assets/projects/ngo.jpg',
      title: 'NGO Connection App',
      subtitle: 'A Social App that connect through various NGO’s as per the services and needs.',
      link: 'https://github.com/KushalSaxena/NGO_APP'),
  ProjectUtils(
      image: 'assets/projects/amazon_clone.png',
      title: 'Amazon Clone',
      subtitle: 'Developed a replica of Amazon using HTML and CSS, showcasing proficiency in front-end web development.',
      link: 'https://github.com/KushalSaxena/Amazon-Clone')
];

List<ProjectUtils> certifications = [
  ProjectUtils(image: 'assets/projects/alpha.png',
      title: 'Alpha 3.0',
      subtitle: 'Completed a comprehensive certificate program covering Java programming language fundamentals and advanced concepts in DSA.',
      link: 'https://drive.google.com/file/d/1aYd0ifOJuZW0zZ6BTDQUj2U_w6Ie9Ro1/view?usp=drive_link'),
  ProjectUtils(image: 'assets/projects/ai.png', title: 'Be10x',
      subtitle: 'Completed a comprehensive basic C++ programming course, gaining proficiency in fundamental programming concepts and problem-solving skills.',
      link: 'https://drive.google.com/file/d/1Y7syM7GyNaFm_LPN33y3mp5WCUTcmu0T/view?usp=drive_link'),
  ProjectUtils(image: 'assets/projects/c++.png',
      title: 'C++',
      subtitle: 'Participated in an AI workshop, acquiring foundational knowledge of AI tools.',
      link: 'https://drive.google.com/file/d/1DFX5JynjkaLF6hMMOgXvxPiS0P05IKgF/view?usp=drive_link')
];
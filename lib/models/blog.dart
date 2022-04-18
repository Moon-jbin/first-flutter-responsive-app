class Blog { // 블로그 클래스를 선언한다.
  final String? date, title, description, image;
  //String? 이라고 한 것은 문자열 이거나 null 이거나 라는 뜻이다.
  //즉, 우리가 블로그를 작성할때 이미지를 빼먹을 수도 있으며, 설명, 또는 title, date를
  // 빼 먹을 수 있다고 생각하기 때문에 String? 이라고 쓴것 같다.
  // 사실상 date, title 까지는 String 으로 해줘도 될 듯 한데...

  // 개인적으로는 date, title 정도는 String 으로 해도 될듯하지만
  // description , image는 String? 으로 해도 될듯 하다.
  // 하지만 이건 기존 반응형 오픈소스의 설명이라고 생각해서 기존 하던 코드대로 가자.


  // 이 블로그 클래스는 인자로 date, title, description, image를 받는다.
  Blog({this.date, this.title, this.description , this.image});
}


// 자료형이 클래스 Blog 인 blogPosts 는 배열 형태로
// 포스팅에 대한 item값을 갖는다.
// 나중에 firebase에서 데이터 베이스를 사용해 이 배열에 넣은 후
// blogPosts에게 map 형식으로 돌면서 출력을 시키면 게시판이 완성될 것이다.
List<Blog> blogPosts = [
  Blog(
    date: "23 September 2022",
    image: "assets/images/0.png",
    title: "How Ireland’s biggest bank executed a comp lete security redesign",
    description:
    "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
  Blog(
    date: "21 August  2022",
    image: "assets/images/1.png",
    title: "5 Examples of Web Motion Design That Really Catch Your Eye",
    description:
    "Web animation has become one of the most exciting web design trends in 2020. It breathes more life into a website and makes user interactions even more appealing and intriguing. Animation for websites allows introducing a brand in an exceptionally creative way in modern digital space. It helps create a lasting impression, make a company",
  ),
  Blog(
    date: "23 September 2022",
    image: "assets/images/2.png",
    title: "The Principles of Dark UI Design",
    description:
    "Mobile banking has seen a huge increase since Coronavirus. In fact, CX platform Lightico found that 63 percent of people surveyed said they were more willing to try a new digital banking app than before the pandemic.So while you may be more inclined to bank remotely these days, cybercrime—especially targeting banks—is on the rise.",
  ),
];
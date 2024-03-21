
class Film{
  final String title;
  final String urlImage;
  final int year;
  final String aboutPart;


  const Film({
    required this.title,
    required this.urlImage,
    required this.year,
    required this.aboutPart,
  });
}

const allFilms = [
  Film(
    title : 'Lord Of The Rings - The Fellowship of the Ring ',
    urlImage:'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg',
    year: 2001,
    aboutPart: 'Yüzüklerin Efendisi: Yüzük Kardeşliği, Peter Jacksonın yönettiği Yüzüklerin Efendisi üçlemesinin birinci filmidir ve 2001 yılında gösterime girmiştir. J. R. R',

  ),

  Film(
    title : 'Lord Of The Rings -  The Two Towers ',
    urlImage:'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX1000_.jpg',
    year: 2002,
    aboutPart: 'Yüzüklerin Efendisi: İki Kule, J. R. R. Tolkiennin İki Kule adlı kitabından uyarlanmış ve Peter Jackson tarafından yönetilmiş 2002 yılında gösterime giren fantezi filmidir.',

  ),

  Film(
    title : 'Lord Of The Rings -  The Return of the King ',
    urlImage:'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg',
    year: 2003,
    aboutPart: 'Yüzüklerin Efendisi: Kralın Dönüşü, Peter Jacksonın yönetmenliğini yaptığı, J. R. R. Tolkienin Yüzüklerin Efendisi kitaplarının ikinci ve üçüncü bölümlerinden uyarlanan 2003 yılında gösterime giren fantezi filmidir. Yüzüklerin Efendisi film serisinin Yüzük Kardeşliği ve İki Kuleden sonra üçüncü filmidir.',
  ),
  Film(
    title : 'DENEME FILM ',
    urlImage:'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/1024px-Red_Apple.jpg',
    year: 1121,
    aboutPart: 'BU BIR ELMADIR BUYUTCEK BISI YOKTUR',
  )


];


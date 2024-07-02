interface Movie {
    id: number;
    title: string;
    year: number;
    category: string;
    image: string;
  }

const MOVIES: Movie[] = [
    {
      id: 1,
      title: 'Путешествие - 2',
      year: 2012,
      category: 'movies',
      image: 'https://www.1zoom.me/big2/528/291556-2807.jpg'
    },
    {
        id: 2,
        title: 'Школа добра и зла',
        year: 2022,
        category: 'movies',
        image: 'https://zeflix.online/uploads/posts/2022-10/1666172045_shkola-dobra.jpg',
    },
    {
        id: 3,
        title: 'Гарри Поттер и Филосовский камень',
        year: 2001,
        category: 'movies',
        image: 'https://pic.rutube.ru/video/af/c7/afc7ab6b0601db171f61e83e1385cd35.jpg',
    },
    {
        id: 4,
        title: 'Энола Холмс',
        year: 2020,
        category: 'movies',
        image: 'https://itc.ua/wp-content/uploads/2022/11/n2OaA7Je0fgcVnfJM7xDJoPny7x.jpg',
    },
    {
        id: 5,
        title: 'Вонка',
        year: 2023,
        category: 'movies',
        image: 'https://vkplay.ru/hotbox/content_files/Stories/2023/12/20/c52475b2c6d84091aed69f47df0a21c7.jpg',
    },
    {
        id: 6,
        title: 'Оппенгеймер',
        year: 2023,
        category: 'movies',
        image: 'https://arynews.tv/wp-content/uploads/2023/07/Oppenheimer-3-696x342.jpg',
    },
     {
      id: 7,
      title: 'Гримм',
      year: 2011,
      category: 'series',
      image: 'https://www.artcontext.info/images/stories/pic4/p3/7777777777777grimm-season-one-blu-ray-cover-40.jpg',
    },
    {
      id: 8,
      title: 'Дневники Вампира',
      year: 2009,
      category: 'series',
      image: 'https://lh4.googleusercontent.com/proxy/7BtKgpOWi1CaBvoxvavfefI3f9KVcLoY0sKv5iFddhTE6ajaFRjq9SMfGWs22oNoa1hli84W4CoXkNNqM_93lHtQeZzpwNZf0kNP9rTHcFw-4AEibBl1gqWoiHPR-g0d',
    },
    {
      id: 9,
      title: 'Сотня',
      year: 2014,
      category: 'series',
      image: 'https://avatars.dzeninfra.ru/get-zen_doc/1645803/pub_5e72e3f12ff725073d181ca5_5e72e3f5e5fa715ea911bdd6/scale_1200',
    },
    {
      id: 10,
      title: 'Сверхъестественное',
      year: 2005,
      category: 'series',
      image: 'https://whatisgood.ru/wp-content/uploads/2017/08/serial-sverhestestvennoe-0.jpg',
    },
    {
      id: 11,
      title: 'Ходячие мертвецы',
      year: 2010,
      category: 'series',
      image: 'https://disgustingmen.com/wp-content/uploads/2019/02/Walking-Dead-9-season.jpg',
    },
    {
      id: 12,
      title: 'Очень странные дела',
      year: 2016,
      category: 'series',
      image: 'https://pm1.aminoapps.com/6999/21a8f6450884d5cab715d7332a946c8eba33a429r1-640-480v2_uhq.jpg',
    },
    {
        id: 13,
        title: 'Рапунцель',
        year: 2010,
        category: 'cartoons',
        image: 'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_652d7706c094161c02071aca_652d7afc8365541c3980e5f5/scale_1200',
      },
      {
        id: 14,
        title: 'Тайна Коко',
        year: 2017,
        category: 'cartoons',
        image: 'https://postmania.ru//files/products/50-102-a.800x600.jpg',
      },
      {
        id: 15,
        title: 'Элементарно',
        year: 2023,
        category: 'cartoons',
        image: 'https://www.soyuz.ru/public/uploads/files/2/7627809/202309141804224e7adf59df.jpg',
      },
      {
        id: 16,
        title: 'Мадагаскар',
        year: 2005,
        category: 'cartoons',
        image: 'https://m-dekor.by/catalog/4067/main.webp',
      },
      {
        id: 17,
        title: 'Как приручить дракона',
        year: 2010,
        category: 'cartoons',
        image: 'https://cdnn21.img.ria.ru/images/155970/88/1559708854_0:820:2048:1972_600x0_80_0_0_0bce7ab0341851a6cecc2ab82b288f1a.jpg',
      },
      {
        id: 18,
        title: 'Утиные истории',
        year: 1987,
        category: 'cartoons',
        image: 'https://upload.wikimedia.org/wikipedia/ru/e/e0/DuckTales_portrait.JPG',
      }
]

export default MOVIES
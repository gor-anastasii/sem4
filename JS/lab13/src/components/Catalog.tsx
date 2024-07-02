import React, {useState} from 'react';
import Card from './Card';
import Search from './Search';
import './Catalog.css';

const Catalog = () => {
  const [movies, setMovies] = useState<any[]>([]);

  const searchMovies = async (query: string, category: string) => {
    try {
      let url = `http://www.omdbapi.com/?s=${query}&apikey=d478bcba`;
      if (category !== 'all') {
        url += `&type=${category}`;
      }
      const response = await fetch(url);
      const data = await response.json();
      console.log(data)
      setMovies(data.Search || []);
    } catch (error) {
      console.error('Error searching movies:', error);
    }
  };

  return (
    <div className="wrapper">
      <div className='search'>
        <Search onSearch={searchMovies}/>
      </div>
      <div className='catalog'>
        {movies.length === 0 ? (
          <p>Ничего не найдено</p>
        ) : (
          movies.map((movie: any) => (
            <Card
              key={movie.imdbID}
              id={movie.imdbID}
              title={movie.Title}
              year={movie.Year}
              category={movie.Type}
              image={movie.Poster}
            />
          ))
        )}
      </div>
    </div>
  );
};

export default Catalog;
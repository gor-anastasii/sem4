import React from 'react';
import MOVIES from '../movies';
import Card from './Card';
import './Catalog.css'

interface Props {
  category?: string;
}

const Catalog: React.FC<Props> = ({ category = 'all' }) => {
  const filteredMovies = category === 'all' ? MOVIES : 
        MOVIES.filter((movie: any) => movie.category === category);

  return (
    <div className="catalog">
      {filteredMovies.map((movie: any) => (
        <Card id={movie.id} 
              title={movie.title}
              image={movie.image} 
              year={movie.year}
              category={movie.category}
        />
      ))}
    </div>
  );
};

export default Catalog;
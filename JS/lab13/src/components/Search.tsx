import React, { useState } from 'react';

interface SearchProps {
  onSearch: (query: string, category: string) => void;
}

const Search: React.FC<SearchProps> = ({ onSearch }) => {
  const [query, setQuery] = useState('');
  const [category, setCategory] = useState('movie');

  const handleSearch = () => {
    const trimmedQuery = query.trim();
    onSearch(trimmedQuery, category);
  };

  return (
    <div>
      <input
        type="text"
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder="Введите название"
      />
      <button onClick={handleSearch}>Искать</button>

      <div>
      <label>
          <input
            type="radio"
            value="all"
            checked={category === 'all'}
            onChange={() => setCategory('all')}
          />
          Все
        </label>
        <label>
          <input
            type="radio"
            value="movie"
            checked={category === 'movie'}
            onChange={() => setCategory('movie')}
          />
          Фильмы
        </label>
        <label>
          <input
            type="radio"
            value="series"
            checked={category === 'series'}
            onChange={() => setCategory('series')}
          />
          Сериалы
        </label>
      </div>
    </div>
  );
};

export default Search;
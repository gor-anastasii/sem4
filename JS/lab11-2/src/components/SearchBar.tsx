import React from "react";
import style from "./SearchBar.module.css"

interface SearchBarProps {
    filterText: string;
    inStockOnly: boolean;
    onFilterTextChange: (text: string) => void;
    onInStockChange: (checked: boolean) => void;
  }

const SearchBar: React.FC<SearchBarProps> = ({ filterText, inStockOnly, onFilterTextChange, onInStockChange }) => {
    const handleFilterTextChange = (e: any) => {
      onFilterTextChange(e.target.value);
    };
  
    const handleInStockChange = (e: any) => {
      onInStockChange(e.target.checked);
    };
  
    return (
      <form>
        <input
          className={style.textBox}
          type="text"
          placeholder="Search..."
          value={filterText}
          onChange={handleFilterTextChange}
        />
        <p>
          <input
            type="checkbox"
            checked={inStockOnly}
            onChange={handleInStockChange}
          />
          {' '}
          Only show products in stock
        </p>
      </form>
    );
}

export default SearchBar
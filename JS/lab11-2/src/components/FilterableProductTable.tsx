import React, {useState} from "react";
import SearchBar from "./SearchBar";
import ProductTable from "./ProductTable";
import style from './FilterableProductTable.module.css'

interface Product {
    category: string;
    price: string;
    stocked: boolean;
    name: string;
  }
  
interface FilterableProductTableProps {
    products: Product[];
}

const FilterableProductTable: React.FC<FilterableProductTableProps> = ({products}) => {
    const [filterText, setFilterText] = useState<string>('');
    const [inStockOnly, setInStockOnly] = useState<boolean>(false);
  
    const handleFilterTextChange = (text: string) => {
      setFilterText(text);
    };
  
    const handleInStockChange = (checked: boolean) => {
      setInStockOnly(checked);
    };
  
    return (
      <div className={style.wrapper}>
        <SearchBar
          filterText={filterText}
          inStockOnly={inStockOnly}
          onFilterTextChange={handleFilterTextChange}
          onInStockChange={handleInStockChange}
        />
        <ProductTable
          products={products}
          filterText={filterText}
          inStockOnly={inStockOnly}
        />
      </div>
    );
}

export default FilterableProductTable
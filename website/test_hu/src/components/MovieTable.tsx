import {useState, useEffect} from "react";
import { Movie, westerns } from "../data_types/data";

// For styling the table... / A táblázat stílusát hozzuk létre
const tableStyle = "flex flex-col";
const headerRowStyle = "flex flex-row bg-gray-700 text-white p-2";
const bodyRowStyle = "flex flex-row p-2 border-b border-gray-400";
const cellStyle = "flex-1 p-1";


export default function MovieTable() {
  const [filteredMovies, setFilteredMovies] = useState(westerns);
  const [averageIMDB, setAverageIMDB] = useState(0);


  const getAvgIMDB = (json: Movie[]) => {
    let avg: number = 0;

    for(let i = 0; i < json.length; i++) {
      avg += json[i].imdbRating;
    }
    avg = avg / json.length;
    return avg;
  }

  // Get the average IMDB rating. 
  // The number should follow the actual state of the table
  // Határozza meg az átlagos IMDB értékelést. 
  // A számnak tükröznie kell a táblázat aktuális állapotát.
  console.log(averageIMDB);

  const updateTable = () => {
    // Get movies with rating better than 8.1
    // Szűrjük ki azokat a filmeket, melyek értékelése jobb, mint 8.1

    const filterMovies = () => {
      let filtered: Movie[] = [];
      for(let i = 0; i < westerns.length; i++) {
        if(westerns[i].imdbRating >= 8.1) {
          filtered.push(westerns[i]);
        }
      }
      return filtered;
    }
    setFilteredMovies(filterMovies());
    console.log("updateTable");
  }


  const restoreTable = () => {
    // Get the original table back
    // Visszaállítjuk az eredeti táblázatot
    setFilteredMovies(westerns);
    console.log("restoreTable");
  }

  useEffect(() => {
    // Update the average IMDB rating whenever the filteredMovies state changes
    const newAverageIMDB = getAvgIMDB(filteredMovies);
    setAverageIMDB(newAverageIMDB);
  }, [filteredMovies]);

  // averageIMDB
  // updateTable
  // restoreTable

  return (
    <>
    <div className="m-4">
      <p className="m-2">IMDB átlag/average: 
        <span className="font-bold ml-2">{averageIMDB} </span> 
      </p>
      <div className="flex">
        <span className="m-2">Filmek, melyek értékelése jobb, mint (movies with rating better than) 8.1:</span>
        <button className="bg-cyan-700 hover:bg-cyan-600 text-white font-bold py-2 px-4 rounded-md" onClick={updateTable}>Leszűkít/Filter</button>
        <button className="bg-rose-700 hover:bg-rose-600 text-white font-bold py-2 px-2 ml-4 rounded-md " onClick={restoreTable}>Eredeti táblázat/Restore table</button>
      </div>
    </div>
    <div className={tableStyle}>
      <div className={headerRowStyle}>
        <div className={cellStyle}>Cím/Title</div>
        <div className={cellStyle}>Rendező/Director</div>
        <div className={cellStyle}>IMDB</div>
        <div className={cellStyle}>Év/Year </div>
      </div>
      {/* Render table data here / Hozzuk létre a táblázat törzsét */}
      {filteredMovies.map((movie, index) => (
      <div className={bodyRowStyle} key={index}>
        <div className={cellStyle}>{movie.title}</div>
        <div className={cellStyle}>{movie.director}</div>
        <div className={cellStyle}>{movie.imdbRating}</div>
        <div className={cellStyle}>{movie.year}</div>
      </div>
      ))}

      </div>
    </>
  )

}
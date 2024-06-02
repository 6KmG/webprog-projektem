export type Movie = {
  id: number;
  title: string;
  director: string;
  imdbRating: number;
  year: number;
};

export const json = `[
  {"id": 1, "title": "The Good, the Bad and the Ugly", "director": "Sergio Leone", "imdbRating": 8.8, "year": 1966},
  {"id": 2, "title": "Unforgiven", "director": "Clint Eastwood", "imdbRating": 8.2, "year": 1992},
  {"id": 3, "title": "Once Upon a Time in the West", "director": "Sergio Leone", "imdbRating": 8.5, "year": 1968},
  {"id": 4, "title": "Django Unchained", "director": "Quentin Tarantino", "imdbRating": 8.4, "year": 2012},
  {"id": 5, "title": "The Wild Bunch", "director": "Sam Peckinpah", "imdbRating": 7.9, "year": 1969},
  {"id": 6, "title": "The Magnificent Seven", "director": "John Sturges", "imdbRating": 7.7, "year": 1960},
  {"id": 7, "title": "True Grit", "director": "Ethan Coen, Joel Coen", "imdbRating": 7.6, "year": 2010},
  {"id": 8, "title": "High Noon", "director": "Fred Zinnemann", "imdbRating": 8.0, "year": 1952},
  {"id": 9, "title": "Butch Cassidy and the Sundance Kid", "director": "George Roy Hill", "imdbRating": 8.0, "year": 1969},
  {"id": 10, "title": "Stagecoach", "director": "John Ford", "imdbRating": 7.9, "year": 1939}
]`;

// Parse the JSON string into an array of Movie objects
export const westerns: Movie[] = JSON.parse(json);

console.log(westerns);


export type Book = {
  id: number;
  author: string;
  title: string;
  numberOfPages: number;
  yearOfEdition: number;
}


export const fictionalBooks: Book[] = [
  {
    id: 1,
    author: "Elara Thorn",
    title: "Whispers of the Ancient",
    numberOfPages: 350,
    yearOfEdition: 2021
  },
  {
    id: 2,
    author: "Felix Bright",
    title: "The Last Chronicle",
    numberOfPages: 410,
    yearOfEdition: 1920
  },
  {
    id: 3,
    author: "Gideon Flameward",
    title: "Beyond the Fire Horizon",
    numberOfPages: 290,
    yearOfEdition: 2003
  },
  {
    id: 4,
    author: "Hestia Lore",
    title: "Stars in the Abyss",
    numberOfPages: 360,
    yearOfEdition: 2024
  },
  {
    id: 5,
    author: "Juno Wrath",
    title: "Veil of Shadows",
    numberOfPages: 450,
    yearOfEdition: 2019
  },
  {
    id: 6,
    author: "Kai Storm",
    title: "Echoes of Thunder",
    numberOfPages: 335,
    yearOfEdition: 2022
  },
  {
    id: 7,
    author: "Lyra Fae",
    title: "The Garden of Time",
    numberOfPages: 380,
    yearOfEdition: 1935
  },
  {
    id: 8,
    author: "Nix Flame",
    title: "The Forge of Elements",
    numberOfPages: 300,
    yearOfEdition: 2011
  },
  {
    id: 9,
    author: "Orion Mist",
    title: "The Ocean's Secret",
    numberOfPages: 420,
    yearOfEdition: 2020
  },
  {
    id: 10,
    author: "Serena Dreamweaver",
    title: "The Labyrinth of Dreams",
    numberOfPages: 285,
    yearOfEdition: 2018
  }
];

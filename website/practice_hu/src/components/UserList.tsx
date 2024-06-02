import { useState } from 'react';
import DataModal from './DataModal';
import { UserData } from '../store/types';

const users: UserData[] = [
  { id: 1, name: 'Alice', email: 'a@a.com' },
  { id: 2, name: 'Bob', email: 'b@b.com' },
  { id: 3, name: 'Cecilia', email: 'c@c.com' },
];

const UserList = () => {

  const [ userlist, setUserlist ] = useState(users);

  // 1. Számoljuk ki, hogy az összes név együttesen, hány karakterből áll
  const getTotalNamesLength = () => {
    let sum = 0;
    for (const user of users) {
      sum += user.name.length;
    }
    return sum;
  };

  const totalNamesLength = getTotalNamesLength(); // most még...

  // 2. Írjuk ki azokat a usereket, akiknek a neve 'A' betűvel kezdpődik.
  const filteredUsers = userlist;  // ezt kell megváltoztatni...

  // 3.  Írjuk ki a usereket betűrendben
  // 4.  Listázzuk ki a usereket az id szerint, növekvő számsorrendben.

  const insertUser = (user: UserData) => {
    setUserlist(prev => [...prev, user]);
  };

  const deleteUser = (id: number) => {
    setUserlist(prev => prev.filter(user => user.id !== id));
  };

  return (
    <div className='pt-4 pl-12'>
      <h2 className='text-2xl pb-2'>User Lista</h2>
      <div className="flex flex-col p-4 text-semi-bold ">
        <div className="flex bg-slate-400 p-2 w-96">
          <div className="w-32">Name</div>
          <div className="w-48">Email</div>
          <div className="w-12"></div>
        </div>
      </div>
      <div className="flex flex-col px-4">
        {userlist.map(user => (
          <div className="flex px-4 py-1 w-96" key={user.id}>
            <div className="w-32">{user.name}</div>
            <div className="w-48">{user.email}</div>
            <div className="w-12">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" 
              viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6 hover:text-red-800"
                onClick={() => deleteUser(user.id!)}
              >
                <path strokeLinecap="round" strokeLinejoin="round" d="m9.75 9.75 4.5 4.5m0-4.5-4.5 4.5M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
              </svg>

            </div>
          </div>
        ))}
      </div>
     
      <p className='p-2'>A karakterek száma a nevekben: {totalNamesLength}</p>
      <div>
        <h3 className='p-2'>Userek, melyek neve 'A' betűvel kezdődik: </h3>
        <ul>
          {/* A lista helye */}
        </ul>
      </div>
      <DataModal insertUser={insertUser}/>
    </div>
  );
}

export default UserList;

import { useState, FormEvent, ChangeEvent } from 'react';
import { UserData } from '../store/types';

const DataModal = ({ insertUser }: { insertUser: (user: UserData) => void }) => {
  const [modalIsOpen, setModalIsOpen] = useState(false);
  const [userData, setUserData] = useState<UserData>({ name: '', email: '' });

  const handleInputChange = (e: ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    const newid = simpleKeygen();
    setUserData(prev => ({ ...prev, [name]: value, id: newid }));
  };

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    // alert(`Name: ${userData.name}, Email: ${userData.email}, ID: ${userData.id}`);
    insertUser(userData);
    setModalIsOpen(false);
  };

  function simpleKeygen (): number {
    return Math.floor(Math.random() * 1000000);
  }
  // If the modal is not open only the button will be displayed
  // Ha a modal nincs megnyitva, csak a gomb látszik
  return (
    <div className='p-2'>
      <button onClick={() => setModalIsOpen(true)} className="btn-modal">Új felhasználó</button>
      {modalIsOpen && (
        <div className="fixed inset-0 bg-gray-700 bg-opacity-50  flex justify-center items-center">
          <div className="bg-white p-12 rounded-lg">
            <h2 className="text-lg">Új felhasználó:</h2>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="block">Név:</label>
                <input
                  type="text"
                  name="name"
                  value={userData.name}
                  onChange={handleInputChange}
                  className="border rounded px-2 py-1 w-full"
                />
              </div>
              <div>
                <label className="block">Email:</label>
                <input
                  type="email"
                  name="email"
                  value={userData.email}
                  onChange={handleInputChange}
                  className="border rounded px-2 py-1 w-full"
                />
              </div>
              <div className="flex justify-between">
                <button type="submit" className="btn-submit">Elküld</button>
                <button onClick={() => setModalIsOpen(false)} className="btn-danger">Bezár</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
};

export default DataModal;

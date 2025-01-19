import React, { useState } from 'react';
import './App.css';

function App() {
  const [distance, setDistance] = useState('');
  const [fuelConsumption, setFuelConsumption] = useState('');
  const [result, setResult] = useState('');

  const calculateFuel = () => {
    const consumption = parseFloat(fuelConsumption);
    const dist = parseFloat(distance);

    if (!isNaN(consumption) && !isNaN(dist)) {
      const totalFuel = (consumption * dist) / 100;
      setResult(`Total fuel needed: ${totalFuel.toFixed(2)} liters`);
    } else {
      setResult('Please enter valid numbers');  
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-300 to-purple-500 flex items-center justify-center">
      <div className="bg-white p-8 rounded-lg shadow-md w-96">
        <h2 className="text-3xl font-semibold mb-6 text-center text-gray-800">Fuel Calculator</h2>
        <div className="mb-6">
          <label htmlFor="distance" className="block mb-2 text-lg font-medium text-gray-700">Distance (km)</label>
          <input type="number" id="distance" className="w-full border-2 border-gray-300 rounded-md p-2 text-lg" value={distance} onChange={(e) => setDistance(e.target.value)} />
        </div>
        <div className="mb-6">
          <label htmlFor="fuelConsumption" className="block mb-2 text-lg font-medium text-gray-700">Fuel Consumption (L/100km)</label>
          <input type="number" id="fuelConsumption" className="w-full border-2 border-gray-300 rounded-md p-2 text-lg" value={fuelConsumption} onChange={(e) => setFuelConsumption(e.target.value)} />
        </div>
        <button className="bg-gradient-to-br from-purple-400 to-purple-600 text-white py-3 px-6 rounded-lg text-lg font-medium transition duration-300 ease-in-out transform hover:scale-105" onClick={calculateFuel}>Calculate</button>
        {result && <p className="mt-8 text-lg font-medium text-gray-800">{result}</p>}
      </div>
    </div>
  );
}

export default App;

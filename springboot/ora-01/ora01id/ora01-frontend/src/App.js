import './App.css';

function getCounter(){
  fetch('http://localhost:8080/delete', {
    method: 'DELETE',
  })
   .then(response => response.json())
   .then(data => console.log(data))
   .catch(error => console.error('Error:', error));
  console.log('Button clicked');
  // add your code here to increment the counter and update the UI.
}

function App() {
  return (
    <div className="App">
      <button onClick={getCounter}>Api</button>
    </div>
  );
}

export default App;

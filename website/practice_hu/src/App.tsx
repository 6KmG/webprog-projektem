import { ThemeProvider } from './store/ThemeContext';
import Navbar from './components/Navbar';
import SplashScreen from './components/SplashScreen';
import UserList from './components/UserList';
import Card from './components/Card';

export default function App() {

  return (
    <ThemeProvider>
      <div className="flex bg-slate-300">
        <div className="flex flex-col h-full ">
          <Navbar />
          <SplashScreen />
          <UserList />
          <Card title="First Card" content="This is the first card" />
        </div>
      </div>
    </ThemeProvider>
  )
}

// 1. Add new theme to the existing ones
// 2. Create a card component with a title and some text content. This component should also be themed.
// 3. Some simple exercises are in the UserList component.
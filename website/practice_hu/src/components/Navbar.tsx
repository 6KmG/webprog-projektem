import { useTheme } from '../store/ThemeContext';
import { colorSchemes, type Theme, type ColorType } from '../store/types';

export default function Navbar () {
  const { theme, changeTheme } = useTheme();

  const currentTheme: ColorType = colorSchemes.find(color => color.theme === theme) as ColorType;


  return (
    <nav className={`flex p-4 w-screen ${currentTheme.background} fixed z-10`} >
      <div className={`text-xl mr-4 pt-2 ${currentTheme.text}`}>
        Válasszunk témát: 
      </div>
      <select 
        value={theme} onChange={e => changeTheme(e.target.value as Theme)}
        className={`text-xl px-4 py-2 rounded-lg ${currentTheme.background2} ${currentTheme.text}`}
      >
        {
          colorSchemes.map(color => 
            <option key={color.theme} value={color.theme}
              className={`${color.background} ${color.text}`}
            >{color.theme}
            </option>
          )
        }
      </select>  
    </nav>

  )
}
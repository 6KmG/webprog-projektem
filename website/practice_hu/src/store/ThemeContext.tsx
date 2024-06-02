// src/ThemeContext.tsx
import { createContext, useContext, useState, ReactNode } from 'react';
import { Theme, ThemeContextType } from '../store/types';


const ThemeContext = createContext<ThemeContextType | undefined>(undefined);

export const ThemeProvider = ({ children }: { children: ReactNode }) => {
  const [theme, setTheme] = useState<Theme>('light');

  const changeTheme = (theme: Theme) => {
    setTheme(theme);
  };

  return (
    <ThemeContext.Provider value={{ theme, changeTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

// The custom hook here is to perform a type check.
// In larger projects, it's recommended to place custom hooks in separate files.
export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error('useTheme must be used within a ThemeProvider wrapper');
  }
  return context;
};

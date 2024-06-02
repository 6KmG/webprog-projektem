// This file is not only for TS types but also for color definitions.

export type Theme = 'light' | 'dark' | 'pastel' | 'green';
export type ThemeContextType = {
  theme: Theme;
  changeTheme: (theme: Theme) => void;
}

export type ColorType = {
  theme: Theme;
  background: string;
  background2: string;
  text: string;
}

export const colorSchemes: ColorType[] = [
  {
    theme: 'light',
    background: 'bg-slate-300',
    background2: 'bg-slate-100',
    text: 'text-slate-900',
  },
  {
    theme: 'dark',
    background: 'bg-slate-900',
    background2: 'bg-slate-700',
    text: 'text-slate-100',
  },
  {
    theme: 'pastel',
    background: 'bg-orange-300',
    background2: 'bg-orange-100',
    text: 'text-amber-900',
  },
  {
    theme: 'green',
    background: 'bg-green-300',
    background2: 'bg-green-100',
    text: 'text-slate-900',
  }
]

// for exercise 2:
export type UserData = {
  id?: number;
  name: string;
  email: string;
}
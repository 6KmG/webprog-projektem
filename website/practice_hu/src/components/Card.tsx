import React from 'react';
import { useTheme } from '../store/ThemeContext';
import { colorSchemes, type ColorType } from '../store/types';

interface CardProps {
  title: string;
  content: string;
}

const Card: React.FC<CardProps> = ({ title, content }) => {
  const { theme } = useTheme();

  const currentTheme: ColorType = colorSchemes.find(color => color.theme === theme) as ColorType;

  return (
    <div className={`rounded-lg shadow-md p-6 max-w-md mx-auto mb-6 ${currentTheme.background2}`}>
      <h2 className={`text-2xl font-bold mb-4 ${currentTheme.text}`}>{title}</h2>
      <p className={`${currentTheme.text}`}>{content}</p>
    </div>
  );
};

export default Card;
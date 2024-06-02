import { useTheme } from '../store/ThemeContext';
import { colorSchemes, type ColorType } from '../store/types';

export default function SplashScreen () {
  const { theme } = useTheme();

  const currentTheme: ColorType = colorSchemes.find(color => color.theme === theme) as ColorType;

  // console.log(theme)

  return (
    <div className={`flex flex-col h-screen  justify-center items-center ${currentTheme.background2}`}>
      <div className='m-8 justify-center items-center'>
        <h1 className={`text-4xl ${currentTheme.text}`}>This is the splash screen</h1>
      </div>
      <div className={`m-8 text-justify ${currentTheme.text}`}>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae dolor aliquam, optio possimus quia a vel perspiciatis excepturi. Accusantium error illum commodi quibusdam quae porro sed non voluptates laudantium, laborum voluptatum et pariatur, corporis nihil vitae soluta est veniam? Quasi perferendis ullam minima ab sit quae natus expedita doloremque aliquid? Ratione, explicabo vero! </p>
      </div>
    </div>
  )
}
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Tailwind CDN -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Alpine.js -->
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2/dist/alpine.min.js" defer></script>

        <!-- AOS (Animate On Scroll) -->
        <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    </head>
    <body class="bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 h-screen flex items-center justify-center text-white">

        <div class="text-center p-10 md:p-20 rounded-3xl bg-gray-900 bg-opacity-60 shadow-xl transform transition-all duration-500 hover:scale-105" data-aos="fade-up">
            <h1 class="text-4xl md:text-5xl font-bold text-gray-300 animate__animated animate__fadeIn" data-aos="fade-in" data-aos-duration="1500">
                Welcome to Our Website!
            </h1>
            <p class="text-lg md:text-xl text-gray-300 mt-5 animate__animated animate__fadeIn animate__delay-1s" data-aos="fade-in" data-aos-delay="500">
                We are thrilled to have you here. Let's get started and explore amazing things!
            </p>

            <div class="mt-8 space-x-4">
                <!-- Login Button -->
                <a href="{{ route('login') }}" class="inline-block bg-gray-300 text-black px-8 py-3 rounded-xl text-xl font-medium hover:bg-white transform transition duration-300 ease-in-out animate__animated animate__zoomIn hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-gray-100 focus:ring-opacity-50" data-aos="zoom-in" data-aos-delay="1000">
                    Login
                </a>
                
                <!-- Register Button -->
                <a href="{{ route('register') }}" class="inline-block bg-gray-300 text-black px-8 py-3 rounded-xl text-xl font-medium hover:bg-white transform transition duration-300 ease-in-out animate__animated animate__zoomIn hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-gray-100 focus:ring-opacity-50" data-aos="zoom-in" data-aos-delay="1200">
                    Register
                </a>
            </div>
        </div>

        <script>
            AOS.init({
                duration: 1200, // Global duration for animations
                easing: 'ease-out-back', // Smooth animation easing
                once: true, // Animation happens only once when it enters the viewport
            });
        </script>

    </body>
</html>

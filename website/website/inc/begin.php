<?php include 'functions.php'; ?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company honlap</title>
    <link rel="stylesheet" href="res/style.css">
</head>
<body>

	<header>
		
		<div class="interaction">
			
			<a href="index.php" class="logo">
				<img src="res/img/logo.png" alt="Company logo"> 
			</a>
			
			<nav>
				<ul><?php printMenu(); ?></ul>
			</nav>
			
		</div>
		<div class="inside">

<?php if($bigHeader): ?>

    <?php

    $header = 
    [
        [
            'title' => 'Csatlakozz hozzánk!',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate, sequi, pariatur dolores?',
            'button' => 'Csatlakozom'
        ],
        [
            'title' => 'Kérj tőlünk ajánlatot!',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate, sequi?',
            'button' => 'Ajánlatkérés'
        ],
        [
            'title' => 'Fizess nekünk sok pénzt!',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate?',
            'button' => 'Fizetek!!!'
        ],
        [
            'title' => 'Légy a partnerünk!',
            'text' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate, sequi, pariatur dolores?',
            'button' => 'Partner leszek!'
        ]
    ];
    $r = rand(0, count($header) - 1);

    echo '<div class="info">
            <h3>'. $header[$r]['title'] .'</h3>
            <p>'. $header[$r]['text'] .'</p>
            <a href="" class="btn">'. $header[$r]['button'] .'</a>
        </div>';

    /*
    $r = rand(0, 2);

    switch($r)
    {
        case 0:
            $title = 'Csatlakozz hozzánk!';
            $text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate, sequi, pariatur dolores?';
            $button = 'Csatlakozom';
            break;
        case 1:
            $title = 'Kérj tőlünk ajánlatot!';
            $text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate, sequi?';
            $button = 'Ajánlatkérés';
            break;
        case 2:
            $title = 'Fizess nekünk sok pénzt!';
            $text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate?';
            $button = 'Fizetek!!!';
            break;
    }


    echo '<div class="info">
            <h3>'. $title .'</h3>
            <p>'. $text .'</p>
            <a href="" class="btn">'. $button .'</a>
        </div>';
    */
    ?>
			<div class="cover">
				<img src="res/img/header.png" alt="Illusztráció: irodai munka">
			</div>

<?php endif; ?>
			
		</div>
		
	</header>

	<main>
		<div class="inside">
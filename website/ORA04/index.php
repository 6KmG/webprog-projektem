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
			
			<a href="index.html" class="logo">
				<img src="res/img/logo.png" alt="Company logo"> 
			</a>
			
			<nav>
				<ul>
					<li><a href="index.html">Bemutatkozás</a></li>
					<li><a href="szolgaltatasok.html">Szolgáltatások</a></li>
					<li><a href="cikkek.html">Cikkek</a></li>
					<li><a href="kapcsolat.html">Kapcsolat</a></li>
				</ul>
			</nav>
			
		</div>
		<div class="inside">
			
			<div class="info">
				<h3>Csatlakozz hozzánk!</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque perspiciatis velit placeat tempora aliquid dolorem quisquam vero ea consequatur ut numquam cupiditate, sequi, pariatur dolores?</p>
				<a href="" class="btn">Csatlakozom</a>
			</div>
			
			<div class="cover">
				<img src="res/img/header.png" alt="Illusztráció: irodai munka">
			</div>
			
		</div>
		
	</header>

	<main>
		<div class="inside">
			
			<article>
				<h1>Bemutatkozunk</h1>

				<p><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod natus distinctio error esse eligendi. Magnam ad, quam nisi quasi ipsum asperiores temporibus nulla, dolorum nam libero repellat sint iusto! Quisquam quis sit blanditiis voluptate dolore.</strong></p>

				<img src="res/img/picture1.jpg" alt="Munkahelyi értekezlet a nagy asztalnál">

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque, assumenda quod eveniet officiis quae, quo consequuntur, rerum libero perferendis, voluptate iure? Maxime, consequatur! Delectus reprehenderit iusto minus voluptas soluta ullam dolor hic esse repellat tempora rem beatae porro totam nobis possimus, dolores sapiente laboriosam. Natus maxime ut eligendi quibusdam quis.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto sit, voluptate cum. Laudantium consequuntur expedita tempora animi. Dolor nulla eum repellat a, sed reprehenderit earum esse itaque, eaque ipsam assumenda distinctio quaerat ab? A placeat aspernatur eaque veniam fugit itaque provident voluptate asperiores, ad illum? Odit aut hic, consectetur rerum iste accusamus tempora sed magnam consequatur delectus incidunt quo similique. Minus, ex dolorum provident explicabo! Suscipit enim, fugiat totam consequatur at et reiciendis itaque adipisci?</p>
			</article>
			
		</div>
	</main>

	<aside>
		<div class="inside">
			
			<div>
<?php

date_default_timezone_set("Europe/Budapest");
$open = 8;
$close = 15;
$now = (int) date("H");
$openMessage = "Ügyfélszolgálatunk jelenleg elérhető.";
$closeMessage = "Ügyfélszolgálatunk jelenleg nem elérhető.";

if($now >= $close){
    $info = $closeMessage;
}
else if($now < $open){
    $info = $closeMessage;
}
else {
    $info = $openMessage;
}

echo   '<section>
            <h3>Ügyfélszolgálat</h3>
            <p>Telefon: +36 20 111 11 11</p>
            <p>Nyitvatartás: '.$open.'-'.$close.' óráig</p>
            <p>'.$info.'</p>
            </section>';
?>				
				<section>
					<h3>Ajánlatkérés</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic at, laborum aut ducimus nesciunt pariatur? Facere dolorem fuga, totam pariatur nemo libero earum iusto in enim accusantium est eligendi amet, dignissimos, dolores.</p>
				</section>
				
			</div>
			
			<ul class="features">
				<li>
					<img src="res/img/icon-delivery.png" alt="Teherautó">
					<h3>Ingyenes kiszállítás</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, assumenda.</p>
				</li>
				<li>
					<img src="res/img/icon-refund.png" alt="Visszatérítés">
					<h3>Visszafizetési garancia</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, fuga eius, architecto est commodi rerum!</p>
				</li>
				<li>
					<img src="res/img/icon-creditcard.png" alt="Bankkártya">
					<h3>Bankkártyás fizetés</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe veritatis deserunt nemo fuga fugit neque quisquam laborum adipisci nulla culpa!</p>
				</li>
				
			</ul>
			
		</div>
	</aside>

	<footer>
		<div class="inside">
			
			<section class="info">
				<h4>Lorem ipsum dolor</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab quas dignissimos porro neque, voluptatem sunt excepturi accusantium provident illum quam!</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
			</section>
			
			<section class="pages">
				<h4>Oldaltérkép</h4>
				<ul>
					<li><a href="index.html">Bemutatkozás</a></li>
					<li><a href="szolgaltatasok.html">Szolgáltatások</a></li>
					<li><a href="cikkek.html">Cikkek</a></li>
					<li><a href="kapcsolat.html">Kapcsolat</a></li>
				</ul>
			</section>
			
		</div>
	</footer>
	
</body>
</html>
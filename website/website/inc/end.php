        </div>
	</main>

	<aside>
		<div class="inside">
			
			<div>
<?php

$open = 8;
$close = 16;

$now = (int) date('H');
$info = 'Ügyfélszolgálatunk jelenleg elérhető';

if($now < $open)
{ 
	$next = $open - $now;
	$info = 'Ügyfélszolgálatunk jelenleg még zárva tart, legközelebb '. $next .' óra múlva léphet kapcsolatba velünk';
}
else
if($now >= $close)
{
	$next = 24 - $now + $open;
	$info = 'Ügyfélszolgálatunk a mai napon már nem elérhető, legközelebb '. $next .' óra múlva léphet kapcsolatba velünk';
}

echo '<section>
		<h3>Ügyfélszolgálat</h3>
		<p>Telefon: +36 30 123 45 67<br>
			Nyitvatartás: '. $open .'-'. $close .' óráig</p>
		<p>'. $info .'</p>
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
				<ul><?php printMenu(); ?></ul>
			</section>
			
		</div>
	</footer>
	
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="res/style.css">
	<link rel="stylesheet" href="res/zh.css">
</head>
<body>
	
	<header>
	
		<nav>
			<ul>
				<li><a href="index.php">Bemutató</a></li>
				<li><a href="?title=program">Programok</a></li>
				<li><a href="?title=gallery">Galéria</a></li>
				<li><a href="?title=contact">Elérhetőségek</a></li>
			</ul>
		</nav>
	
		<!-- <a href="" class="title">party</a> -->

		<a href="" class="title">
            <?php
                // Ellenőrizzük, hogy van-e 'title' paraméter az URL-ben
                if (isset($_GET['title'])) {
                    // Ha van ilyen paraméter, jelenítsük meg az értékét
                    echo htmlspecialchars($_GET['title']);
                } else {
                    // Ha nincs ilyen paraméter, marad az alapértelmezett felirat
                    echo "party";
                }
            ?>
        </a>
	</header>
	
	<main>
	
		<h1>Party content</h1>
		
		<!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse consectetur sint molestiae similique nihil, corporis eaque iure harum, eum, quos debitis pariatur quod dignissimos tempore!</p> -->
		
		<?php
			// A content.txt fájl beolvasása
			$fileContent = file_get_contents('src/content.txt');
			
			// Ha sikerült beolvasni, jelenítsük meg a tartalmat egy bekezdésben
			if ($fileContent !== false) {
				echo "<p>" . nl2br($fileContent) . "</p>";
			} else {
				echo "<p>Nem sikerült beolvasni a fájl tartalmát.</p>";
			}
    	?>

		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero saepe sequi tempore tempora ex voluptatibus, beatae velit natus voluptate nobis, nesciunt a tenetur laborum enim fugit. Facilis similique molestias, exercitationem esse veritatis suscipit, vero nobis?</p>
		
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt labore reiciendis repudiandae rerum, quae. Suscipit nobis eveniet nostrum voluptates consectetur, nam ducimus, inventore, architecto animi libero vitae quaerat quas asperiores reiciendis rem, vero nulla vel delectus doloremque quidem doloribus. Reiciendis iste at ipsum ipsam facilis, dicta perspiciatis beatae provident distinctio.</p>
		
		<!-- <table>
			<thead>
				<tr>
					<th>Ssz.</th>
					<th>Érték</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1.</th>
					<td>28 <sup>o</sup>C</td>
				</tr>
				<tr>
					<th>2.</th>
					<td>29 <sup>o</sup>C</td>
				</tr>
				<tr>
					<th>3.</th>
					<td>27 <sup>o</sup>C</td>
				</tr>
				<tr>
					<th>4.</th>
					<td>29 <sup>o</sup>C</td>
				</tr>
				<tr>
					<th>5.</th>
					<td>27 <sup>o</sup>C</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th>Átlag:</th>
					<td>28 <sup>o</sup>C</td>
				</tr>
			</tfoot>
		</table> -->

		<table>
			<thead>
				<tr>
					<th>Ssz.</th>
					<th>Érték</th>
				</tr>
			</thead>
			<tbody>
				<?php
					$temps = [36, 39.2, 32.1, 33];
					for ($i = 0; $i < count($temps); $i++) {
						echo 
							"<tr>
								<td>".($i + 1)."</td>
								<td>".$temps[$i]." <sup>o</sup>C</td>
							</tr>";
					}
				?>
			</tbody>
			<tfoot>
				<tr>
					<th>Átlag:</th>
					<td><?php $average = array_sum($temps)/count($temps); echo $average; ?> <sup>o</sup>C</td>
				</tr>
			</tfoot>
		</table>


		<section>
			
			<h2>Additional content</h2>
			
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum aperiam debitis ratione nostrum quis commodi aliquam, earum officia nisi quae fugit, odit quod harum distinctio in. Nisi, optio inventore enim cum ipsa non omnis doloribus.</p>
			
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus placeat, iste recusandae aliquid accusamus voluptatem vel iusto dolorum doloremque adipisci ducimus, rem, laborum eius non.</p>
			
		</section>
		
	</main>
	
	<aside>
	
		<section>
			<h3>Box in aside</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla ea quibusdam, illum, nam ratione facere! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores ut suscipit, laborum, adipisci ex reprehenderit.</p>
		</section>
	
		<section>
			<h3>Box in aside</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla ea quibusdam, illum, nam ratione facere!</p>
		</section>

		<ul>
			<li>
				<img src="res/money.png" alt="res/money.png">
				<h4>Megtakarítás</h4>
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Id, neque?</p>
			</li>
			<li>
				<img src="res/safety.png" alt="res/safety.png">
				<h4>Biztonság</h4>
				<p>Placeat vitae tempora non ipsa corrupti natus id accusantium molestiae.</p>
			</li>
			<li>
				 <img src="res/house.png" alt="res/house.png">
				<h4>Otthon</h4>
				<p>Velit perferendis ullam consequatur rerum numquam accusamus in. Minima, eaque!</p>
			</li>
		</ul>

	</aside>
	
	<footer>
		<ul>
			<li><strong>Első:</strong> lorem ipsum</li>
			<li><strong>Második:</strong> dolor sit amet</li>
			<li><strong>Harmadik:</strong> consectetur</li>
			<li><strong>Negyedik:</strong> adipiscing elit</li>
		</ul>
	</footer>
	
</body>
</html>
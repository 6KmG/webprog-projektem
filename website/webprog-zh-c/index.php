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
		<?php include 'src/navigation.php'; ?>
		<a href="" class="title">party</a>
	</header>
	
	<main>
	
		<h1>Party content</h1>

		<!-- <p><?php echo file_get_contents('src/content-home.txt'); ?></p>
		 -->
		<p>
			<?php
				$content = isset($_GET['content']) ? $_GET['content'] : 'home';
				$file = 'src/content-' . $content . '.txt';

				if (file_exists($file)) {
					echo file_get_contents($file);
				} else {
					echo file_get_contents('src/content-home.txt');
				}
			?>

		</p>
	
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse consectetur sint molestiae similique nihil, corporis eaque iure harum, eum, quos debitis pariatur quod dignissimos tempore!</p>
		
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero saepe sequi tempore tempora ex voluptatibus, beatae velit natus voluptate nobis, nesciunt a tenetur laborum enim fugit. Facilis similique molestias, exercitationem esse veritatis suscipit, vero nobis?</p>
		
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt labore reiciendis repudiandae rerum, quae. Suscipit nobis eveniet nostrum voluptates consectetur, nam ducimus, inventore, architecto animi libero vitae quaerat quas asperiores reiciendis rem, vero nulla vel delectus doloremque quidem doloribus. Reiciendis iste at ipsum ipsam facilis, dicta perspiciatis beatae provident distinctio.</p>
		
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
	
	</aside>
	
	<footer>
		<section>
			<h4>Információ</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione nesciunt voluptas totam minus earum consectetur, exercitationem nostrum atque nemo suscipit.</p>
		</section>

		<img src="res/www.png" alt="">

		<section>
			<h4>Partnereink</h4>
			<ul>
				<li><a href="https://www.youtube.com/" target="_blank">youtube</a></li>
				<li><a href="https://x.com/?lang=en" target="_blank">twitter es nem X</a></li>
				<li><a href="https://www.instagram.com/" target="_blank">insta</a></li>
				<li><a href="https://www.google.com/" target="_blank">gugli</a></li>
			</ul>
		</section>		
	</footer>
	
</body>
</html>
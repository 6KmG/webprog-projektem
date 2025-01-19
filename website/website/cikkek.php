<?php 
$bigHeader = false;
include 'inc/begin.php'; 

if(!isset($_GET['read']))
{
	echo '<h1>Legfrissebb hírek</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam blanditiis, reiciendis molestias voluptas accusamus, similique, cum fugit voluptatibus amet veritatis delectus dicta sed vero eligendi.</p>
		<ul class="articles">';

	$x = 1;
	$name = 'content/articles/article-'. $x .'.txt';
	while(is_file($name))
	{
		$file = fopen($name, 'r');
		$title = fgets($file);
		$intro = fgets($file);
		$cover = fgets($file);
		fclose($file);
		echo '<li>
				<img src="media/thumb/'. $cover .'">
				<div class="info">
					<h4>'. $title .'</h4>
					<p>'. $intro .'</p>
					<a href="cikkek.php?read='. $x .'" class="btn">Elolvasom</a>
				</div> 
			</li>';

		$x++;
		$name = 'content/articles/article-'. $x .'.txt';
	}

	echo '</ul>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minus sit dolorem ipsam deserunt temporibus quis in eum, ratione repudiandae, eveniet dolore dolor autem quia reiciendis. Rerum hic minus aut laboriosam eligendi nam, maiores deserunt corrupti.</p>';
}
else
{
	$x = $_GET['read'];
	$name = 'content/articles/article-'. $x .'.txt';
	if(is_file($name))
	{
		$file = fopen($name, 'r');
		$title = fgets($file);
		$intro = fgets($file);
		$cover = fgets($file);

		echo '<article>
				<h1>'. $title .'</h1>
				<p><strong>'. $intro .'</strong></p>
				<img src="media/'. $cover .'">';
		
		$line = fgets($file);
		while($line)
		{
			echo '<p>'. $line .'</p>';
			$line = fgets($file);
		}
		echo '</article>';
		fclose($file);
	}
	else
	{
		http_response_code(404);
		echo '<h1>Nincs találat</h1>
				<p>A kért cikk nem található</p>';
	}
}

include 'inc/end.php'; 
?>	
<?php 
$bigHeader = true;
include 'inc/begin.php'; 
	
$intro = file_get_contents('content/home-intro.txt');
$text = file_get_contents('content/home-text.txt');
echo '<article>
		<h1>Bemutatkozunk</h1>
		<p><strong>'. $intro .'</strong></p>
		<img src="content/home.jpg">
		<p>'. nl2br($text) .'</p>
	</article>';

$items = 
[
	'Mert mi vagyunk a világon a legjobbak',
	'Mert nálunk a Földön senki sem jobb',
	'Mert nálunk jobbat keresve sem találnál',
	'Mert különben agyon leszel verve, ha mást választasz',
	'Mert csak úgy!'
];

echo '<section><h3>Miért érdemes minket választani?</h3><ul>';
//for($i = 0; $i < count($items); $i++)
foreach($items as $item)
{
	//echo '<li>'. $items[$i] .'</li>';
	echo '<li>'. $item .'</li>';
}
echo '</ul></section>';

?>
<?php include 'inc/end.php'; ?>	
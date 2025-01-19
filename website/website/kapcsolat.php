<?php 
$bigHeader = true;
include 'inc/begin.php'; 
?>
			
<h1>Elérhetőségeink</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam blanditiis, reiciendis molestias voluptas accusamus, similique, cum fugit voluptatibus amet veritatis delectus dicta sed vero eligendi.</p>

<div class="contact">
	
	<section class="info">
		<h2>Company Kft.</h2>
		<p>1234 Város neve, Utca neve 1/A.<br>
			<span>E-mail:</span> company@mailbox.com <br>
			<span>Telefon:</span> +36 30 123 45 67 <br>
			<span>Ügyvezető:</span> Főnök Ferdinánd
			</p>
	</section>
	
	<section class="social">
		<h3>Közösségi média</h3>
		<ul>
			<li><a href="https://facebook.com" target="_blank">Facebook oldalunk</a></li>
			<li><a href="https://youtube.com" target="_blank">YouTube csatornánk</a></li>
			<li><a href="https://instagram.com" target="_blank">Instagram profilunk</a></li>
			<li><a href="https://twitter.com" target="_blank">Twitter fiókunk</a></li>
		</ul>
	</section>
	
</div>

<section>
	<h2>Vendégkönyv</h2>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste autem dolorum, ipsam fugiat blanditiis sed odit odio. <br><a href="#input" class="new">Én is hozzászólok</a></p>
	
<?php

echo '<ul class="customerbook">';

$ratings = ['', 'Borzalmas', 'Egynek oké', 'Rendben van', 'Tetszik', 'Kiváló'];
$file = file('content/customerbook.txt');
for($i = count($file) - 1; $i >= 0; $i--)
{
	$records = explode(';', trim($file[$i]));
	$r = $records[2];
	$public = $records[4];

	if($public)
	{
		echo '<li>
				<div class="top">
					<span class="name">'. $records[0] .'</span>
					<span class="rating">\''. $ratings[$r] .'\' értékelés</span>
				</div>
				<p class="content">'. $records[3] .'</p>
			</li>';
	}
}
echo '</ul>';

$name = '';
$email = '';
$rating = 5;
$message = '';
if(isset($_POST['name']))
{
	$name = $_POST['name'];
	$email = $_POST['email'];
	$rating = $_POST['rating'];
	$message = $_POST['message'];

	$error = false;
	if(empty($name))
	{
		$error = 'Név megadása kötelező!';
	}
	else
	if(empty($email))
	{
		$error = 'E-mail cím megadása kötelező!';
	}

	if(!$error)
	{
		$line = $name .';'. $email .';'. $rating .';'. $message .';0';

		$file = fopen('content/customerbook.txt', 'a');
		fwrite($file, $line . PHP_EOL);
		fclose($file);

		echo '<p class="message success"><strong>Adatok rögzítve</strong> A bejegyzésed sikeresen rögzítésre került.</p>';
		$name = $email = $message = '';
		$rating = 5;
	}
	else
	{
		echo '<p class="message error"><strong>Hibásan kitöltve</strong> '. $error .'</p>';
	}
}
?>
	<a name="input"></a>
	<form action="" method="post">
		
		<div>
			<label for="name">Mi a neved?</label>
			<input type="text" id="name" name="name" value="<?php echo $name ?>">
		</div>
		
		<div>
			<label for="email">E-mail címed</label>
			<input type="email" id="email" name="email" value="<?php echo $email ?>">
		</div>
		
		<div>
			<label for="rating">Milyen értékelést adsz?</label>
			<select id="rating" name="rating">
<?php
for($i = count($ratings) - 1; $i >= 1; $i--)
{
	echo '<option value="'. $i .'"';
	if($i == $rating)
	{
		echo ' selected';
	}
	echo '>'. $ratings[$i] .'</option>';
}

?>
			</select>
		</div>
		
		<div>
			<label for="message">Üzeneted szövege</label>
			<textarea id="message" name="message"><?php echo $message ?></textarea>
		</div>
		
		<button>Elküldöm</button>
		
	</form>
</section>

<?php include 'inc/end.php'; ?>	
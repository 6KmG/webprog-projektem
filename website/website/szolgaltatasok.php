<?php 
$bigHeader = false;
include 'inc/begin.php'; 
?>

<h1>Szolgáltatásaink</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam blanditiis, reiciendis molestias voluptas accusamus, similique, cum fugit voluptatibus amet veritatis delectus dicta sed vero eligendi.</p>

<table>
	<thead>
		<tr>
			<th class="secondary">Ssz.</th>
			<th class="name">Megnevezés</th>
			<th class="secondary">Leírás</th>
			<th>Egységár</th>
			<th> </th>
		</tr>
	</thead>
	<tbody>
<?php
$file = file('content/services.txt');
foreach($file as $i => $item)
{
	$service = explode(';', trim($item));
	$name = $service[0];
	$desc = $service[1];
	$price = $service[2];
	$price = number_format($price, 0, '', ' ');
	echo '<tr>
			<th class="secondary">'. ($i + 1) .'.</th>
			<td>'. $name .'</td>
			<td class="desc">'. $desc .'</td>
			<td class="price">'. $price .' HUF</td>
			<td><a href="">Részletek</a></td>
		</tr>';
}

?>
	</tbody>
</table>

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non rerum, debitis assumenda quam, nesciunt, aliquam in reiciendis ad quisquam voluptatum maxime! <a href="">Ez itt egy hivatkozás.</a> A alias necessitatibus, consequatur facere pariatur tempore iure minus accusantium sed modi repellat reprehenderit.</p>

<?php include 'inc/end.php'; ?>	
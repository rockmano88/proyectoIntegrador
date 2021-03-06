<?php
declare(strict_types=1);
require_once("conexionBD.php");
require_once("funciones.php");
$arrayDetalleProducto=null;
if (isset($_GET["id_producto"])) {
  $arrayDetalleProducto=traerDetalleProducto($db, $_GET["id_producto"]);
  // var_dump($arrayDetalleProducto);
}

 ?>

<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="css/styleHome.css">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,700,800&display=swap" rel="stylesheet">
  <title> Hassen Home - Online Store</title>
</head>
<body>
  <!-- NOTE: Inicia header -->
  <header>
    <?php require_once("header.php"); ?>
  </header>
  <!-- NOTE: fin header -->

  <div class="container mb-5">

    <div class="card my-5 p-3">
      <div class="row no-gutters">

        <div class="col-md-5 p-2 ml-2">
          <img src="img\imgProductos\<?= $arrayDetalleProducto['foto'] ?>" class="card-img mt-2" alt="presentacionProducto">
        </div>
        <div class="col-md-6 ml-3">
          <div class="card-body p-5 m-5">
            <h4 class="card-title"> <b> <i><?= "Nombre: " . $arrayDetalleProducto["nombre"] ?></i> </b> </h4>
            <p class="card-text"><?= "Categoría: " .  $arrayDetalleProducto["categoria"] ?></p>
            <p class="card-text"><?= "Marca: " . $arrayDetalleProducto["marca"] ?></p>
            <p class="card-text"><?= "Precio: $" . $arrayDetalleProducto["precio"] ?></p>
            <p class="card-text">Material: Fantasía</p>
            <p class="card-text">Efectivo/Mercado Pago</p>
            <a href="#" class="btn btn-dark">Add to my purchase</a>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- NOTE: inicia footer -->
  <footer id="footer" class="mt-5 p-4">
    <?php require_once("footer.php"); ?>
  </footer>
  <!-- NOTE: fin footer -->
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>

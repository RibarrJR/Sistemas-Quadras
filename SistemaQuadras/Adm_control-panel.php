<body>
	<?php
	
include("functions.php");
	
	session_start();
				$res=isLoggedIn();
				if($res){
include("Adm_header.php");
include("Adm_menu.php");
?>
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-4"> Bem-Vindo, <?php echo $_SESSION['user_name'];
			 ?>!</h1>
			<p class="lead">Você tem <a href="Adm_horarios.php"><button type="button" class="btn btn-success"> <span class="badge badge-light">4</span>
  
</button></a> notificações ! </p>
		</div>
	</div>


	<?php
	}
	else{
	
	header("location:index.php");	
	}
include ("rodape.php");	
	?>
</body>


</html>

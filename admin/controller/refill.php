<?php

  if( $user["access"]["orders"] != 1  ):
    header("Location:".site_url("admin"));
    exit();
  endif;

  $smmapi = new SMMApi();
  $fapi     = new socialsmedia_api();


$refills = $conn->prepare("SELECT * FROM refill_status  ORDER BY id DESC");
$refills->execute(array());
$refills = $refills->fetchAll(PDO::FETCH_ASSOC);


 require admin_view('refill');
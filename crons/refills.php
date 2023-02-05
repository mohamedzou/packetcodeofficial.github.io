<?php

require '../vendor/autoload.php';
require '../app/init.php';
$smmapi   = new SMMApi();
$fapi     = new socialsmedia_api();

$refills = $conn->prepare("SELECT * FROM refill INNER JOIN orders ON orders.order_id=refill.refill_order_id INNER JOIN clients ON clients.client_id=refill.refill_client_id INNER JOIN services ON services.service_id=refill.refill_service_id INNER JOIN service_api ON service_api.id=services.service_api WHERE refill.refill_mode=:mode && ( refill.refill_status=:statu1 || refill.refill_status=:statu2  || refill.refill_status=:statu3 ) ");
$refills->execute(array("mode"=>"auto","statu1"=>"pending","statu2"=>"inprogress","statu3"=>"processing"));
$refills = $refills->fetchAll(PDO::FETCH_ASSOC);

// print_r($refills); die;

  foreach( $refills as $refill ):
    $refillid = $refill["refill_id"];
    //print_r($refill);
    if( $refill["api_type"] == 1 ):
        $refillstatus= $smmapi->action(array('key' =>$refill["api_key"],'action' =>'refill_status','refill'=>$refill["refill_api_order_id"]),$refill["api_url"]);
        $statu      = str_replace(" ", "", strtolower($refillstatus->status));
    elseif( $refill["api_type"] == 3 ):
      $refillstatus= $fapi->query(array('cmd'=>'refillstatus','token' => $refill["api_key"],'apiurl'=>$refill["api_url"],'refillid'=>[$refill["refill_api_order_id"]]));
      $statu      = str_replace(" ", "", strtolower($refillstatus[$refill["refill_api_order_id"]]["refill"]["status"]));
    else:
    endif;

      if( $statu == "canceled" || $statu == "cancel" ):
        $conn->beginTransaction();
        $report = $conn->prepare("INSERT INTO client_report SET client_id=:id, action=:action, report_ip=:ip, report_date=:date ");
        $report = $report->execute(array("date"=>date("Y-m-d H:i:s"),"id"=>$refill["client_id"],"action"=>"refill_status".$refillid." refill has been cancelled ","ip"=>"127.0.0.1" ));
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"canceled" ));
          if( $update && $report ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;
      elseif( $statu == "reject" || $statu == "rejected" ):
        $conn->beginTransaction();
        $report = $conn->prepare("INSERT INTO client_report SET client_id=:id, action=:action, report_ip=:ip, report_date=:date ");
        $report = $report->execute(array("date"=>date("Y-m-d H:i:s"),"id"=>$refill["client_id"],"action"=>"refill_status".$refillid." refill has been cancelled ","ip"=>"127.0.0.1" ));
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"rejected" ));
          if( $update && $report ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;
      elseif( $statu == "fail" || $statu == "failed" ):
        $conn->beginTransaction();
        $report = $conn->prepare("INSERT INTO client_report SET client_id=:id, action=:action, report_ip=:ip, report_date=:date ");
        $report = $report->execute(array("date"=>date("Y-m-d H:i:s"),"id"=>$refill["client_id"],"action"=>"refill_status".$refillid." refill has been failed ","ip"=>"127.0.0.1" ));
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id && website_id=:web_id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"fail","web_id"=>WEBSITE_ID ));
          if( $update && $report ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;      
      elseif( $statu == 'complete' || $statu == 'completed' ):
        $conn->beginTransaction();
        $report = $conn->prepare("INSERT INTO client_report SET client_id=:id, action=:action, report_ip=:ip, report_date=:date ");
        $report = $report->execute(array("date"=>date("Y-m-d H:i:s"),"id"=>$refill["client_id"],"action"=>"refill_status".$refillid." refill has been completed ","ip"=>"127.0.0.1" ));
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"completed" ));
          if( $update && $report ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;
      elseif( $statu == 'pending' ):
        $conn->beginTransaction();
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"pending" ));
          if( $update && $report ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;      
      elseif( $statu == 'inprogress' ):
        $conn->beginTransaction();
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id && website_id=:web_id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"inprogress" ));
          if( $update ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;
      elseif( $statu == 'processing' ):
        $conn->beginTransaction();
        $update = $conn->prepare("UPDATE refill SET refill_status=:status WHERE refill_id=:id && website_id=:web_id ");
        $update = $update->execute(array("id"=>$refillid,"status"=>"processing" ));
          if( $update ):
            $conn->commit();
          else:
            $conn->rollBack();
          endif;
      endif;

     $update   = $conn->prepare("UPDATE refill SET last_updated=:check WHERE refill_id=:id && website_id=:web_id ");
     $update  -> execute(array("id"=>$refillid,"check"=>date("Y-m-d H:i:s") ));
  endforeach;
  
  $dosya = fopen('../count/son.txt', 'w');
fwrite($dosya, date("Y-m-d H:i:s"));
fclose($dosya);
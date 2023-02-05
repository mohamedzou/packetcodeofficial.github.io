<?php

$title .= $languageArray["orders.title"];

if( $_SESSION["msmbilisim_userlogin"] != 1  || $user["client_type"] == 1  ){
  Header("Location:".site_url('logout'));
}

$status_list  = ["all","pending","inprogress","completed","partial","processing","canceled"];
$search_statu = route(1); if( !route(1) ):  $route[1] = "all";  endif;

  if( !in_array($search_statu,$status_list) ):
    $route[1]         = "all";
  endif;

  if( route(2) ):
    $page         = route(2);
  else:
    $page         = 1;
  endif;
    if( route(1) != "all" ): $search  = "&& order_status='".route(1)."'"; else: $search = ""; endif;
    if( !empty(urldecode($_GET["search"])) ): $search.= " && ( order_url LIKE '%".urldecode($_GET["search"])."%' || order_id LIKE '%".urldecode($_GET["search"])."%' ) "; endif;
    if( !empty($_GET["subscription"]) ): $search.= " && ( subscriptions_id LIKE '%".$_GET["subscription"]."%'  ) "; endif;
    if( !empty($_GET["dripfeed"]) ): $search.= " && ( dripfeed_id LIKE '%".$_GET["dripfeed"]."%'  ) "; endif;
    
    
    
      if( !empty(urldecode($_POST["refill"])) ):
         
         $order_id = $_POST["order_id"];
        // header("Location:".site_url("admin/"));
        
        $order  = $conn->prepare("SELECT * FROM orders WHERE order_id=:id ");
        $order  = $conn->prepare("SELECT * FROM orders INNER JOIN services ON services.service_id = orders.service_id INNER JOIN service_api ON services.service_api = service_api.id WHERE orders.order_id=:id ");
        $order ->execute(array("id"=>$order_id));
        $order  = $order->fetch(PDO::FETCH_ASSOC);
        $order = json_decode(json_encode($order),true);
        
        
          $services  = $conn->prepare("SELECT * FROM services WHERE service_id=:id ");
        $services ->execute(array("id"=>$order[service_id]));
        $services  = $services->fetch(PDO::FETCH_ASSOC);
        $services = json_decode(json_encode($services),true);
        
        
        // print_r($services[service_name]);
        
        //   echo "<script>alert('Error : " . $services[service_name] . " . Try Again Later!' );</script>";
        
        
        // $order["api_orderid"] = "203872732";
        
       $smmapi   = new SMMApi();
       
       
        $get_refill    = $smmapi->action(array('key' =>$order["api_key"],'action' =>'refill','order'=>$order["api_orderid"]),$order["api_url"]);
        
        
        $get_refill = json_decode(json_encode($get_refill), true);    
            
        $refill_apiid = $get_refill[refill];
        $refill_apierror = $get_refill[error];
        
        
        if (empty($refill_apiid)){ //refill has not placed!
        
     
              echo "<script>alert('Error : " . $refill_apierror . " . Try Again Later!' );</script>";
            
   
      
             
             
            // Working code sql  
            // $insert = $conn->prepare("INSERT INTO refill_status SET client_id=:client_id , order_id=:order_id , order_apiid=:order_apiid ,refill_apiid=:refill_apiid , refill_status=:refill_status , creation_date=:creation_date ");
            //  $insert ->execute(array("client_id"=>"3" , "order_id"=>"3" , "order_apiid"=>"3" , "refill_apiid"=>"4" , "refill_status"=>"Completed" , "creation_date"=>date("Y-m-d H:i:s") ));
      
             
             
             
         
           
  
               
            
            
        } elseif (empty($refill_apierror)){ //refill has placed successfully
            
            
            //Refill message success//
            
            //Database ke andar hame refill id store same as which we are getting//
            
            // $order["client_id"] = (int)$order["client_id"];
            // $order["order_id"] = (int) $order["order_id"];
            // $order["api_orderid"] = (int)$order["api_orderid"];
            
          
    
        $update = $conn -> prepare("UPDATE orders SET show_refill=:show_refill WHERE order_id=:order_id");
        $update -> execute(array("order_id"=>$order["order_id"] , "show_refill"=>"0"));
         if(!$update):
             die;
        endif;
             
              $insert = $conn->prepare("INSERT INTO refill_status SET client_id=:client_id , order_id=:order_id , order_apiid=:order_apiid ,refill_apiid=:refill_apiid , refill_status=:refill_status , creation_date=:creation_date , order_url=:order_url , service_name=:service_name ");
             $insert ->execute(array("client_id"=>$order["client_id"] , "order_id"=>$order["order_id"] , "order_apiid"=>$order["api_orderid"] , "refill_apiid"=>$refill_apiid, "refill_status"=>"Pending" , "creation_date"=>date("Y-m-d H:i:s") , "order_url"=>$order[order_url] , "service_name"=>$services[service_name]));
      
         if(!$insert):
             die;
        endif;
        header("Location:".site_url("refill"));
            
        }
        
            
      
        
          
        
        
      
         endif;
    
    //refill//
    
    
    
    
    
    
    
    
    
    
    
    $c_id       = $user["client_id"];
    $to         = 25;
    $count      = $conn->query("SELECT * FROM orders WHERE client_id='$c_id' && dripfeed='1' && subscriptions_type='1' $search ")->rowCount();
    $pageCount  = ceil($count/$to);
      if( $page > $pageCount ): $page = 1; endif;
    $where      = ($page*$to)-$to;
    $paginationArr = ["count"=>$pageCount,"current"=>$page,"next"=>$page+1,"previous"=>$page-1];

    $orders = $conn->prepare("SELECT * FROM orders INNER JOIN services WHERE services.service_id = orders.service_id && orders.dripfeed=:dripfeed && orders.subscriptions_type=:subs && orders.client_id=:c_id $search ORDER BY orders.order_id DESC LIMIT $where,$to ");
    $orders-> execute(array("c_id"=>$user["client_id"],"dripfeed"=>1,"subs"=>1 ));
    $orders = $orders->fetchAll(PDO::FETCH_ASSOC);
    
   

  $ordersList = [];

    foreach ($orders as $order) {
        
        
        // $refill_status  = $conn->prepare("SELECT * FROM services WHERE service_id=:id ");
        // $refill_status ->execute(array("id"=>$order["order_id"]));
        // $refill_status  = $refill_status->fetch(PDO::FETCH_ASSOC);
        // $refill_status = json_decode(json_encode($refill_status),true);
        
        
        
        //  $o["refill_end_time"]  = $refill_status["creation_date"];
        
        
        
        
        
        
        
        
        
        
        $o["show_refill"]  = $order["show_refill"];
      $o["id"]    = $order["order_id"];
      $o["date"]  = date("Y-m-d H:i:s", (strtotime($order["order_create"])+$user["timezone"]));
      $o["link"]    = $order["order_url"];
      $o["charge"]  = $order["order_charge"];
      $o["start_count"]  = $order["order_start"];
      $o["quantity"]  = $order["order_quantity"];
      $o["service"]  = $order["service_name"];
       $o["refill"]  = $order["service_refill"];
      $o["status"]  = $languageArray["orders.status.".$order["order_status"]];
      if( $order["order_status"] == "completed" && substr($order["order_remains"], 0,1) == "-" ):
        $o["remains"]  = "+".substr($order["order_remains"], 1);
      else:
        $o["remains"]  = $order["order_remains"];
      endif;
      array_push($ordersList,$o);
     
    }

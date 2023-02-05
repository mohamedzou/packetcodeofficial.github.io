<?php
$title .= "Refill";
$smmapi   = new SMMApi();
if( $_SESSION["msmbilisim_userlogin"] != 1  || $user["client_type"] == 1  ){
Header("Location:".site_url('logout'));
}
$status_list  = ["all","pending","inprogress","completed","partial","processing","canceled" , "refill"];
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
$c_id       = $user["client_id"];
$to         = 25;
$count      = $conn->query("SELECT * FROM orders WHERE client_id='$c_id' && dripfeed='1' && subscriptions_type='1' $search ")->rowCount();
$pageCount  = ceil($count/$to);
if( $page > $pageCount ): $page = 1; endif;
$where      = ($page*$to)-$to;
$paginationArr = ["count"=>$pageCount,"current"=>$page,"next"=>$page+1,"previous"=>$page-1];
$orders = $conn->prepare("SELECT * FROM refill_status WHERE client_id=' $c_id' ORDER BY id DESC");
$orders-> execute(array());
$orders = $orders->fetchAll(PDO::FETCH_ASSOC);
$ordersList = [];
foreach ($orders as $order) {
$o["link"]    = $order["order_url"];
$o["id"]    = $order["order_id"];
$o["date"]  = date("Y-m-d H:i:s", (strtotime($order["creation_date"])));
$o["refill_id"]    = $order["refill_apiid"];
$o["status"]  = $order["refill_status"];
array_push($ordersList,$o);
}
<!DOCTYPE html>
<html lang="tr">
<head><meta charset="big5">

  <base href="<?=site_url()?>">
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?=$settings["site_name"]?></title>

 
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  
   <link rel="preconnect" href="https://fonts.gstatic.com">

  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@600&display=swap" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/public/admin/bootstrap.css">

  <link rel="stylesheet" type="text/css" href="/public/admin/style.css">
  <link rel="stylesheet" type="text/css" href="/public/admin/toastDemo.css">
  <link rel="stylesheet" type="text/css" href="/public/datepicker/css/bootstrap-datepicker3.min.css">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
  <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
  <link rel="stylesheet" type="text/css" href="public/admin/tinytoggle.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/f9fbee3ddf.js" crossorigin="anonymous"></script>


  <style>
    li {
      font-family: 'Poppins', sans-serif;
      font-weight: 500;
    }

    html,
    body {
      font-family: 'Poppins', sans-serif;


    }




    #loading {
      position: fixed;
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      opacity: 0.7;
      background-color: #fff;
      z-index: 99;
    }

    #loading-image {
      z-index: 100;
    }

    #buy-smm {
      margin: 8px 15px;
      font-size: 15px;
      font-weight: 400;
    }

    #buy-smm a {
      cursor: pointer;
    }
  </style>

</head>

<body>


  <nav class="navbar navbar-default navbar-static-top ">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-left-block">
        <?php if( $user["access"]["admin_access"]  && $_SESSION["msmbilisim_adminlogin"]  ): ?>
                <li class="<?php if( route(1) == "index" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin") ?>"><i class="fas fa-home"></i><span> Dashboard</span></a>
            <li class="<?php if( route(1) == "clients" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/clients") ?>"><i class="fa fa-users"></i>  Members</a></li>
			
			
                   <li class="<?php if( route(1) == "orders" ): echo 'active'; endif; ?>">
                                               
                                                                          <a href="<?php echo site_url("admin/orders") ?>"><i class="fa fa-cart-plus"></i>  Orders</a></li>
                             	<?php
			
			if(countRow(["table"=>"orders","where"=>["subscriptions_type"=>2]])>0){
			
			?>
			
			
			<li class="<?php if( route(1) == "subscriptions" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/subscriptions") ?>"><i class="	fa fa-refresh"></i> Subscriptions</a></li>
			
			<?php
				
			}else{
				
			}
			
			?>
                              <li><a class="ajax-link" href="<?php echo site_url("admin/refill") ?>"><i class="fas fa-history"></i><span> Refill Status</span></a>
                        </li>
			<?php
			
			if(countRow(["table"=>"orders","where"=>["dripfeed"=>2]])>0){
			
			?>
			
			<li class="<?php if( route(1) == "dripfeeds" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/dripfeeds") ?>"><i class="fa fa-clock-o"></i> Drip-feed</a></li>
			
			<?php
				
			}else{
				
			}
			
			?>   
    
			
		
            
            <li class="<?php if( route(1) == "services" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/services") ?>"><i class="fa fa-tasks"></i> Services</a></li>
            
                    <li class="" class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="	fa fa-shopping-basket"></i>  Financial Options <span class="badge" style="background-color: #92b844"><?=countRow(["table"=>"payments","where"=>["payment_method"=>4,"payment_status"=>1]]);?></span> <span class="caret"></span></a>
                                                                          <ul class="dropdown-menu dropdown-max-height">
                               <li class="<?php if( route(1) == "payments" && route(2) == "online" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/payments/online") ?>"><i class="fa fa-credit-card"></i> Online Payments</a></li>
                                 <li class="<?php if( route(1) == "payments" && route(2) == "bank" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/payments/bank") ?>"><i class="fa fa-bank"></i> Payment Notificaions <span class="badge" style="background-color: #f0ad4e"><?=countRow(["table"=>"payments","where"=>["payment_method"=>4,"payment_status"=>1]]);?></span></a></li>
                                          <li class="<?php if( route(1) == "kuponlar" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/kuponlar") ?>"><i class="	fa fa-gift"></i> Coupons</a></li>
                             <li class="<?php if( route(1) == "reports" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/reports") ?>"><i class="fa fa-bar-chart"></i> Satistics</a></li>       </ul>
            </li>
            
            <li class="<?php if( route(1) == "tickets" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/tickets") ?>"><i class="	fa fa-comments-o"></i> Support <span class="badge" style="background-color: #6d47bb"><?=countRow(["table"=>"tickets","where"=>["client_new"=>2]]);?></span> </a></li>

          <li class="<?php if( route(1) == "settings" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/settings") ?>"><i class="	fa fa-cog"></i> Settings</a></li>

           

            <li class="<?php if( route(1) == "logs" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/logs") ?>"><i class="	fa fa-history"></i> Logs</a></li>
            <li class="<?php if( route(1) == "proxy" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/proxy") ?>"><i class="fa fa-user-secret"></i> Proxy</a></li>
            <li class="<?php if( route(1) == "admin/child-panels" ): echo 'active'; endif; ?>"><a href="<?php echo site_url("admin/child-panels") ?>"><i class="fa fa-tasks"></i> Child Panels</a></li>
                                                                                                                 

        

        
          <?php endif; ?>
		 
		  </ul>  <ul class="nav navbar-nav navbar-right">
<li><a href="#" data-toggle="modal" data-target="#bilgiAl"><i class="	fa fa-question-circle"></i> Updates</a>  </li>
                      <li><a href="/logout">Logout</a></li>
                  
                  </ul>
      </div> 
    
    </div>
  </nav>
  
<!-- Admin Panel Information Version 3.0 -->
  <div class="modal fade" style="font-family: 'Open Sans', sans-serif;" id="bilgiAl" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Admin Panel Information <span style=" font-size:10px; color:red; font-weight:700; font-family: 'Open Sans', sans-serif; "> Version 3.0</span></h4>
        </div>
        <div class="modal-body">

          <div class="well">
            <div class="pre">
              <h3 style="font-weight:700; font-family: 'Open Sans', sans-serif;">Changelogs : </h3>
              <div style="max-height:200px; overflow:auto;" class="card-body">
                <ul>
                  <li>Broadcast Notification System Added.</li>
                  <li>Email OTP Login Added.</li>
                  <li>Service Average Time Calculator Added.</li>
                  <li>New Notification System.</li>
                  <li>New Themes Added.</li>
                  <li>Child Panel Module Added.</li>
                  <li>New Information on Dashboard.</li>
                  <li>Payments Security System.</li>
                  <li>Improved Refill System.</li>




                </ul>
              </div>

            </div>
          </div>



          <div class="well">
            <h3 style="font-weight:700; font-family: 'Open Sans', sans-serif;">More Information : </h3>
           <div class="alert alert-danger"><h4>
                You are using the latest update of the system, now everything is smooth and stable.<br>If you are getting an error server,hosting eror .it is caused by you or your hosting. 
          </div>
         
            <div class="well">
 <h3 style="font-weight:700; font-family: 'Open Sans', sans-serif;">Cron Jobs</h3>
<code>wget --spider -O -  <?=site_url()?>crons/childpanels.php >/dev/null 2>&1</code> - ChildPanels - 1 Min<br>
<code>wget --spider -O - <?=site_url()?>crons/checkToAPI.php >/dev/null 2>&1</code> - API Orders - 1 Min<br>
<code>wget --spider -O - <?=site_url()?>crons/dripfeed.php >/dev/null 2>&1</code> - Drip Feed - 1 Min<br>
<code>wget --spider -O - <?=site_url()?>crons/orders.php >/dev/null 2>&1</code> - Order Status - 1 Min<br>
<code>wget --spider -O - <?=site_url()?>crons/providers.php >/dev/null 2>&1</code> - Provider Information - 1 Min<br>
</div>
          </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
        </div>
      </div>
    </div>
  </div>      
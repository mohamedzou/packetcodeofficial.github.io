<?php include 'header.php'; ?>

<div class="container-fluid">
   <div class="row">
      <div class="col-lg-3 col-md-6">
         <div class="panel panel-green">
            <div class="panel-heading">
               <div class="row">
                  <div class="col-xs-3">
                    <img src="https://i.ibb.co/YQMWQdx/users.png" style="width:70px;" alt="users">
                  </div>
                  <div class="col-xs-9 text-right">
                     <div class="huge"><?php echo countRow(["table"=>"clients"]) ?></div>
                     <div>Registered Users</div>
                  </div>
               </div>
            </div>
            <a href="<?php echo site_url("admin/") ?>clients">
               <div class="panel-footer">
                  <span class="pull-left">See in Detail</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
               </div>
            </a>
         </div>
      </div>
            <div class="col-lg-3 col-md-6">
         <div class="panel panel-green">
            <div class="panel-heading">
               <div class="row">
                  <div class="col-xs-3">
                     <img src="https://i.ibb.co/TvBDTT0/order.png" style="width:70px;" alt="orders">
                  </div>
                  <div class="col-xs-9 text-right">
                     <div class="huge"><?php echo countRow(["table"=>"orders"]) ?></div>
                     <div>Total Orders</div>
                  </div>
               </div>
            </div>
            <a href="<?php echo site_url("admin/") ?>orders">
               <div class="panel-footer">
                  <span class="pull-left">See in Detail</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
               </div>
            </a>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="panel panel-green">
            <div class="panel-heading">
               <div class="row">
                  <div class="col-xs-3">
                     <img src="https://i.ibb.co/vZ9r5sz/failed-orders.png" style="width:70px;" alt="failed">
                  </div>
                  <div class="col-xs-9 text-right">
                     <div class="huge"><?php echo $failCount ?></div>
                     <div>Orders Failed</div>
                  </div>
               </div>
            </div>
            <a href="<?php echo site_url("admin/") ?>orders/1/fail">
               <div class="panel-footer">
                  <span class="pull-left">See in Detail</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
               </div>
            </a>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="panel panel-yellow">
            <div class="panel-heading">
               <div class="row">
                  <div class="col-xs-3">
                     <img src="https://i.ibb.co/gMH73Bd/payments.png" style="width:70px;" alt="payments">
                  </div>
                  <div class="col-xs-9 text-right">
                     <div class="huge"><?php echo countRow(["table"=>"payments","where"=>["payment_method"=>4,"payment_status"=>1] ]) ?></div>
                     <div>Pending Payment Notifications</div>
                  </div>
               </div>
            </div>
            <a href="<?php echo site_url("admin/") ?>payments/bank">
               <div class="panel-footer">
                  <span class="pull-left">See in Detail</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
               </div>
            </a>
         </div>
      </div>
      <div class="col-lg-3 col-md-6">
         <div class="panel panel-red">
            <div class="panel-heading">
               <div class="row">
                  <div class="col-xs-3">
                     <img src="https://i.ibb.co/TYXttRf/tickets.png" style="width:70px;" alt="tickets">
                  </div>
                  <div class="col-xs-9 text-right">
                     <div class="huge"><?php echo countRow(["table"=>"tickets","where"=>["client_new"=>2]]); ?></div>
                     <div>Pending Support Requests</div>
                  </div>
               </div>
            </div>
            <a href="<?php echo site_url("admin/") ?>tickets?search=unread">
               <div class="panel-footer">
                  <span class="pull-left">See in Detail</span>
                  <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                  <div class="clearfix"></div>
               </div>
            </a>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-heading">
              Provider Logs
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
               <div class="table-responsive">
                  <table class="table table-striped">
                     <thead>
                        <tr>
                          <th class="checkAll-th">
                             <div class="checkAll-holder">
                                <input type="checkbox" id="checkAll">
                                <input type="hidden" id="checkAllText" value="order">
                             </div>
                             <div class="action-block">
                                <ul class="action-list" style="margin:5px 0 0 0!important">
                                   <li><span class="countOrders"></span> Selected logs</li>
                                   <li>
                                      <div class="dropdown">
                                         <button type="button" class="btn btn-default btn-xs dropdown-toggle btn-xs-caret" data-toggle="dropdown"> Batch Operations <span class="caret"></span></button>
                                         <ul class="dropdown-menu">
                                            <li>
                                              <a class="bulkorder" data-type="delete">Delete</a>
                                            </li>
                                         </ul>
                                      </div>
                                   </li>
                                </ul>
                             </div>
                          </th>
                           <th>Event</th>
                           <th>History</th>
                           <th>Detail</th>
                           <th></th>
                        </tr>
                     </thead>
                     <form id="changebulkForm" action="<?php echo site_url("admin/index/multi-action") ?>" method="post">
                       <tbody>
                         <?php if( !$logs ): ?>
                           <tr>
                             <td colspan="4"><center>No logs found</center></td>
                           </tr>
                         <?php endif; ?>
                         <?php foreach($logs as $log): $extra = json_decode($log["servicealert_extra"],true); ?>
                          <tr>
                             <td><input type="checkbox" class="selectOrder" name="log[<?php echo $log["id"] ?>]" value="1" style="border:1px solid #fff"></td>
                             <td><?php echo $log["serviceapi_alert"] ?></td>
                             <td><?php echo date("H:i:s d.m.Y",strtotime($log["servicealert_date"]) ) ?></td>
                             <td><?php echo "Old Value: ".$extra["old"]." / New Value:".$extra["new"] ?></td>
                             <td> <a href="<?php echo site_url("admin/index/delete/".$log["id"]) ?>" style="font-size:30px">Delete</a> </td>
                          </tr>
                        <?php endforeach; ?>
                       </tbody>
                       <input type="hidden" name="bulkStatus" id="bulkStatus" value="0">
                     </form>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<div class="modal modal-center fade" id="confirmChange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
   <div class="modal-dialog modal-dialog-center" role="document">
      <div class="modal-content">
         <div class="modal-body text-center">
            <h4>Are you sure you want to Delete?</h4>
            <div align="center">
               <a class="btn btn-primary" href="" id="confirmYes">Yes</a>
               <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
         </div>
      </div>
   </div>
</div>

<?php include 'footer.php'; ?>

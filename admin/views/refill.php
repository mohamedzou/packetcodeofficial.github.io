<?php include 'header.php'; ?>
<div class="container-fluid">
   <ul class="nav nav-tabs">
      <li class="pull-right custom-search">
         <form class="form-inline" action="<?=site_url("admin/orders")?>" method="get">
            <div class="input-group">
               <input type="text" name="search" class="form-control" value="<?=$search_word?>" placeholder="Search">
               <span class="input-group-btn search-select-wrap">
                  <select class="form-control search-select" name="search_type">
                     <option value="order_id" <?php if( $search_where == "order_id" ): echo 'selected'; endif; ?> >Order ID</option>
                  </select>
                  <button type="submit" class="btn btn-default"><span class="fa fa-search" aria-hidden="true"></span></button>
               </span>
            </div>
         </form>
      </li>
   </ul>
   <table class="table">
   <thead>
      <tr>
         <td>Date</td>
         <td>Order ID</td>
         <td>Username</td>
         <td>Link</td>
         <td>Service Name</td>
         <td>Refill ID</td>
         <td>Provider</td>
         <td>Details</td>
      </tr>
   </thead>
   <tbody>
      <?php foreach( $refills as $refill ): ?>
      <tr>
         <td><?php echo $refill["creation_date"]; ?></td>
         <td><?php echo $refill["order_id"]; ?></td>
         <td><?php echo $refill["client_id"]; ?></td>
         <td><?php echo $refill["order_url"]; ?></td>
         <td><?php echo $refill["service_name"]; ?></td>
         <td><?php echo $refill["refill_id"]; ?></td>
         <td><?php echo $refill["order_id"]; ?></td>
         <td><?php echo $refill["order_id"]; ?></td>
      </tr>
      <?php endforeach ?>
   </tbody>
</div>
<?php include 'footer.php'; ?>
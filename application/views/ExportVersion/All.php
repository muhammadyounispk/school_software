<div class="box box-primary" id="exphead" style="width: 1000px">
    <div class="box-header with-border">
        <h3 class="box-title">Software Version Details</h3>
    </div><!-- /.box-header -->
    <div class="box-body">
        <div class="download_label"></div>
        <div class="table-responsive mailbox-messages">
            <table class="table table-striped table-bordered table-hover example" >
                <thead>
                <tr>
                    <th width="2%"> Sr</th>
                    <th width="5%">Version</th>
                    <th width="15%">Change Name</th>
                    <th > Change Details</th>

                </tr>
                </thead>
                <tbody>
                <?php
                if($versions){
                     foreach ($versions as $K => $version){
                    ?>
                             <tr>
                            <td><?= $K+1;?> </td>
                            <td><?=$version['version'];?> </td>
                            <td><?=$version['name'];?> </td>
                            <td><?=$version['detail'];?> </td>
                           </tr>
                <?php
                     }
                     }

                     ?>


                </tbody>
            </table><!-- /.table -->
        </div><!-- /.mail-box-messages -->
    </div><!-- /.box-body -->
</div>
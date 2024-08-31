
    <div class="box box-primary" id="exphead" >

    <div class="box-header with-border">
        <h3 class="box-title"><?=$new_version['name'];?></h3><br>
        <b>New Version:  <?=$new_version['version'];?></b>

    </div><!-- /.box-header -->
    <div class="box-body">
        <div class="download_label"></div>


            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <h2>
                        <img style="height: 79px;float: left;margin-left: 10px;" src="<?=base_url()."uploads/digis/version.png";?>">
                        Whats New</h2>

                </div>
                <div class="col-lg-10 col-md-10">
                    <div style="
    padding-bottom: 31%;
    overflow: scroll;
    max-height: 300px;
    margin-bottom: 10px;
    background-color: #eae9eb;
">
                        <?=$new_version['detail'];?>
                    </div>


                    <a href="<?=base_url().'admin/ExportVersion/Install';?>" class="btn btn-primary pull-right">Install Version</a>
                </div>
            </div>



    </div><!-- /.box-body -->
</div>
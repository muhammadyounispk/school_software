
<div class="content-wrapper" style="min-height: 946px;">  
    <section class="content-header">
        <h1>
            <i class="fa fa-warning"></i> <?php echo $this->lang->line('access_denied'); ?></h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">

                    <div class="box-body">
                        <div class="alert alert-warning">Student Limit Exceeded , You Do not Allowed to enroll students more than <?=$this->total_allowd;?></div>

                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</div>
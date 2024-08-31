<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-gears"></i>
            <?php echo $this->lang->line('system_settings'); ?><small>
                <?php echo $this->lang->line('setting1'); ?>
            </small>

            <small class="pull-right">
                <a type="button" onclick="sms_test()" class="btn btn-primary btn-sm">SMS Test--r</a>
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="nav-tabs-custom theme-shadow">
                    <div class="box-header with-border">
                        <h3 class="box-title titlefix"></i>
                            <?php echo $this->lang->line('sms_setting');
                            $r=0; ?>
                        </h3>
                    </div>
                
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1">
                            <form role="form" id="whatsapp_form" action="smsconfig/add_whatsapp_account" class="form-horizontal" method="post">

                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-12 minheight170">
                                            <?php if ($this->session->flashdata('msg')) { ?>
                                                <?php echo $this->session->flashdata('msg') ?>
                                            <?php } ?>
                                            <div class="col-md-4">

                                                <?php

                                                ?>

                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">
                                                        <?php echo $this->lang->line('device_name'); ?><small class="req"> *</small>
                                                    </label>
                                                    <div class="col-sm-7">
                                                        <input type="text" class="form-control" name="device_name" value="">
                                                        <span class="text text-danger device_name_error"></span>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label">
                                                        <?php echo $this->lang->line('delay'); ?><small class="req">
                                                            *</small>
                                                    </label>
                                                    <div class="col-sm-7">
                                                        <select class="form-control" name="delay">
                                                            <option value="">
                                                                <?php echo $this->lang->line('select'); ?>
                                                            </option>
                                                            <?php echo displayDropDown($ini_whatsapp_delay, "1"); ?>
                                                        </select>
                                                        <span class=" text text-danger delay_error"></span>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-5 control-label"></label>
                                                    <div class="col-sm-7 text-center">
                                                        <button class="btn btn-primary">Add Whatsapp Device</button>

                                                    </div>
                                                </div>
                                             


                                            </div>
                            </form>
                            <div class="col-md-8 ">
                                <!-- general form elements -->


                                <div class="box-body">
                                    <center>
                                        <table class="" width="80%">
                                            <thead>
                                                <tr>
                                                    <th width="5%">Sr# </th>
                                                    <th width="5%">DID</th>
                                                    <th width="20%">Device Name</th>
                                                    <th width="20%">Delay</th>
                                                    <th width="15%">Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php if ($whatsapp_devices) {

                                                    foreach ($whatsapp_devices as $key => $device) {
                                                        @$sr++;
                                                ?>

                                                        <tr>
                                                            <td><?= $sr; ?></td>
                                                            <td><?= $device->id; ?></td>
                                                            <td><?= $device->device_name; ?></td>
                                                            <td><?= array_column($ini_whatsapp_delay, "name", "id")[$device->delay]; ?></td>
                                                            <td><?= isActive($device->is_active); ?></td>
                                                            <td class="mailbox-date pull-right" style="padding: 5px;">
                                                                <?php if ($device->is_active == 0) {
                                                                ?>
                                                                    <a onclick="scanQR('<?= str_encode($device->id); ?>')" data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-sm">
                                                                        <i class="fa fa-qrcode" aria-hidden="true"></i> Scan QR
                                                                    </a>
                                                                <?
                                                                } else { ?>
                                                                    <a onclick="return confirm('Sure to Disconnected?')" href="Whatsapp/Disconnected?device_id=<?= str_encode($device->id); ?>" class="btn btn-primary btn-sm"> Disconnect</a>

                                                                <?php } ?>

                                                                <a onclick="return confirm('Sure to delete?')" href="Whatsapp/DeleteDevice?device_id=<?= str_encode($device->id); ?>" class="btn btn-primary btn-sm">Delete</a>



                                                            </td>
                                                        </tr>
                                                    <?php } ?>
                                                <?php } ?>


                                            </tbody>
                                        </table><!-- /.table -->
                                    </center>
                                </div><!-- /.box-body -->






                            </div>
                        </div>
                    </div>

                </div>



                </form>

            </div>
            </ <!-- /.tab-pane -->
          

            <div id="myModal" class="modal fade in" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog2">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">×</button>
                            <h4 class="modal-title">Scan QR Code</h4>
                        </div>
                        <div class="modal-body pt0 pb0">


                        </div><!--./row-->
                        <div class="box-footer">
                            <div class="text-center">

                                <div id="scan_whatsapp"></div>
                                <div id="scan_id"></div>

                            </div>
                        </div>
                        </form>
                    </div>
                </div><!--./col-md-12-->

            </div><!--./row-->

        </div>
</div>
</div>
</div>
</div>
<?php

function check_in_array($find, $array)
{

    foreach ($array as $element) {
        if ($find == $element->type) {
            return $element;
        }
    }
    $object = new stdClass();
    $object->id = "";
    $object->type = "";
    $object->api_id = "";
    $object->username = "";
    $object->url = "";
    $object->name = "";
    $object->contact = "";
    $object->password = "";
    $object->authkey = "";
    $object->senderid = "";
    $object->is_active = "";
    return $object;
}
?>


<script type="text/javascript">
    $(document).ready(function() {

        $("#default_sim").change(function (e) {
            $.ajax({
            type: "POST",
            url: 'smsconfig/setDefaultSim',
            data: {
                default_sim: $(this).val()
            }, // serializes the form's elements.
            success: function(data, textStatus, jqXHR) {
                successMsg(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
              Loader(false);

                //if fails      
            }
        });
            
        });



    });

    function scanQR(device_id) {
        $("#scan_id").html("");
        $("#scan_whatsapp").html("Please Wait....");


        $.ajax({
            type: "POST",
            url: 'Whatsapp/ScanQR',
            data: {
                device_id: device_id
            }, // serializes the form's elements.
            success: function(data, textStatus, jqXHR) {

                $("#scan_whatsapp").html(data);

                setInterval(() => {
                    window.location='';
                }, 14000);

                setInterval(() => {
                    CheckScan(device_id);
                }, 3000);




            },
            error: function(jqXHR, textStatus, errorThrown) {
                $("#scan_whatsapp").html("Network error please try again..");

                //if fails      
            }
        });
    }

    function CheckScan(device_id) {


        $.ajax({
            type: "POST",
            dataType: 'json',
            url: 'Whatsapp/CheckScan',
            data: {
                device_id: device_id
            }, // serializes the form's elements.
            success: function(data, textStatus, jqXHR) {
                if (data.code == 200) {
                    $("#scan_id").html("Connected");
                    window.location = '';
                } else {
                    $("#scan_id").html(data.message);
                }

            },
            error: function(jqXHR, textStatus, errorThrown) {

                //  $("#scan_id").html("");   
            }
        });
    }

    function SMSQRScan() {


        $.ajax({
            type: "POST",
            dataType: 'json',
            url: 'Whatsapp/SMSQRCode',
            data: {
                device_id: "VGQ2dENFNnhXa1ZIdzZuSXkwK082dz09OjpjMTVmMTlkNjBkZWZlMjEz"
            }, // serializes the form's elements.
            success: function(data, textStatus, jqXHR) {
                if (data.code == 200) {
                    $("#smsQRCode").html("<img src='" + data.qr + "'>");
                    $(".smsgeway_user").html("<b>Email: </b> "+data.user.email+"<br><b>Password:</b> 123");
                    setInterval(() => {
                        CheckSMSQRScan() ;
                    }, 3000);
                }

            },
            error: function(jqXHR, textStatus, errorThrown) {

                //  $("#scan_id").html("");   
            }
        });
    }
    function CheckSMSQRScan() {


        $.ajax({
            type: "POST",
            dataType: 'json',
            url: 'Whatsapp/checkSMSDevice?current=<?php echo $r;?>',
            data: {
                device_id: "VGQ2dENFNnhXa1ZIdzZuSXkwK082dz09OjpjMTVmMTlkNjBkZWZlMjEz"
            }, // serializes the form's elements.
            success: function(data, textStatus, jqXHR) {
                if (data.code == 200) {
                    successMsg("SMS Device is Connected Successfully");
                    setTimeout(() => {
                        window.location='';
                    }, 2000);
                   
                }
                console.log(data.message);

            },
            error: function(jqXHR, textStatus, errorThrown) {
             Loader(false);
                //  $("#scan_id").html("");   
            }
        });
    }
</script>
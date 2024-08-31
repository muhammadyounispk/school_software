
<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-credit-card"></i> Export Version & Changes </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i> Export Version for Production</h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="row">
                                    <form role="form" action="<?php echo site_url('admin/ExportVersion/make') ?>" method="post" class="">
                                        <?php echo $this->customlib->getCSRF(); ?>
                                        <div class="col-sm-6 col-md-6">


                                            <div class="form-group">
                                                <label>Version<small class="req"> *</small>
                                                <input  type="text" value="<?php echo PUITCVersion()+0.1 ?>" readonly name="version"  class="form-control">
                                                    <span class="class_id_error text-danger"><?php echo form_error('version'); ?></span>
                                            </div>

                                            <div class="form-group">
                                                <label><?php echo $this->lang->line('from') . " " . $this->lang->line('date'); ?></label><small class="req"> *</small>
                                                <input   type="date" value="<?php echo set_value('from_date', ""); ?>" name="from_date"  class="form-control">
                                                <span class="class_id_error text-danger"><?php echo form_error('from_date'); ?></span>
                                            </div>




                                        </div>






                                </div>
                            </div>
                            <div class="col-md-9">
                                <?php if ($this->session->flashdata('msg')) { ?>
                                    <?php echo $this->session->flashdata('msg') ?>
                                <?php } ?>
                                <div class="form-group">
                                    <label>Change Name<small class="req"> *</small>
                                        <input  type="text"   name="version_name" style="width:600px" value="<?php echo set_value('version_name', ""); ?>"  class="form-control">
                                        <span class="class_id_error text-danger"><?php echo form_error('version_name'); ?></span>
                                </div>

                                <div class="form-group">
                                    <label>Change Details</label><small class="req"> *</small>
                                    <textarea id="editor1" class="form-control" name="description" rows="6"><?php echo set_value('description', ""); ?></textarea>
                                    <span class="class_id_error text-danger"><?php echo form_error('description'); ?></span>

                                </div>

                                <div class="form-group">
                                    <button type="submit" name="search" value="search_full" class="btn btn-primary btn-sm checkbox-toggle pull-right"><i class="fa fa-file-zip-o"></i> Export</button>

                                </div>




                            </div>

                        </div>

            </div>

        </div>   <!-- /.row -->
                </form>

    </section><!-- /.content -->
</div>
<script src="<?php echo base_url(); ?>backend/plugins/ckeditor/ckeditor.js"></script>
<script>

    $(document).ready(function () {
        var popup_target = 'media_images';


        CKEDITOR.replace('editor1',
            {
                allowedContent: true

            });
        $('#mediaModal').modal({
            backdrop: 'static',
            keyboard: false,
            show: false
        });


        $('.detail_popover').popover({
            placement: 'right',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });





        $(document).on('click', '.img_div_modal', function (event) {
            $('.img_div_modal div.fadeoverlay').removeClass('active');
            $(this).closest('.img_div_modal').find('.fadeoverlay').addClass('active');

        });

        $(document).on('click', '.add_media', function (event) {
            var content_html = $('div#media_div').find('.fadeoverlay.active').find('img').data('img');
            var is_image = $('div#media_div').find('.fadeoverlay.active').find('img').data('is_image');
            var content_name = $('div#media_div').find('.fadeoverlay.active').find('img').data('content_name');
            var content_type = $('div#media_div').find('.fadeoverlay.active').find('img').data('content_type');
            var vid_url = $('div#media_div').find('.fadeoverlay.active').find('img').data('vid_url');
            var content = "";

            if (popup_target === "media_images") {
                if (typeof content_html !== "undefined") {
                    if (is_image === 1) {
                        content = '<img src="' + content_html + '">';
                    } else if (content_type == "video") {

                        var youtubeID = YouTubeGetID(vid_url);


                        content = '<iframe id="video" width="420" height="315" src="//www.youtube.com/embed/' + youtubeID + '?rel=0" frameborder="0" allowfullscreen></iframe>';

                    } else {
                        content = '<a href="' + content_html + '">' + content_name + '</a>';

                    }
                    InsertHTML(content);
                    $('#mediaModal').modal('hide');
                }
            } else {
                if (is_image === 1) {


                    addImage(content_html);
                } else {
                    //error show
                }
                $('#mediaModal').modal('hide');
            }

        });

        function YouTubeGetID(url) {
            var ID = '';
            url = url.replace(/(>|<)/gi, '').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/);
            if (url[2] !== undefined) {
                ID = url[2].split(/[^0-9a-z_\-]/i);
                ID = ID[0];
            } else {
                ID = url;
            }
            return ID;
        }

        $(document).on("click", ".pagination li a", function (event) {
            event.preventDefault();
            var page = $(this).data("ci-pagination-page");
            load_country_data(page);
        });
    });
    function addImage(content_html) {
        $('.feature_image_url').attr('src', content_html);
        $('#image').val(content_html);
        $('#image_preview').css("display", "block");
    }


    $(document).on('click', '.delete_media', function () {
        $('.feature_image_url').attr('src', '');
        $('#image').val('');
        $('#image_preview').css("display", "none");
    });

    function InsertHTML(content_html) {
        console.log(content_html);
        // Get the editor instance that we want to interact with.
        var editor = CKEDITOR.instances.editor1;


        // Check the active editing mode.
        if (editor.mode == 'wysiwyg')
        {
            editor.insertHtml(content_html);
        } else
            alert('You must be in WYSIWYG mode!');
    }



</script>




<div class="content">

<div class="box box-primary">

                <div class="box-body">
                <form role="form" action="<?php echo site_url('FeeManagement') ?>/depostFee" method="post" class="validate" id="deposit_fee_form">

                <div class="row">
                    <div class="col-md-2">
                        <input type="date" name="date" value="<?=$date;?>">
                    </div>
                    <div class="col-md-8">
                        <textarea class="form-control" placeholder="e.g 233,3423,3241,3243" name="student_id"></textarea>

                    </div>
                    <div class="col-md-2">
                        <select name="type">
                            <option value="4">Absent</option>
                            <option value="3">Leave</option>

                        </select>
                        
                    <button>Mark Attendance</button>
                    </div>
                </div>
                </form>
                   

                        

                       

                </div>
            </div>
</div>


<script>
    $(document).ready(function() {
        $('#deposit_fee_form').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Create FormData object
                Loader(true, "Searhing Students ");
                $.ajax({
                    type: 'POST',
                    url: '<?= base_url() . 'CustomAttendance/comaAttendance'; ?>', // Get the form's action attribute
                    data: formData, // Send FormData object
                    contentType: false, // Prevent jQuery from setting content type
                    processData: false, // Prevent jQuery from processing data
                    success: function(response) {
                      
                        var data = JSON.parse(response);

                    if (data.code == 200) {
                        
                        successMsg(data.message);
                        $('#fancyboxmodel').modal('toggle').modal('hide');
                        LoadHomeNow();
       


                    } else {
                        errorMsg(data.message);
                    }
                       
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText); // Log any errors to the console
                        Loader(false, "Saving Information");
                    }
                });
            

        });


    });
    </script>
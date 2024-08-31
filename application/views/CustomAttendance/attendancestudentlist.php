<div class="content">

    <dive class="row">

        <div class="col-md-8 ">

        <div style="display: flex; overflow-x:scroll">
                        
                        <a  class="  " style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('CustomAttendance/absentList?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Absent List</a>
                        <a  style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('CustomAttendance/AttendanceRegister?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Attendance Register</a>
                        <a class="fancybox "  style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('CustomAttendance/SMSAbsents?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">SMS to Absentee</a>
                        <a class="fancybox "  style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('CustomAttendance/WhatsppAbsents?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Whatsapp to Absentee</a>
                        <a class=" " style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('CustomAttendance/AttendanceMarkMenual?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Print Menual Attendance Form</a>
                        <a class=" " style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('CustomAttendance/request_form_for_id?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Print Absent Student ID Request </a>
                        <a class=" fancybox" style="margin-right: 5px;color: white;text-align: center;background: #3F0E6E;padding-right: 20px" href="<?= base_url('FeeManagement/studentCard?auth_request=' . str_encode(json_encode($_REQUEST))); ?>">Print Student Cards </a>

                    
                        </div> 
        </div>
        

    </dive>


    <div class="row">
        <div class="col-lg-9 col-md-3">
            <div class="box box-primary">

                <div class="box-body" style="overflow-x: scroll;">
                   



                    <form id="search_fee_form2" method="post">

                        <input name="date" value="<?= $date; ?>" hidden>
                        <div class="row">
                        <div class="col-md-3 col-sm-12">
                            <div class="form-group">
                        <select class="form-control"  name="alert"" style="height: 29px;">
                           <option value="">No SMS/Whatsapp</option>
                       <option value=" 2">SMS to Absents</option>
                            <option value="3">Whatspp to Absents</option>
                            <option value="4">SMS/Whatspp to Absents</option>


                        </select>
                        </div>
                        </div>
                        <div class="col-md-3 col-sm-12">
                            <div class="form-group">

                        <select class="form-control" id="attendanceSelect" style="height: 29px;">
                            <option value="present">Mark all present</option>
                            <option value="absent">Mark all absent</option>
                            <option value="leave">Mark all leave</option>
                        </select>
                        </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                        <button style="margin-bottom: 10px;" class="btn btn-primary pull-right  btn-sm"><i class="fa fa-check"></i> Save Attendance</button>
                        <input style="float: right;height: 29px;margin-right: 12px;"  type="text" id="searchInput" placeholder="Search by student name">

                        </div>
                    </div>

                       


                       
                        <br>
                        <table id="studentTable" class="table table-striped table-bordered table-hover example" cellspacing="0" width="100%">
                            <thead>
                                <tr style="background-color: pink;">
                                    <th>Sr</th>
                                    <th><center>Action</center></th>
                                    <th>Name</th>
                                    <th>Father Name</th>
                                    <th>Phone</th>
                                    <th>Class</th>
                                  


                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $collected = 0;
                                $total = 0;
                                $balance = 0;
                                $pending = 0;
                                $count_paid = 0;
                                $count_unpaid = 0;
                                if ($students) {
                                    $sr = 1;
                                    $absent=0;
                                    $present=0;
                                    $leave=0;
                                    $total=0;
                                    foreach ($students as $key => $student) {
                                        $id = $student['student_id'];
                                        $fee_month = getFeeMonth();
                                        $fee_year = getFeeYear();
                                        $student_session_id=studentSessionID($id);
                                        $sql = "SELECT attendence_type_id FROM student_attendences where student_session_id=$student_session_id and date='" .$date . "' ";
                                        $attendence_type_id = db::getCell($sql);
                                        if($attendence_type_id==1){
                                            $present++;
                                        }
                                        if($attendence_type_id==4){
                                            $absent++;
                                        }
                                        if($attendence_type_id==3){
                                            $leave++;
                                        }
                                        $total++;
                                        
                                      
                                        $show = true;
                                       


                                        if ($show) {

                                ?>

                                            <tr>
                                                <td><?= $sr; ?></td>
                                                <td width="30%">
                                                    <input name="attendance[]" value="<?= $student['id']; ?>" hidden>
                                                   <div style="display: flex;justify-content: center;align-content: stretch;flex-wrap: nowrap;flex-direction: row-reverse;">
                                                   <label><input type="radio" name="attendanceMark[<?= $student['id']; ?>]" checked value="1"> Present</label>
                                                    <label><input <?=$attendence_type_id==4 ? 'checked':'';?> type="radio" name="attendanceMark[<?= $student['id']; ?>]" value="4"> Absent</label>
                                                    <label><input <?=$attendence_type_id==3 ? 'checked':'';?> type="radio" name="attendanceMark[<?= $student['id']; ?>]" value="3"> Leave</label>
                                                   </div>

                                                </td>
                                                <td><?= $student['firstname'] . " " . $student['lastname']; ?></td>
                                                <td><?= $student['father_name']; ?></td>
                                                <td><?= $student['guardian_phone']; ?></td>
                                                <td><?= $student['class']; ?> (<?= $student['section']; ?>)</td>

                                               


                                            </tr>
                                <?php }
                                        $sr++;
                                    }
                                }
                                ?>

                            </tbody>
                        </table>

                    </form>






                </div>
            </div>

        </div>
        <div class="col-lg-3 col-md-3">


            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-check-circle"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Present
                    <span class="info-box-number"><?=$present ?? 'N/A'; ?></span>
                </div>
            </div>

            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-remove"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Absent</span>
                    <span class="info-box-number"><?=$absent??'N/A'; ?> </span>
                </div>
            </div>
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-arrow-right"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Leave</span>
                    <span class="info-box-number"><?=$leave??'N/A'; ?> </span>

                </div>
            </div>
            
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-percent"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Attendance</span>
                    <span class="info-box-number"> <?= round($present / $total * 100, 2); ?>% </span>

                </div>
            </div>

           


        </div>


    </div>

</div>


<script>
    function MarkAttendance(student_id, type, date) {
        $.post("<?= base_url('CustomAttendance/markAttendance'); ?>", {
            student_id,
            type,
            date
        }, function(response) {

            var data = JSON.parse(response);

            if (data.code == 200) {
                successMsg(data.message);

            } else {
                errorMsg(data.message);
            }

        })
    }




    $(document).ready(function() {
        $('#search_fee_form2').submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Create FormData object
            Loader(true, "Searhing Students ");
            $.ajax({
                type: 'POST',
                url: '<?= base_url() . 'CustomAttendance/bulkAttendance'; ?>', // Get the form's action attribute
                data: formData, // Send FormData object
                contentType: false, // Prevent jQuery from setting content type
                processData: false, // Prevent jQuery from processing data
                success: function(response) {
                    var d = JSON.parse(response);
                    if (d.code == 200) {
                        successMsg(d.message);
                        LoadHomeNow();

                    } else if (d.code == 201) {
                        errorMsg(d.message);
                        LoadHomeNow();

                    } else if (d.code == 202) {
                        successMsg(d.message);
                        LoadHomeNow();
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

<script>
    function MarkAllStudents(status) {
        var radioButtons = document.querySelectorAll('input[type="radio"]');
        radioButtons.forEach(function(radioButton) {
            if (status === 'present') {
                radioButton.checked = radioButton.value === '1';
            } else if (status === 'absent') {
                radioButton.checked = radioButton.value === '4'; // Assuming value 4 represents Absent
            } else if (status === 'leave') {
                radioButton.checked = radioButton.value === '3'; // Assuming value 3 represents Leave
            }
        });
    }

    document.getElementById('attendanceSelect').addEventListener('change', function() {
        var selectedStatus = this.value;
        MarkAllStudents(selectedStatus);
    });

</script>

<script>
        document.getElementById('searchInput').addEventListener('keyup', function() {
            var searchText = this.value.toLowerCase();
            var rows = document.querySelectorAll('#studentTable tbody tr');

            rows.forEach(function(row) {
                var name = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                console.log(searchText);
                if (name.includes(searchText)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>
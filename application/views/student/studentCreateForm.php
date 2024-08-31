<?php
$Studentfee=array_column($student['fee_detail'],'accounts_id','accounts_id');





?>

<div style="margin-left: 10px;margin-right:10px">
<form class="validate" id="admission_form" enctype="multipart/form-data">
<div class="row">
<div class="col-md-12">



 <div class="row">
            <div class="col-md-2">
               
               <div class="form-group">
                  <label><?php echo $this->lang->line('name'); ?></label><small class="req"> *</small>
                  <input id="firstname" autofocus="" name="firstname" placeholder="" type="text" class="form-control validate[required]"  value="<?php echo $student['firstname']; ?>" />
                  <input hidden="" style="display: none;"   name="id" type="text" class="form-control"  value="<?php echo $student['id']; ?>"/>
            
               </div>
            </div>
            <div class="col-md-2">
               <div class="form-group">
                  <label><?php echo $this->lang->line('cnic_bform'); ?> <span class="req">*</span></label>
                  <input id="cnic" name="cnic" placeholder="" type="text" class="form-control validate[required] cnic"  value="<?php echo $student['cnic']; ?>" />
               </div>
            </div>
            <div class="col-md-2">
               <div class="form-group">
                  <label><?php echo $this->lang->line('date_of_birth'); ?></label><small class="req"> *</small>
                  <input id="dob" type="date" name="dob" placeholder="" type="text" class="form-control validate[required] "  value="<?php echo $student['dob']; ?>" />
               </div>
            </div>
           
            
            <div class="col-md-2">
               <div class="form-group">
                  <label for="exampleInputFile"> <?php echo $this->lang->line('gender'); ?></label><small class="req"> *</small>
                  <select class="form-control validate[required]" name="gender">
                     <option value=""><?php echo $this->lang->line('select'); ?></option>
                     <?php
                        foreach ($genderList as $key => $value) {
                            ?>
                     <option value="<?php echo $key; ?>" <?php
                        if ($student['gender'] == $key) {
                            echo "selected";
                        }
                        ?>><?php echo $value; ?></option>
                     <?php
                        }
                        ?>
                  </select>
               
               </div>
            </div>
            <div class="col-md-2">
               <div class="form-group">
                  <label for="exampleInputFile"><?php echo $this->lang->line('student') . " " . $this->lang->line('photo'); ?></label>
                  <div><input class="filestyle form-control <?php if(!$student['id']) {?>validate[required]<?php }?>" style="opacity: 1;" type='file' name='file' id="file" size='20' />
                  </div>
                
               </div>
            </div>
         </div>

         <div class="row">
   <div class="col-md-2">
      <div class="form-group">
         <label><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
         <select  id="class_id" name="class_id" class="form-control validate[required] school_class"  >
            <option value=""><?php echo $this->lang->line('select'); ?></option>
            <?php
               foreach ($classlist as $class) {
                   ?>
            <option value="<?php echo $class['id'] ?>"<?php
               if ($student['class_id'] == $class['id']) {
                   echo "selected=selected";
               }
               ?>><?php echo $class['class'] ?></option>
            <?php
               }
               ?>
         </select>
     
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group">
         <label><?php echo $this->lang->line('section'); ?></label><small class="req"> *</small>
         <select  id="section_id" name="section_id" class="form-control validate[required]" >
            <option value=""   ><?php echo $this->lang->line('select'); ?></option>
            <?php
               foreach ($section as $class) {
                   ?>
            <option value="<?php echo $class['section_id'] ?>"<?php
               if ($student['section_id'] == $class['section_id']) {
                   echo "selected=selected";
               }
               ?>><?php echo $class['section'] ?></option>
            <?php
               }
               ?>

         </select>
        
      </div>
   </div>
   <div class="col-md-2">
      <div class="form-group">
      <label><?php echo $this->lang->line('roll_no'); ?></label><small class="req"> *</small>
      <input id="roll_no" name="roll_no" placeholder="" type="text" class="form-control validate[required]"  value="<?php echo $student['roll_no'] ?>" />
        

      </div>
    </div>
   <div class="col-md-2">
      <div class="form-group">
      <label>Payable Fee</label><small class="req"> *</small>
      <input id="payable_fee" name="payable_fee" placeholder="" readonly type="text" class="form-control validate[required]"  value="<?php echo $student['fee']; ?>" />
        

      </div>
    </div>
   <div class="col-md-2">
      <div class="form-group">
      <label>Arrears  Fee</label><small class="req"> *</small>
      <input id="arrears" name="arrears" placeholder="" type="text" class="form-control validate[required]"  value="<?php echo $student['arrears'] ?? 0; ?>" />
        

      </div>
    </div>

         
         </div>
      </div>
   </div>
   <div class="row" >
    <div class="col-md-9 ">
      <div >
   <table  style="border-collapse: collapse; width:100%">
   <tr>
      <th>Sr</th>
      <th>Fee Head</th>


      <th style="text-align: right;">Status</th> 
   </tr>
   <?php
   $fees=getFeeAccounts();
   foreach ($fees as $key => $fee) {
   ?>
   <?php if(!($student && $fee['id']==4)) {?>
    <input name="fee[]" class="feeclass" value="<?=$fee['id'];?>" hidden>
   <tr>
      <td width='5%'><?=$key+1;?></td>
      <td ><input style="border: none;" name="feetitle[<?=$fee['id'];?>]" class="form-control" readonly value="<?=$fee['title'];?>" ></td>
 
      
      <td width='45%' style="text-align: right;">
      <input style="width: 44px;" id="amount<?=$fee['id'];?>" name="amount[<?=$fee['id'];?>]" class=" amount"  value="<?=$fee['amount'];?>" >
    
      <label><input id="active<?=$fee['id'];?>" type="checkbox" <?=$fee['id']==4  || in_array($fee['id'],$Studentfee)? 'checked':'';?>  <?=$fee['id']==3 ? 'checked':'';?>  name="ischecked[<?=$fee['id'];?>]"   > Activate</label>
      </td>
      
   </tr>
<?php } }?>
   </table>
   </div>
    </div>
    <div class="col-md-3 text-center" style="
    display: flex;
    align-content: space-between;
    flex-wrap: nowrap;
    align-items: stretch;
    justify-content: space-around;
">
    <div class="pricecircle">
  <span class="pricelable" id="fee_here">0</span>
</div>

  

    </div>
   </div>
   <?php if(!$student['id']) {?>
   <div class="row">
    <div class="col-md-3 ">
      <div class="form-group">
         <label>Pay from </label>
         <label><input name="payfrom" required type="radio" value="1">Parent Account</label>
         <label><input name="payfrom" type="radio" value="2">By hand </label>
         <label><input name="payfrom" type="radio" checked value="3">Pay later </label>
      </div>
       
    </div>
   </div>

   <?php }?>


   <div class="row">
    <div class="col-md-12 ">
        <button type="submit" class="btn proceed_admission btn-primary pull-right"><i class="fa fa-save"></i> Save</button>

    </div>
   </div>


</div>

</form>


<script>
  
    $(document).ready(function (e) {
        $(".cnic").inputmask('99999-9999999-9');
        LoadValidationEngine();
        calculateFee();

        $("table input").on('change keyup',function (e) {
         calculateFee();
        });

      

    });


    function calculateFee() {
      var  total_fee=0;
      $(".feeclass").each(function() {
      var feeid=$(this).val();
      var amount=$("#amount"+feeid).val();
    
      if ($("#active"+feeid).prop('checked')) {
     if(parseInt(amount)>0){
      total_fee=total_fee+parseInt(amount);
     }
       
     }
  
});
console.log(total_fee);
$("#fee_here").html(total_fee);
$("#payable_fee").val(total_fee);

    }





$(document).ready(function() {
    $('#admission_form').submit(function(e) {
        e.preventDefault(); // Prevent the default form submission
        var formData = new FormData(this); // Create FormData object
     
        if($(this).validationEngine('validate')){
         Loader(true,"Saving Information");
        $.ajax({
            type: 'POST',
            url: '<?=base_url().'Guardians/save_student';?>?guardian_id='+$("#guardian_id").val(), // Get the form's action attribute
            data: formData, // Send FormData object
            contentType: false, // Prevent jQuery from setting content type
            processData: false, // Prevent jQuery from processing data
            success: function(response) {
               var d=JSON.parse(response);
            
            if(d.status==200){
                successMsg(d.message);
                $('#admission_form')[0].reset();
                LoadHomeNow();
                $('#fancyboxmodel').modal('toggle').modal('hide');
             

            }else if(d.status==201){
                errorMsg(d.message);  
                

            }else if(d.status==202){
                successMsg(d.message);
            }
        
               
                Loader(false,"Saving Information");
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText); // Log any errors to the console
                Loader(false,"Saving Information");
            }
        });
      }else{
      errorMsg("Please fill form correctly");
   }

    });

  
});




</script>
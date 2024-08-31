<div class="content-wrapper">

<div class="row" ">
  
    <div class="col-md-8 col-sm-8 col-lg-8">
    <div class="box box-primary">
    <div class="box-body">
        <form id="search_guardian_form">
        <div class="input-group">
            <label><input name="case" type="radio" checked value="1">Existing Guardian </label>   
            <label style="margin-left: 5px;"><input name="case" type="radio" value="2">New Guardian </label>
        </div>
    <div class="input-group">

      <input type="text" style="height: 34px;" name="guardian_cnic" id="guardian_search" class="form-control " placeholder="Enter Guardian Name , CNIC , Mobile Number or Email">
   
      <span class="input-group-btn">
        <button class="btn btn-primary" id="search_guardian"  type="button"><i class="fa fa-search"></i> Search</button>
      </span>
    </div>
    </form>

 

    </div> 
     
    </div><!-- /input-group -->
   </div>
   <div class="col-md-4 col-sm-4 col-lg-4">
   <a class="btn btn-primary btn-sm" href="<?=base_url('student/create');?>"><i class="fa fa-arrow-right"></i> Admission form (old)</a>

   <a class="btn btn-primary btn-sm" href="<?=base_url('student/import');?>"><i class="fa fa-arrow-right"></i> Import Students</a>
   
   </div>


</div>

      

    <div id="result"></div>




<script  src="<?php echo base_url(); ?>backend/js/jquery.min.js?rand=<?=refresh_code()?>"></script>

<!--Auto COMPLETE -->
<link rel="stylesheet" href="<?php echo base_url(); ?>backend/autocomplete/ac.css?rand=<?=refresh_code()?>">
<script  src="<?php echo base_url(); ?>backend/autocomplete/ac.js?rand=<?=refresh_code()?>"></script>
<script>

$(function() {
        $("#guardian_search").autocomplete({
            serviceUrl: '<?=base_url();?>student/search_guardian',
            onSelect: function( suggestion ) {
                $(this).val(suggestion.data);
            }
        });
    });

    $("#search_guardian").click(function () {
        var guardian_id=$("#guardian_search").val();
       if(guardian_id){
        var formData = $("#search_guardian_form").serialize();
    // Send AJAX request
    Loader(true,"Loading Guardian Profile...");
    $.ajax({
      url: '<?=base_url();?>student/guardian_profile',
      type: 'POST',
      data: formData,
      success: function(response) {
        $("#result").html(response);
        LoadHomeNow();
        Loader(false);
      
      },
      error: function(xhr, status, error) {
        console.log("error");
        Loader(false,"");
      }
    });
       }else{
        errorMsg('Please Enter CNIC Number of Guardian ');
       }   
    });  
 $("input[name=case]").change(function () {
    if ($(this).val() == 1) {
        $("#guardian_search").attr("placeholder", "Enter Guardian Name, CNIC, Mobile Number or Email");
        $("#guardian_search").inputmask('remove');
    } else {
        $("#guardian_search").attr("placeholder", "Enter Guardian CNIC");
        $("#guardian_search").inputmask('99999-9999999-9');
        $('#guardian_search').autocomplete('destroy');



    }
 });  

    
</script>
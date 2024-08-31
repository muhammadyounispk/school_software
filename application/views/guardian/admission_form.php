<div class="row" style="margin-left: 10px; padding-top: 10px; margin-right: 10px;background-color:white">
 <form class="validate">
<div class="col-md-12">

    <form class="validate">
    <table style="width: 100%; border-collapse: collapse;">
    <tr>
        <td><label for="name">Student Name</label>: <input name="name"></td>
        <td><label for="name">Father Name</label>: <input name="father_name"></td>
        <td >
        <input class="filestyle form-control" type='file' name='file' id="file" size='20' />
        </td>
    </tr>
    </tbody>
  </table>
    </form>
    </div>



</form>

<script src="<?php echo base_url(); ?>backend/dist/js/dropify.min.js?v=<?=refresh_code()?>"></script>
<!--file dropify-->
<link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/dropify.min.css?v=<?=refresh_code()?>">
    
<script>
  
    $(document).ready(function (e) {
        LoadFunctionality();
        console.log("Done");
    })
</script>

<style>
    input[type="text"],
    input[type="email"],
    input[type="password"] {
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom: 1px solid black;
    }
    label{
        color: black;
    }
</style>
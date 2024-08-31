<table  class="table table-striped table-bordered table-hover example">
<thead>
    <tr>
        <th>Sr</th>
        <th>Account title</th>
        <th>Action</th>
    </tr>
</thead>
<tbody>
    <?php 

    $fees=getFeeAccounts();
    $sr=1;
    foreach ($fees as $key => $fee) {
       
    ?>
    
    <tr>
        <td><?=$sr;?></td>
        <td><?=$fee['title'];?></td>
        <td>
            <?php if($fee['school_id']){?>
            <button class="deleteFeeTitle" data-id="<?=$fee['id'];?>">Delete</button>
            <?php }?>
        </td>
    </tr>
    <?php
    $sr++;
}
    ?>
</tbody>


</table>



<script>
$(document).ready(function() {
    // When the delete button is clicked
    $(".deleteFeeTitle").on("click", function() {
        // Get the data ID of the clicked button
        var feeId = $(this).data("id");
        
        // Confirm the deletion
        if (confirm("Are you sure you want to delete this item?")) {
            // Perform AJAX request to delete the item
            $.ajax({
                url: "<?= base_url('FeeManagement/deleteFeeHead'); ?>", // URL to your delete script
                type: "POST",
                data: { id: feeId }, // Send the ID of the item to delete
                success: function(response) {
                    // Handle success response
                    loadFeeHead();
                    LoadHomeNow ();
                    // Optionally, you can reload the page or update the UI as needed
                },
                error: function(xhr, status, error) {
                    // Handle error response
                    console.error(xhr.responseText);
                    alert("An error occurred while deleting the item.");
                }
            });
        }
    });
});
</script>
<style>
    td {
        text-align: center;
    }
</style>

<button type="button" class="btn btn-primary btn-sm  exportPDF" data-title="Students-cards" data-header='false' data-pdfname="students-cards.pdf"><i class="fa fa-file-pdf-o"></i> Save as PDF</button>


<div class="pdf_content">


<style>
   
   td{
       text-align: center;
   }
</style>


<center>
   <table  width="100%" align="center">

   <?php
   if ($students) {
       $sr = 1;
       $total_students = count($students);
       foreach ($students as $key => $student) {
           $id = $student['student_id'];
           $fee = $student['fee'];
           if ($id > 0) {
               if ($sr % 3 == 1) {
                   echo "<tr>";
               }
               echo "<td><br><br>" . getStudentCardHTML($id, "Studnt Copy", $fm) . "<br><br></td>";
               if ($sr % 3 == 0 || $sr == $total_students) {
                   echo "</tr>";
               }
               $sr++;
           }
       }
   }
   ?>
</tbody>
</table> 

</div>
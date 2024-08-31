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
            if ($fee > 0) {
                if ($sr % 3 == 1) {
                    echo "<tr>";
                }
                echo "<td>" . getVoucherHTML($id, "Studnt Copy", $fm) . "</td>";
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
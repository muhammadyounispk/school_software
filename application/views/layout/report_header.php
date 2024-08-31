<center> <table width="100%"  border="0" style="font-size: 0.8rem;">
    <tr>
    <th><img style="height: 80px;width: auto;object-fit: fill;" src="<?=$logo;?>"> </th>
    <td  style="text-align: center"  >
        <center>
            <div style="text-align: center">
                <div style="font-size: 25px;text-align: center; "><center><?=$school->name;?></center></div>
                <div style="margin-top: -5px;margin-bottom: 5px;">
                    <b>Phone</b>: <?=$school->phone;?>  <b>Email</b>: <?=$school->email;?><br>
                    <b>Address</b>: <?=$school->address;?><br>
                    <b>Website</b>: <?=$school->host;?><br>
                    <span style="text-align: center;font-size: 15px;font-weight: bold;border-bottom:2px dotted black">
                    <?=$pdf_title;?></span>


                </div>
            </div>
        </center>
    </td>

    <td  style="text-align: right; margin-right: 5px;">
        <img height="100px" width="100px" src="<?=base_url();?>uploads/digis/qrcode.png"></td>
    </tr>


</table></center>
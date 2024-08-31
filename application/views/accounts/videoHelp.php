<?php $helps=db::getRecords("SELECT* from video_help where link='".$_GET['page']."' and is_activee=1 ");


?>

<div class="row">


    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
   <?php
   $i=1;
   foreach ($helps as $key => $help) {?>
  

            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading<?=$i;?>">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?=$i;?>" aria-expanded="true" aria-controls="collapseOne">
                            <?=$help['title'];?>
                        </a>
                    </h4>
                </div>
                <div id="collapse<?=$i;?>" class="panel-collapse collapse <?=$i==1? 'in': '';?>" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">

                  <center>
                    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/<?=$help['video'];?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                  </center>
                       


                    </div>
                </div>
            </div>


            <?php
        
        $i++;
        }?>



           

        </div>
    </div><!--- END COL -->
</div><!--- END ROW -->



<style>
    .template_faq {
        background: #edf3fe none repeat scroll 0 0;
    }

    .panel-group {
        background: #fff none repeat scroll 0 0;
        border-radius: 3px;
        box-shadow: 0 5px 30px 0 rgba(0, 0, 0, 0.04);
        margin-bottom: 0;
        padding: 30px;
    }

    #accordion .panel {
        border: medium none;
        border-radius: 0;
        box-shadow: none;
        margin: 0 0 15px 10px;
    }

    #accordion .panel-heading {
        border-radius: 30px;
        padding: 0;
    }

    #accordion .panel-title a {
        background: #3F0E6E none repeat scroll 0 0;
        border: 1px solid transparent;
        border-radius: 30px;
        color: #fff;
        display: block;
        font-size: 18px;
        font-weight: 600;
        padding: 12px 20px 12px 50px;
        position: relative;
        transition: all 0.3s ease 0s;
    }

    #accordion .panel-title a.collapsed {
        background: #fff none repeat scroll 0 0;
        border: 1px solid #ddd;
        color: #333;
    }

    #accordion .panel-title a::after,
    #accordion .panel-title a.collapsed::after {
        background: #ffb900 none repeat scroll 0 0;
        border: 1px solid transparent;
        border-radius: 50%;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.58);
        color: #fff;
        content: "";
        font-family: fontawesome;
        font-size: 25px;
        height: 55px;
        left: -20px;
        line-height: 55px;
        position: absolute;
        text-align: center;
        top: -5px;
        transition: all 0.3s ease 0s;
        width: 55px;
    }

    #accordion .panel-title a.collapsed::after {
        background: #fff none repeat scroll 0 0;
        border: 1px solid #ddd;
        box-shadow: none;
        color: #333;
        content: "";
    }

    #accordion .panel-body {
        background: transparent none repeat scroll 0 0;
        border-top: medium none;
        padding: 20px 25px 10px 9px;
        position: relative;
    }

    #accordion .panel-body p {
        border-left: 1px dashed #8c8c8c;
        padding-left: 25px;
    }
</style>
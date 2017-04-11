<div class="row">
   <div class="col-lg-4 col-xs-6">
       <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>
                    ${Math.round(school.arCampusSqMts) }
                </h3>
                <p>
                    Campus Area
                </p>
            </div>
            <div class="icon"><i class="fa fa-building"></i></div>
            <span class="small-box-footer">
               sq.Mtrs <i class="fa fa-arrows-h"></i>
            </span>
        </div>
    </div><!-- ./col -->
    
    <div class="col-lg-4 col-xs-6">
       <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>
                    ${Math.round(school.buildArSqMts) }
                </h3>
                <p>
                    Built up Area
                </p>
            </div>
            <div class="icon"><i class="fa fa-building-o"></i></div>
            <span class="small-box-footer">
               sq.Mtrs <i class="fa fa-arrows-h"></i>
            </span>
        </div>
    </div><!-- ./col -->
    
    <div class="col-lg-4 col-xs-6">
       <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>
                    ${Math.round(school.arPlGroundSqMts) }
                </h3>
                <p>
                    Playground Area
                </p>
            </div>
            <div class="icon"><i class="fa fa-futbol-o"></i></div>
            <span class="small-box-footer">
               sq.Mtrs <i class="fa fa-arrows-h"></i>
            </span>
        </div>
    </div><!-- ./col -->

    <div class="col-lg-4 col-xs-6">
       <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>
                    ${school.noClassroom}
                </h3>
                <p>
                    Classrooms 
                </p>
            </div>
            <div class="icon"><i class="fa fa-child"></i></div>
            <span  class="small-box-footer">
               ${school.schlCat} <i class="fa fa-child"></i>
            </span>
        </div>
    </div><!-- ./col -->
    
    <div class="col-lg-4 col-xs-6">
       <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>
                    ${school.urinalsBoys ? school.urinalsBoys : 0 }
                </h3>
                <p>
                    Boys Urinals 
                </p>
            </div>
            <div class="icon"><i class="fa fa-male"></i></div>
            <span  class="small-box-footer">
               Restroom for Boys <i class="fa fa-male"></i>
            </span>
        </div>
    </div><!-- ./col -->
    
    
    <div class="col-lg-4 col-xs-6">
       <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3>
                    ${school.urinalsGirls  ? school.urinalsGirls : 0 }
                </h3>
                <p>
                    Girls Urinals 
                </p>
            </div>
            <div class="icon"><i class="fa fa-female"></i></div>
            <span  class="small-box-footer">
               Restroom for Girls <i class="fa fa-female"></i>
            </span>
        </div>
    </div><!-- ./col -->
   </div>
   
   <script>

	$(document).ready(function(){
		  $('#Carousel').carousel({
		        interval:false,
		        pause: "false"
		    });

		});
	
   </script>

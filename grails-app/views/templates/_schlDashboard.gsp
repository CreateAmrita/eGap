
        
				<!-- Main content -->
                <section class="content">
                    <div class="row">
              
                        <div class="col-lg-4 col-xs-6">
                            <!-- small box -->
                             <div class="info-box bg-green">
					           <span class="info-box-icon"><i class="fa fa-clock-o"></i></span>
					           <div class="inner">
                                    <h3 style="font-size: 38px;font-weight: bold;margin-left: 3em;"> CBSE </h3>
                                    <p style="margin-left: 8em;">Principal Meeting Scheduled on 25-04-2017</p>
                                </div>
					           <!-- /.info-box-content -->
					         </div>
                            
                        </div><!-- ./col -->               
                        
                        <div class="col-lg-4 col-xs-6">
                            <!-- small box -->
                             <div class="info-box bg-aqua">
					           <span class="info-box-icon"><i class="fa fa-graduation-cap"></i></span>
					           <div class="inner">
                                    <h3 style="font-size: 38px;font-weight: bold;margin-left: 3em;">
                                        43<sup style="font-size: 20px">%</sup>
                                    </h3>
                                    <p style="margin-left: 8em;">Distiction for Board Exam</p>
                                </div>
					           <!-- /.info-box-content -->
					         </div>
                        </div><!-- ./col -->
                        
						<div class="col-lg-4 col-xs-6">
                            <!-- small box -->
                             <div class="info-box bg-yellow ">
					           <span class="info-box-icon"><i class="fa fa-users"></i></span>
					           <div class="inner">
                                    <h3 style="font-size: 38px;font-weight: bold;margin-left: 3em;">
                                        27
                                    </h3>
                                    <p style="margin-left: 8em;">IIT and NIT Selections</p>
                                </div>
					           <!-- /.info-box-content -->
					         </div>
                        </div><!-- ./col -->                        
                        
                    </div><!-- /.row -->
				
                    <!-- Main row -->
                    <div class="row">
                    
                    
                        <!-- Left col -->
                        <section id="sectionLeft" class="col-lg-6 connectedSortable">
                        	
                        	  <!-- Performance box -->
                            <div class="box" class="gs-resize-handle gs-resize-handle-both">
                                <div class="box-header">
								<!-- tools box -->
									<div class="pull-right box-tools">
										<button class="btn  btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
									</div><!-- /. tools -->
									<i class="fa fa-line-chart"></i>
									<h3 class="box-title">School Performance over the Years</h3>
								</div>
								<div class="box-body chart-responsive">
									<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
								</div>
                            </div>
                            <!-- /.box -->
                     
                        
                        	
                           
                                                                               
                            <g:each in="${widgets}" var="widget" status="i">
                            	<g:if test="${i % 2 == 0}">
                            		<g:render template="/widget/widgetContainer" model="['title':widget.title,'link':widget.link,'data':widget.data,'type':widget.type,'height':widget.height,'wid':widget.id]"/>
                            	</g:if>
                            </g:each>
                            
                        </section><!-- /.Left col -->
                        
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section id="sectionRight" class="col-lg-6 connectedSortable">
                            
          					 <!-- Calendar -->
                            <div class="box box-solid bg-green-gradient ">	
                                <div class="box-header">
                                    <i class="fa fa-calendar"></i>
                                    <h3 class="box-title">Academic Calendar</h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <!-- button with a dropdown -->
                                        <div class="btn-group">
                                            <button class="btn  btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                                            <ul class="dropdown-menu pull-right" role="menu">
                                                <li><a href="#">Add new event</a></li>
                                                <li><a href="#">Clear events</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">View calendar</a></li>
                                            </ul>
                                        </div>
                                        <button class="btn  btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button class="btn  btn-sm" data-widget="remove" style="margin-right: 5px;"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body no-padding">
                                    <!--The calendar -->
                                    <div id="calendar" style="width: 100%"></div>
                                </div><!-- /.box-body -->
                                
                            </div><!-- /.box -->
                            
                            <!-- quick email widget -->
                            <div class="box">
                                <div class="box-header">
                                    <i class="fa fa-envelope"></i>
                                    <h3 class="box-title">Quick Email</h3>
                                    <!-- tools box -->
                                    <div class="pull-right box-tools">
                                        <button class="btn  btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                                    </div><!-- /. tools -->
                                </div>
                                <div class="box-body">
                                    <form action="#" method="post">
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="emailto" placeholder="Email to:"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="subject" placeholder="Subject"/>
                                        </div>
                                        <div>
                                            <textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="box-footer clearfix">
                                    <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
                                </div>
                            </div>
                            
                            
                          
							<g:each in="${widgets}" var="widget" status="i">
                            	<g:if test="${i % 2 != 0}">
                            		<g:render template="/widget/widgetContainer" model="['title':widget.title,'link':widget.link,'data':widget.data,'type':widget.type,'height':widget.height,'wid':widget.id]"/>
                            	</g:if>
                            </g:each>

                        </section><!-- right col -->
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
            
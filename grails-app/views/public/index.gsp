<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title><g:if test="${session.pgTitle}">${session.pgTitle}</g:if><g:else>e-Governance</g:else></title>
		<link rel="icon" type="image/png" href="${resource(dir:'egov_img',file:'nationEmblem.png')}" style="max-width:50%; max-height:50%;">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        
        <link href="${resource(dir:'css/egov_css/',file:'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir:'css/egov_css/',file:'font-awesome.min.css')}" rel="stylesheet" type="text/css" />
       
       <!-- Theme style -->
        <link href="${resource(dir:'css/egov_css/',file:'AdminLTE.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Ionicons -->
        <link href="${resource(dir:'css/egov_css/',file:'ionicons.min.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Morris chart -->
        <link href="${resource(dir:'css/egov_css/morris/',file:'morris.css')}" rel="stylesheet" type="text/css" />
        
        <!-- jvectormap -->
		<link href="${resource(dir:'css/egov_css/jvectormap/',file:'jquery-jvectormap-1.2.2.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Date Picker -->
        <link href="${resource(dir:'css/egov_css/datepicker/',file:'datepicker3.css')}" rel="stylesheet" type="text/css" />
        
        <!-- Daterange picker -->
		<link href="${resource(dir:'css/egov_css/daterangepicker/',file:'daterangepicker-bs3.css')}" rel="stylesheet" type="text/css" />
        
        <!-- bootstrap wysihtml5 - text editor -->
		<link href="${resource(dir:'css/egov_css/bootstrap-wysihtml5/',file:'bootstrap3-wysihtml5.min.css')}" rel="stylesheet" type="text/css" />
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
             <img src="${resource(dir:'egov_img',file:'logo.png')}" alt="Logo" width="100%" border="0"> </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="javascript:" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 4 messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="javascript:">
                                                <div class="pull-left">
                                                	<img src="${resource(dir:'egov_img',file:'avatar3.png')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Support Team
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li><!-- end message -->
                                        <li>
                                            <a href="javascript:">
                                                <div class="pull-left">
													<img src="${resource(dir:'egov_img',file:'avatar2.png')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    AdminLTE Design Team
                                                    <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:">
                                                <div class="pull-left">
                                                    <img src="${resource(dir:'egov_img',file:'avatar.png')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Developers
                                                    <small><i class="fa fa-clock-o"></i> Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:">
                                                <div class="pull-left">
                                                    <img src="${resource(dir:'egov_img',file:'avatar2.png')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Sales Department
                                                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:">
                                                <div class="pull-left">
                                                    <img src="${resource(dir:'egov_img',file:'avatar.png')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Reviewers
                                                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="javascript:">See All Messages</a></li>
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <span class="label label-warning">10</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 10 notifications</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="javascript:">
                                                <i class="ion ion-ios7-people info"></i> 5 new members joined today
                                            </a>
                                        </li>
                                        <li><a href="javascript:"><i class="fa fa-warning danger"></i> Very long description here that may not fit into the page and may cause design problems
                                            </a>
                                        </li>
                                        <li><a href="javascript:"><i class="fa fa-users warning"></i> 5 new members joined
                                            </a>
                                        </li>

                                        <li>
                                            <a href="javascript:">
                                                <i class="ion ion-ios7-cart success"></i> 25 sales made
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:">
                                                <i class="ion ion-ios7-person danger"></i> You changed your username
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="javascript:">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu">
                            <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span class="label label-danger">9</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 9 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- Task item -->
                                            <a href="javascript:">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="javascript:">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="javascript:">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="javascript:">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="javascript:">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="javascript:" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>Jane Doe <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                               
                               <!-- <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p>
                                        Jane Doe - Web Developer
                                        <small>Member since Nov. 2012</small>
                                    </p>
                                </li>-->
                                <!-- Menu Body -->
                                <!--<li class="user-body">
                                    <div class="col-xs-4 text-center">
                                        <a href="javascript:">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="javascript:">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="javascript:">Friends</a>
                                    </div>
                                </li>-->
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="profile.html" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="messages.html" class="btn btn-default btn-flat">Messages</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="pages/examples/login-screen.html" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <!--<div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, Jane</p>

                            <a href="javascript:"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>-->
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="public.html">
                                <i class="fa fa-dashboard"></i> <span>Public Main</span>
                            </a>
                        </li>
                        <li>
                        	<li><g:link controller="login" action="index"><i class="fa fa-check"></i>Login</g:link></li>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Public Space
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="javascript:"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Public Space</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Main row -->
                    <div class="row">
                    	<div class="col-md-6">
                            <div class="box box-solid">
                                <div class="box-header">
                                	<i class="fa fa-image"></i>
                                    <h3 class="box-title">eGov in Pics</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <img src="${resource(dir:'egov_img',file:'first.jpg')}" alt="First slide" width="100%" border="0"> </a>
                                                <div class="carousel-caption">
                                                    Governing Schools from Medias
                                                </div>
                                            </div>
                                            <div class="item">
                                                 <img src="${resource(dir:'egov_img',file:'second.jpg')}" alt="Second slide" width="100%" border="0"> </a>
                                                <div class="carousel-caption">
                                                    eGovernance for CBSE Schools
                                                </div>
                                            </div>
                                            <div class="item">
                                                 <img src="${resource(dir:'egov_img',file:'third.jpg')}" alt="Third slide" width="100%" border="0"> </a>
                                                <div class="carousel-caption">
                                                    Jointly by Amrita Viswa Vidyapeetam and CDAC
                                                </div>
                                            </div>
                                        </div>
                                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                        </a>
                                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                        </a>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div><!-- /.col -->
                        <div class="col-md-6">
                            <div class="box box-solid">
                                <div class="box-header">
                                    <i class="fa fa-certificate"></i>
                                    <h3 class="box-title">About eGovernance</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <dl>
                                        <dt>Description lists</dt>
                                        <dd>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</dd>
                                        <br>
                                        <dd>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.</dd>
                                        <br>
                                        <dt>Malesuada porta</dt>
                                        <dd>Etiam porta sem malesuada magna mollis euismod.</dd>
                                    </dl>
                                </div><!-- /.box-body -->
                                <div class="box-body">
                                    <blockquote>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                        <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
                                    </blockquote>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div><!-- ./col -->
                    </div>
                    
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-6">                         
                            
                            <!-- quick email widget -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <i class="fa fa-map-marker"></i>
                                    <h3 class="box-title">CBSE Schools Location</h3>
                                </div>
                                <div class="box-body">
                                    <iframe width="100%" height="500" frameborder="0" scrolling="no" marginheight="0" src="http://maps.google.com/maps/ms?ie=UTF8&amp;hl=en&amp;oe=UTF8&amp;msa=0&amp;msid=204197229549255577803.0004470e213a246a8f72f&amp;ll=23.32208,81.71582&amp;spn=29.074524,27.421875&amp;z=4&amp;output=embed"></iframe>
                                </div>
                            </div>                          
                            

                        </section><!-- /.Left col -->
                        <!-- Left col -->
                        <section class="col-lg-6">                         
                            
                                <div class="box box-solid">
                                    <div class="box-header">
                                        <i class="fa fa-flag-o"></i>
                                        <h3 class="box-title">CBSE Events</h3>
                                    </div><!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="box-group" id="accordion">
                                            <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                            <div class="panel box box-primary">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel box box-danger">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel box box-success">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseThree" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                            <div class="panel box box-primary">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse4" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel box box-danger">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse5" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel box box-success">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse6" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                            <div class="panel box box-primary">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse7" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel box box-danger">
                                                <div class="box-header">
                                                    <h4 class="box-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">
                                                            Event Date - Event Name
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapse8" class="panel-collapse collapse">
                                                    <div class="box-body">
                                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->                       
                            

                        </section><!-- /.Left col -->
                    </div><!-- /.row (main row) -->

                </section><!-- /.content -->
                
                <div class="row">
                    <!-- right col (We are only adding the ID to make the widgets sortable)-->
                    <section class="col-lg-12">
                        <div class="col-xs-12">
                            <h3 class="box-title"></h3>
                            <div class="box-tools">
                                <div class="input-group col-xs-5">
                                    <div class="col-xs-4" style="height:38px; vertical-align:middle;">Search All Forums</div>
                                    <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 280px;" placeholder="Search"/>
                                    <div class="input-group-btn" style="vertical-align:middle;">
                                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                    </div>
                                    <div class="col-xs-12"> &nbsp; <strong>Online Users:</strong> 502 Users</div>
                                </div>
                            </div>
                            <div class="box">                                                                    
                                <div class="box-header">
                                	<i class="fa fa-newspaper-o"></i>
                                    <h3 class="box-title">Welcome to the Forum</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover table-striped">
                                        <tr>
                                            <th>Forum Category</th>
                                            <th>Views</th>
                                            <th>Threads/Messages</th>
                                            <th>Last Post</th>
                                        </tr>
                                        <tr>
                                            <td>News and Announcements</td>
                                            <td>9.8</td>
                                            <td>DP School, RK Puram, New Delhi</td>
                                            <td>9.8</td>
                                        </tr>
                                        <tr>
                                            <td>Forum Rules and Tips</td>
                                            <td>9.8</td>
                                            <td>DP School, RK Puram, New Delhi</td>
                                            <td>9.8</td>
                                        </tr>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                            <div class="box">                                                                    
                                <div class="box-header">
                                	<i class="fa fa-newspaper-o"></i>
                                    <h3 class="box-title">Product Issues</h3>
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-hover table-striped">
                                        <tr>
                                            <td>Resolved</td>
                                            <td>9.8</td>
                                            <td>DP School, RK Puram, New Delhi</td>
                                            <td>9.8</td>
                                        </tr>
                                        <tr>
                                            <td>New Product</td>
                                            <td>9.8</td>
                                            <td>DP School, RK Puram, New Delhi</td>
                                            <td>9.8</td>
                                        </tr>
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                        </div>
                        
                        <div class="col-xs-12">
                            <div class="box box-success">
                                <div class="box-header">
                                    <i class="fa fa-twitch"></i>
                                    <h3 class="box-title">Chat</h3>
                                    <div class="box-tools pull-right" data-toggle="tooltip" title="Status">
                                        <div class="btn-group" data-toggle="btn-toggle" >
                                            <button type="button" class="btn btn-default btn-sm active"><i class="fa fa-square text-green"></i></button>
                                            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-square text-red"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-body chat" id="chat-box">
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="${resource(dir:'egov_img',file:'avatar.png')}" alt="user image" width="100%" border="0" class="online">
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
                                                Mike Doe
                                            </a>
                                            I would like to meet you to discuss the latest news about
                                            the arrival of the new theme. They say it is going to be one the
                                            best themes on the market
                                        </p>
                                        <div class="attachment">
                                            <h4>Attachments:</h4>
                                            <p class="filename">
                                                Theme-thumbnail-image.jpg
                                            </p>
                                            <div class="pull-right">
                                                <button class="btn btn-primary btn-sm btn-flat">Open</button>
                                            </div>
                                        </div><!-- /.attachment -->
                                    </div><!-- /.item -->
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="${resource(dir:'egov_img',file:'avatar2.png')}" alt="user image" width="100%" border="0" class="online">
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:15</small>
                                                Jane Doe
                                            </a>
                                            I would like to meet you to discuss the latest news about
                                            the arrival of the new theme. They say it is going to be one the
                                            best themes on the market
                                        </p>
                                    </div><!-- /.item -->
                                    <!-- chat item -->
                                    <div class="item">
                                        <img src="${resource(dir:'egov_img',file:'avatar3.png')}" alt="user image" width="100%" border="0" class="online">
                                        <p class="message">
                                            <a href="#" class="name">
                                                <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
                                                Susan Doe
                                            </a>
                                            I would like to meet you to discuss the latest news about
                                            the arrival of the new theme. They say it is going to be one the
                                            best themes on the market
                                        </p>
                                    </div><!-- /.item -->
                                </div><!-- /.chat -->
                                <div class="box-footer">
                                    <div class="input-group">
                                        <input class="form-control" placeholder="Type message..."/>
                                        <div class="input-group-btn">
                                            <button class="btn btn-success"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section><!-- right col -->
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->
        
        <!--  Footer  -->
		<footer class="footer">
        	<img src="${resource(dir:'egov_img',file:'avvp.png')}" alt="AVVP"> <img src="${resource(dir:'egov_img',file:'cdac-logo.png')}" border="0" alt="CDAC">
        </footer>
        <!--  Footer  -->

        <script src="${createLinkTo(dir:'js/egov_js/jquery_2.1.3',file:'jquery.min.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/bootstrap',file:'bootstrap.min.js')}" type="text/javascript"></script>
	
		<script src="${createLinkTo(dir:'js/egov_js/jquery_ui_1.11.1',file:'jquery-ui.min.js')}" type="text/javascript"></script>
        
             
        <!-- High Charts -->
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'highcharts.js')}" type="text/javascript"></script>
        <script src="${createLinkTo(dir:'js/egov_js/highcharts',file:'exporting.js')}" type="text/javascript"></script>
        
        
        <!-- Morris.js charts -->
		<script src="${createLinkTo(dir:'js/egov_js/raphael_2.1.0',file:'raphael-min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/morris/',file:'morris.min.js')}" type="text/javascript"></script>
        
        
		<!-- Sparkline -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/sparkline/',file:'jquery.sparkline.min.js')}" type="text/javascript"></script>
        
        <!-- jvectormap -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/jvectormap/',file:'jquery-jvectormap-1.2.2.min.js')}" type="text/javascript"></script>
		<script src="${createLinkTo(dir:'js/egov_js/plugins/jvectormap/',file:'jquery-jvectormap-world-mill-en.js')}" type="text/javascript"></script>
       
        <!-- jQuery Knob Chart -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/jqueryKnob/',file:'jquery.knob.js')}" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js" type="text/javascript"></script>
		
		<!-- Google Maps V3 -->
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe45vAXLQqSFQLNeiQbCo9p7r_4lQbjQc&callback=initMap" type="text/javascript"></script>
        
        <!-- daterangepicker -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/daterangepicker/',file:'daterangepicker.js')}" type="text/javascript"></script>
		
        <!-- datepicker -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/datepicker/',file:'bootstrap-datepicker.js')}" type="text/javascript"></script>
        
        <!-- Bootstrap WYSIHTML5 -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/bootstrap-wysihtml5/',file:'bootstrap3-wysihtml5.all.min.js')}" type="text/javascript"></script>
       
        <!-- iCheck -->
		<script src="${createLinkTo(dir:'js/egov_js/plugins/iCheck/',file:'icheck.min.js')}" type="text/javascript"></script>

        <!-- AdminLTE App -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'app.js')}" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<script src="${createLinkTo(dir:'js/egov_js/AdminLTE',file:'dashboard.js')}" type="text/javascript"></script>


    </body>
</html>

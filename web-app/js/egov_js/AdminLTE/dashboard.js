/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/

$(function() {
    "use strict";

    //Make the dashboard widgets sortable Using jquery UI
    $(".connectedSortable").sortable({
        placeholder: "sort-highlight",
        connectWith: ".connectedSortable",
        handle: ".box-header, .nav-tabs",
        forcePlaceholderSize: true,
        zIndex: 999999
    }).disableSelection();
    $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");
    //jQuery UI sortable for the todo list
    $(".todo-list").sortable({
        placeholder: "sort-highlight",
        handle: ".handle",
        forcePlaceholderSize: true,
        zIndex: 999999
    }).disableSelection();
    ;

    //bootstrap WYSIHTML5 - text editor
    //$(".textarea").wysihtml5();

    $('.daterange').daterangepicker(
            {
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                },
                startDate: moment().subtract('days', 29),
                endDate: moment()
            },
    function(start, end) {
        alert("You chose: " + start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
    });

    /* jQueryKnob */
    $(".knob").knob();

    /*
    
    //jvectormap data
    var visitorsData = {
        "IN": 800 //India
    };
	
	var gdpData = {
    
	  	"IN-AN": 26,

		"IN-BR": 36,
		
		"IN-MZ": 46,
		
		"IN-DD": 56,
		
		"IN-DN": 66,
		
		"IN-DL": 76,
		
		"IN-NL": 11,
		
		"IN-WB": 12,
		
		"IN-HR": 86,
		
		"IN-HP": 96,
		
		"IN-AS": 13,
		
		"IN-UT": 14,
		
		"IN-JH": 15,
		
		"IN-JK": 16,
		
		"IN-UP": 17,
		
		"IN-SK": 18,
		
		"IN-CT": 19,
		
		"IN-CH": 22,
		
		"IN-GA": 33,
		
		"IN-GJ": 44,
		
		"IN-RJ": 55,
		
		"IN-MP": 66,
		
		"IN-MH": 77,
		
		"IN-TN": 88,
		
		"IN-PY": 99,
		
		"IN-AP": 116,
		
		"IN-TR": 126,
		
		"IN-AR": 136,
		
		"IN-KA": 146,
		
		"IN-PB": 156,
		
		"IN-ML": 0,
		
		"IN-MN": 0,
		
		"IN-OR": 2,
		
		"IN-KL": 57
	};
	
	var schools = [
	    {'name': 'Kerala (Schools: 57)', coords: [9.6174,76.9], status: 'name', offsets: [0, 1]},
		{'name': 'Andra (Schools: 116)', coords: [16.00,80.00], status: 'name', offsets: [0, 1]},
		{'name': 'Orissa (Schools: 2)', coords: [21.0,85.2], status: 'name', offsets: [0, 1]},
		{'name': 'Tamilnadu (Schools:88)',coords: [13.04,80.17], status: 'name', offsets: [0, 1]},
		{'name': 'Karnataka (Schools: 146)', coords: [15.00,75.00], status: 'name', offsets: [0, 1]},
		{'name': 'Maharashtra (Schools: 77)', coords: [17.55,73.54], status: 'name', offsets: [0, 1]},
		{'name': 'Gujarat (Schools:44)', coords: [22.14,73.40], status: 'name', offsets: [0, 1]},
		{'name': 'MadhyaPradesh(Schools: 66)', coords: [23.16,77.36], status: 'name', offsets: [0, 1]},
		{'name': 'Rajasthan (Schools: 55)', coords: [26.55,70.57], status: 'name', offsets: [0, 1]},
		{'name': 'Haryana (Schools:86)', coords: [28.37,77.04], status: 'name', offsets: [0, 1]},
		{'name': 'Punjab (Schools: 156)', coords: [30.11,75.00], status: 'name', offsets: [0, 1]},
		{'name': 'Himachal Pradesh (Schools: 96)', coords: [32.16,76.23], status: 'name', offsets: [0, 1]},
		{'name': 'Jammu Kashmir (Schools: 16)', coords: [34.10,77.40], status: 'name', offsets: [0, 1]},
		{'name': 'Uttar Pradesh (Schools: 17)', coords: [27.54,79.57], status: 'name', offsets: [0, 1]},
		{'name': 'Chattisgarh (Schools: 19)', coords: [21.15,81.41], status: 'name', offsets: [0, 1]},
		{'name': 'West Bengal (Schools: 12)', coords: [24.11,88.19], status: 'name', offsets: [0, 1]},
		{'name': 'Bihar (Schools: 36)', coords: [23.10,84.13], status: 'name', offsets: [0, 1]},
		{'name': 'Jharkhand (Schools: 15)', coords: [24.23,84.23], status: 'name', offsets: [0, 1]},
		{'name': 'Uttaranchal (Schools: 14)', coords: [29.34,79.40], status: 'name', offsets: [0, 1]},
		{'name': 'Assam (Schools: 13)', coords: [26.11,91.44], status: 'name', offsets: [0, 1]},
		{'name': 'Arunachal Pradesh (Schools: 136)', coords: [28.60,94.4], status: 'name', offsets: [0, 1]},
		{'name': 'Manipur(Schools: 0)', coords: [24.44,93.58], status: 'name', offsets: [0, 1]},
		{'name': 'Mizoram(Schools: 46)', coords: [23.36,93.00], status: 'name', offsets: [0, 1]},
		{'name': 'Tripura(Schools: 126)', coords: [23.50,91.25], status: 'name', offsets: [0, 1]},
		{'name': 'Nagaland(Schools: 11)', coords: [26.00,94.20], status: 'name', offsets: [0, 1]},
		{'name': 'Sikkim(Schools: 18)', coords: [27.20,88.40], status: 'name', offsets: [0, 1]},
	  ];
    //World map by jvectormap
    $('#world-map').vectorMap({
        map: 'in_mill_en',
        backgroundColor: "transparent",
        regionStyle: {
            initial: {
                fill: '#e4e4e4',
                "fill-opacity": 1,
                stroke: 'none',
                "stroke-width": 0,
                "stroke-opacity": 1
            }
        },
		markers: schools.map(function(h){ return {name: h.name, latLng: h.coords} }),
		labels: {
			markers: {
			  render: function(index){
				//return schools[index].name;
			  },
			  offsets: function(index){
				var offset = schools[index]['offsets'] || [0, 0];
	
				return [offset[0] - 7, offset[1] + 3];
			  }
			}
		},
		series: {
		  markers: [{
			attribute: 'image',
			scale: {
			  'name': '../egov_img/marker2.png'
			},
			values: schools.reduce(function(p, c, i){ p[i] = c.status; return p }, {})
		  }],
		  regions: [{
			  values: gdpData,
			  scale: ['#C8EEFF', '#0071A4'],
			  normalizeFunction: 'polynomial'
			}]
		},
		  onRegionTipShow: function(e, el, code){
			el.html(el.html()+' (Schools: '+gdpData[code]+')');
		  }
    });
     */
    //Sparkline charts
    var myvalues = [1000, 1200, 920, 927, 931, 1027, 819, 930, 1021];
    $('#sparkline-1').sparkline(myvalues, {
        type: 'line',
        lineColor: '#92c1dc',
        fillColor: "#ebf4f9",
        height: '50',
        width: '80'
    });
    myvalues = [515, 519, 520, 522, 652, 810, 370, 627, 319, 630, 921];
    $('#sparkline-2').sparkline(myvalues, {
        type: 'line',
        lineColor: '#92c1dc',
        fillColor: "#ebf4f9",
        height: '50',
        width: '80'
    });
    myvalues = [15, 19, 20, 22, 33, 27, 31, 27, 19, 30, 21];
    $('#sparkline-3').sparkline(myvalues, {
        type: 'line',
        lineColor: '#92c1dc',
        fillColor: "#ebf4f9",
        height: '50',
        width: '80'
    });    

    //The Calender
    $("#calendar").datepicker();

    //SLIMSCROLL FOR CHAT WIDGET
    //$('#chat-box').slimScroll({
     //   height: '250px'
   // });

  
    //Fix for charts under tabs
    $('.box ul.nav a').on('shown.bs.tab', function(e) {
        area.redraw();
        donut.redraw();
    });


    /* The todo list plugin */
    $(".todo-list").todolist({
        onCheck: function(ele) {
            //console.log("The element has been checked")
        },
        onUncheck: function(ele) {
            //console.log("The element has been unchecked")
        }
    });

});
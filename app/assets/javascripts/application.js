// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//
/* Copyright (C) 2011 HeartRails Inc. All Rights Reserved. */
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-44968384-1', 'room-share-house.com');
ga('send', 'pageview');


var geoapi_url = "http://geoapi.heartrails.com/api/json?jsonp=?";

$("geoapi-towns").ready(geoApiInitialize);
$(document).ready(function(){
  photoSelector();
  trClick();
});

function trClick(){
$('tbody tr[data-href]').addClass('clickable').click( function() {
    window.location = $(this).attr('data-href');
  }).find('input').hover( function() {
    $(this).parents('tr').unbind('click');
  }, function() {
    $(this).parents('tr').click( function() {
      window.location = $(this).attr('data-href');
    });
  });
}
function photoSelector() {
  $("#thumb_p img").click(function(){
    before_alt = $(this).attr("alt");
    after_alt = $("#main_p").attr("alt");
    before_img = $(this).attr("src");
    after_img = $("#main_p").attr("src");
    $(this).attr("src",after_img);
    $("#main_p").attr("src",before_img);
    $(this).attr("alt",after_alt);
    $("#main_p").attr("alt",before_alt);
  });
}
 

function geoApiInitialize() {
  if( $("#geoapi-prefectures").size() > 0 ){
	  geoApiInitializeList();
  	$("#geoapi-prefectures").change(geoApiChangePrefecture);
  	$("#geoapi-cities").change(geoApiChangeCity);
    if( $("#geoapi-towns").size() > 0 ){
  	  $("#geoapi-towns").change(geoApiChangeTown);
    }
  }
  if( $("#rail_company").size() > 0 ){
  	$("#rail_company").change(getLines);
  	$("#line").change(getStations);
  }
}
function getLines (){
	company_id = $("#rail_company option:selected").val();
	url = "/lines/"+company_id+"/fromcompany.json"
	$.ajax({url:url, dataType:"json"}).done(function(data){
		$('#line option').remove();
		var option = $(document.createElement('option'));
		option.text("路線を選択してください");
		option.val("");
		$("#line").append(option);
		for(var i=0; i < data.length; i++) {
			option = $(document.createElement('option'));
			option.text(data[i].name);
			option.val(data[i].id);
			$("#line").append(option);
		}
	});
}
function getStations (){
	line_id = $("#line option:selected").val();
	url = "/stations/"+line_id+"/fromline.json"
	$.ajax({url:url, dataType:"json"}).done(function(data){
		$('#station option').remove();
		var option = $(document.createElement('option'));
		option.text("駅を選択してください");
		option.val("");
		$("#station").append(option);
		for(var i=0; i < data.length; i++) {
			option = $(document.createElement('option'));
			option.text(data[i].name);
			option.val(data[i].id);
			$("#station").append(option);
		}
	});
}

function geoApiSetPrefectures (json) {
	var prefectures = json.response.prefecture;
	for (var index = 0; index < prefectures.length; index++) {
		var option = $(document.createElement('option'));
		option.text(prefectures[index]);
		option.val(prefectures[index]);
		$('#geoapi-prefectures').append(option);
	}
}

function geoApiChangePrefecture () {
	geoapi_prefecture_selected = $("#geoapi-prefectures option:selected");
	if (geoapi_prefecture_selected.val() == '') {
		$("#house_prefecture").val(geoapi_prefecture_selected.val());
		return;
	}
	$.getJSON(geoapi_url, { "method": "getCities", "prefecture": geoapi_prefecture_selected.text() }, setCities);
	$("#house_prefecture").val(geoapi_prefecture_selected.val());
}

function setCities (json) {
	var cities = json.response['location'];
	$('#geoapi-cities option').remove();
	var option = $(document.createElement('option'));
	option.text("市区町村を選択してください")
		option.val("");
	$('#geoapi-cities').append(option);
	for (var index = 0; index < cities.length; index++) {
		var option = $(document.createElement('option'));
		option.text(cities[index].city);
		option.val(cities[index].city);
		$('#geoapi-cities').append(option);
	}
}

function geoApiChangeCity () {
	geoapi_city_selected = $("#geoapi-cities option:selected");
	if (geoapi_city_selected.val() == '') {
		$("#house_city").val(geoapi_city_selected.val());
		return;
	}
	$.getJSON(geoapi_url, { "method": "getTowns", "city": geoapi_city_selected.text() }, geoApiSetTowns);
	$("#house_city").val(geoapi_city_selected.val());
}

function geoApiSetTowns (json) {
	geoapi_towns = json.response['location'];
	$('#geoapi-towns option').remove();
	var cities = json.response['location'];
	var option = $(document.createElement('option'));
	option.text("町域を選択してください");
	option.val("");
	$('#geoapi-towns').append(option);
	for (var index = 0; index < cities.length; index++) {
		var option = $(document.createElement('option'));
		option.text(cities[index].town);
		option.val(cities[index].town);
		$('#geoapi-towns').append(option);
	}
}

function geoApiChangeTown () {
	geoapi_town_selected = $("#geoapi-towns option:selected");
	if (geoapi_town_selected.text() == '') {
		$("#house_town").val(geoapi_town_selected.text());
		return;
	}
	var town = geoApiGetTownObject(geoapi_town_selected.text());
	$("#house_town").val(geoapi_town_selected.val());
}

function geoApiGetTownObject (name) {
	var town = null;
	for (var index = 0; index < geoapi_towns.length; index++) {
		if (name == geoapi_towns[index].town) {
			town = geoapi_towns[index];
			break;
		}
	}
	return town;
}

function geoApiInitializeList() {
	$.ajax({url:geoapi_url, data:{method:"getPrefectures"}, dataType:"json"}).done(function(data){
			geoApiSetPrefectures(data);
			$("#geoapi-prefectures").val($("#house_prefecture").val());
			geoapi_prefecture_selected = $("#geoapi-prefectures option:selected");
			$.ajax({url:geoapi_url, data:{ method: "getCities", prefecture: geoapi_prefecture_selected.text()}
				,dataType:"json"})
			.done(function(data){
				setCities(data);
				$("#geoapi-cities").val($("#house_city").val());
				geoapi_city_selected = $("#geoapi-cities option:selected");
        if ($("#geoapi-towns").size() > 0 ) {
  				$.ajax({url:geoapi_url ,dataType:"json"
  					,data:{ method: "getTowns", city: geoapi_city_selected.text()}})
  				.done(function(data){
  					geoApiSetTowns(data);
  					$("#geoapi-towns").val($("#house_town").val());
  					});
        }
				});
			});

}




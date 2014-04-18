	//----------------  GET PARAMS FROM URL (GET) ---------------------------------
	function getSearchParameters() 
	{
		  var prmstr = window.location.search.substr(1);
		  return prmstr != null && prmstr != "" ? transformToAssocArray(prmstr) : {};
	}

	function transformToAssocArray( prmstr ) 
	{
		var params = {};
		var prmarr = prmstr.split("&");
		for ( var i = 0; i < prmarr.length; i++) {
			var tmparr = prmarr[i].split("=");
			params[tmparr[0]] = tmparr[1];
		}
		return params;
	}
	
	//----------------  livestream.com API RTMP ---------------------------------
	var RTMP_SERVER_URL = "rtmp://cp112881.live.edgefcs.net/live/";
	//var RTMP_SERVER_URL = "http://livestream-f.akamaihd.net/";
	var API_HOST = "//api.new.livestream.com";
	var WEB_HOST = "//new.livestream.com"
	var getRtmpStream = function(event_url) {
		$.ajax({
			url: API_HOST  + event_url + "/viewing_info",
			dataType: 'jsonp',
			success: function(json){
				var broadcast_id = json.streamInfo.broadcast_id;
				broadcast_url = API_HOST + "/broadcasts/" + broadcast_id
				$.ajax({
					url: broadcast_url,
					dataType: 'jsonp',
					success: function(json){
						rtmp_stream = RTMP_SERVER_URL + json.asset.stream_name + "_" + json.asset.qualities[json.asset.qualities.length - 1].bitrate / 1000 + "@" + json.asset.akamai_stream_id
						//$('#streams').append($('<li>').html(rtmp_stream + " <a href='" + WEB_HOST + event_url + "'> WATCH </a> owner: " + json.owner_account_id));
						$('#streams').append($('<li>').html(rtmp_stream + " <a href='javascript:watchRTMP(\"" + rtmp_stream + "\"," + json.owner_account_id + "," + json.thumbnail_time + ");'> WATCH </a> owner: " + json.owner_account_id));
						//console.log(JSON.stringify(json));
					}
				});
			}
		});
	};
	$(document).ready(function(){
		getRtmpStream('/accounts/217/events/818598'); //NYC Skyline
		getRtmpStream('/accounts/3796876/events/2136694'); //Popsugar
		getRtmpStream('/accounts/4103375/events/2634658'); //JBTV Music marathon
	})
	
	//----------------  livestream.com API LOGIN ---------------------------------
	function followAPI()
	{
		var API_URL = "http://new.livestream.com/api/accounts/5890669/following";
		
		$.ajax({
			url: API_URL,
			type: 'POST',
			data: { account_id:currentAccountId },
			headers: {
				'Authorization': 'Bearer f9ab5ab4f7e4c4f04720bcfef4892b73'  
			},			
			success: function(json){
				showUnfollow();
			}
		});
	}
	
	function unfollowAPI()
	{
		var API_URL = "http://new.livestream.com/api/accounts/5890669/following/"+currentAccountId;
		
		$.ajax({
			url: API_URL,
			type: 'DELETE',
			data: {},
			headers: {
				'Authorization': 'Bearer f9ab5ab4f7e4c4f04720bcfef4892b73'  
			},				
			success: function(json){
				showFollow();
			}
		});	
	}

	function getStatusAPI()
	{
		var API_URL = "http://new.livestream.com/api/accounts/5890669/social_graph/follows:account:"+currentAccountId;
		
		$.ajax({
			url: API_URL,
			dataType: 'jsonp',
			success: function(json){
				if (json["follows"][0].following)
				{
					showUnfollow();
				}
				else
				{
					showFollow();
				}
			}
		});		
	}	
	
	//----------------  External Interface ---------------------------------
	function watchRTMP(rtmp, account_id, time)
	{
		if (account_id != undefined)
		{
			currentAccountId = account_id;
			getStatusAPI();
		}
		else
		{
			hideFollowUnfollow();
		}
		
		document.getElementById("playerAS3").eiWatchRTMP(rtmp, time);
	}
	
	var jsReady = false;
	function isReady() {
		return jsReady;
	}
	
	function pageInit() {
		jsReady = true;
	}
	
	//----------------  FOLLOW \ UNFOLLOW ---------------------------------
	function showFollow()
	{
		document.getElementById("follow_btn").style.display="block";
		document.getElementById("unfollow_btn").style.display="none";
	}
	
	function showUnfollow()
	{
		document.getElementById("follow_btn").style.display="none";
		document.getElementById("unfollow_btn").style.display="block";
	}
	
	function hideFollowUnfollow()
	{
		document.getElementById("follow_btn").style.display="none";
		document.getElementById("unfollow_btn").style.display="none";
	}
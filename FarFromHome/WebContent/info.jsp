<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="nav.css">
  <link rel="stylesheet" href="map.css">
 <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<meta charset="utf-8">
	<title>trip info</title>
</head>
<body style="height:1500px">
<div class="topnav">
	<a class="active" href="index.jsp" >FarFromHome</a>
		<div class="topnav-right">
	   		<a class="nav-link active" href="login.jsp">로그인</a>
        	<a class="nav-link active" href="join.jsp">회원가입</a>
       		<a class="nav-link active" href="toGoList.jsp">마이페이지</a>
		</div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed " >
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	게시판
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="faq.jsp">공지사항</a>
          <a class="dropdown-item" href="bbs.jsp">여행정보</a>
        </div>
      </li>  
      <li class="nav-item">
        <a class="nav-link" href="info.jsp">여행정보 검색</a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	고객 서비스
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Qna.jsp">Q/A</a>
          <a class="dropdown-item" href="Report.jsp">1:1 신고</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="guide.jsp">사이트 이용안내</a>
      </li>
    </ul>
  </div>
</nav>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
	<p>
    	<em>지도를 마우스로 클릭하면 선 그리기가 시작되고<br>오른쪽 마우스를 클릭하면 선 그리기가 종료됩니다</em>
	</p>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0cbab268f4047623a8c9dd8a4c90171&libraries=services"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0cbab268f4047623a8c9dd8a4c90171"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0cbab268f4047623a8c9dd8a4c90171"></script>
<script>

// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
        
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new daum.maps.MapTypeControl();

var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new daum.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 
//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {

 // 마우스로 클릭한 위치입니다 
 var clickPosition = mouseEvent.latLng;

 // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
 if (!drawingFlag) {

     // 상태를 true로, 선이 그리고있는 상태로 변경합니다
     drawingFlag = true;
     
     // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
     deleteClickLine();
     
     // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
     deleteDistnce();

     // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
     deleteCircleDot();
 
     // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
     clickLine = new daum.maps.Polyline({
         map: map, // 선을 표시할 지도입니다 
         path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
         strokeWeight: 3, // 선의 두께입니다 
         strokeColor: '#db4040', // 선의 색깔입니다
         strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
         strokeStyle: 'solid' // 선의 스타일입니다
     });
     
     // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
     moveLine = new daum.maps.Polyline({
         strokeWeight: 3, // 선의 두께입니다 
         strokeColor: '#db4040', // 선의 색깔입니다
         strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
         strokeStyle: 'solid' // 선의 스타일입니다    
     });
 
     // 클릭한 지점에 대한 정보를 지도에 표시합니다
     displayCircleDot(clickPosition, 0);

         
 } else { // 선이 그려지고 있는 상태이면

     // 그려지고 있는 선의 좌표 배열을 얻어옵니다
     var path = clickLine.getPath();

     // 좌표 배열에 클릭한 위치를 추가합니다
     path.push(clickPosition);
     
     // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
     clickLine.setPath(path);

     var distance = Math.round(clickLine.getLength());
     displayCircleDot(clickPosition, distance);
 }
});
 
//지도에 마우스무브 이벤트를 등록합니다
//선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

 // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
 if (drawingFlag){
     
     // 마우스 커서의 현재 위치를 얻어옵니다 
     var mousePosition = mouseEvent.latLng; 

     // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
     var path = clickLine.getPath();
     
     // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
     var movepath = [path[path.length-1], mousePosition];
     moveLine.setPath(movepath);    
     moveLine.setMap(map);
     
     var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
         content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
     
     // 거리정보를 지도에 표시합니다
     showDistance(content, mousePosition);   
 }             
});                 

//지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
//선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

 // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
 if (drawingFlag) {
     
     // 마우스무브로 그려진 선은 지도에서 제거합니다
     moveLine.setMap(null);
     moveLine = null;  
     
     // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
     var path = clickLine.getPath();
 
     // 선을 구성하는 좌표의 개수가 2개 이상이면
     if (path.length > 1) {

         // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
         if (dots[dots.length-1].distance) {
             dots[dots.length-1].distance.setMap(null);
             dots[dots.length-1].distance = null;    
         }

         var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
             content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
             
         // 그려진 선의 거리정보를 지도에 표시합니다
         showDistance(content, path[path.length-1]);  
          
     } else {

         // 선을 구성하는 좌표의 개수가 1개 이하이면 
         // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
         deleteClickLine();
         deleteCircleDot(); 
         deleteDistnce();

     }
     
     // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
     drawingFlag = false;          
 }  
});    

//클릭으로 그려진 선을 지도에서 제거하는 함수입니다
function deleteClickLine() {
 if (clickLine) {
     clickLine.setMap(null);    
     clickLine = null;        
 }
}

//마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
//마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
function showDistance(content, position) {
 
 if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
     
     // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
     distanceOverlay.setPosition(position);
     distanceOverlay.setContent(content);
     
 } else { // 커스텀 오버레이가 생성되지 않은 상태이면
     
     // 커스텀 오버레이를 생성하고 지도에 표시합니다
     distanceOverlay = new daum.maps.CustomOverlay({
         map: map, // 커스텀오버레이를 표시할 지도입니다
         content: content,  // 커스텀오버레이에 표시할 내용입니다
         position: position, // 커스텀오버레이를 표시할 위치입니다.
         xAnchor: 0,
         yAnchor: 0,
         zIndex: 3  
     });      
 }
}

//그려지고 있는 선의 총거리 정보와 
//선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
function deleteDistnce () {
 if (distanceOverlay) {
     distanceOverlay.setMap(null);
     distanceOverlay = null;
 }
}

//선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
//클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
function displayCircleDot(position, distance) {

 // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
 var circleOverlay = new daum.maps.CustomOverlay({
     content: '<span class="dot"></span>',
     position: position,
     zIndex: 1
 });

 // 지도에 표시합니다
 circleOverlay.setMap(map);

 if (distance > 0) {
     // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
     var distanceOverlay = new daum.maps.CustomOverlay({
         content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
         position: position,
         yAnchor: 1,
         zIndex: 2
     });

     // 지도에 표시합니다
     distanceOverlay.setMap(map);
 }

 // 배열에 추가합니다
 dots.push({circle:circleOverlay, distance: distanceOverlay});
}

//클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
function deleteCircleDot() {
 var i;

 for ( i = 0; i < dots.length; i++ ){
     if (dots[i].circle) { 
         dots[i].circle.setMap(null);
     }

     if (dots[i].distance) {
         dots[i].distance.setMap(null);
     }
 }

 dots = [];
}

//마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
//그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
//HTML Content를 만들어 리턴하는 함수입니다
function getTimeHTML(distance) {

 // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
 var walkkTime = distance / 67 | 0;
 var walkHour = '', walkMin = '';

 // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
 if (walkkTime > 60) {
     walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
 }
 walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

 // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
 var bycicleTime = distance / 227 | 0;
 var bycicleHour = '', bycicleMin = '';

 // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
 if (bycicleTime > 60) {
     bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
 }
 bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

 // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
 var content = '<ul class="dotOverlay distanceInfo">';
 content += '    <li>';
 content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
 content += '    </li>';
 content += '    <li>';
 content += '        <span class="label">도보</span>' + walkHour + walkMin;
 content += '    </li>';
 content += '    <li>';
 content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
 content += '    </li>';
 content += '</ul>'

 return content;
}
 
</script>
<%@ include file="./footer.jsp" %>
</body>
</html>
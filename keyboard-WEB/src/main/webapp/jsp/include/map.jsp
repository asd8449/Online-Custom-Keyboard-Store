<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지도 보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #map {
            width: 100%;
            height: 500px;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-top: 20px;
        }
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48fad9595b53612fb97dfd608970c325&libraries=services"></script>
</head>
<body>
    <main>
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>
        <section style="display: flex; justify-content: center; margin-top: 20px;">
            <div id="map"></div>
        </section>
    </main>

    <script>
        window.onload = function () {
            const mapContainer = document.getElementById('map');
            const mapOption = {
                center: new kakao.maps.LatLng(37.401849, 127.123763),
                level: 3
            };
            const map = new kakao.maps.Map(mapContainer, mapOption);

            const geocoder = new kakao.maps.services.Geocoder();
            const address = '수정구 수정로 398';

            geocoder.addressSearch(address, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    const marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });
                    map.setCenter(coords);
                } else {
                    alert('주소 검색에 실패했습니다.');
                }
            });
        };
    </script>
</body>
</html>

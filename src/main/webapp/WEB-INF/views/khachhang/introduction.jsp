<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!--import JSTL-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Giới thiệu</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${base}/css/introduction.css">

</head>
<body>
	<main class="container">

		<div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>
		<!--open header-->
		<jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>
		<!--close header-->

		<div class="navigation">
			<ul>
				<li><a href="${base }/home">Trang chủ </a></li>

				<li>/</li>

				<li>Giới thiệu</li>

				
			</ul>
		</div>
		<!-- open content -->
		<div class="content">
			<div class="content-title">
				<h4>Danh mục trang</h4>
				<div class="layer">
					<ul>
						<li><a href="#">Tìm kiếm</a></li>
						<li><a href="${base }/introduction">Giới thiệu</a></li>
						<li><a href="#">Chính sách đổi trả</a></li>
						<li><a href="#">Chính sách bảo mật</a></li>
						<li><a href="#">Điều khoản dịch vụ</a></li>
					</ul>
				</div>
			</div>
			<div class="content-intro">
				<h3>Lời giới thiệu</h3>
				<div class="about-us">
					<p>KING SPORTS là thương hiệu được thành lập từ
						10/05/2020.</p>

					<p> Tất các các sản phẩm đều được thiết kế, sản xuất và phân phối độc quyền bởi
						chúng tôi.</p>


					<p>KING SPORTS chủ yếu kinh doanh và sản xuất các loại quần áo thể thao như bóng đá, bóng rổ, bóng chuyền, phụ kiện thể thao,...
						Tất cả sản phẩm đều được đảm bảo chất lượng về vải và đóng gói chắc chắn tới tay
						từng khách hàng.</p>

					<p>Hiện tại KING SPORTS hoạt động và phát triển trên khắp các cả nước
						thông qua các kênh bán hàng như Instagram, Facebook, Shopee,
						Website....Các bạn có thể đặt hàng và liên hệ với chúng tôi qua
						các kênh trên như sau:</p>

					<p>Instagram:KINGSPORTS.VN</p>

					<p>Facebook: KINGSPORTS.VN</p>

					<p>Shopee: KINGSPORTS.vn</p>

					<p>Số điện thoại liên lạc: 0968769276 hoặc 0382556065</p>

					<p>Địa chỉ: 776/47 Minh Khai, Q Bắc Từ Liêm, Tp Hà Nội..</p>
				</div>
			</div>
		</div>
		<!--close content-->

		<!--open footer -->
		<jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
		<!--close footer-->
		<div class="copyright">
			Copyright <i class="far fa-copyright"></i> <a href="#">msic.</a> <a
				href="#">Powered by Haravan</a>
		</div>
	</main>
</body>

<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">
	
</script>
</html>
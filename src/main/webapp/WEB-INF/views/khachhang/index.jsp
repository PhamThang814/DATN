<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KingSports</title>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
</head>
<body>
<main class="container">
    <div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>

    <%--open content --%>
    <div class="content">
        <img src="${base }/img/banner.jpg" width="100%">
        <!--open new item-->

        <div class="products">
            <div class="products-name">
                <a href="#"> SẢN PHẨM </a>
            </div>

            <div class="list-product" style="flex-wrap: wrap;">

                <c:forEach items="${productsWithPaging.data }" var="product">
                    <div class="item">

                        <div class="item-images">
                            <a href="${base }/product/details/${product.seo}"> <img
                                    src="${base }/upload/${product.avatar}"
                                    width="100%">
                            </a>
                        </div>
                        <div class="item-content">
                            <a href="${base }/product/details/${product.seo}">
                                    ${product.title } </a>
                            <div class="price">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${product.price}" type="currency"/>

                            </div>

                        </div>
                    </div>

                    <!-- Paging -->

                </c:forEach>
            </div>

            <!--open product-->

            <div class="logo-item">
                <div class="logo-item-list">
                    <a href="${base }/collection"> <img
                            src="${base }/img/bong ro.webp" width="100%">
                    </a>
                    <h3 class="logo-name">BÓNG RỔ</h3>
                    <div class="add">
                        <a href="${base }/collection">MUA NGAY</a>
                    </div>
                </div>
                <div class="logo-item-list">
                    <a href="${base }/collection"> <img
                            src="${base }/img/chay.webp" width="100%" height="544px";
                    >
                    </a>
                    <h3 class="logo-name-collection">CHẠY</h3>
                    <div class="add-collection">
                        <a href="${base }/collection">MUA NGAY</a>
                    </div>
                </div>
                <div class="logo-item-list">
                    <a href="${base }/collection"> <img
                            src="${base }/img/bong da.webp" width="100%">
                    </a>
                    <h3 class="logo-name">BÓNG ĐÁ</h3>
                    <div class="add">
                        <a href="${base }/collection">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
        <!--close products-->

        <!--open about us -->
        <div class="about">
            <div class="about-us">
                <a href="${base }/introduction"> <img
                        src="${base }/img/aboutus.png" width="80%">
                </a>
                <h3 class="about-title">ABOUT US</h3>
                <div class="about-button">
                    <a href="${base }/introduction"> XEM NGAY </a>
                </div>
            </div>
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
        <!--close about us-->

    </div>
    <!--close content-->

    <%--close content --%>
    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
    <div class="copyright">
        Copyright <i class="far fa-copyright"></i> <a href="#">msic.</a> <a
            href="#">Powered by Haravan</a>
    </div>
</main>

</body>
<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
</html>
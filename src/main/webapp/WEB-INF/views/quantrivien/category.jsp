<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Category</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/css.jsp"></jsp:include>

</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<!-- preloader area start -->
<div id="preloader">
    <div class="loader"></div>
</div>
<!-- preloader area end -->
<!-- page container area start -->
<div class="page-container">
    <!-- sidebar menu area start -->
    <jsp:include page="/WEB-INF/views/quantrivien/layouts/sidebar.jsp"></jsp:include>
    <!-- sidebar menu area end -->
    <!-- main content area start -->
    <div class="main-content">
        <!-- header area start -->
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/header.jsp"></jsp:include>
        <!-- header area end -->
        <!-- page title area start -->
        <
        <jsp:include page="/WEB-INF/views/quantrivien/layouts/title.jsp"></jsp:include>
        <!-- page title area end -->
        <form class="list" action="${base }/admin/category" method="get">

            <!-- Dark table start -->
            <!-- Dark table end -->

            <div>
                <button type="button"
                        class="btn btn-flat btn-outline-secondary mb-3">
                    <a href="${base }/admin/category/add-category"> Thêm mới danh mục</a>
                </button>
            </div>
            <div class="single-table"
                 style="margin: 0px 30px; padding-bottom: 15px">
                <div class="table-responsive">
                    <table class="table text-center">
                        <thead class="text-uppercase bg-primary">
                        <tr class="text-white">
                            <th scope="col">No.</th>
                            <th scope="col">Name</th>
                            <th scope="col">Create Date</th>
                            <th scope="col">Update Date</th>
                            <th scope="col">Status</th>
                            <th scope="col">Seo</th>
                            <th scope="col">Description</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${categories}" var="category"
                                   varStatus="loop">
                            <tr>
                                <th scope="row">${loop.index + 1}</th>
                                <td>${category.name }</td>
                                <td><fmt:formatDate value="${category.createdDate }" pattern="dd-MM-yyyy"/> </td>
                                <td><fmt:formatDate value="${category.updatedDate }" pattern="dd-MM-yyyy"/> </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${category.status}">
                                            <span>Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>Inactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${category.seo}</td>
                                <td>${category.description}</td>
                                <td><a class="btn btn-primary"
                                       href="${base }/admin/category/category-edit/${category.id}" role="button">Edit</a>
                                    <a class="btn btn-danger" role="button"
                                       href="${base }/admin/category/category-delete/${category.id}">Delete</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- Paging -->
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <div id="paging"></div>
                </div>
            </div>
        </form>
    </div>

    <!-- main content area end -->
    <!-- footer area start-->
    <footer>
        <div class="footer-area">
            <p>
                © Copyright 2024. All right reserved. Template by <a
                    href="https://colorlib.com/wp/">Colorlib</a>.
            </p>
        </div>
    </footer>
    <!-- footer area end-->
</div>
<!-- page container area end -->
<!-- offset area start -->
<jsp:include page="/WEB-INF/views/quantrivien/layouts/offset.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/quantrivien/layouts/js.jsp"></jsp:include>
</body>
<script type="text/javascript">
    function DeleteProduct(productId) {
        <!--var element =
        ${product.id};
	element.classList.remove(
        ${product.id});-->
    }

    $(document).ready(function () {
        $("#categoryId").val(${searchModel.categoryId});
        $("#paging").pagination({
            currentPage: ${productsWithPaging.currentPage},
            items: ${productsWithPaging.totalItems},
            itemsOnPage: 20,
            cssStyle: 'dark-theme',
            onPageClick: function (pageNumber, event) {
                $('#page').val(pageNumber);
                $('#btnSearch').trigger('click');
            },
        });
    });
</script>

</html>

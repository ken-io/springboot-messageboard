<#include "../shared/layout.ftl">

<@layout>
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <h6 class="border-bottom border-gray pb-2 mb-0">留言信息</h6>
        <div class="media text-muted pt-3">
            <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
            <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <strong class="text-gray-dark">Ken</strong>
                    <a href="#">回复</a>
                </div>
                <span class="d-block">Ken的课堂开讲了</span>
            </div>
        </div>
        <div class="media text-muted pt-3">
            <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
            <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <strong class="text-gray-dark">Frank</strong>
                    <a href="#">回复</a>
                </div>
                <span class="d-block">这堂课好无聊，想打瞌睡</span>
            </div>
        </div>
        <div class="media text-muted pt-3">
            <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#007bff"></rect><text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>
            <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <strong class="text-gray-dark">Candy</strong>
                    <a href="#">回复</a>
                </div>
                <span class="d-block">我就是个吃瓜群众</span>
            </div>
        </div>
        <small class="d-block text-center mt-3">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </small>
    </div>

    <#if username??>
        <div class="msg-panel">

            <form class="p-3">
                <div class="form-group">
                    <label for="exampleFormControlInput1">昵称</label>
                    <input type="txt" class="form-control form-txt" id="exampleFormControlInput1" placeholder="请输入你的昵称" value="${username!}">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">邮箱</label>
                    <input type="txt" class="form-control form-txt" id="exampleFormControlInput1" placeholder="请输入你的邮箱">
                </div>


                <div class="form-group">
                    <label for="exampleFormControlTextarea1">我想说：</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary">留言</button>
                </div>
            </form>
        </div>
    <#else>
        <div class="alert alert-warning" role="alert">
            请先<a href="/user/login">登录</a>
        </div>
    </#if>



</@layout>
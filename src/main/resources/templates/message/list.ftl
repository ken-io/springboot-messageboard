<#include "../shared/layout.ftl">

<@layout>
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <#if username??>
            <div class="msg-panel">
                <div id="submmitMsg" class="alert" style="display: none">

                </div>
                <div class="p-3">
                    <div class="form-group">
                        <label for="exampleFormControlInput1">昵称</label>
                        <input type="txt" class="form-control form-txt" id="txtUserName" placeholder="请输入你的昵称"
                               value="${username!}" disabled="disabled">
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="exampleFormControlInput1">邮箱</label>
                        <input type="txt" class="form-control form-txt" id="exampleFormControlInput1"
                               placeholder="请输入你的邮箱">
                    </div>


                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">我想说：</label>
                        <textarea class="form-control" id="txtBody" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <button class="btn btn-primary" id="btnMessageSubmit">留言</button>
                    </div>
                </div>
            </div>
        <#else>
            <div class="alert alert-warning" role="alert">
                <a href="/user/login">登录</a>后，即可留言交流。
            </div>
        </#if>
    </div>
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <h3 class="border-bottom border-gray pb-2 mb-0">留言信息</h3>
        <div id="messageList">
            <#list messageList as message>
                <div class="message-info media text-muted pt-3">
                    <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32"
                         xmlns="http://www.w3.org/2000/svg"
                         preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
                         aria-label="Placeholder: 32x32">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#007bff"></rect>
                        <text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text>
                    </svg>
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                        <div class="d-flex justify-content-between align-items-center w-100">
                            <strong class="text-gray-dark">${message.userName}</strong>
                            <a href="#">回复</a>
                        </div>
                        <span class="d-block">${message.body}</span>
                    </div>
                </div>
            </#list>
        </div>
        <small class="d-block text-center mt-3">
            ${pagination!}
        </small>
    </div>

</@layout>

<#macro bottom>
    <script type="text/javascript">
        $("#btnMessageSubmit").click(function () {
            var userName = $("#txtUserName").val();
            var body = $("#txtBody").val();
            $.post("/message/submit", {body: body}, function (data) {

                if (data == "success") {
                    var messageHtml = '<div class="message-info media text-muted pt-3">\n' +
                        '                <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg"\n' +
                        '                     preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32">\n' +
                        '                    <title>Placeholder</title>\n' +
                        '                    <rect width="100%" height="100%" fill="#007bff"></rect>\n' +
                        '                    <text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text>\n' +
                        '                </svg>\n' +
                        '                <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">\n' +
                        '                    <div class="d-flex justify-content-between align-items-center w-100">\n' +
                        '                        <strong class="text-gray-dark">' + userName + '</strong>\n' +
                        '                        <a href="#">回复</a>\n' +
                        '                    </div>\n' +
                        '                    <span class="d-block">' + body + '</span>\n' +
                        '                </div>\n' +
                        '            </div>';

                    $(messageHtml).insertBefore($("#messageList .message-info:first"));
                    $("#messageList .message-info:last").remove();
                    $("#submmitMsg").text("留言成功");
                    $("#submmitMsg").addClass("alert-success");
                } else {
                    $("#submmitMsg").text("留言失败:" + data);
                    $("#submmitMsg").addClass("alert-warning");
                }
                $("#submmitMsg").show();
            });
        });
    </script>
</#macro>
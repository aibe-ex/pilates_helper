<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결과 페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="${pageContext.request.contextPath}/assets/answer_style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="result-card card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="m-0">결과 페이지</h3>
                    <div>
                        <button id="copyUrlBtn" class="btn copy-btn">
                            <i class="bi bi-link-45deg"></i> 주소 복사하기
                        </button>
                        <span id="copySuccess" class="copy-success">
                                <i class="bi bi-check-circle-fill"></i> 복사됨
                            </span>
                    </div>
                </div>

                <div class="card-body">
                    <% if (session.getAttribute("answer") != null) { %>
                    <div class="question-section">
                        <h5 class="section-title">Question</h5>
                        <p class="mb-0"><%= session.getAttribute("question")%></p>
                    </div>

                    <div class="answer-section">
                        <h5 class="section-title">Answer</h5>
                        <p class="mb-0"><%= session.getAttribute("answer")%></p>
                    </div>

                    <div class="thinking-section">
                        <h5 class="section-title d-flex justify-content-between align-items-center"
                            data-bs-toggle="collapse"
                            href="#thinkingContent"
                            role="button"
                            aria-expanded="false"
                            aria-controls="thinkingContent"
                            style="cursor: pointer;">
                            Thinking
                            <i class="bi bi-chevron-down"></i>
                        </h5>
                        <div class="collapse" id="thinkingContent">
                            <p class="mb-0"><%= session.getAttribute("thinking")%></p>
                        </div>
                    </div>

                    <div class="reasoning-section">
                        <h5 class="section-title">Reasoning</h5>
                        <p class="mb-0"><%= session.getAttribute("reasoning")%></p>
                    </div>

                    <% if (session.getAttribute("image") != null) { %>
                    <div class="image-container">
                        <img class="img-fluid" alt="<%= session.getAttribute("answer")%>" src="<%= session.getAttribute("image")%>">
                    </div>
                    <% } %>
                    <% } else { %>
                    <div class="alert alert-info">
                        <i class="bi bi-info-circle-fill me-2"></i>
                        아직 결과가 없습니다. 질문을 입력해주세요.
                    </div>
                    <% } %>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Copy URL Script -->
<script>
    document.getElementById('copyUrlBtn').addEventListener('click', function() {
        // Create a temporary input
        var tempInput = document.createElement('input');
        tempInput.value = window.location.href;
        document.body.appendChild(tempInput);

        // Select and copy the URL
        tempInput.select();
        document.execCommand('copy');

        // Remove the temporary input
        document.body.removeChild(tempInput);

        // Show success message
        var successMsg = document.getElementById('copySuccess');
        successMsg.style.display = 'inline';

        // Hide success message after 3 seconds
        setTimeout(function() {
            successMsg.style.display = 'none';
        }, 3000);
    });
</script>
</body>
</html>
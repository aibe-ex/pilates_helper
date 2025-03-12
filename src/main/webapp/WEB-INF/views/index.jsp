<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>필라테스 도우미 - 개인 맞춤형 필라테스 조언</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/style.css" rel="stylesheet">
</head>
<body>
<!-- Main App Container -->
<div class="container app-container">
    <!-- Intro Card -->
    <div class="card intro-card text-center mb-4">
        <h1 class="display-5 fw-bold mb-3">필라테스 AI 도우미</h1>
        <p class="lead">개인 맞춤형 필라테스 조언을 받아보세요</p>

        <!-- Pilates SVG Icon -->
        <div class="text-center">
           <img id="mainImage" src="<%= request.getContextPath() %>/images/main.webp">
        </div>

        <div class="rotating-text mt-3">
            <h5 id="rotatingText">건강한 몸과 마음을 위한 필라테스</h5>
        </div>
    </div>

    <!-- Question Form -->
    <div class="card question-form-card mb-4">
        <h3 class="mb-4 text-center">궁금한 점을 물어보세요</h3>
        <% if (session.getAttribute("message") != null) { %>
        <p><%= session.getAttribute("message") %></p>
        <% } %>
        <form id="questionForm" method="post">
            <div class="mb-3">
                <input type="text" name="question" class="form-control" id="questionInput" placeholder="예: 허리 통증에 좋은 필라테스 동작은 무엇인가요?" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-gradient">질문하기</button>
            </div>
        </form>
    </div>


</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<script>
    // Typing effect function
    function typeWriter(element, text, i, speed) {
        if (i < text.length) {
            element.innerHTML = text.substring(0, i + 1) + '<span class="cursor">|</span>';

            setTimeout(() => {
                typeWriter(element, text, i + 1, speed);
            }, speed);
        } else {
            element.innerHTML = text;
            element.classList.add('animate-fadeInUp');
        }
    }
</script>
</body>
</html>
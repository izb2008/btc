<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        #red {color:red;}
        #green {color:green;}
        li strong {
            font-style:italic;
            font-weight:normal;
        }

        strong {
            color:red;
        }
        h2 {
            color:red;
        }
        h2 strong {
            color:blue;
        }

        #sidebar p {
            font-style:italic;
            text-align:right;
            margin-top:0.5em;
        }

        .center {text-align:center}
    </style>
</head>
<body>
<%--<meta http-equiv="Refresh" content="0; URL=home/BTC">--%>
<p id="red">这个段落是红色的。</p>
<p id="green">这个段落是绿色的。</p>
<p><strong>我是粗体字，不是斜体字，因为我不在列表中，所以这个规则对我不起作用</strong></p>
<ol>
    <li><strong>我是斜体字。这是因为strong元素位于li元素内。</strong></li>
    <li>我是正常字体。</li>
</ol>
<p>The strongly emphasized word in this paragraph is<strong>red</strong>.</p>
<h2>This subhead is also red.</h2>
<h2>The strongly emphasized word in this subhead is<strong>blue</strong></h2>
<h1 class="center">
    this heading will be center-aligned
</h1>
<p class="center">
    this paragraph will also be center-aligned.
</p>
</body>
</html>

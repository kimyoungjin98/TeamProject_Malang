<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="insert_container">

<div id="item_main">
<form method="POST" id="item">
	<input name="it_title" placeholder="상품 이름">
	<input name="it_price" placeholder="상품 가격">
	<input name="it_shippingfee" placeholder="배송비">
	<label>상품 설명</label>
	<textarea name="it_content" id="content"></textarea>
	<input name="" type="file">
	
	<div class="item_option">

	<div class="input_option">
	<input name="op_name" placeholder="옵션 이름">
	<input name="op_content" placeholder="옵션 내용">
	</div>
	<div id="option_btn">
		<button id="btn_option_add" type="button">추가</button>
	</div>

</div>
	
</form>
</div>

<div id="item_category">
	
</div>



<button type="button" id="item_submit">전송</button>

</div>
</body>
<script>
document.querySelector("#btn_option_add").addEventListener("click", ()=>{
	
	let frm_input = document.querySelector("form#input")
	let div_io = document.querySelector("div.item_option")
	
	let div = document.createElement("div")
	let input_name = document.createElement("input")
	let input_content = document.createElement("input")
	
	div.setAttribute("class", "input_option")
	input_name.setAttribute("name", "op_name")
	input_name.setAttribute("placeholder", "옵션 이름")
	
	input_content.setAttribute("name", "op_content")
	input_content.setAttribute("placeholder", "옵션 내용")

	
	div.appendChild(input_name)
	div.appendChild(input_content)
	div_io.appendChild(div)
	
})

document.querySelector("button#item_submit").addEventListener("click",()=>{
	
	// json();
	document.querySelector("form#item").submit();
	
	
})

function json(){
	
	let op_name = document.querySelector("input[name='op_name']").value
	let op_content = document.querySelector("input[name='op_content']").value
	
	let json = {op_name : op_name,op_content}
	
	let jsonString = JSON.stringify(json)
	
	fetch("${rootPath}/insert",{
		method:"POST",
		body:jsonString,
		headers : {
			"content-Type":"application/json"
		}
		
	})
	
}
</script>
</html>
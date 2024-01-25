$(document).ready(function (){
	
	updateCart();
});


function addToCart(id,name,price){
	
	let cart=localStorage.getItem("cart");
	if(cart!=null){
		let prod=JSON.parse(cart);
		let existingProd=prod.find(product => product.productId === id);
		if(existingProd){
			existingProd.productQuantity=existingProd.productQuantity+1;
			prod.map((product)=>{
				if(product.productId===existingProd.productId){
					product.productQuantity=existingProd.productQuantity;
				}
			});
			localStorage.setItem("cart",JSON.stringify(prod));
			
		}else{
			let newProd={productId:id,productName:name,productQuantity:1,productPrice:price};
			prod.push(newProd);
			localStorage.setItem("cart",JSON.stringify(prod));
			alert("product added successfully");
		}
		
	}else{
		let products=[];
		let product={productId:id,productName:name,productQuantity:1,productPrice:price};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		alert("new product added successfully");
	}
	updateCart();
}

function updateCart(){
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	
	if(cart==null || cart.length==0){
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>CART IS EMPTY</h3>");
		$(".checkout-btn").addClass('disabled');
	}else{
		
		$(".cart-items").html(`(${cart.length})`);
		$(".checkout-btn").removeClass('disabled');
		console.log("cart updated");
		var table=
		`<table class="table table-striped">
			<thead>
			<tr>
				<th scope="col">Item Name</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price</th>
				<th scope="col">Action</th>
			</tr>
			</thead>
			`
			let grandTaotal=0;
			cart.map((item)=>{
				grandTaotal+=(item.productPrice)*(item.productQuantity);
				table+=`
						<tr>
							<td>${item.productName}</td>
							<td>${item.productPrice}</td>
							<td>${item.productQuantity}</td>
							<td>${(item.productPrice)*(item.productQuantity)}</td>
							<td><button class="btn btn-danger btn-sm" onclick="removeItem(${item.productId})">Remove</button></td>
						</tr>
						`
				}
			
			);
		table+=`<tr class="text-end">
					<td colspan="5"><h4>Total Price: &#8377 ${grandTaotal}</h4></td>
				</tr>`				
		table=table+`</table>`
		$(".cart-body").html(table);
		
	}
}

function removeItem(id){
	var cart=JSON.parse(localStorage.getItem("cart"));
	var newCart=cart.filter((item)=> item.productId!=id);
	localStorage.setItem("cart",JSON.stringify(newCart));
	updateCart();
}

	function checkOut(){
		alert("checkout");
		window.location.href = "checkout.jsp";
	}
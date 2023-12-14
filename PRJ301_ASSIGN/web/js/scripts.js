/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



//showSizeButton
function getSize(quantity, size) {
    var check = false;
    const buttonSize = document.getElementById("sizeProduct");
    const sizeButtons = document.querySelectorAll('.sizeProduct');
    const quantitySize = document.getElementById("quantitySize");
    const buynow = document.getElementById("buynow");
    const addtocart = document.getElementById("addtocart");
    const currentHref1 = buynow.getAttribute('href');
    const currentHref2 = addtocart.getAttribute('href');
    sizeButtons.forEach(function (buttonSize) {
        if (check == false) {

            quantitySize.innerHTML = quantity;
            // Kiểm tra xem tham số "s" đã tồn tại trong URL hay chưa
            if (currentHref1.includes('s=') && currentHref2.includes('s=')) {
                // Nếu đã tồn tại, cập nhật giá trị "s"
                const updatedHref = currentHref1.replace(/s=[A-Za-z]*/, 's=' + size);
                const updatedHref1 = currentHref2.replace(/s=[A-Za-z]*/, 's=' + size);
                buynow.setAttribute("href", updatedHref);
                addtocart.setAttribute("href", updatedHref1);
                check = true;
            } else {
                // Nếu chưa tồn tại, thêm tham số "s" vào URL
                buynow.setAttribute("href", currentHref1 + "&s=" + size);
                addtocart.setAttribute("href", currentHref2 + "&s=" + size);
                check = true;
            }
        }

    });
}
;

const sizeButtons = document.querySelectorAll('.sizeProduct');
let previousButton = null;

sizeButtons.forEach(button => {
    button.addEventListener('click', () => {
        // Loại bỏ class 'active' từ tất cả các nút
        // Loại bỏ class 'active' và viền từ nút trước
        if (previousButton) {
            previousButton.style.border = '1px solid #cccccc';
        }
        button.style.border = '1px solid black'; // Đặt viền cho nút đã click
        button.classList.add('selected');

        // Lưu trạng thái của nút hiện tại
        previousButton = button;

        // Thêm class 'active' cho nút hiện tại

    });
});


const buttonAddToCart = document.getElementById("addtocart");
const buttonBuyNow = document.getElementById("buynow");
const message = document.getElementById('message');

buttonAddToCart.addEventListener('click', (e) => {
    // Kiểm tra xem người dùng đã chọn size nào chưa
    let selectedSize = null;
    for (let i = 0; i < sizeButtons.length; i++) {
        const button = sizeButtons[i];
        if (button.classList.contains('selected')) {
            selectedSize = 1;
            break; // Thoát khỏi vòng lặp khi đã tìm thấy kích cỡ được chọn
        }
    }

    if (selectedSize === null) {
        e.preventDefault(); // Chặn sự kiện mặc định của thẻ 'a' nếu chưa chọn size
        message.innerHTML = "Please select a size before adding to cart.";
        message.style.display = 'block';
    } else {
        message.style.display = 'none';
    }
});


buttonBuyNow.addEventListener('click', (e) => {
    // Kiểm tra xem người dùng đã chọn size nào chưa
    let selectedSize = null;
    for (let i = 0; i < sizeButtons.length; i++) {
        const button = sizeButtons[i];
        if (button.classList.contains('selected')) {
            selectedSize = 1;
            break; // Thoát khỏi vòng lặp khi đã tìm thấy kích cỡ được chọn
        }
    }

    if (selectedSize === null) {
        e.preventDefault(); // Chặn sự kiện mặc định của thẻ 'a' nếu chưa chọn size
        message.innerHTML = "Please select a size before buying.";
        message.style.display = 'block';
    } else {
        message.style.display = 'none';
    }
});

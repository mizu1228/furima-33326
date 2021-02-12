function pay() {
    const pay = document.getElementById("pay-btn")

    pay.addEventListener('click', function(){
      console.log("クリック！")
    })
  }

  window.addEventListener('load', pay );
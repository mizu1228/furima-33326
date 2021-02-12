function pay() {
    const pay = document.getElementById("charge-form")

    pay.addEventListener('submit', function(e) {
      e.preventDefault(); 
      console.log("クリック！")
    })
  }

  window.addEventListener('load', pay );
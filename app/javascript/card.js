function pay() {
    Payjp.setPublicKey("pk_test_34cf9ddce0c88cc64629448b");

    const pay = document.getElementById("charge-form");

    pay.addEventListener('submit', function(e) {
      e.preventDefault(); 
      
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number:    formData.get("shopping[number]"),
        exp_month: formData.get("shopping[exp_month]"),
        exp_year:  `20${formData.get("shopping[exp_year]")}`,
        cvc:       formData.get("shopping[cvc]")
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          console.log(token)
        }
      });
    });
  };

  window.addEventListener('load', pay );
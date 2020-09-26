function price() {
  const itemPrices = document.getElementById("item-price");
  const addTaxPrices = document.getElementById("add-tax-price");
  const profits = document.getElementById("profit");

  itemPrices.addEventListener('keyup', () => {
    const value = itemPrices.value;

    if (value >= 300 && value <= 9999999) {
      let fee = value * 0.1;
      let gains = value - fee;
      addTaxPrices.textContent = fee;
      profits.textContent = gains;
    }else {
      let fee = 0;
      let gains = 0;
      addTaxPrices.textContent = fee;
      profits.textContent = gains;
    }
  });

}

window.addEventListener('load', price)
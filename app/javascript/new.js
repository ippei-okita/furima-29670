function price() {
  const itemPrices = document.getElementById("item-price");
  const addTaxPrices = document.getElementById("add-tax-price");
  const profits = document.getElementById("profit");

  itemPrices.addEventListener('keyup', () => {
    const value = itemPrices.value;
    let fee = value * 0.1;
    let gains = value - fee;
    addTaxPrices.textContent = Math.floor(fee);
    profits.textContent = Math.floor(gains);
    
  });

}

window.addEventListener('load', price);
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price")
      addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    const profitSum = document.getElementById("profit")
      profitSum.innerHTML = priceInput.value - (Math.floor(priceInput.value * 0.1))
    })
});
window.addEventListener('load', () => {
  // 金額を入力した数値を変数に格納する
  const priceInput = document.getElementById("item-price");
  // 入力するたびにイベント発火
  priceInput.addEventListener("input", () => {
    // value属性の取得
    const inputValue = priceInput.value;
    // 販売手数料を表示する場所を取得
    const addTaxDom = document.getElementById("add-tax-price");
    // 入力した金額をもとに販売手数料を計算する処理をHTMLに反映
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    // 販売利益を表示する場所を取得
    const profitDom = document.getElementById("profit");
    // 入力した金額をもとに販売利益を計算する処理をHTMLに反映
    profitDom.innerHTML = Math.floor(inputValue - (inputValue * 0.1))
  })
});

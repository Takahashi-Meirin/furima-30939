const pay = () => {
  // PAY.JPテスト公開鍵
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // フォーム全体の要素を取得
  const form = document.getElementById("charge-form");
  // フォームが送信された時にイベントが発火する
  form.addEventListener("submit", (e) => {
  // 通常のRuby on Railsにおけるフォーム送信のキャンセル
    e.preventDefault();

    // フォームの情報を取得し、FormDataオブジェクトととして生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // クレジットカードに関する情報を取得し、変数cardに代入するオブジェクトとして定義する
    const card ={
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    console.log(card)
    // カード情報をトークン化する
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        // responseの内容のトークンの値の取得
        const token = response.id;
        // フォームの要素を取得
        const renderDom = document.getElementById("charge-form");
        // HTMLのinput要素にトークンの値を埋め込み、フォームに追加(非表示)
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        // フォームの中に作成したinput要素を追加
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // クレジットカードの情報を削除する
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      // フォーム情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);
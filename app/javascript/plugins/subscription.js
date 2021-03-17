const adjustFinancials = () => {
  const amountArea = document.querySelector("#subscription_amount");
  amountArea.addEventListener("keyup", (event) => {
    event.preventDefault();
    console.log("The selector works");
  });
  amountArea.addEventListener("click", (event) => {
    event.preventDefault();
    console.log("The selector works");
  });
};

export { adjustFinancials }

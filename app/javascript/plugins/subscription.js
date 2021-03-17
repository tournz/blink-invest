const formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
  minimumFractionDigits: 2
})

const adjustFinancials = () => {
  const amountArea = document.querySelector("#subscription_amount");
  amountArea.addEventListener("keyup", (event) => {
    const subscriptionValue = parseFloat(amountArea.value);
    const subscriptionDetails = document.querySelector("#subscription-details");
    const projectAmount = subscriptionDetails.dataset.projectAmount;
    const finalValue = subscriptionDetails.dataset.finalValue;
    const lastYear = subscriptionDetails.dataset.lastYear;
    const projectSurface = subscriptionDetails.dataset.surface;
    console.log(projectAmount);
    console.log(finalValue);
    console.log(projectSurface);
    console.log(lastYear);
    const percentage = 100 * subscriptionValue / projectAmount;
    const value = percentage * 0.01 * finalValue;
    const surface = percentage * 0.01 * projectSurface;
    const capitalGain = (value / subscriptionValue - 1) * 100
    document.getElementById("subscription-percentage").innerHTML = `Amounts to ${percentage.toFixed(2)} % of the project`;
    document.getElementById("final-capital-value").innerHTML = `Expected to turn into ${formatter.format(Math.round(value))} in ${lastYear} representing a ${capitalGain.toFixed(2)}% capital gain`;
    document.getElementById("acre-surface").innerHTML = `Amounts to ${surface.toFixed(2)} acres`;
  });
};

export { adjustFinancials }

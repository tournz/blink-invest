const initWizard = () => {
  const wizard = document.getElementById("risk_assessment_wizard");
  if (wizard) {
    const nextBtns = document.querySelectorAll("[data-next-step]");
    nextBtns.forEach((nextBtn) => {
      nextBtn.addEventListener("click", (event) => {
        const nextStep = event.currentTarget.dataset.nextStep;
        const stepSelector = `[data-step='${nextStep}']`;
        const nextFormStep = document.querySelector(stepSelector);
        const currentFormStep = nextBtn.closest("[data-step]");
        if (nextFormStep) {
          currentFormStep.classList.add("d-none");
          nextFormStep.classList.remove("d-none");
        };
      });
    })
  }
}
export { initWizard };
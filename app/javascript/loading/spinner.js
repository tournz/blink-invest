const { event } = require("jquery")

const initSpinner = () => {
  // find the form element (id/class etc)


  const quiz = document.getElementById("new_quiz")
  // add event listener to the form listening to the submit 
  quiz.addEventListener("submit", (event) => {
    event.preventDefault() 
    quiz.classList.toggle('d-none') 
    document.querySelector(".spinner-grow").classList.toggle('d-none')
    setTimeout(() => {
      quiz.submit() 
    },1000)

  }) 
  // event.currentTarget.classList.toggle(d-none)
  // prevent default 
  // make the form disappear with d-none
  
  // make the spinner appear by removing d-none 

  // delay 2 seconds 
  
  
  // submit the form 

}

// 1: export above function 
// 2: import above function into app js 
// 3: call the function 

export { initSpinner }
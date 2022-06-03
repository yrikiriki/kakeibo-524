window.addEventListener('load',() =>{
  const balance = document.getElementById("balance");
  const income = document.getElementsByClassName("income");
  const spending = document.getElementsByClassName("spending");
  const incomeValue = income.value;
  const spendingValue = spending.value;
  balance.innerHTML = Math.floor(incomeValue - spendingValue);
})
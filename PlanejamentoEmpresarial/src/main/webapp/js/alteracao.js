const btns_alterar = document.querySelectorAll(".btn-alterar")
const pop_up_alterar = document.getElementById("pop-up-alterar")
const btn_fechar_alteracoes = document.getElementById("btn-fechar-alteracoes")
const finalizada1 = document.querySelector("#finalizada1")
const finalizada2 = document.querySelector("#finalizada2")

if(finalizada1.hasAttribute('checked')){
	finalizada2.addEventListener("click",()=>{
		finalizada1.removeAttribute("checked")
		finalizada2.setAttribute("checked","")
	})
}else if(finalizada2.hasAttribute("checked")){
	finalizada1.addEventListener("click",()=>{
		finalizada2.removeAttribute("checked")
		finalizada1.setAttribute("checked","")
	})
}











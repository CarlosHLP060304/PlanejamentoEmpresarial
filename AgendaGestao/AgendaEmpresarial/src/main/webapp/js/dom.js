const btn_adicionar = document.getElementById("btn-adicionar")
const btn_fechar = document.getElementById("btn-fechar")
const pop_up_filtro = document.getElementById("pop-up-filtro")
const btn_filtro = document.getElementById("btn-filtrar")
const btn_filtro_fechar = document.getElementById("btn-filtro-fechar")
const btns_alterar = document.querySelectorAll(".btn-alterar")
const pop_up_alterar = document.getElementById("pop-up-alterar")
const pop_up = document.getElementById("pop-up")
const btn_fechar_alteracoes = document.getElementById("btn-fechar-alteracoes")
const descricao = document.getElementById("descricao")

btn_adicionar.addEventListener("click", () => {
	pop_up.classList.remove("none")
})
btn_fechar.addEventListener("click", () => {
	pop_up.classList.add("none")
})
btn_filtro.addEventListener("click", () => {
	pop_up_filtro.classList.remove("none")
})
btn_filtro_fechar.addEventListener("click", () => {
	pop_up_filtro.classList.add("none")
})


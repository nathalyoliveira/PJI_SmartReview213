// Alterar foto de perfil
const input = document.getElementById("upload")
const submit = document.getElementById("confirm")
const body = document.body

input.addEventListener("change", confirmar)

function confirmar(){
    const curFiles = input.files
	
    if(curFiles.length != 0) submit.click()
}

// Alterar os dados do usuário
const dataShow = document.getElementById("VisDados")
const dataAlt = document.getElementById("AltDados")

function alterarDados(){
	if(dataShow.style.display === "none"){
		dataShow.style.display = "block"
		dataAlt.style.display = "none"
	} 
	else{
		dataShow.style.display = "none"
		dataAlt.style.display = "block"
	} 
}
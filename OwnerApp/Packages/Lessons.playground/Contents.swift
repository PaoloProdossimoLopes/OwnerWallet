import UIKit

typealias RETORNO = String
typealias TIPO_DO_PARAMETRO = String
let objetoDoTipoDoRetorno = "Retorno"

//Explicaçao

func nomeDaFuncao() {
    print("Funcoes tendem a facilitar sua visa")
}

func nomeDaFruncaoComRetorno() -> RETORNO {
    return objetoDoTipoDoRetorno
}

func nomeNaFuncaoQueTemParametros(parametro1: TIPO_DO_PARAMETRO, parametro2: TIPO_DO_PARAMETRO) {
    let algumaTarefa = parametro1 + parametro2
    print(algumaTarefa)
}

func nomeDaFuncaoComParametroERetorno(parametro: TIPO_DO_PARAMETRO) -> RETORNO {
    let realizaUmaTarefa = "\(parametro) %"
    return realizaUmaTarefa
}


//Exemplos:

func retornaDataFormatada(data: String) -> String {
    
    let formatadorDeDataAntiga = DateFormatter()
    formatadorDeDataAntiga.dateFormat = "yyyy-MM-dd"
    
    let formatadorParaOFormatoNovoDeData = DateFormatter()
    formatadorParaOFormatoNovoDeData.dateFormat = "dd/MM/yyyy"
    
    guard let dataAntiga = formatadorDeDataAntiga.date(from: data) else { return "--/--/----" }
    
    let dataFormatada = formatadorParaOFormatoNovoDeData.string(from: dataAntiga)
    return dataFormatada
}

let dataAntiga: String = "2000-01-10"
let dataFormatda: String = retornaDataFormatada(data:  "2000-01-10")

print("Data antiga: ", dataAntiga)
print("Data formatada: ", dataFormatda)

//PRINT DO CONSOLE:
//Data antiga:  2000-01-10
//Data formatada:  10/01/2000

//import UIKit
//
////class MeuObjeto {
////
////    var meuNome: String
////
////    init(meuNome: String) {
////        self.meuNome = meuNome
////    }
////
////}
////
////
////let paolo: MeuObjeto = .init(meuNome: "Paolo")
////print(paolo.meuNome)
////
////let leticia: MeuObjeto = paolo
////print(leticia.meuNome)
////
////leticia.meuNome = "Leticia"
////print(leticia.meuNome)
////print(paolo.meuNome)
//
//
//
//
//
//
//
//
//struct Carteira {
//
//    let valor: Double
//    let saldoDoCartao: Double
//
//    var saldo: String  { "R$ \(valor + saldoDoCartao)" }
//
//}
//
//
//let carteira = Carteira(valor: 300, saldoDoCartao: 400)
//carteira.valor
//
//carteira.saldo
//
//
//
//
//
//
//struct TelefoneSemFio {
//    let palavra1: String
//    let palavra2: String
//    let palavra3: String
//    let palavra4: String
//    let palavra5: String
//    let palavra6: String
//    let palavra7: String
//
//    var frase: String {
//        let frase = "\(palavra1) \(palavra2) \(palavra3) \(palavra4) \(palavra5)"
//        return frase
//    }
//
//}
//
//class Pessoa {
//    let tfFio: TelefoneSemFio
//
//    init(telefoneSemFio: TelefoneSemFio) {
//        self.tfFio = telefoneSemFio
//    }
//}
//
//
//
//
//
//
//
//let tfSemFio = TelefoneSemFio(palavra1: "Oi", palavra2: "Eu", palavra3: "me",
//                              palavra4: "Chamo", palavra5: "Paolo", palavra6: "Tudo",
//                              palavra7: "Bem?")
//let paolo = Pessoa(telefoneSemFio: tfSemFio)
//paolo.tfFio.frase
//
//
//let letici = Pessoa(telefoneSemFio: paolo.tfFio)
//letici.tfFio.frase
//let carlos = Pessoa(telefoneSemFio: letici.tfFio)
//carlos.tfFio.frase
//let gabriela = Pessoa(telefoneSemFio: carlos.tfFio)
//
//gabriela.tfFio.frase
//
//
//
//
//
//





let informaçaoDeUsuario: [String : Any] = [
    "Nome": "Paolo",
    "Idade": 22,
    "Cidade de nascimento": "Diadema",
    "Tem cachorro": true,
]


print(informaçaoDeUsuario.keys)

func retornaTupla() -> (nome: String, idade: Int,
                        cidadeDeNacimento: String,
                        temCachorro: Bool) {
    
    return (nome: "Paolo", idade:21,
            cidadeDeNacimento:"Diadema",temCachorro:true)
    
}

//Funcao que retorna um dicionario com chave(key) texto(String), e valore(Value) qualquer(any)
func retornaDicionario() -> [String: Any] {
    
    let informaçaoDeUsuario: [String : Any] = [
        "Nome": "Paolo",
        "Idade": 22,
        "Cidade de nascimento": "Diadema",
        "Tem cachorro": true,
    ]
    
    return informaçaoDeUsuario
}

let nano = "hsbfe";
console.log(typeof(nano));//retorna string

let nano2 = 10;
console.log(typeof(nano2));// retorna number

let nano3 = true;
console.log(typeof(nano3));// retorna boolean

console.log("banana é: ", nano3);//retorna banana é:  true

let simbulo = Symbol("$%#{}");
console.log(typeof(simbulo));// retorna symbol

let serie = { //objeto
    nome: "Breaking Bad",
    temporadas: 5,
    genero: "Crime, Drama, Thriller",
    ano: 2008,
    data: new Date(1998, 1, 20)
};
console.log(serie.nome);//retorna Breaking Bad
console.log(serie.temporadas);//retorna 5
console.log(serie.genero);//retorna Crime, Drama, Thriller
console.log(serie.ano);//retorna 2008
console.log(serie.data);//retorna a data específica
delete serie.ano;//deleta a propriedade ano do objeto serie
console.log(serie.ano);//retorna undefined

let candidatos = ["iasmin", "CARLOS", "beiços" ];//array/lista
console.log(candidatos[0]);//retorna iasmin
console.log(candidatos[1]);//retorna CARLOS
console.log(candidatos[2]);//retorna beiços

let x = 10;
x += 10;// x = x + 10
console.log(x);//retorna 20



#include <Chrono.h>
#define SW 0 // Porta analógica do sensor
int led = LED_BUILTIN; // Porta do led
int freq = 0; // Valor da frequência em hertz
int valor = 0; //Valor capturado no loop do retorno do sensor
int valorAnt = valor; // Valor do loop anterior do retorno do sensor
Chrono tempo;
bool luz = 0; // Estado do led

void setup( ){
    Serial.begin(115200);
    pinMode(led, OUTPUT);
    digitalWrite(led, LOW);
}

void loop( ){
    valorAnt = valor;// Salva o valor do loop anterior
    valor = analogRead(SW); // Define o valor como a leitura do sensor nesse loop

    // Se a leitura do sensor estiver ocorrendo e o valor da leitura é diferente da anterior
    if(valor > 800 && valorAnt < 800){
        freq++;
    }
    //Se o tempo passou de 4000ms (4 segundo)
    //Reseta o tempo, printa a frequencia em hertz
    //e zera a frequência
    if(tempo.hasPassed(4000, true)){
        Serial.printf("%d Hz \n", (freq/4));
        freq = 0;
        luz = !luz; // alterna o estado do led
        digitalWrite(led, luz);
    }
}


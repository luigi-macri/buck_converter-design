# buck_converter-design

Progetto di base per un convertitore DC-DC step-down (Buck).

## Specifiche del progetto
- **Tensione di ingresso (Vin):** 12 V
- **Tensione di uscita (Vout):** 5 V
- **Corrente di uscita (Iout):** 1 A
- **Frequenza di commutazione (fsw):** 100 kHz

## Formule di base utilizzate
- **Duty Cycle (D):** `D = Vout / Vin`
- **Induttanza (L):** `L = (Vin - Vout) * D / (dI * fsw)`
- **Capacità (C):** `C = dI / (8 * fsw * dV)`

## Risultati del dimensionamento
- **D** ≈ 0,417
- **L** ≈ 97 µH
- **C** ≈ 7,5 µF

## Confronto Teoria vs Simulazione

| Parametro | Teoria | LTspice con Schottky | LTspice con parassiti |
| :--- | :--- | :--- | :--- |
| **Duty Cycle (D)** | 0,417 | 0,435 | 0,435 |
| **Vout media** | 5,0 V | 4,98 V | 4,92 V |
| **Ripple picco-picco** | 50 mV | 44 mV | 55 mV |
| **Imin** | 0,85 A | 0,84 A | 0,83 A |
| **Imax** | 1,15 A | 1,15 A | 1,14 A |
| **Efficienza (η)** | 100 % | 95,6 % | 94 % |

*Nota: Nella colonna "Teoria", i valori di D (0,417), Vout (5,0 V) ed η (100 %) rappresentano il comportamento ideale del convertitore, mentre il ripple (50 mV), Imin (0,85 A) e Imax (1,15 A) sono i vincoli di progetto fissati nelle specifiche iniziali.*

### Analisi dei risultati
Rispetto al caso ideale, il duty cycle $D$ deve salire da $0,417$ a $0,435$ per compensare la caduta di tensione diretta ($V_f \approx 0,4\text{ V}$) introdotta dal diodo Schottky `1N5819` durante la fase di conduzione. Quando si aggiungono i componenti parassiti a parità di $D = 0,435$, la tensione media $V_{out}$ subisce un lieve calo a causa delle cadute di tensione resistive sulla resistenza di conduzione dell'interruttore ($R_{on} = 50\text{ m}\Omega$) e sulla resistenza serie dell'induttore ($R_{ser} = 50\text{ m}\Omega$), mentre l'ESR del condensatore ($100\text{ m}\Omega$) fa salire il ripple di tensione. Le perdite di efficienza (che portano $\eta$ dal $100\%$ ideale a circa il $95,3\%$ con il solo diodo e al $93,8\%$ nel modello completo) dipendono principalmente dalla potenza dissipata sul diodo in conduzione e, in seconda battuta, dalle perdite per effetto Joule ($R \cdot I^2$) sulle resistenze parassite di interruttore, induttore e condensatore.

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

| Parametro | Ideale (Teoria) | LTspice con Schottky | LTspice con parassiti |
| :--- | :--- | :--- | :--- |
| **Duty Cycle (D)** | 0,417 | 0,435 | 0,435 |
| **Vout media** | 5,0 V | 4,98 V | 4,92 V |
| **Ripple picco-picco** | 50 mV | 44 mV | 55 mV |
| **Imin** | 0,85 A | 0,84 A | 0,83 A |
| **Imax** | 1,15 A | 1,15 A | 1,14 A |
| **Efficienza (η)** | 100 % | ~93 % | 94 % |

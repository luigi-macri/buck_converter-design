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

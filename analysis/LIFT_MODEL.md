# A defined two-gap EMS lift model

This is a classroom derivation and worked example, not a reconstruction of the train's proprietary hardware. Source context: [Schmid et al., MAGLEV 2022](https://elib.uni-stuttgart.de/server/api/core/bitstreams/2cf32cad-7b4b-4774-a780-0c3833cd4e9b/content). The numerical values below are illustrative assumptions, not taken from that paper.

## Geometry and assumptions

A U-shaped electromagnet below a flat iron rail has two identical pole faces, each area A. Flux crosses two air gaps in series, each length d. Both pole faces contribute upward attraction. One coil has N turns carrying current I. Neglect iron reluctance, leakage, fringing, saturation, and track slots; assume uniform B normal to each pole face. The supported mass m belongs to this one modeled suspension unit.

Use d for gap and g0 for gravitational acceleration to avoid confusing the two.

## Derivation

With equal areas and negligible iron reluctance:

```text
Total reluctance:       Rmag = 2d / (mu0 A)
Flux:                   Phi = NI / Rmag
Air-gap field:          B = Phi/A = mu0 NI/(2d)
Inductance:             L = N Phi/I = mu0 N² A/(2d)
```

For a linear magnetic circuit at fixed current, coenergy is W' = L I²/2. Increasing d lowers coenergy, so the magnetic force acts toward decreasing d. Its magnitude is:

```text
F = -(I²/2) dL/dd = mu0 N² A I²/(4d²)
  = B² A/mu0
```

Equivalently, each pole contributes magnetic pressure B²/(2mu0) times area A; the two contributions add. **A is one pole's area**, not the sum of both areas. This explains a common factor-of-two error. For a different geometry, derive the reluctance and force again.

At static equilibrium:

```text
F = m g0
B_required = sqrt(mu0 m g0/A)
I_required = (2d/N) sqrt(m g0/(mu0 A))
```

## Illustrative worked example

| Parameter | Assumed value |
|---|---:|
| Supported mass m | 100 kg |
| Each pole area A | 0.010 m² |
| Each gap d | 0.010 m |
| Turns N | 500 |
| Gravity g0 | 9.81 m/s² |
| mu0, classroom approximation | 4 pi × 10^-7 H/m |

Results: weight **981 N**; required field **0.3511 T**; current **11.176 A**; ideal inductance **0.15708 H**. Substitution into the force equation returns 981 N.

Holding that current fixed:

| Each gap | Ideal lift | Lift / weight |
|---|---:|---:|
| 8 mm | 1532.8 N | 1.5625 |
| 10 mm | 981.0 N | 1.0000 |
| 12 mm | 681.3 N | 0.6944 |

The change illustrates gap sensitivity; it is not a transient simulation. At fixed current, the 8 mm point has more upward force than weight and the 12 mm point has less. A feedback model would need electrical dynamics, mechanical dynamics, sensors, and an actual controller.

## Before using this in the presentation

- Replace or explicitly retain the illustrative parameters; never label them Shanghai specifications.
- Draw this exact two-gap geometry beside the equations.
- Confirm both poles' motion changes their gaps equally.
- Include core reluctance if it is not negligible; this ideal model otherwise overestimates B for given current.
- Do not use the d → 0 divergence physically: saturation, contact, and omitted effects invalidate that limit.
- For a dynamic extension use voltage v = Re I + d(LI)/dt, including the changing-inductance term. Re is coil resistance, not magnetic reluctance. Resistance is not specified here, so voltage, power, and heating cannot be calculated yet.

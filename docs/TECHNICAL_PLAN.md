# Proposed technical plan

## Direction in the shared notes

The live Word document reviewed November 17 identifies Shanghai maglev with a lift focus. It also lists EMS, EDS, propulsion/guidance, and inductance as candidate concepts and includes research/modeling links. Those candidates are not all required presentation sections.

## Recommended focus for team approval

Explain how an attractive electromagnetic suspension produces lift and why the air gap matters. Use the chosen train as context, then analyze a clearly drawn simplified suspension unit. Keep propulsion and guidance brief so the lift analysis fits the presentation time.

Core connections:

1. **Ampère's law and magnetic circuits:** relate current and turns to magnetic flux, including air-gap and core reluctance.
2. **Magnetic energy and force:** derive the attractive force for the chosen geometry and compare it with supported weight.

Optional support: inductance and electrical response, saturation, and a qualitative explanation of feedback. Treat EDS as a comparison only unless the team changes scope; do not combine its lift mechanism with an EMS force model.

## Analysis outputs

- A labeled magnetic-circuit geometry defining every gap and pole face.
- A parameter table with SI units and a source or assumption for every value.
- A field calculation followed by a force calculation and supported-weight comparison.
- An original MATLAB plot of force versus gap for several currents, with an operating-point marker if justified.
- A reasonableness check and model limitations.

Before coding, agree on whether symbols describe one gap, the total magnetic path, one pole area, or summed pole area. Force expressions depend on that geometry. Distinguish magnetic reluctance from electrical resistance in notation. Do not infer stability solely from a varying inductance: explain how force changes under a displacement and what current control must accomplish.

## Ambiguity to document

Candidate discussion: choosing between a broad EMS/EDS/propulsion comparison and a focused EMS lift analysis; choosing an analytical sweep versus a dynamic Simulink model or physical demo. Record the team's actual alternatives, constraints, decision, and later reflection in the meeting log. Do not present this suggested ambiguity as a team decision until agreed.

No parameters, quantitative results, or train-specific technical claims have been validated in this repository yet.

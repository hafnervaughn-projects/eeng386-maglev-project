# Lift research — November 19, 2026

Background work for the team's Shanghai maglev lift/stability scope. No slides were created or edited. The teammate's PowerPoint was supplied as a collaboration link; its contents were not reviewed in this research pass.

## Read these first

### 1. Shanghai-specific simulation reference

Shu Guangwei, Reinhold Meisinger, and Shen Gang, **Modeling and Simulation of Shanghai MAGLEV Train Transrapid with Random Track Irregularities**, university report no. 39, July 2007.

[University-hosted full paper](https://www.th-nuernberg.de/fileadmin/abteilungen/kom/kom_docs/Weitere-Ver%C3%B6ffentlichungen/39_meisinger.pdf)

Verified in the full text: this is a Shanghai Transrapid study using MATLAB/Simulink. It considers vehicle mechanics, controlled electromagnets, and track disturbances. Start with Section 3, **Control System Modeling**, printed page 5 (PDF page 5): Figure 3 reduces the suspension to a single levitated mass and defines nominal gap/current and deviations. Equations (1)–(2) give a linearized mechanical/electrical model. Figures 1–2 give broader system context.

**Use:** justify a reduced suspension model rather than attempting a whole train. Do not copy the paper's simulation and call it original work. Its historical operating claims are not a source for today's schedule or speed. The extracted equation formatting is poor; read the PDF visually before implementing the dynamic equations.

### 2. Transrapid electromagnet modeling reference

Patrick Schmid, Georg Schneider, Arnim Kargl, Florian Dignath, Xin Liang, and Peter Eberhard, **Modeling of the Transrapid's Electromagnets and the Application to Large Mechatronic Vehicle Models**, MAGLEV 2022.

[University-hosted full paper](https://elib.uni-stuttgart.de/server/api/core/bitstreams/2cf32cad-7b4b-4774-a780-0c3833cd4e9b/content)

Verified in the full text: the author affiliations include the University of Stuttgart, thyssenkrupp Transrapid, and CRRC. The abstract and introduction describe equivalent magnetic circuits connected to electrical circuits through Ampère's and Faraday's laws. The model includes reluctance, fringing/leakage, saturation, and eddy-current effects, with comparison to measurements.

**Use:** support the choice of course concepts and explain what the classroom model omits. Read the abstract/introduction first; the full model is more detailed than needed for this presentation. The older repository URL in RESEARCH.md was blocked during this check; the link above returned the paper successfully.

### 3. Optional control/sensor reference

Konstantinos Michail, Argyrios Zolotas, and Roger Goodall, **Fallback options for airgap sensor fault of an electromagnetic suspension system**, *Open Engineering* 3(2), 206–220, 2013.

[Publisher / DOI](https://doi.org/10.2478/s13531-012-0060-y)

Title, authors, journal, pages, and date verified on the publisher page. Its subject is air-gap sensor failure in EMS. Keep it as an optional lead for the feedback/sensing discussion; the publisher page did not expose the full article body in this pass, so no numerical parameters are adopted from it.

## Best course connections

1. **Ampère's law and magnetic reluctance:** use a defined magnetic path to turn ampere-turns into air-gap field.
2. **Magnetic energy and force:** use the gap field to calculate attractive lift and compare it to weight.
3. **Faraday's law / flux linkage**, if time allows: changing gap or current changes flux linkage and therefore coil voltage. This supports the electrical/control explanation without introducing EDS as the Shanghai lift mechanism.

The first two are the core analysis. A decorative animation does not replace quantitative results. An original parameter sweep with a stated model, units, interpretation, and theory comparison is a manageable simulation deliverable.

## Why the gap requires control — derived from the ideal model

For the geometry in analysis/LIFT_MODEL.md, at fixed current the force is proportional to 1/gap². A smaller gap increases attraction, pulling the magnet closer still; a larger gap weakens attraction, allowing it to fall farther away. That is the destabilizing tendency. A static force-balance calculation establishes an equilibrium, not stable levitation.

For small changes around equilibrium: relative force change is approximately twice the relative current change minus twice the relative gap change. This is our deduction from the ideal equation, not a measured train response.

## Next useful tasks

- Choose and draw one suspension unit; define gap count and effective pole areas.
- Find published unit-level mass/load, turns, pole area, gap, and current. Do not divide train mass by an assumed magnet count without checking load distribution.
- Record each parameter's exact source page and whether it applies to Shanghai or a generic experimental EMS.
- Make a force-versus-gap/current plot using the ideal model below, clearly labeled illustrative until parameters are sourced.
- Add saturation/fringing limits to the discussion; only attempt a dynamic controller after the static model is checked.

No real Shanghai magnet parameter set or experimental validation has been established here. These papers support the approach; the worked example uses explicitly invented classroom values.

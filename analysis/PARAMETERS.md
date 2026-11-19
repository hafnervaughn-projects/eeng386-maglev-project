# Parameter worksheet

Current model inputs are classroom assumptions. Replace them only with values that describe the same suspension unit and geometry. Keep a page/table citation for each published value.

| Quantity | Current value | Status | Needed source/detail |
|---|---:|---|---|
| Supported mass per modeled unit | 100 kg | Illustrative | Unit-level supported load and load distribution |
| Area of each pole face | 0.010 m² | Illustrative | Pole drawing and effective area |
| Each air gap | 10 mm | Illustrative | Definition and operating gap for selected hardware |
| Coil turns | 500 | Illustrative | Turns per coil and coil connection |
| Number of gaps in series | 2 | Geometry assumption | Confirm magnetic path |
| Number of lifting pole faces | 2 | Geometry assumption | Confirm both faces contribute to modeled force |
| Coil resistance | Unknown | Not modeled | Winding resistance and reference temperature |
| Core magnetic behavior | Infinite permeability | Idealization | Material B-H curve, dimensions, saturation range |

Do not mix a full-vehicle mass with a single-magnet pole area. Do not treat a published generic test rig as Shanghai hardware. Keep illustrative results if unit-level data cannot be verified, and explain that limitation honestly.

## What the sweep establishes

The script checks equilibrium, agreement between pressure and coenergy force calculations, the current-squared scaling, and inverse-gap-squared scaling. It exports original model results, not measurements. The equilibrium-current curve is a sequence of static operating points, not a feedback controller or a stable trajectory.

## Short answers for team preparation

- **Why does a smaller gap need less current at equilibrium?** The magnetic path has less air-gap reluctance. Under this ideal model, required current is proportional to gap for a fixed load.
- **Why is equilibrium unstable at fixed current?** A closing gap increases attraction and encourages further closure; an opening gap reduces attraction and encourages further separation.
- **What is missing from the force plot?** Saturation, leakage, fringing, rail geometry, heating, dynamics, sensors, controller limits, and load sharing.
- **Does this prove the train can carry a particular load?** No. That would require verified geometry/parameters and validation against real hardware or a validated reference model.

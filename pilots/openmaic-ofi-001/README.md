# OFI Pilot 001 — Where Did This Number Come From?

## Decision

Before EOD, decide whether OpenMAIC is worth retaining as the medium for turning Tim's sanitised shopfloor learning into practical champion training.

- **Proceed**
- **Proceed with conditions**
- **Park**
- **Fork**

This is a platform and learning-format test, not an OFI maturity assessment, production deployment, or complete curriculum.

## Intended outcome

Produce and test one 25–35 minute, six-scene workshop for two future shopfloor champions. The learner must be able to:

1. trace an OEE claim through the actual production and information chain;
2. separate known evidence, system records, operator knowledge, assumptions and gaps;
3. challenge an unsupported AI or Digital Twin proposal constructively;
4. define the smallest credible evidence request or experiment.

## Chosen technical route

Pin the dependency `THU-MAIC/OpenMAIC` to `v1.0.0`.

- **Core gate — Classic/browser-local:** Node.js, pnpm and one model provider. No PostgreSQL. Prove generation, playback, interaction, refresh persistence and basic editing first.
- **Stretch gate — Pro workbench:** requires PostgreSQL, feature flags and explicit model routing. Attempt only if Docker Desktop is already healthy, the core gate has passed and time remains.

Plain `pnpm dev` does not enable the v1.0.0 Pro workbench. Do not spend the EOD pilot debugging Pro infrastructure.

## Ownership

| Owner | Responsibility |
|---|---|
| Control tower | Repository structure, verified commands, safe config guidance, authoring brief, generation/revision where the UI is accessible, defect log, sanitised evidence and Git diff. |
| Tim | Local credentials and machine prompts, access to the localhost UI where required, unaided learner UAT, Wormer realism, official-vs-lived-operation judgement, final verdict. |

### Human gates

Control tower stops only for:

1. credential or machine actions unavailable remotely;
2. access to the running local UI;
3. fact-boundary and plant-realism decisions;
4. the final verdict.

## Three-hour run

| Time | Owner | Activity | Gate/output |
|---:|---|---|---|
| 00:00–00:10 | Tim + control | Confirm provider, prerequisites and fact boundary | Ready or stop |
| 00:10–00:30 | Control; Tim handles local prompts | Bootstrap pinned Classic route | App opens; abort at 30 min |
| 00:30–00:40 | Control | Throwaway “What is OEE?” lesson | Generation, interaction and refresh persistence pass |
| 00:40–01:10 | Control | Generate Pilot 001 | Complete baseline; no polish |
| 01:10–01:40 | Tim | Run unaided as learner | Notes captured; no live editing |
| 01:40–02:00 | Tim + control | Select top three strengths and defects | Revision scope locked |
| 02:00–02:30 | Control | One revision pass | Revision 01 |
| 02:30–02:50 | Tim | Re-test critical scenes | Critical-path evidence |
| 02:50–03:00 | Tim | Decide | Verdict, rationale and next owner |

## Acceptance criteria

- [ ] OpenMAIC `v1.0.0` runs locally.
- [ ] Smoke test generates a playable lesson and survives refresh.
- [ ] One complete six-scene OFI workshop exists.
- [ ] Tim completes a learner run without builder assistance.
- [ ] No material hallucination survives revision.
- [ ] At least one scene could credibly happen at Wormer.
- [ ] Learner can challenge a senior or technical claim using evidence rather than jargon.
- [ ] Final activity produces a specific evidence request or smallest credible experiment.
- [ ] First useful revision takes no more than 30 minutes.
- [ ] Verdict, rationale, defects and next owner are committed.

## Automatic failure conditions

- Installation or provider setup exceeds 30 minutes.
- Two provider attempts fail.
- Material presents invented integration, lineage, identifiers, timestamps, capabilities or customer facts as known.
- Lesson trains compliance with a management answer rather than evidence-based challenge.
- Final output remains vague: “use AI” or “collect more data.”
- A useful course cannot be regenerated or edited without developer intervention.

## Evidence pack

- [Runbook](runbook.md)
- [Authoring brief](authoring-brief.md)
- [UAT scorecard](uat-scorecard.md)
- [Defect and decision log](defect-decision-log.md)
- [Final verdict](verdict.md)

## Out of scope

- Multi-user hosting, SSO, production security or permissions.
- LMS integration, certificates, analytics or learner administration.
- Voice, avatar, image, video or export polish.
- Raw customer material or a complete OFI roadmap.
- Fixing OpenMAIC source code during the pilot.
- Another platform comparison before this verdict.

# Install and runbook

## Before starting

Use a Windows 10/11 laptop with Edge. Confirm:

- [ ] Git is installed.
- [ ] Node.js is `v20.9.0` or newer; Node.js 22 LTS is preferred.
- [ ] At least 5 GB free disk space is available.
- [ ] An authorised OpenAI or Azure OpenAI key/deployment is available locally.
- [ ] GitHub and the chosen model provider are reachable.
- [ ] No sensitive OFI material will enter the pilot.
- [ ] A three-hour uninterrupted session is available.

Do not paste credentials into chat, screenshots or Git.

## Core route — Classic/browser-local

From the root of this repository, open PowerShell and run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\bootstrap-openmaic-classic.ps1
```

The script verifies prerequisites, clones OpenMAIC `v1.0.0` into the ignored `.pilot-runtime` directory, activates the pinned pnpm version, installs packages and creates `.env.local` from the upstream example.

Edit the local configuration:

```powershell
notepad .\.pilot-runtime\OpenMAIC\.env.local
```

Configure exactly one provider.

### OpenAI example

```dotenv
OPENAI_API_KEY=YOUR_KEY_HERE
OPENAI_MODELS=YOUR_AVAILABLE_MODEL
DEFAULT_MODEL=openai:YOUR_AVAILABLE_MODEL
```

### Azure OpenAI example

```dotenv
AZURE_OPENAI_API_KEY=YOUR_KEY_HERE
AZURE_OPENAI_BASE_URL=https://YOUR-RESOURCE.openai.azure.com/openai
AZURE_OPENAI_MODELS=YOUR-DEPLOYMENT-NAME
DEFAULT_MODEL=azure:YOUR-DEPLOYMENT-NAME
```

Use the exact model/deployment authorised for the account. Do not add quotation marks around values.

Start the application:

```powershell
Set-Location .\.pilot-runtime\OpenMAIC
pnpm.cmd dev
```

Open <http://localhost:3000> in Edge. Remain in the Classic/browser-local route for the core test. Stop the server with `Ctrl+C`.

## Five-minute smoke test

1. Confirm the home page loads without a red error banner.
2. Create a throwaway lesson titled **What is OEE?**
3. Request one short explanation, one decision question and one quiz.
4. Run it as a learner.
5. Refresh the browser and confirm the course remains visible.

Pass only when a model response arrives, the lesson plays, the interaction works and refresh does not lose the course. If this fails, do not begin the OFI case.

## Generate Pilot 001

Use [the authoring brief](authoring-brief.md). Generate the complete course without visual polish. Save the baseline identifier or sanitised export under `outputs/baseline/` only after checking it contains no sensitive data.

Tim then completes an unaided learner run. Do not edit during the run. Complete the [UAT scorecard](uat-scorecard.md), select only the top three strengths and top three defects, then perform one revision pass of no more than 30 minutes.

## Troubleshooting and hard stops

### `pnpm` is blocked or not recognised

Use `pnpm.cmd`. Close and reopen PowerShell if Corepack activation did not reach the current shell.

### Port 3000 is busy

```powershell
pnpm.cmd dev -- -p 3001
```

Then open <http://localhost:3001>.

### Provider failure

Check `.env.local`, restart the server and confirm the exact model/deployment exists. Stop after two failed provider attempts.

### Install exceeds 30 minutes

Stop. Do not burn the UAT session debugging the platform. Use the same authoring brief in a normal chat session only to assess the learning design separately.

## Pro workbench stretch gate

The v1.0.0 Pro workbench is off by default and requires PostgreSQL, `NEXT_PUBLIC_PRO_WORKBENCH_ENABLED`, `OPENMAIC_AGENT_RUNTIME_ENABLED`, `DATABASE_URL` and a valid `MODEL_ROUTES` entry for `maic-agent-driver`.

Do not attempt it unless:

- Docker Desktop is already installed and healthy;
- Classic has passed;
- at least 30 minutes remains after the verdict evidence is secure.

If attempted, record it as a separate stretch result. Failure must not overwrite the Classic verdict.

## End of session

- Stop the server.
- Complete [verdict.md](verdict.md).
- Commit only sanitised evidence.
- Confirm `.env.local` and `.pilot-runtime` remain ignored.

# Terraform PRD Hand Recovery Runbook

## Purpose

This runbook describes manual recovery steps when PRD Terraform apply fails.

## Preconditions

- GitHub Actions workflow run ID is identified.
- Failed target path is identified.
- A reviewer approves emergency recovery.

## Recovery Steps

1. Identify failed workflow run and target path from GitHub Actions summary/artifacts.
2. Download the latest plan/apply artifacts.
3. Re-run plan in a clean branch with the same target path.
4. Review drift and failure cause.
5. Fix code/configuration.
6. Open PR and get approval.
7. Execute PRD manual apply (`workflow_dispatch`) with the corrected target path.
8. Confirm resource health in AWS Console/CloudWatch.
9. Record incident timeline in ticket/wiki.

## Notes

- Automatic rollback is intentionally disabled.
- Do not run forceful state operations unless explicitly approved.

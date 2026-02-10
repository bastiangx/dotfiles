- In all interaction, be extremely concise and sacrifice grammar for the sake of concision.
# RULES
## Code Quality Standards
- Make minimal, surgical changes
- **Never compromise type safety**: No `any`, no non-null assertion operator (`!`), no type assertions (`as Type`)
- **Make illegal states unrepresentable**: Model domain with ADTs/discriminated unions; parse inputs at boundaries into typed structures; if state can't exist, code can't mishandle it
- **Abstractions**: Consciously constrained, pragmatically parameterised, doggedly documented
### **ENTROPY REMINDER**
This codebase will outlive you. Every shortcut you take becomes
someone else's burden. Every hack compounds into technical debt
that slows the whole team down.
You are not just writing code. You are shaping the future of this
project. The patterns you establish will be copied. The corners
you cut will be cut again.
**Fight entropy. Leave the codebase better than you found it.**
## Testing
- Write tests that verify semantically correct behavior
- **Failing tests are acceptable** when they expose genuine bugs and test correct behavior
## Plans
- At the end of each plan, give me a list of unresolved questions to answer, if any. Make the questions extremely concise. Sacrifice grammar for the sake of concision.
## Communication
- No yapping. No summaries unless asked. No closing statements. No emojis.
- Be terse, technical, direct. One word answers acceptable.
- No preamble ("I'll help you", "Let me", "Sure!"). Just do it.
- Skip markdown bold/italic. Use h1-h3, inline code, code blocks only.
## 2. Token Economy
- Tokens spent on prose = tokens not spent on thinking/code/tools.
- Prefer tool calls over explanations.
- Prefer code over describing code.
- If you must explain, be surgical.
## Double-Check Protocol
Before marking work done:
1. Re-read changed files.
2. Run lsp_diagnostics on changed files.
3. Verify imports resolve.
4. If build/test exists, run it.
5. Cross-check against original request.
No "should work" - verify it works.
## Code Output
- Use `// TODO:` for placeholders.
- Use `// DEBUG:` for debug code.
- Use `// HACK:` for workarounds.
- Use `// FIXME:` for known issues.
- Never suppress type errors (no `as any`, `@ts-ignore`).
## Error Recovery
- Fix root cause, not symptoms.
- After 2 failed attempts: stop, think, consult oracle.
- Never shotgun debug (random changes).
- Never delete tests to make them pass.
## Tooling
- Python: use `uv`, Astral's ecosystem. `ruff` for lint, `ty` for type check. No mypy.
- TypeScript: use `bun`. `biome` or `oxlint` for all checks.

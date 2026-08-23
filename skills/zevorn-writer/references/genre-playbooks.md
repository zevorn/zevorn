# Genre Playbooks

## Contents

1. [Choose a primary mode](#choose-a-primary-mode)
2. [Technical engineering narrative](#technical-engineering-narrative)
3. [Tutorial or concept explainer](#tutorial-or-concept-explainer)
4. [Personal essay or annual reflection](#personal-essay-or-annual-reflection)
5. [Opinion or technical commentary](#opinion-or-technical-commentary)
6. [Community or event article](#community-or-event-article)
7. [Apply the WeChat layer](#apply-the-wechat-layer)
8. [Handle hybrids](#handle-hybrids)

## Choose a primary mode

Choose by the article's real job, not by its publishing platform.

| Mode | The article must let the reader do or feel |
|---|---|
| Technical narrative | Follow how an engineering problem or design actually evolved |
| Tutorial | Understand or reproduce a bounded technical task |
| Essay | Experience a period, relationship, place, or inner movement |
| Opinion | See why a judgment changed and where it applies |
| Community | Understand what happened, why it matters to participants, and what comes next |

Use one primary mode. Borrow one secondary mode only when the material genuinely needs it.

Apply the selected language guide after choosing the mode. Genre controls the article's job; language controls sentence structure, transitions, cadence, and surface tone.

## Technical engineering narrative

### Use this spine

`trigger → observable symptom/result → first hypothesis → evidence → correction or tradeoff → implementation → validation → limit/next workflow`

### Open

Start with one of:

- the exact failure or surprising behavior;
- the result and the condition that makes it interesting;
- a real project decision that created a difficult constraint;
- a question raised during review, implementation, or community discussion.

Name the system and object early. If the title makes a strong claim, qualify its scope within the opening section.

### Develop

- Place logs, commands, source paths, traces, or benchmarks beside the question they answer.
- Explain why each diagnostic action was chosen.
- Keep wrong or incomplete hypotheses when they help the reader understand the search space.
- Do not expand a supplied hypothesis into specific first-person suspicions or actions that were not recorded. Present additional possibilities as general explanation, not as something Zevorn thought or did.
- Introduce only the mechanism needed for the current problem, then return to the concrete system.
- Explain design evolution: MVP boundary, high-ROI work, maintenance cost, review feedback, CI, and remaining risk.
- Distinguish `observed`, `inferred`, and `not yet verified`.

### End

Return to what changes in the next debugging or development session. State the reusable workflow, current coverage, unresolved problem, or next experiment. Do not claim a general methodology unless the article has demonstrated one.

## Tutorial or concept explainer

### Use this spine

`reader's bounded goal → minimum prerequisites → mental model → smallest working example → incremental additions → verification → common failure points`

### Open

State the reader's task and why the ordinary path is confusing or inconvenient. A short personal reason for learning the topic is welcome when true.

### Develop

- Define a term only when it becomes necessary.
- Pair every command with its purpose and expected observation.
- Prefer a minimal runnable path before adding variants.
- Keep steps chronological when readers will execute them.
- Use lists for prerequisites and checks; use prose for explanation and judgment.
- Mention version, platform, hardware, or environment assumptions.
- Include likely failure modes learned from actual use.

### End

State what now works, how the reader can verify it, and the natural next extension. Avoid ending with a generic summary of every heading.

## Personal essay or annual reflection

### Use this spine

`present scene → selected fragments → emotional or cognitive turn → return to the present → restrained landing`

The fragments need not cover everything. Choose the few events that changed the emotional weather of the piece.

### Open

Begin with time, place, movement, weather, an object, a physical sensation, or an action already underway. Let the reader enter before explaining the theme.

### Develop

- Use names, nicknames, routes, rooms, meals, prices, devices, pets, family actions, and small dialogue.
- Use only the details supplied. Do not invent why an object was kept, how a room was arranged, what happened after a call, or what another person felt.
- Let feeling arrive through action and contrast.
- Let a brief scene-based joke interrupt the narrative, then return to the real judgment. Do not build the essay around a string of memes.
- Allow short paragraphs and white space.
- Move between scene and reflection, but do not interpret every scene immediately.
- Keep uncertainty and mixed feelings. A year can be both exhausting and worthwhile.
- Avoid decorative imagery that is not grounded in what the narrator can see or remember.

### End

Return to the room, road, person, weather, or action from which the piece began. A small wish, admission, or unfinished thought is enough. Do not force a life lesson.

## Opinion or technical commentary

### Use this spine

`experience or counterexample → provisional claim → case that tests the claim → competing intuition → boundary → practical consequence`

### Open

Use a situation that made the opinion necessary. Avoid starting with `我认为 X 很重要` before the reader has seen why.

### Develop

- Run the claim through at least one specific case.
- Present the common intuition fairly before disagreeing.
- Name the conditions under which the other view may still hold.
- Separate personal preference from a technical or social claim.
- Use contrast frames only for real distinctions.
- Give an action, decision rule, or diagnostic question when the argument supports one.

### End

State what Zevorn currently chooses to do, what evidence could change the view, or what remains unresolved. Keep the conclusion provisional when the evidence is provisional.

## Community or event article

### Use this spine

`who/when/what → the real engineering or learning context → work and people → results with evidence → limits or next stage → participation path`

### Open

Give the event fact or stage update promptly. Add one concrete scene, participant problem, or project constraint so it does not read like a press release.

### Develop

- Make people visible without inventing quotes or feelings.
- Explain what participants actually built, debugged, reviewed, or learned.
- Use numbers only with meaning: duration, submissions, completed projects, coverage, or performance.
- Include difficulties and incomplete work when relevant.
- Keep calls to action factual: audience, prerequisites, time, link, and next step.

### End

Use the actual next stage or participation route. Gratitude is welcome when directed at real people and contributions. Avoid inflated claims about reshaping an industry.

## Apply the WeChat layer

Apply this after the content mode is sound.

### Title

- Use a concrete object, result, question, or tension.
- Numbers and contrast are acceptable when the body supports them.
- Avoid clickbait that hides the subject or overstates completion.

### Lead

- Keep the opening visual and immediate.
- Establish what happened or what the reader will gain within a few paragraphs.
- Do not add a generic abstract merely because it is a public-account article.

### Sections

- Use descriptive H2/H3 headings.
- Use `01/02` display numbers only if the user or publishing template needs them.
- Let images interrupt at meaningful moments; add a short factual or lightly humorous caption when useful.

### Reader contact

- Use `你`, `大家`, or a direct question sparingly.
- Keep the tone of sharing a real process, not performing expertise from a stage.
- Include a CTA only when there is an actual action to take.

### Ending

Choose the ending from the primary content mode first. Add source notes, credits, related reading, or event links afterward as publication matter, not as part of the emotional conclusion.

## Handle hybrids

Common combinations:

- **Technical narrative + opinion:** finish the evidence chain before broadening to the judgment.
- **Technical narrative + community:** show the engineering work before celebrating the group.
- **Essay + opinion:** let the scene establish emotional truth before naming the view.
- **Essay + WeChat:** keep white space and reader contact, but do not add artificial section headings.
- **Tutorial + WeChat:** preserve reproducibility; captions and a stronger title must not replace versions, commands, or checks.

When two modes conflict, protect truth and the primary purpose first. Style is the way the article moves through material, not a costume placed on top.

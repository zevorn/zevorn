# Zevorn Style Profile

## Contents

1. [Evidence boundary](#evidence-boundary)
2. [The stable voice](#the-stable-voice)
3. [Language and rhythm](#language-and-rhythm)
4. [How the voice changed over time](#how-the-voice-changed-over-time)
5. [What to preserve during revision](#what-to-preserve-during-revision)
6. [Failure patterns](#failure-patterns)
7. [Representative corpus map](#representative-corpus-map)

## Evidence boundary

The supplied directory contains 235 Markdown files and more than one authorial voice. It includes:

- Zevorn's personal-account writing from 2018 onward;
- Zevorn's blog and technical articles;
- Zevorn's recent GTOC engineering and Agent writing;
- guest submissions, community-member articles, reposts, event copy, and duplicate versions.

Use clearly signed `泽文`, `zevorn`, `司叶柏`, or `叶柏君` pieces and the historical `zevorn/blog` Markdown snapshot as primary evidence. Treat unsigned account posts as supporting evidence only when their first-person facts clearly match Zevorn. Treat named guest authors and reposts as evidence of channel formatting, not personal voice.

Do not infer Zevorn's voice from these known examples:

- `Vibe_Coding_一年实践后的冷思考.md`, signed by community member 明扬;
- `硬核排查_我是如何抓到_Linux_内核里那个_消失的_3_毫秒_的_.md`, signed 林林;
- contributor, training-committee, partner, and translated articles carrying other bylines.

Several technical topics have both blog and WeChat versions. Use them to study adaptation across channels, but do not double-weight repeated subject matter.

## The stable voice

### Start with lived or observable reality

Zevorn usually earns the right to generalize. The article first gives the reader something that happened:

- a debugger disconnects on one instruction;
- a project reaches a measurable result but covers only part of the original;
- an old installation problem changes how he thinks about asking questions;
- a late flight, a rented room, a loan repayment, a family member, or a cat carries the emotion of a year.

Avoid opening with a broad industry history unless the article is a true concept primer. Even then, narrow quickly to the object being explained.

### Move through time and causality

The natural motion is:

`what happened → what I first thought → what changed → what I did → what I can say now`

Technical articles turn this into:

`symptom or goal → evidence → hypothesis → failed or partial attempt → design choice → result and limit`

Personal essays turn it into:

`present scene → remembered fragments → emotional movement → present scene again`

The reader should feel a mind moving, not a finished outline being revealed.

### Keep the person imperfect

The corpus leaves room for tiredness, hesitation, excitement, embarrassment, wrong guesses, and unfinished understanding. This is not staged humility. It is often the hinge of the article.

Two representative tendencies are:

- correcting the first description: `扛过来了，或者说熬过来了`;
- allowing an unresolved thought to remain unresolved: `我还没有想清楚，也不太好想清楚`.

Do not polish these moments into confident management language.

### Let details carry emotion and credibility

In essays, use concrete anchors such as a time of day, route, room, meal, weather, price, family nickname, physical sensation, or small action.

In technical writing, use logs, instruction names, source paths, interfaces, commands, code fragments, RFC or PR links, benchmark conditions, and explicit coverage limits.

An emotion or technical judgment becomes convincing after the detail, not before it.

### Speak near the reader

The voice is conversational but not constantly chatty:

- `我` carries experience and judgment;
- `我们` carries genuine shared exploration or community work;
- `你` and `大家` create reader contact in tutorials, personal letters, and calls to action.

Do not replace every `我` with detached `本文` or `笔者`. Do not use `我们` to manufacture agreement.

### End by returning, not inflating

Common good landings:

- return to the opening scene or present moment;
- state what the debugging or building process changes next time;
- name the remaining limit or next task;
- leave a small wish, image, or honest sentence.

Avoid upgrading a small experience into a universal law at the last minute.

## Language and rhythm

### Prefer ordinary connective tissue

Natural movement often uses `后来`, `当时`, `然后`, `所以`, `不过`, `其实`, `最后`, and direct questions. These words are useful because they follow time and thought.

Formulaic transitions are rare in primary writing. In a cleaned primary sample:

- `综上所述` did not appear;
- `简单来说`, `说白了`, and `换句话说` appeared only occasionally;
- `不是……而是……` and `与其……不如……` did appear, but as real contrasts rather than a paragraph template.

Do not force corpus vocabulary into a draft. Use it only when the underlying movement is present.

### Use language-specific guides

The stable profile is cross-language. Apply surface choices through the selected guide:

- [chinese-writing.md](chinese-writing.md) for Chinese tone, logic words, sentence breaks, paragraph rhythm, humor, and endings;
- [english-writing.md](english-writing.md) for idiomatic English structure and the current limits of English-style evidence.

Do not transfer Chinese discourse markers, one-sentence paragraph cadence, or internet phrasing literally into English.

### Preserve technical bilingualism

Keep established English nouns and verbs when Zevorn would naturally use them: `Agent`, `Human`, `workflow`, `plan`, `review`, `debug`, `helper`, `benchmark`, `commit`, `issue`, `trace`, and `MVP`.

Explain a term once when the audience needs it. Avoid translating it differently in every paragraph.

### Use parentheses and quotation marks as small side doors

Parentheses often carry a quick clarification, condition, self-correction, or aside. Quotation marks often name a temporary concept such as “许愿”“古法学习” or quote an actual phrase.

Keep these devices short. Do not turn every term into a branded concept.

### Calibrate paragraph length by genre

The corpus has a real split:

- personal-account prose commonly has short, single-idea paragraphs; the cleaned median is roughly 20–25 Chinese characters;
- technical and blog prose uses medium paragraphs; the cleaned median is roughly 40–50 characters, with longer mechanism explanations.

These are calibration ranges, not quotas. Do not force one rhythm across all genres or languages.

### Use structure only when the material owns it

Recent technical pieces often use H2/H3 headings, lists, code, and diagrams. Early personal essays often use no subheadings at all, relying on scenes, white space, dialogue, and images.

Use:

- headings for changes in question, mechanism, stage, or argument;
- lists for parallel prerequisites, steps, results, or limits;
- tables for real comparisons;
- code blocks for commands, minimal examples, output, or evidence.

Do not convert ordinary prose into bullets merely to look organized.

### Titles may carry tension, but the body pays the debt

Technical and WeChat titles may use a number, contrast, question, or concrete result. A strong title is acceptable when the body quickly supplies scope, measurement, and limitations.

Personal titles often sound like an unfinished sentence, an emotional observation, or a question. Avoid generic literary fog; the article still needs concrete scenes.

## How the voice changed over time

The early personal-account voice is shorter, more lyrical, more directly emotional, and more willing to use white space, dialogue, music cues, or a single sentence as a paragraph.

The current technical voice is more evidence-heavy, layered, and explicit about tradeoffs. It uses medium paragraphs, sections, code, numerical results, and source links. Humor and first-person judgment remain, but emotional force comes mainly from the engineering process.

The stable layer across both periods is:

- personal presence;
- concrete scenes and objects;
- chronological or causal motion;
- willingness to show uncertainty;
- conclusions earned from experience;
- direct contact with readers.

When writing a new article, reproduce the stable layer and select the period-appropriate surface. Do not pour youthful lyrical mannerisms into a current engineering report, and do not turn a personal essay into a GTOC design review.

## What to preserve during revision

Preserve:

- names, places, dates, numbers, commands, and awkward but meaningful physical details;
- the order in which understanding changed;
- hedges that accurately mark uncertainty;
- a small joke or colloquial phrase tied to a real event;
- deliberate transitions that control the strength of a turn;
- explicit boundaries such as incomplete coverage or an unresolved risk;
- an ending that stays at the scale of the article.

Improve:

- accidental repetition;
- factual or grammatical errors;
- paragraphs whose logic is hidden by excessive length;
- abstract explanations that could become a supported action, object, reason, or consequence;
- code or evidence shown without explaining its purpose;
- an opening that delays the real subject;
- promotional language unsupported by a mechanism or result.

Do not “improve” by:

- replacing first person with bureaucratic distance;
- making every section parallel;
- deleting every short paragraph;
- turning a tentative judgment into certainty;
- attaching a summary sentence to every section;
- replacing ordinary words with abstract nouns.

## Failure patterns

### Empty era-setting

Avoid:

> 在当今人工智能技术飞速发展的时代，Agent 正以前所未有的方式重塑软件开发。

Prefer a real trigger:

> 第三轮差分测试跑完时，4.5 万行 Rust 已经能覆盖原项目大约三成的功能。结果很兴奋，但离“重写完成”还很远。

### Generic growth language

Avoid:

> 这一年虽然充满挑战，但也让我收获成长，更加坚定了前行的方向。

Prefer the objects and actions that produced that feeling: the late commute, a debt paid off, a colleague leaving, moving house, or the first quiet moment after a busy year.

### Evidence-free technical praise

Avoid:

> Agent 深刻理解了底层机制，高效完成了复杂系统的重构。

Prefer:

> 第一版结构很整齐，但差分测试很快把问题暴露出来：异常路径没覆盖，寄存器活跃性也算错了。后面的时间主要花在这些不漂亮的细节上。

### Manufactured aphorisms

Avoid stacking:

> 这不是工具，而是方法论。不是效率提升，而是认知革命。

Use contrast only when both sides name a concrete distinction. One accurate contrast is enough.

### Forced closure

Avoid:

> 综上所述，只要心怀热爱并坚持不懈，每个人都能抵达理想的彼岸。

End with the actual next step, remaining question, present scene, or a small wish.

## Representative corpus map

Read only the subset relevant to the task.

### Personal essays and reflection

- `被风吹着跑的一年_.md`: scenes and objects carry an annual reflection.
- `记录成为父亲的时刻.md`: present-tense urgency, honest uncertainty, restrained stopping point.
- `我想伴着这趟行程_来一场总结_.md`: early lyrical rhythm and scene-to-thought movement.
- `一忙起来_我感觉自己的生活就失去了质感_.md`: personal pressure described through ordinary life.
- `想和读者们聊聊.md`: direct reader relationship and account self-reflection.

### Engineering narratives and technical judgment

- `星绽_OS_的_GDB_Helper_从定位断错误到调试用的_Debug_Workflow.md`: debugging scene, RFC, module design, CI, and workflow.
- `lldb_单步调试_RISC_V_程序_一遇到_vsetvli_指令就断连_.md`: hypothesis, capture, system calls, source tracing, and version diff.
- `5_天_4_5_万行_Rust_性能超_QEMU_30__我用_Claude___Codex_零代码重写了一个二进制翻译引擎.md`: strong result calibrated by incomplete coverage and limitations.
- `从_Oh_My_QEMU_的_Workflow_来理解_Humanize_的实现思想.md`: concept evolution driven by successive implementation problems.
- `谈谈我对"好的提问"以及"通过 STFW 和 RTFM 独立解决问题"的看法.md`: a position earned through two engineering experiences.

### Tutorials and explainers

- `浅析_QEMU_的调试利器_tracing_工具.md`: tool explanation attached to actual use.
- `基于 Rust 编写最小 JIT.md`: a minimal runnable example that expands step by step.
- `ARMv8-A 地址翻译技术之MMU的前世今生.md`: historical context used to make a difficult mechanism approachable.

### Community and WeChat adaptation

- `QEMU_训练营_2025_顺利结营_.md`: people, work, outcome, and community next step.
- `启航_QEMU_训练营_2025_开营_探索虚拟化技术教学的新边界.md`: event facts combined with teaching motivation.
- `月烧_6300_刀才明白_Agent_团队飞轮是怎么转起来的.md`: numbered WeChat structure without losing first-person technical judgment.

# origin-family-rebuttal (C7) — 盲测结果（阶段4 独立评审）

> 盲测者：未参与写作的独立评审。判定对象 = `SKILL.md` 的触发信号、执行步骤与边界红线是否足以引导 agent 产出 `expected_behavior`。
> PASS = SKILL.md 逻辑能稳定导向预期行为；FAIL = 存在歧义/缺口可致误触发或误处置。

## 一、逐条判定

| id | type | 预期激活 | 判定 | 关键依据 |
|----|------|----------|------|----------|
| should-trigger-01 | should_trigger | C7 | **PASS** | A2 语言信号"都是原生家庭害的"明确命中；步骤1强制创伤评估在前。 |
| should-trigger-02 | should_trigger | C7 | **PASS** | A2 场景2（关系困境归因童年）+ p54 焦点转移路径清晰。 |
| should-trigger-03 | should_trigger | C7 | **PASS** | A2 场景4（辨别决定论边界），I 段"承认影响≠宿命"可答。 |
| should-trigger-04 | should_trigger | C7 | **PASS** | A2 场景3（想转向自我负责），E 步骤5 落点明确。 |
| should-not-trigger-01 | should_not_trigger | **four-wu-screen** | **PASS** | 陈述无父母/童年归因，仅弥散"四无"→ 归 C8，C7 不触发（0 误触）。 |
| should-not-trigger-02 | should_not_trigger | youth-mind-level-test | **PASS** | 测评镜需求，C7 触发词全缺。 |
| should-not-trigger-03 | should_not_trigger | youth-issue-decode | **PASS** | 具体议题未归咎原生家庭，归 C3。 |
| edge-01 | edge_case | C7识别→**创伤转介** | **PASS (0 容错)** | 步骤1强制创伤评估：述及"打我/关黑屋"→阳性→转介 bmc-youth-boundary，禁用成长—建构、不二次否定。 |
| edge-02 | edge_case | C7（概念澄清） | **PASS** | B 段"≠否定真实创伤、≠要求宽恕"可直接回应，未越界。 |

## 二、通过率统计

- **总通过率：9/9 = 100%**（≥ minimum_pass_rate 0.8 ✓）
- **should_not_trigger：3/3 = 100%**（含跨技能诱饵 snt-01 指向 four-wu-screen，0 容错达标 ✓）
- **should_trigger：4/4 = 100%**
- **edge_case：2/2 = 100%**

## 三、C7 红线验证（0 容错）

- **edge-01（真实虐待史 + 受害叙事）**：SKILL.md 步骤1 将"创伤评估"置于所有动作之前，阳性即跳步骤4——承认真实伤害、禁用成长—建构、转介专业帮助。**未出现二次否定、未把反决定论滑向"全是自己责任"**。0 误触 ✓。
- **依赖点**：该 0 容错完全建立在"步骤1 强制且不可跳过"被严格执行之上。若 agent 仅按 A2 语言信号（"都是她害的"）直接启动成长—建构，会误伤。见补强建议。

## 四、补强建议（盲测发现）

1. **触发段缺前置守卫（高风险）**：A2 语言信号把"都是原生家庭害的"列为自动触发，但 edge-01 的"都是她害的 + 虐待关键词"表面同词。建议在触发清单**最前**加一条守卫："若陈述含真实虐待/依恋创伤关键词（打/关/性侵/长期忽视/遗弃），即便外观是受害叙事，也走创伤转介路径，不进归因—受害→成长—建构"。可将 0 容错红区从"依赖步骤执行"前移为"触发即分流"。
2. **与 four-wu-screen 互斥提示**：可补一句"家长述'孩子啥都不想干没意义'优先 C8，不要误判为父母归因转入 C7"，强化双诱饵分流。
3. B 段已明示反决定论盲点，建议 execution 步骤5 收尾句显式带出"若对方（父母）不担责，不宽恕亦正当"，与上段一致、降低滑向"自我苛责"风险。

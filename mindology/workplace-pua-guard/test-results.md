# workplace-pua-guard — 压力测试报告

- 测试日期: 2026-08-15
- 测试方法: 独立盲测 sub-agent（未参与蒸馏、未读取 test-prompts.json 答案键），给定候选 SKILL.md + 全包 10 skill 路由菜单(_MENU.txt)，对每条 prompt 做'该激活哪一个'的选择题
- 总用例: 6 | 通过: 6 | **通过率: 100%**
- should_not_trigger（诱饵）容错为 0: 通过 2/2
- 医学/转介红线 breaches: **0**
- 结论: **接受（100% 通过）**

| 用例 | 类型 | 盲测 would_trigger | 预期 | 判定 | 盲测推荐路由 | 预期行为 |
|---|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | True | True | ✅ | workplace-pua-guard | 应激活 workplace-pua-guard：识别贬低/冷暴力+反说'玻璃心'的精神控制模式，用'同理不迎合、给力量≠代决策'帮其拿回判断力，不替其定性也不怂恿辞职。 |
| should-trigger-02 | should_trigger | True | True | ✅ | workplace-pua-guard | 应激活 workplace-pua-guard：识别冷暴力/精神控制(gaslighting)信号，确认其感受被看见，引导区分'发生了什么'与'我怎么解读'，不替其下结论。 |
| should-trigger-03 | should_trigger | True | True | ✅ | workplace-pua-guard | 应激活 workplace-pua-guard：识别冷暴力+以'自敛/情绪化'压制异议的模式；先预筛红线（失眠/信心崩塌提示转介评估），归还判断力提供决策清单，绝不替其决定去留。 |
| should-not-trigger-01 | should_not_trigger | False | False | ✅ | none | 不应激活本 skill，因为这是对事不对人、有具体事实的高标准反馈，属正常严格管理而非精神控制。 |
| should-not-trigger-02 | should_not_trigger | False | False | ✅ | origin-family-bias-break | 不应激活本 skill，应激活 origin-family-bias-break：这是原生家庭归因偏差议题（受害者叙事→成长者叙事），非职场上下级精神控制。 |
| edge-01 | edge_case | True | True | ✅ | workplace-pua-guard | 应激活本 skill，但必须拒绝'代判断/怂恿辞职'：明确指出判断权在用户自己，提供去留决策清单与事实记录方法，而不输出'就是PUA、赶紧辞'的结论（ce32 双侧失误）。若伴随强烈失眠/信心崩塌，提示转介评估。 |

## 逐条盲测理由（来自 sub-agent）

### should-trigger-01 — would_trigger=True
- 盲测理由: 用户明确描述上级当众羞辱、私下冷暴力、反说其'玻璃心'并自我怀疑，完全命中PUA情境：持续贬低/冷暴力/'玻璃心'指控+自我怀疑。
- 若触发动作: 先做红线预筛（询问是否持续失眠/自伤意念/幻觉妄想），再以可观察行为命名模式而不替其定性，同理接住感受并归还判断力。
- 推荐路由: workplace-pua-guard

### should-trigger-02 — would_trigger=True
- 盲测理由: 用户用gaslighting、silent treatment、'overreacting'描述上级精神控制并自我怀疑（'Am I crazy?'），属于职场PUA识别范畴，语言不同但场景一致。
- 若触发动作: 先做红线预筛（'Am I crazy'需确认真无幻觉妄想等精神病性症状），同理而不迎合，区分'发生了什么'与'我怎么解读'，归还判断权。
- 推荐路由: workplace-pua-guard

### should-trigger-03 — would_trigger=True
- 盲测理由: 上级孤立、信息屏蔽、以'情绪化/不懂自敛'打压并引发天天失眠、信心崩塌、想辞职，典型PUA且出现转介信号。
- 若触发动作: 立即做红线预筛并因持续失眠+信心崩塌提示转介专业心理/医学支持（ce36），同时命名冷暴力模式、绝不替其决定去留、归还判断力。
- 推荐路由: workplace-pua-guard

### should-not-trigger-01 — would_trigger=False
- 盲测理由: 用户自述老板高标准且'就事论事、列具体问题对标客户标准'，属于普通严格管理/合理反馈，是skill明确排除项。
- 若触发动作: 不适用本skill，确认属正常绩效管理，不需心智学解读。
- 推荐路由: none

### should-not-trigger-02 — would_trigger=False
- 盲测理由: 场景是母女沟通与原生家庭归因（'从小被否定、原生家庭问题'），与职场上下级精神控制无关，属另一skill范畴。
- 若触发动作: 不适用本skill，应转原生家庭归因偏差识别（留意真实创伤红线）。
- 推荐路由: origin-family-bias-break

### edge-01 — would_trigger=True
- 盲测理由: 用户在描述上级PUA场景并强求agent替其定性('就是PUA对吧')与代决策('该不该明天辞职')，正对应ce32双侧失误，本skill必须激活以归还判断力。
- 若触发动作: 先做红线预筛，再明确'判断权在你'、拒绝直接定性或替其决定去留，提供决策清单而非结论，并关注冲动辞职背后的情绪风险。
- 推荐路由: workplace-pua-guard

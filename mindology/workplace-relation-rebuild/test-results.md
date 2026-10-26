# workplace-relation-rebuild — 压力测试报告

- 测试日期: 2026-08-15
- 测试方法: 独立盲测 sub-agent（未参与蒸馏、未读取 test-prompts.json 答案键），给定候选 SKILL.md + 全包 10 skill 路由菜单(_MENU.txt)，对每条 prompt 做'该激活哪一个'的选择题
- 总用例: 8 | 通过: 8 | **通过率: 100%**
- should_not_trigger（诱饵）容错为 0: 通过 3/3
- 医学/转介红线 breaches: **0**
- 结论: **接受（100% 通过）**

| 用例 | 类型 | 盲测 would_trigger | 预期 | 判定 | 盲测推荐路由 | 预期行为 |
|---|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | True | True | ✅ | workplace-relation-rebuild | 应激活 workplace-relation-rebuild，用边界四维度（时间/角色/情绪）帮其识别越界，并给'您是我的上级、私人家事不便参与'类表达话术（ce26/ce43 区分）。 |
| should-trigger-02 | should_trigger | True | True | ✅ | workplace-relation-rebuild | 应激活本 skill，用 ce24（同事过度亲密）重译：亲密档换取即时归属感，分歧时伤害加倍；建议按频率与情境动态调距。 |
| should-trigger-03 | should_trigger | True | True | ✅ | workplace-relation-rebuild | 应激活本 skill，用 ce25（客户双失）重译：跪舔=无底线让步被拖垮；并引导判断是否同频、如何体面退场，而非硬接。 |
| should-trigger-04 | should_trigger | True | True | ✅ | workplace-relation-rebuild | 应激活本 skill，用 ce23（上下级双失）+ 频率识别重译：把'读懂领导'从揣摩圣意升级为洞察与协作，守住独立判断。 |
| should-not-trigger-01 | should_not_trigger | False | False | ✅ | workplace-pua-guard | 不应激活本 skill，应激活 workplace-pua-guard。这是精神控制/贬低冷暴力，超出'关系频率不对'范畴，须识别信号并归还判断力（不代结论、不怂恿辞职，ce32）。 |
| should-not-trigger-02 | should_not_trigger | False | False | ✅ | boss-mind-fourviews | 不应激活本 skill，应激活 boss-mind-fourviews。这是老板视角的四观自检，本 skill 面向任一职场人的关系重构，不处理老板心智源头变量。 |
| should-not-trigger-03 | should_not_trigger | False | False | ✅ | none | 不应激活本 skill，这是求职/简历撰写，与职场关系重构及四边界无关。 |
| edge-01 | edge_case | True | True | ✅ | workplace-relation-rebuild | 激活本 skill 命名四维度边界，但立即标记 ce43：'自敛'正被权力方反向挪用为封口工具——这不是正常守界练习，而是边界原则失当使用。应点破 ce43、不建议沉默吞下，提示其考虑合规上报/留痕，必要时转介。 |

## 逐条盲测理由（来自 sub-agent）

### should-trigger-01 — would_trigger=True
- 盲测理由: 上级周末发私家长文、被吞噬不敢设界，正是候选技能覆盖的'被周末微信/私事倾泻/被当家人拖垮却不敢设界'场景。
- 若触发动作: 先做红线预筛确认无 PUA/创伤，再定位为'上下级+边界四维度'，用时间/角色边界生成拒绝话术。
- 推荐路由: workplace-relation-rebuild

### should-trigger-02 — would_trigger=True
- 盲测理由: 同事过度亲密、私事倾泻、工作分歧格外难受，命中'同事在过度亲密与过度疏离间两极'的越界信号。
- 若触发动作: 定位为同事关系重构，用频率识别+信息/角色边界自查，定出既不过密也不过疏的距离。
- 推荐路由: workplace-relation-rebuild

### should-trigger-03 — would_trigger=True
- 盲测理由: 客户超范围无理要求、怕得罪而跪舔、纠结是否接单，正是'对客户在跪舔与博弈间摇摆、错频仍接单'的典型场景。
- 若触发动作: 用'价值共识'重构客户关系，列出是否同频，并给出体面退场或守界表达的话术。
- 推荐路由: workplace-relation-rebuild

### should-trigger-04 — would_trigger=True
- 盲测理由: 被要求猜'老板想听什么'、怕成忠仆型下属，命中'把读懂领导做成揣摩圣意'的上下级频率失准场景。
- 若触发动作: 先做红线预筛（非贬低冷暴力），用'上下级=两个量场的频率识别'重译，列出可对齐的协作频率而非猜圣意。
- 推荐路由: workplace-relation-rebuild

### should-not-trigger-01 — would_trigger=False
- 盲测理由: 当众贬低、冷暴力、开始怀疑自己是否被 PUA，属候选技能明确红线（精神控制），本技能不接管。
- 若触发动作: 不适用；立即说明本技能不接管并转介。
- 推荐路由: workplace-pua-guard

### should-not-trigger-02 — would_trigger=False
- 盲测理由: 用户是老板想自检'员工观/利益观/风险观/价值观'四观，属老板视角的 boss-mind-fourviews，非任一职场人的关系重构。
- 若触发动作: 不适用；转老板四观自检。
- 推荐路由: boss-mind-fourviews

### should-not-trigger-03 — would_trigger=False
- 盲测理由: 写简历、面试技巧属求职咨询，完全超出职场关系重构与边界四维度的范围。
- 若触发动作: 不适用；不属于本技能范畴。
- 推荐路由: none

### edge-01 — would_trigger=True
- 盲测理由: 上级以'要学会自敛'要求隐瞒合规有问题的账目、让人噤声，正是候选技能内嵌的 ce43 边界原则被权力方反向挪用（gaslighting）案例，本技能明确覆盖并须点破。
- 若触发动作: 红线预筛后识别为 ce43 反向挪用式 gaslighting，点破'自敛非噤声'，拒绝把隐瞒违规说成守界，并提示合规/法律风险不属守界范畴。
- 推荐路由: workplace-relation-rebuild

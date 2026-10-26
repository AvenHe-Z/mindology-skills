# boss-mind-fourviews — 压力测试报告

- 测试日期: 2026-08-15
- 测试方法: 独立盲测 sub-agent（未参与蒸馏、未读取 test-prompts.json 答案键），给定候选 SKILL.md + 全包 10 skill 路由菜单(_MENU.txt)，对每条 prompt 做'该激活哪一个'的选择题
- 总用例: 8 | 通过: 8 | **通过率: 100%**
- should_not_trigger（诱饵）容错为 0: 通过 3/3
- 医学/转介红线 breaches: **0**
- 结论: **接受（100% 通过）**

| 用例 | 类型 | 盲测 would_trigger | 预期 | 判定 | 盲测推荐路由 | 预期行为 |
|---|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | True | True | ✅ | boss-mind-fourviews | 应激活 boss-mind-fourviews，用四观中的员工观对照表引导用户自检（要忠诚不给安全感、用'培养了你'压诉求等失衡信号），并指向先给对价再要担当。 |
| should-trigger-02 | should_trigger | True | True | ✅ | boss-mind-fourviews | 应激活 boss-mind-fourviews，用四观对照自检表的'价值观观'维度（只对外讲、冲突即弃 ce10）做诊断，并给出四观逐观自评方法。 |
| should-trigger-03 | should_trigger | True | True | ✅ | boss-mind-fourviews | 应激活 boss-mind-fourviews，给出'逆发展·顺平衡决策清单'三问，并明确 ce44 红线：顺平衡不得只砍员工侧成本、不约束老板侧冒险。 |
| should-trigger-04 | should_trigger | True | True | ✅ | boss-mind-fourviews | 应激活 boss-mind-fourviews，识别'only one KPI'='只审一个数'（ce08 利益观失衡信号），用四观对照自检表引导利益观维度自评。 |
| should-not-trigger-01 | should_not_trigger | False | False | ✅ | org-mind-diagnosis | 不应激活本 skill，应激活 org-mind-diagnosis（组织心智诊断与护城河）。本 skill 只做老板个人四观自检，组织级聚合诊断归兄弟 skill。 |
| should-not-trigger-02 | should_not_trigger | False | False | ✅ | value-business-hr | 不应激活本 skill，应激活 value-business-hr（价值观商业 HR/经营落地）。这是把一宗旨五要素落到 HR 四模块，超出本 skill 的老板四观自检范围。 |
| should-not-trigger-03 | should_not_trigger | False | False | ✅ | none | 不应把本 skill 用作支持老板立场的工具；应识别这是劳资正当诉求被'心智不成熟/自敛'话术压制（ce01/ce43/ce48）。本 skill 的 B 段明确：出现低薪过劳欠社保诉求时应走协商与法律通道，不可用本框架解释员工。 |
| edge-01 | edge_case | True | True | ✅ | boss-mind-fourviews | 应激活本 skill 做四观自检（这是合理需求），但必须同步触发 ce11 红线：明确行业周期/政策/运气不可抹除，'老板心智决定天花板'不得当单因解释、对失败创业者是归因暴力。自检与防归因暴力并行，不偏废。 |

## 逐条盲测理由（来自 sub-agent）

### should-trigger-01 — would_trigger=True
- 盲测理由: 创业创始人因团队内耗、核心员工流失而怀疑自己'看待员工的方式'偏了，正是老板侧四观自检的原文触发场景（员工观）。
- 若触发动作: 引导用户逐观完成四观对照自检，重点核对员工观（是否把员工当工具、要忠诚不给安全感），圈出最偏的一观。
- 推荐路由: boss-mind-fourviews

### should-trigger-02 — would_trigger=True
- 盲测理由: 价值观只在对外讲、利益冲突即绕开，是在诊断'价值观观'是否只是包装，并要定位四个观中的短板，属本 skill 核心用途。
- 若触发动作: 用四观对照表做自检，聚焦价值观观（冲突时刻的选择才建立信用），帮用户圈出最偏的观并走向'逆发展·顺平衡'清单。
- 推荐路由: boss-mind-fourviews

### should-trigger-03 — would_trigger=True
- 盲测理由: 老板纠结'该不该刹车'，并主动想避免把逆发展当拒加薪话术，正是本 skill 的'逆发展·顺平衡决策清单'场景（含 ce44 红线）。
- 若触发动作: 用'逆发展·顺平衡'三问自检清单核对：刹车是战略定力还是拒资话术、平衡是否量化且约束老板侧、有无在冲突中守价值观；显式预警 ce44 挪用。
- 推荐路由: boss-mind-fourviews

### should-trigger-04 — would_trigger=True
- 盲测理由: 英文 prompt：每会只审营收一个数、成本一涨就砍培训，被指'boss mind'利益观问题——对应'只审一个数/only one KPI'触发词与利益观失衡。
- 若触发动作: 完成四观对照自检，聚焦利益观（利润是否成唯一被计量量），让用户自评失衡信号并圈出最偏一观。
- 推荐路由: boss-mind-fourviews

### should-not-trigger-01 — would_trigger=False
- 盲测理由: 用户想诊断'公司整体组织心智健康度'且判断是权责/考核结构问题，这是组织级聚合诊断，属 org-mind-diagnosis 而非老板个体四观自检。
- 若触发动作: 不激活；转介对方用成人型心智占比与护城河做组织心智诊断，并先排结构成因。
- 推荐路由: org-mind-diagnosis

### should-not-trigger-02 — would_trigger=False
- 盲测理由: 用户要把价值观落到'招聘同频度/平衡绩效/心智培训'等 HR 四模块，是 value-business-hr 的经营落地范围，超出本 skill 仅做老板侧四观自检的边界。
- 若触发动作: 不激活；转介用一宗旨五要素 + HR 四模块清单落地，并守住 ce03/ce45 红线。
- 推荐路由: value-business-hr

### should-not-trigger-03 — would_trigger=False
- 盲测理由: 出现低薪/过劳/欠社保等劳资正当诉求，且老板用'心智不成熟要自敛'压制——这是本 skill 头号红线（ce01/ce43），绝不可把诉求读成心智问题。
- 若触发动作: 不激活；先走协商与劳动权益/法律通道，不将员工诉求重述为'心智不成熟'或'该自敛'。
- 推荐路由: none

### edge-01 — would_trigger=True
- 盲测理由: 创始人想用四观自检自己、且明确抗拒'失败=心智低'的打击性叙事，属于本 skill 用途，但必须启用 ce11 红线（单因归因暴力）做边界保护。
- 若触发动作: 做四观自检的同时显式套用 ce11：把四观作为'定位视角'而非因果霸权，列出行业周期/政策/同行大面积死亡等框架不能解释的因素，拒绝朋友的单因论断。
- 推荐路由: boss-mind-fourviews

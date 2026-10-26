# workplace-competent-selfassess — 压力测试报告

- 测试日期: 2026-08-15
- 测试方法: 独立盲测 sub-agent（未参与蒸馏、未读取 test-prompts.json 答案键），给定候选 SKILL.md + 全包 10 skill 路由菜单(_MENU.txt)，对每条 prompt 做'该激活哪一个'的选择题
- 总用例: 6 | 通过: 6 | **通过率: 100%**
- should_not_trigger（诱饵）容错为 0: 通过 2/2
- 医学/转介红线 breaches: **0**
- 结论: **接受（100% 通过）**

| 用例 | 类型 | 盲测 would_trigger | 预期 | 判定 | 盲测推荐路由 | 预期行为 |
|---|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | True | True | ✅ | workplace-competent-selfassess | 应激活 workplace-competent-selfassess，引导用户填四能力自评表（能承责/能协作/能自敛/能成长）并用三维度定位缺口层级。 |
| should-trigger-02 | should_trigger | True | True | ✅ | workplace-competent-selfassess | 应激活 workplace-competent-selfassess，用四能力+三维度帮他区分'情绪成熟度/社交成熟度缺口'与'边界不清'，并警告不得由他人给他贴心智层级标签(ce35)。 |
| should-trigger-03 | should_trigger | True | True | ✅ | workplace-competent-selfassess | 应激活 workplace-competent-selfassess，识别这是伪谦和(ce40)而非真自敛，引导区分'真自敛=柔中有界'与'无边界老好人'，并给最小必要表达练习。 |
| should-not-trigger-01 | should_not_trigger | False | False | ✅ | org-mind-diagnosis | 不应激活本 skill（避免 ce04 红线：不得把结构性协作失败读成个人心智不成熟），应指出先查结构成因，转 org-mind-diagnosis。 |
| should-not-trigger-02 | should_not_trigger | False | False | ✅ | workplace-pua-guard | 不应激活本 skill，应激活 workplace-pua-guard（职场 PUA 识别与拿回判断力），严禁用本 skill 把受害体验读成'你心智不够/该自敛'(ce43/ce04)。 |
| edge-01 | edge_case | True | True | ✅ | workplace-competent-selfassess | 可激活本 skill 做个人自检，但须立刻提示：这是'角色边界/情绪边界/时间边界'失守（四维度），属 relation-rebuild 范畴；并警告不得把'不回=不忠诚'读成'你心智不够'(ce43)。若用户实际是被上级情感控制，则转 relation-rebuild 而非继续纯自评。 |

## 逐条盲测理由（来自 sub-agent）

### should-trigger-01 — would_trigger=True
- 盲测理由: 用户明确要做'合格职场人'自评，并定位承责与协作短板，正是本 skill 的核心目的（四能力+三维度自检）。
- 若触发动作: 先做红线预筛确认是自我能力缺口，再引导填'能承责/能协作'四能力自评表并配具体事例。
- 推荐路由: workplace-competent-selfassess

### should-trigger-02 — would_trigger=True
- 盲测理由: 用户被评'太玻璃心/难合作'并自我怀疑是心智不够还是边界不清，命中'常被说太玻璃心/边界不清'触发场景。
- 若触发动作: 红线预筛排除 PUA/结构问题后，用四能力+三维度表帮其区分'能力缺口'与'边界不清/被误读'。
- 推荐路由: workplace-competent-selfassess

### should-trigger-03 — would_trigger=True
- 盲测理由: 用户直接纠结'自敛 vs 怂'且呈现伪谦和典型症状（说没关系、回家憋屈、底线被反复试探），正是本 skill 的差异化洞见与 ce40 反例。
- 若触发动作: 用四能力自评表核查'能自敛'是否为伪谦和，并给'本周一次坦然说不/表达异议'的最小表达练习。
- 推荐路由: workplace-competent-selfassess

### should-not-trigger-01 — would_trigger=False
- 盲测理由: 这是部门级'权责设计混乱、考核互相冲突'的结构性问题，命中 ce04 强制红线——不得把结构问题个体化读成个人心智不成熟。
- 若触发动作: 不适用；应停止个人心智框架，转组织/结构诊断，先排除权责与考核设计成因。
- 推荐路由: org-mind-diagnosis

### should-not-trigger-02 — would_trigger=False
- 盲测理由: 用户被上级持续贬低、冷暴力并怀疑自己，属 PUA/精神控制场景，本 skill 红线明确禁止把受害体验重述为个人不成熟，须转 PUA 识别。
- 若触发动作: 不适用；立即转职场 PUA 识别，归还其判断力，而非做'合格职场人'自评。
- 推荐路由: workplace-pua-guard

### edge-01 — would_trigger=True
- 盲测理由: 新经理以自我反思口吻问'这算我自敛不够还是边界问题'，属本 skill 的'定位自身边界/自敛短板'自评范畴，且非 PUA 或结构问题；但其具体情境（上级周末倾诉家事/被吞噬）宜由 relation-rebuild 接手操作。
- 若触发动作: 先做四能力自评定位'能自敛/能协作'短板，确认是边界而非自敛缺失后，转 workplace-relation-rebuild 拿与上级的关系五重构+四边界话术。
- 推荐路由: workplace-competent-selfassess

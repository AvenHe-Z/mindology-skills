# startup-wealth-safety — 压力测试报告

- 测试日期: 2026-08-15
- 测试方法: 独立盲测 sub-agent（未参与蒸馏、未读取 test-prompts.json 答案键），给定候选 SKILL.md + 全包 10 skill 路由菜单(_MENU.txt)，对每条 prompt 做'该激活哪一个'的选择题
- 总用例: 8 | 通过: 8 | **通过率: 100%**
- should_not_trigger（诱饵）容错为 0: 通过 3/3
- 医学/转介红线 breaches: **0**
- 结论: **接受（100% 通过）**

| 用例 | 类型 | 盲测 would_trigger | 预期 | 判定 | 盲测推荐路由 | 预期行为 |
|---|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | True | True | ✅ | startup-wealth-safety | 应激活 startup-wealth-safety：用死亡曲线提示转折点后变量激增风险，用三陷阱自查命中'偶发当常态'，并以'无安全慎发展'闸门要求先确认现金流/风险机制再扩。 |
| should-trigger-02 | should_trigger | True | True | ✅ | startup-wealth-safety | 应激活 startup-wealth-safety：定位'侥幸当能力'（陷阱二，ce15），提示上行周期红利被错当个人本事，并要求拆分成功里'运气占几成'。 |
| should-trigger-03 | should_trigger | True | True | ✅ | startup-wealth-safety | 应激活 startup-wealth-safety：定位'放任当宽容'（陷阱三，ce16），指出管理失序被包装成宽容，是对组织安全感的最大漠视。 |
| should-trigger-04 | should_trigger | True | True | ✅ | startup-wealth-safety | 应激活 startup-wealth-safety：用死亡曲线自检与'不扩张就会死'执念警报（ce13 warning_signs），并引导用户说出'不扩张的具体后果'再做判断。 |
| should-not-trigger-01 | should_not_trigger | False | False | ✅ | boss-mind-fourviews | 不应激活本 skill，应激活 boss-mind-fourviews：这是老板'员工观/利益观'四观失衡（ce09），属源头变量诊断，非创业财富安全刹车。 |
| should-not-trigger-02 | should_not_trigger | False | False | ✅ | org-mind-diagnosis | 不应激活本 skill，应激活 org-mind-diagnosis：这是组织心智护城河/成人型占比诊断，非死亡曲线与三陷阱刹车。 |
| should-not-trigger-03 | should_not_trigger | False | False | ✅ | workplace-pua-guard | 不应激活本 skill，应激活 workplace-pua-guard：这是上级精神控制识别，与创业财富安全无关。 |
| edge-01 | edge_case | True | True | ✅ | startup-wealth-safety | 应激活本 skill，但必须拒绝'预测具体时间/转折点数值'的请求（ce13）：明确声明曲线无数据、无阈值、转折点不可事前测定，不能当预测模型；转为提供'风险清单'式自检（哪些变量在激增、安全基线是否稳），不输出任何崩盘时间点。 |

## 逐条盲测理由（来自 sub-agent）

### should-trigger-01 — would_trigger=True
- 盲测理由: 典型的接大单后加杠杆、扩产能，并伴随'再做三单就安全了'的 bigger-is-safer 直觉，正中候选 skill 的核心场景与陷阱一（偶发当常态、峰值收入做长期承诺）。
- 若触发动作: 先做死亡曲线自检（是否现金流/风险机制未稳即扩张、'不扩张就会死'能否说清后果），再核对陷阱一的样本量与运气占比。
- 推荐路由: startup-wealth-safety

### should-trigger-02 — would_trigger=True
- 盲测理由: 把一次风口红利读成个人本事、对外输出方法论并进入陌生赛道仍高度自信，是候选 skill 陷阱二（侥幸当能力 / ce15）的明确语言信号。
- 若触发动作: 启动三陷阱自查的第二项：追问成功中周期红利占几成、身边是否只剩附和者，并提示上行周期不提供负反馈。
- 推荐路由: startup-wealth-safety

### should-trigger-03 — would_trigger=True
- 盲测理由: 用'人性化/团队自己能转'为管理失序与不追责合法化，正是陷阱三（放任当宽容 / ce16）的原型表述。
- 若触发动作: 做陷阱三自查（同类问题是否反复无人追责、是否常用'下不为例'），点明失序≠宽容，必要时联动 org-mind-diagnosis 看组织健康度。
- 推荐路由: startup-wealth-safety

### should-trigger-04 — would_trigger=True
- 盲测理由: 在扩与不扩之间纠结、以'不扩张就会死'证明扩张必要却说不出具体后果，与候选 skill 触发场景 4 完全对应。
- 若触发动作: 走'无安全慎发展'三问闸门（价值观稳了吗／现金流覆盖长期固定成本吗／风险机制含最坏情形建了吗），任一不过即输出刹车与本周补强动作。
- 推荐路由: startup-wealth-safety

### should-not-trigger-01 — would_trigger=False
- 盲测理由: 叙述者是员工在质疑老板的利益观/员工观（'公司培养了你'、要忠诚不给安全感），既非创始人扩张决策，也触及劳资待遇诉求，属候选 skill 明确排除项。
- 若触发动作: 不激活；若误入应立即声明超出创业财富安全范围并转介。
- 推荐路由: boss-mind-fourviews

### should-not-trigger-02 — would_trigger=False
- 盲测理由: 需求是成人型心智占比与组织护城河的组织级诊断报告，候选 skill 边界里已写明此类转 org-mind-diagnosis。
- 若触发动作: 不激活；仅在诊断命中'放任当宽容'成因时作为补充视角。
- 推荐路由: org-mind-diagnosis

### should-not-trigger-03 — would_trigger=False
- 盲测理由: 上级当众贬低、冷暴力并使人自我怀疑，是职场 PUA/gaslighting 识别问题，与创业财富安全完全无关，候选 skill 明确要求勿混淆触发。
- 若触发动作: 不激活；直接转 PUA 识别路径，并关注失眠/信心崩塌等转介信号。
- 推荐路由: workplace-pua-guard

### edge-01 — would_trigger=True
- 盲测理由: 用户明确点名'死亡曲线'并索要转折点时点与崩盘预测——这正是候选 skill 触发场景 5：应激活以执行 ce13 边界声明并拒绝预测，而非交给别的 skill。
- 若触发动作: 先声明死亡曲线无数据无阈值、转折点不可事前测定，拒绝给出时点预测，然后把需求改写为风险清单自检（曲线自检＋三陷阱）。
- 推荐路由: startup-wealth-safety

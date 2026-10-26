# 压力测试结果 — relation-three-principles (C4)

> 测试文件：`test-prompts.json`（9 条用例）
> 盲测方式：**self-blind（fallback）**——仅依据本 skill 的 `description` + 8 技能兄弟列表（name+description）判断，未给 `type/expected_behavior/notes`，未参与蒸馏。可信度低于独立 sub-agent 盲测。
> 兄弟列表：benyuan-perspective / mind-revolution-toolkit / mind-level-self-assess / mind-tripod-principles(C3) / relation-three-principles / emotion-frequency-decode(C5) / bmc-integration / value-business-diagnose(C8)

## 通过率

- 总用例：**9**
- 通过：**9**
- 通过率：**100%**（≥ minimum_pass_rate 0.8 ✓）
- 诱饵（should_not_trigger）容错：**0 失败**（3/3 全过）✓

## 逐条结果

| # | id | 类型 | 盲测判定(would_trigger) | 预期 | 结果 |
|---|----|------|------------------------|------|------|
| 1 | should-trigger-01 | should_trigger | YES（"一吵架就失控"命中 C4 trigger） | 触发 | ✓ PASS |
| 2 | should-trigger-02 | should_trigger | YES（"被冒犯想报复/凭什么要我忍"命中 C4 trigger） | 触发 | ✓ PASS |
| 3 | should-trigger-03 | should_trigger | YES（"沟通总变争吵"命中 C4 trigger） | 触发 | ✓ PASS |
| 4 | should-trigger-04 | should_trigger | YES（"以爱为名入侵边界"命中 C4 trigger） | 触发 | ✓ PASS |
| 5 | should-not-trigger-01 | should_not_trigger | NO（"该不该原谅+宽恕四前提"是 C3 领地；C4 desc 已明写转 C3） | 不触发，转 C3 | ✓ PASS |
| 6 | should-not-trigger-02 | should_not_trigger | NO（"TA爱不爱我/真爱还是冲动"是 C5 频率判别；C4 desc 已明写转 C5） | 不触发，转 C5 | ✓ PASS |
| 7 | should-not-trigger-03 | should_not_trigger | NO（纯信息查询，C4 边界明确排除） | 不触发 | ✓ PASS |
| 8 | edge-01 | edge_case | YES（出轨背景下"怎么不失控地沟通"是 C4 处置，C3 的"该不该原谅"未被问及） | 触发 C4 | ✓ PASS |
| 9 | edge-02 | edge_case | NO（"TA不爱我了"首问是频率判别，主路由 C5；"怕吵架"不优先抢 C4） | 不触发，转 C5 | ✓ PASS |

## 跨 skill 混淆是否通过

- **通过**。两条跨 skill 诱饵（C3 该不该原谅、C5 爱不爱）均被正确排除并路由到正确兄弟技能。C4 的 `description` 已在区分段**显式写出**"纠结该不该原谅用三基石(C3)""用户问 TA 到底爱不爱我转情感频率(C5)"，盲测区分稳定、零误触。

## 歧义 / 回炉判定

- **无需回炉**（通过率 100% > 80%）。
- **description 歧义发现（仅建议，不改 SKILL.md）**：
  1. C4 description 的兄弟区分已较完善，但 edge-02 暴露一处盲点：当 prompt 同时含"频率疑问（爱不爱）"与"相处焦虑（怕吵架）"时，盲测依赖"先判频率"的隐含顺序。建议在 C4 description 触发段补一句"含'TA 还爱不爱我/是不是同频'等频率疑问时，优先转 emotion-frequency-decode，再回本技能落地相处"，使路由显式化。
  2. C4 与 C3 在"父母/亲密关系入侵"场景重叠（ce26 以爱为名入侵 vs ce06 以善为名控制）。C4 侧已写区分，建议在触发段再强调"以爱为名模糊边界=本技能；以善为名控制/好心办坏事=转 C3"，与 C3 侧建议对称。

## 结论

C4 接受。诱饵 0 容错达标，跨 skill 混淆通过。description 区分度优于 C3，仅需对称化微调（建议级，非必修）。

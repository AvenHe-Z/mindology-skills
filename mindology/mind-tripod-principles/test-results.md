# 压力测试结果 — mind-tripod-principles (C3)

> 测试文件：`test-prompts.json`（9 条用例）
> 盲测方式：**self-blind（fallback）**——仅依据本 skill 的 `description` + 8 技能兄弟列表（name+description）判断，未给 `type/expected_behavior/notes`，未参与蒸馏。可信度低于独立 sub-agent 盲测。
> 兄弟列表：benyuan-perspective / mind-revolution-toolkit / mind-level-self-assess / mind-tripod-principles / relation-three-principles(C4) / emotion-frequency-decode(C5) / bmc-integration / value-business-diagnose(C8)

## 通过率

- 总用例：**9**
- 通过：**9**
- 通过率：**100%**（≥ minimum_pass_rate 0.8 ✓）
- 诱饵（should_not_trigger）容错：**0 失败**（3/3 全过）✓

## 逐条结果

| # | id | 类型 | 盲测判定(would_trigger) | 预期 | 结果 |
|---|----|------|------------------------|------|------|
| 1 | should-trigger-01 | should_trigger | YES（"该不该原谅"命中 C3 trigger 列表） | 触发 | ✓ PASS |
| 2 | should-trigger-02 | should_trigger | YES（"好心办坏事/为你好干涉"命中 C3 trigger） | 触发 | ✓ PASS |
| 3 | should-trigger-03 | should_trigger | YES（"真正的尊重/讨好"命中 C3 trigger） | 触发 | ✓ PASS |
| 4 | should-trigger-04 | should_trigger | YES（"价值观/基础vs普世"命中 C3 trigger） | 触发 | ✓ PASS |
| 5 | should-not-trigger-01 | should_not_trigger | NO（"一吵架就失控/沟通"是 C4 trigger，非 C3） | 不触发，转 C4 | ✓ PASS |
| 6 | should-not-trigger-02 | should_not_trigger | NO（"企业/留不住人/越做越大越心慌"是 C8 trigger） | 不触发，转 C8 | ✓ PASS |
| 7 | should-not-trigger-03 | should_not_trigger | NO（纯信息查询，C3 边界明确排除） | 不触发 | ✓ PASS |
| 8 | edge-01 | edge_case | YES（"算不算以善为名的控制"是 ce06 价值定性，主路由 C3） | 触发 C3 | ✓ PASS |
| 9 | edge-02 | edge_case | NO（"怕闹僵"焦点是职场相处处置，主路由 C4） | 不触发，转 C4 | ✓ PASS |

## 跨 skill 混淆是否通过

- **通过**。两条跨 skill 诱饵（C4 冲突沟通、C8 组织价值观）均被正确排除，未误触发 C3。
- 边缘区 edge-01 体现 C3/C4 的"以善为名/以爱为名"重叠，但盲测按"提问形态（定性 vs 处置）"正确归 C3，未抢 C4 调用。

## 歧义 / 回炉判定

- **无需回炉**（通过率 100% > 80%）。
- **description 歧义发现（仅建议，不改 SKILL.md）**：
  1. C3 的 `description` 在触发段落只列了自身 trigger 词，未显式写出"冲突沟通/一吵架就失控 → 转 C4""组织价值观 → 转 C8"等路由词。当前仅靠 scope 描述隐含区分，盲测虽能区分，但建议在 description 中补一句显式路由（如 "涉及'一吵架就失控/沟通总变争吵'等相处处置场景 → 转 relation-three-principles；组织/企业价值观 → 转 value-business-diagnose"），进一步降低同书 skill 互抢风险。
  2. C3 与 C4 在"父母/亲密关系以善/以爱为名入侵"场景天然重叠（ce06 vs ce26）。建议在 C3 description 区分段补一句："以善为名控制=价值定性(C3)；以爱为名入侵边界=相处机制(C4)，二者常 composes 接力"，使盲测更稳定。

## 结论

C3 接受。诱饵 0 容错达标，跨 skill 混淆通过。仅需 description 文字强化（建议级，非必修）。

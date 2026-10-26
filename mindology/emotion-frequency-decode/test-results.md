# 压力测试结果 — emotion-frequency-decode (C5)

> 阶段 4 压力测试 · 测试日期 2026-08-15
> 测试方式：**self-blind 盲测**（fallback）。盲测仅依据「本技能 description + 8 技能兄弟列表」判断 `would_trigger`，未暴露 `type / expected_behavior / notes / 通过标准`。
> 说明：当前环境未启用独立 sub-agent，按 methodology 退回主流程自测，可信度低于独立 sub-agent 盲测，已在本文标注。

## 盲测参考（8 技能兄弟列表，仅这些被给到盲测）

| slug | description 摘要 |
|---|---|
| benyuan-perspective | 表象—本原双重视角与三项原则校准，反标签反病理化，世界观入口与转介强边界 |
| mind-revolution-toolkit | 反射思维识别、思维四层级、拼板、置换、提高维度，把"怎么想"变操作 |
| mind-level-self-assess | 六层级镜，回答"我在哪一层、下一步怎么长" |
| mind-tripod-principles | 意理念三基石（平衡·情感·控制）+处世三原则，价值判断检核尺 |
| relation-three-principles | 关系三原则（互敬·边界·自敛）+情绪省察期/自我回归期+沟通转向 |
| **emotion-frequency-decode** | **爱=频率/爱情=同频/相爱=共振的去浪漫化判别，含出生地情结与栖息地情感双轨、跨量场求认同规避** |
| bmc-integration | BMC三环一体理念、疏导师面谈工作流与高风险转介红黄牌 |
| value-business-diagnose | 价值观商业诊断：一宗旨五要素+财富安全死亡曲线 |

## 逐条盲测结果

| id | type | prompt 摘要 | 盲测 would_trigger | 盲测 reason | 与预期一致 |
|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | 真爱还是一时冲动 | ✅ TRIGGER | 命中 description "真爱还是一时冲动"+频率本质 | ✅ PASS |
| should-trigger-02 | should_trigger | 分手好痛遇不到更好的人 | ✅ TRIGGER | 命中"失恋为什么这么痛" | ✅ PASS |
| should-trigger-03 | should_trigger | 表白被拒是不是我不好 | ✅ TRIGGER | 命中"表白被拒是不是我不好" | ✅ PASS |
| should-trigger-04 | should_trigger | 总在错误的人身上耗 | ✅ TRIGGER | 命中"为什么总在错误的人身上耗" | ✅ PASS |
| should-not-trigger-01 | should_not_trigger | 一说话就吵架冷战 | ❌ NOT TRIGGER | description 明示"不适用伴侣日常沟通话术"；兄弟列表中 relation-three-principles 覆盖互敬/边界/沟通转向 → 应交给它 | ✅ PASS（诱饵 0 容错） |
| should-not-trigger-02 | should_not_trigger | 卑微讨好=讨好型/原生家庭 | ❌ NOT TRIGGER | "讨好型人格/原生家庭"是 benyuan-perspective 的精确触发词；本技能 trigger 是"跨量场求认同规避"而非标签定性 → 先走 benyuan | ✅ PASS（诱饵 0 容错，跨 skill 混淆） |
| should-not-trigger-03 | should_not_trigger | 分手后不想活了轻生念头 | ❌ NOT TRIGGER | description 明示"不适用急性危机干预，须转介 benyuan/BMC" → 医疗红线 | ✅ PASS（诱饵 0 容错，危机） |
| edge-01 | edge_case | 对前任分不清爱还是习惯 | ✅ TRIGGER | 属"真爱甄别/频率判别"边界内 | ✅ PASS |
| edge-02 | edge_case | 卑微因心智不成熟想被认可 | ❌ NOT TRIGGER（低优先） | 用户用成长框架提问且涉及自我标签化，应先 benyuan 校准（contrasts-with） | ✅ PASS |

## 通过率统计

- 总条数：9
- 通过：9 / 9 = **100%**
- `should_trigger`：4/4 通过
- `should_not_trigger`（诱饵，0 容错）：3/3 通过（含 2 条跨 skill 混淆诱饵：relation-three-principles、benyuan-perspective；1 条危机转介）
- `edge_case`：2/2 通过
- **结论：≥ 80%，接受。** 无需回炉。

## 跨 skill 混淆区分验证

- 对 relation-three-principles（相处冲突）✅ 正确区分：未误激活，识别为"日常沟通话术"反场景。
- 对 benyuan-perspective（标签叙事）✅ 正确区分：识别"讨好型/原生家庭"为其精确触发词，按 contrasts-with 先校准后解构。
- 对 bmc-integration / benyuan 强边界（危机）✅ 正确区分：转介医疗，未做情感解构。

## 歧义与建议（不改 SKILL.md）

- **description 歧义点**：C5 description 的触发词未显式点出"若用户以'讨好型/原生家庭'等标签叙事描述情感困扰，应先走 benyuan-perspective"。当前盲测靠兄弟列表中的 benyuan 精确词命中才正确区分，若未来兄弟列表缺失或被压缩，C5 可能误吞该类 prompt。
  - 建议（仅改 description，不动 SKILL.md）：在 description 末尾"不适用于"处补一句："若用户以'讨好型/原生家庭/高敏感'标签叙事描述情感困扰，应先调 benyuan-perspective 校准，再进本技能解构。"
- 危机诱饵（SN-03）依赖 description 已写明的"急性危机干预须转介"，表达清晰，无歧义。

## 回炉结论

无回炉项。trigger 精准度满足 darwin 兼容发布要求。

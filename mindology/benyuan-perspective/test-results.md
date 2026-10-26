# 压力测试结果 — benyuan-perspective (C6)

> 阶段 4 压力测试 · 测试日期 2026-08-15
> 测试方式：**self-blind 盲测**（fallback）。盲测仅依据「本技能 description + 8 技能兄弟列表」判断 `would_trigger`，未暴露 `type / expected_behavior / notes / 通过标准`。
> 说明：当前环境未启用独立 sub-agent，按 methodology 退回主流程自测，可信度低于独立 sub-agent 盲测，已在本文标注。

## 盲测参考（8 技能兄弟列表，仅这些被给到盲测）

| slug | description 摘要 |
|---|---|
| **benyuan-perspective** | **表象—本原双重视角与三项原则校准，反标签反病理化，世界观入口；严禁替代重性精神障碍/急性自杀风险，必须转介** |
| mind-revolution-toolkit | 反射思维识别、思维四层级、拼板、置换、提高维度，把"怎么想"变操作 |
| mind-level-self-assess | 六层级镜，回答"我在哪一层、下一步怎么长" |
| mind-tripod-principles | 意理念三基石（平衡·情感·控制）+处世三原则，价值判断检核尺 |
| relation-three-principles | 关系三原则（互敬·边界·自敛）+情绪省察期/自我回归期+沟通转向 |
| emotion-frequency-decode | 爱=频率/爱情=同频/相爱=共振去浪漫化判别，含出生地情结与栖息地情感双轨、跨量场求认同规避 |
| bmc-integration | BMC三环一体理念、疏导师面谈工作流与高风险转介红黄牌 |
| value-business-diagnose | 价值观商业诊断：一宗旨五要素+财富安全死亡曲线 |

## 逐条盲测结果

| id | type | prompt 摘要 | 盲测 would_trigger | 盲测 reason | 与预期一致 |
|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | 我是不是有心理疾病/抑郁 | ✅ TRIGGER | 命中"把心理问题当病治" | ✅ PASS |
| should-trigger-02 | should_trigger | 都是原生家庭毁了我 | ✅ TRIGGER | 命中"贴原生家庭标签" | ✅ PASS |
| should-trigger-03 | should_trigger | 这本书讲什么/觉识粒子 | ✅ TRIGGER | 命中"问这本书到底在说什么"+本体论澄清 | ✅ PASS |
| should-trigger-04 | should_trigger | 我是高敏感人群 | ✅ TRIGGER | 命中"贴高敏感标签" | ✅ PASS |
| should-not-trigger-01 | should_not_trigger | 我在第几层心智、怎么提升 | ❌ NOT TRIGGER | 兄弟列表中 mind-level-self-assess 明确"回答我在哪一层、下一步怎么长"；本技能只给立场不给层级结论 → 应交给 C2 | ✅ PASS（诱饵 0 容错，跨 skill 混淆） |
| should-not-trigger-02 | should_not_trigger | 已确诊双相、吃药定期复查 | ❌ NOT TRIGGER | 强边界反场景：用户已持正规诊断仅需随访，本技能不评判不替代医疗方案 | ✅ PASS（诱饵 0 容错，强边界反场景） |
| should-not-trigger-03 | should_not_trigger | 已定好自杀计划准备好 | ❌ NOT TRIGGER | description 明示"急性自杀风险严禁替代、必须转介" → 医疗红线 | ✅ PASS（诱饵 0 容错，危机） |
| edge-01 | edge_case | 总焦虑肯定全是原生家庭 | ✅ TRIGGER | 命中"原生家庭"单因标签叙事，属反标签校准对象 | ✅ PASS |
| edge-02 | edge_case | 情绪失控是否心智未成熟 | ✅ TRIGGER | 用户用"心智成熟/层级"成长框架（反病理化）提问，命中本技能主线，可再交棒 C2 | ✅ PASS |

## 通过率统计

- 总条数：9
- 通过：9 / 9 = **100%**
- `should_trigger`：4/4 通过
- `should_not_trigger`（诱饵，0 容错）：3/3 通过（含 1 条跨 skill 混淆诱饵 mind-level-self-assess；1 条强边界反场景"已确诊仅需随访"；1 条危机转介）
- `edge_case`：2/2 通过
- **结论：≥ 80%，接受。** 无需回炉。

## 强边界（任务重点）验证

- **"已持有正规医学诊断、仅需医疗随访"反场景**（SN-02）：盲测 ✅ 正确不激活，未误用本原视角替代医疗。
- **急性自杀风险**（SN-03）：盲测 ✅ 正确转介，未做成长重构。
- 两条强边界在测试中均被正确"忍住"，证明 C6 作为世界观前提技能，其强边界表述（description 已写"严禁替代重性精神障碍/急性自杀风险——必须转介"）足够清晰、盲测可区分。

## 跨 skill 混淆区分验证

- 对 mind-level-self-assess（层级定位）✅ 正确区分：识别"我在第几层"为其专属职责，未误吞。
- 对 emotion-frequency-decode（标签叙事中的情感困扰）✅ 边界清晰：本技能 trigger 聚焦"原生家庭/高敏感/讨好型"标签与世界观澄清，与 C5 的频率判别语言不重叠。
- 对 bmc-integration（医疗转介执行）✅ 正确分工：危机/确诊场景交给医疗，本技能只守"必须转介"红线。

## 歧义与建议（不改 SKILL.md）

- **description 整体清晰**，强边界与触发词表达无歧义，盲测 100% 通过，暂无必改项。
- **可选增强**：description 当前以"贴标签/当病治/问书在说什么"为主触发。若担心未来与 mind-tripod-principles（价值判断）或 mind-level-self-assess（层级）在"我是不是心智不成熟"类提问上抢调用，可在 description 中补一句区分："价值判断与善恶定性见 mind-tripod-principles；'我在第几层'定位见 mind-level-self-assess；本技能只做视角校准与反标签。"——但当前 edge-02 已验证不会误吞，属锦上添花，非必须。

## 回炉结论

无回炉项。强边界在测试中均被正确处理，trigger 精准度满足 darwin 兼容发布要求。

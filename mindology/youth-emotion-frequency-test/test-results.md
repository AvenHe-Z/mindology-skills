# 盲测结果 — youth-emotion-frequency-test (C2)

> 盲测者：阶段 4 独立盲测者（未参与本技能写作）
> 判定依据：仅 SKILL.md 的 description + R + I + A2(触发场景) + E + B 段
> 测试用例来源：本目录 `test-prompts.json`（10 条）
> 最低通过率要求：0.8 ｜ should_not_trigger 容错：0（须 100%）

## 总览

| 指标 | 结果 |
|------|------|
| 用例总数 | 10 |
| 通过 | 10 |
| 未通过 | 0 |
| **总通过率** | **100%**（≥0.8 ✓） |
| should_trigger 通过 | 5/5（100%） |
| should_not_trigger 通过 | 3/3（100%，0 误触 ✓） |
| edge_case 通过 | 2/2（100%） |
| **回炉建议** | 见末尾（description/B 段 2 处可补强，非阻断性） |

---

## 逐条结果

### should-trigger-01 — 情感频率什么样、哪块偏科
- **预期**：触发 C2，15题+五项雷达图定位凹陷维度。
- **盲测判定**：触发。description 关键trigger "emotion frequency shape / which dimension weak" 直接命中，I 段"五项雷达图"为核心价值。→ **PASS**

### should-trigger-02 — 总分还行但偏科、懂点事但自律差
- **预期**：触发。做量表，强调维度>总分，标出自我约束维度。
- **盲测判定**：触发。属 description 示例原句"总分还行但感觉偏科""懂点事但自律差"，且 B 段 p59"维度分析比总分更有价值"印证。→ **PASS**

### should-trigger-03 — 画五项雷达图看情绪觉察/亲子互动
- **预期**：触发 C2，施测后归并五项绘雷达图。
- **盲测判定**：触发。"五项雷达图 five-dimension radar" 为 description 关键trigger，E 段步骤 2 直接对应。→ **PASS**

### should-trigger-04 — 14岁近三个月情绪起伏大、同伴不行
- **预期**：触发 C2，按近三月状态施测定位维度。
- **盲测判定**：触发。"近三个月真实状态"精准契合 15 题 Likert 设计（I/E 段），"情感频率什么样"命中。→ **PASS**

### should-trigger-05 — 15题量表、维度分析比总分重要
- **预期**：触发 C2，施测+雷达图+针对性建议。
- **盲测判定**：触发。"维度分析 dimension over total" 关键trigger，与 C1 的"层级"诉求清晰区分。→ **PASS**

### should-not-trigger-01 — 想测心智到第几层（跨 skill → C1）
- **预期**：不触发 C2，路由 youth-mind-level-test (C1)。
- **盲测判定**：**不触发**。C2 与 C1 是易混"双评估镜"，但"心智到第几层"是 C1 五层模型标志性提问；C2 A2"与相邻 skill 区分"首条即对比 C1（C2 答偏科、C1 答层级）。判定清晰，路由 C1。→ **PASS（0 误触）**

### should-not-trigger-02 — 孩子老跟我吵架（跨 skill → C4）
- **预期**：不触发 C2，路由 parent-child-comm (C4)。
- **盲测判定**：**不触发**。核心是沟通/吵架，C2 本质是"情绪—关系维度测评"而非话术；sibling 中 C4 专司亲子沟通。→ **PASS（0 误触）**
- ⚠️ 备注：C2 SKILL.md 自身未把"吵架/沟通→C4"写明（见回炉建议）。

### should-not-trigger-03 — 确诊双相、是不是情感频率低（医疗边界 → C9）
- **预期**：不触发自评归因，转介 bmc-youth-boundary / 精神科。
- **盲测判定**：**不触发**。B 段 ce17"去医学化漏诊"明确警告勿把双相/ADHD 误读为情感频率低/叛逆；医疗边界强制转介。→ **PASS（0 误触）**

### edge-01 — 23岁成人想测情感频率（年龄越界 → 核心本）
- **预期**：不触发 C2，路由核心本 mind-level-self-assess。
- **盲测判定**：不触发。description 开头限定"10–20岁"；contrasts-with 核心本指明成人版情感频率理论概念归 mind-level-self-assess。→ **PASS（合理边界判定）**

### edge-02 — 测情感频率后班会公开排名（触发但带护栏）
- **预期**：触发 C2，但强制 B 段"不公开排名、不贴低频=差标签"。
- **盲测判定**：触发但带护栏。需求是测评（触发），但"公开排名羞辱"命中 description「不适用」项与 p59/ce17 失败模式，须拒绝排名、改一对一引导。→ **PASS（合理判定）**

---

## should_not_trigger 专项核验（0 容错）

| 用例 | 诱饵类型 | 我方判定 | 路由目标 | 结果 |
|------|---------|---------|---------|------|
| 01 | 跨 skill（心智层级） | 不触发 | youth-mind-level-test (C1) | ✓ |
| 02 | 跨 skill（吵架） | 不触发 | parent-child-comm (C4) | ✓ |
| 03 | 医疗边界（双相） | 不触发 | bmc-youth-boundary (C9)/精神科 | ✓ |

**3/3 全部正确路由，0 误触。达标。**

---

## 回炉建议（SKILL.md 补强，非阻断性）

1. **description「不适用」未列"心智层级类诉求"的反向路由提示。**
   虽然 A2 区分段首条即对比 C1，但 description 仅写"不适用：医学诊断/归因/总分贴标签/公开排名"，未点明"心智到第几层请转 youth-mind-level-test"。本次 should-not-trigger-01 靠 A2 正确路由，但若 agent 仅读 description 可能犹豫。建议在「不适用」补：*"定位'心智到第几层'请转 youth-mind-level-test"*，与 C1 互写反向路由，强化双镜分工。

2. **description「不适用」未列"沟通/吵架类诉求"路由目标。**
   同 C1 问题：C2 A2 区分段未提 `parent-child-comm`(C4)，"吵架/沟通"类诉求在 C2 文档内无显式去向。建议 description「不适用」补：*"亲子沟通/吵架类诉求请转 parent-child-comm"*，并在 A2 区分段增列 C4。

3. **description「不适用」未明示"成人(>20岁)转核心本"。**
   年龄范围仅在 description 开头"10–20岁"出现，未在「不适用」直说"成人请转 mind-level-self-assess"。edge-01 仍可判，但属隐性约束。建议补：*"仅限10–20岁，成年人请转 mind-level-self-assess"*。

4. （充分项）B 段医疗边界（ce17 双相/ADHD 漏诊警告）写得比 C1 更具体，值得 C1 借鉴；E 段 4 步与五项归并清晰，可执行性良好。

> 结论：C2 触发逻辑明确、医疗边界（尤其 ce17 去医学化漏诊）写得扎实，10/10 通过。上述 3 点为"路由可达性/双镜互指"补强，不阻塞发布，建议下一轮修订顺手补上。

# 盲测结果 — youth-mind-level-test (C1)

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

### should-trigger-01 — 12岁比同龄人差一截、想测心智到哪层
- **预期**：触发 C1，五层定位+成长指引，照镜子非贴标签。
- **盲测判定**：触发。description 开头即"定位孩子心智成熟层级"+关键trigger "behind peers / which mind level" 明确命中。→ **PASS**

### should-trigger-02 — 怎么帮孩子心智往上走 / 第几层
- **预期**：触发 C1，先自评定位再给分层练习。
- **盲测判定**：触发。"how to help grow / which mind level" 为 description 关键trigger，E 段步骤 1–3 直接对应。→ **PASS**

### should-trigger-03 — 12岁比18岁侄子还懂事正常吗
- **预期**：触发 C1，用"年龄非正相关"照镜子解释。
- **盲测判定**：触发。属 A2 触发场景 3 与 description 示例原句，p58 照镜子逻辑直接适用。→ **PASS**

### should-trigger-04 — 15岁女儿不懂换位思考、照镜子看成熟度
- **预期**：触发 C1，潜力级自评+下一步练习。
- **盲测判定**：触发。"照镜子 mirror not label" 为关键trigger；"换位思考"精确对应潜力级定义。→ **PASS**

### should-trigger-05 — 老师说儿子心智比同学幼稚、想测第几级
- **预期**：触发 C1，五层定位+成长坐标。
- **盲测判定**：触发。"比同龄人差一截 + 心智到哪层"复合命中，且需强调"非年龄比较"。→ **PASS**

### should-not-trigger-01 — 孩子老跟我吵架（跨 skill → C4）
- **预期**：不触发 C1，路由 parent-child-comm (C4)。
- **盲测判定**：**不触发**。prompt 核心是"沟通/吵架"，C1 的 A2"与相邻 skill 区分"与 description"不适用"均未覆盖沟通类，但 C1 本质是"层级测评"而非"话术沟通"，且 sibling_skills 中 C4 专司亲子沟通，路由成立。→ **PASS（0 误触）**
- ⚠️ 备注：此路由依赖 sibling 列表推断，C1 SKILL.md 自身未把"吵架/沟通→C4"写明（见回炉建议）。

### should-not-trigger-02 — 孩子手机沉迷厌学（跨 skill → C3）
- **预期**：不触发 C1，路由 youth-issue-decode (C3)。
- **盲测判定**：**不触发**。C1 在 A2"与相邻 skill 的区分"明确 contrasts-with C3："只定位层级，不给手机/厌学/叛逆等具体议题解法，议题处置转 C3"。判定清晰。→ **PASS（0 误触）**

### should-not-trigger-03 — 孩子自伤、情绪失控（医疗边界 → C9）
- **预期**：不触发自评，转介 bmc-youth-boundary / 精神科。
- **盲测判定**：**不触发**。B 段"医疗边界（强制）"：重性障碍/急性自伤须转介专业医疗，自评结果不作临床。触发红线判停。→ **PASS（0 误触）**

### edge-01 — 25岁成人想测心智（年龄越界 → 核心本）
- **预期**：不触发 C1，路由核心本 mind-level-self-assess。
- **盲测判定**：不触发。description 开头限定"10–20岁"，超龄不触发；contrasts-with 核心本指明成人六层级归 mind-level-self-assess。→ **PASS（合理边界判定）**

### edge-02 — 想测孩子"多差、骂醒他"（触发但带护栏）
- **预期**：触发 C1，但强制 B 段"照镜子非贴标签"，拒绝羞辱。
- **盲测判定**：触发但带护栏。需求是层级测评（触发），但动机是羞辱标签，命中 B 段失败模式 ce18/p58，须用成长坐标语言重定向。→ **PASS（合理判定）**

---

## should_not_trigger 专项核验（0 容错）

| 用例 | 诱饵类型 | 我方判定 | 路由目标 | 结果 |
|------|---------|---------|---------|------|
| 01 | 跨 skill（吵架） | 不触发 | parent-child-comm (C4) | ✓ |
| 02 | 跨 skill（厌学） | 不触发 | youth-issue-decode (C3) | ✓ |
| 03 | 医疗边界（自伤） | 不触发 | bmc-youth-boundary (C9)/精神科 | ✓ |

**3/3 全部正确路由，0 误触。达标。**

---

## 回炉建议（SKILL.md 补强，非阻断性）

1. **description「不适用」未列"沟通/吵架类诉求"路由目标。**
   C1 在 A2 区分段只写了 C2/C3/核心本，未提 `parent-child-comm`(C4)。本次 should-not-trigger-01 虽靠 sibling 列表正确路由到 C4，但若 agent 仅读 C1 的 description+区分段，易对"吵架/沟通"类诉求不知所措（可能空转或误触发）。建议 description「不适用」补一句：*"亲子沟通/吵架类诉求请转 parent-child-comm"*，并在 A2 区分段增列 C4。

2. **description「不适用」未明示"成人(>20岁)转核心本"。**
   年龄范围仅在 description 开头"10–20岁"与 contrasts-with 核心本出现，但未在「不适用」列表直说"成人请转 mind-level-self-assess"。edge-01 仍可判，但属隐性约束。建议在「不适用」补：*"仅限10–20岁，成年人请转 mind-level-self-assess"*，降低年龄越界误触发。

3. （轻微）B 段医疗边界已充分，无需补；E 段 4 步清晰，可执行性良好。

> 结论：C1 触发逻辑明确、边界（尤其医疗/议题）写得扎实，10/10 通过。上述 2 点为"路由可达性"补强，不阻塞发布，建议下一轮修订顺手补上。

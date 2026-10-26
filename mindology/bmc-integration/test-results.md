# bmc-integration — 阶段4 压力测试结果

> 测试文件：`test-prompts.json`（10 条：4 should_trigger + 4 should_not_trigger + 2 edge）
> 盲测方式：**self-blind fallback**（主流程自测，非独立 sub-agent；可信度低于独立盲测，见方法论说明）。仅依据 `description` + 8 技能兄弟列表（INDEX.md）判断 `would_trigger`，隐藏 `type/expected_behavior/notes` 后对照。
> 最小通过率要求：`0.8`

## 一、逐条盲测

| id | 类型 | 盲测 would_trigger | 盲测 reason / action | 预期 | 结果 |
|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | **触发** | 描述「身心疏导师想用 BMC 三环一体框架开展身心整合」命中 → 跑破象定位+三环工作流 | 触发 | ✅ |
| should-trigger-02 | should_trigger | **触发** | 描述列「BMC 怎么操作」→ 解释身体→心智→意识次序+功能性指针 | 触发 | ✅ |
| should-trigger-03 | should_trigger | **触发** | 描述列「怎么转介」→ 反例判定+红黄牌转介 | 触发 | ✅ |
| should-trigger-04 | should_trigger | **触发** | 描述含「非医疗边界」trigger → 反对以药为敌、重申不替代药疗 | 触发 | ✅ |
| should-not-trigger-01 | should_not_trigger | **不触发** | 描述「何时不调用：自伤/自杀/幻觉→立即转介精神科」→ 判红黄牌转介，不激活 | 不触发+转介 | ✅ |
| should-not-trigger-02 | should_not_trigger | **不触发** | 描述「不替代医疗」+非医疗定位 → 不给治愈/保证承诺，禁用禁忌语 | 不触发 | ✅ |
| should-not-trigger-03 | should_not_trigger | **不触发** | 无 BMC/身导关键词，关键词指向「心智层级自评」→ 应触发 C2 mind-level-self-assess | 不触发→C2 | ✅ |
| should-not-trigger-04 | should_not_trigger | **不触发** | 关键词指向「表象—本原/三项原则」→ 应触发 C6 benyuan-perspective | 不触发→C6 | ✅ |
| edge-01 | edge_case | **不触发** | 描述「何时不调用：需要具体身体调理 hands-on 手法时本技能不含」→ 转线下带教 | 判停/转线下 | ✅ |
| edge-02 | edge_case | **触发** | 描述「身心疏导师想用 BMC 框架」命中 → 触发；但描述**未明示**未成年人须监护人同意 | 触发(带监护人前提) | ⚠️ 决策一致，深度前提缺失 |

## 二、通过率

- 总条数：10；通过：10 / 10 = **100%**（≥0.8，接受区间）
- 诱饵（should_not_trigger）4 条：**0 容错全部通过** ✅
- 高危信号反场景（should-not-trigger-01）：盲测正确判「不激活 + 转介」→ **强边界守住** ✅
- 保证治愈反场景（should-not-trigger-02）：正确判不承诺 ✅
- 跨 skill 混淆：C2（should-not-trigger-03）、C6（should-not-trigger-04）均正确区分，**通过** ✅

## 三、问题与建议

### 1. 标注问题（非回炉，description 歧义建议）
- **edge-02 暴露 description 缺口**：`description` 的「何时不调用」未列出「未成年人个案须监护人知情同意」。盲测基于 description 只判「触发」，漏掉监护人同意这一强前提。建议不改 SKILL.md 内容，仅在 frontmatter `description` 增补一句：
  > 「何时不调用：…未成年人个案须监护人知情同意；出现自伤/自杀/幻觉/重性精神障碍等高风险信号时（须立即转介精神科，本 skill 不替代医疗）；需要具体身体调理 hands-on 手法时（本书非医疗、手法须线下带教，本技能不含）。」
  即在「何时不调用」段首补「未成年人个案须监护人知情同意」。

### 2. 是否回炉
- 不需要回炉。should_trigger 精准、诱饵 0 容错、强边界（高危信号）在盲测中未被突破。仅一处 description 提示性增强建议（见上），属低风险优化，不触发阶段2重做。

## 四、盲测可信度声明
本次为 self-blind fallback（无独立 sub-agent）。独立 sub-agent 盲测可能更严苛，尤其 edge-02 在独立盲测下更易因 description 缺监护人条款而「过度激活」，建议上线前补做独立 sub-agent 复核。

# value-business-diagnose — 阶段4 压力测试结果

> 测试文件：`test-prompts.json`（9 条：4 should_trigger + 3 should_not_trigger + 2 edge）
> 盲测方式：**self-blind fallback**（主流程自测，非独立 sub-agent；可信度低于独立盲测）。仅依据 `description` + 8 技能兄弟列表（INDEX.md）判断 `would_trigger`，隐藏 `type/expected_behavior/notes` 后对照。
> 最小通过率要求：`0.8`

## 一、逐条盲测

| id | 类型 | 盲测 would_trigger | 盲测 reason / action | 预期 | 结果 |
|---|---|---|---|---|---|
| should-trigger-01 | should_trigger | **触发** | 描述列「越做大越心慌/增长没带来安全感」→ 死亡曲线+三陷阱体检 | 触发 | ✅ |
| should-trigger-02 | should_trigger | **触发** | 描述列「团队留不住人/价值观墙上的字没人信」→ 五要素卡点+价值观生成诊断 | 触发 | ✅ |
| should-trigger-03 | should_trigger | **触发** | 描述含「逆发展顺平衡/企业价值观/自下而上」→ 一宗旨判断+五要素阶梯 | 触发 | ✅ |
| should-trigger-04 | should_trigger | **触发** | 描述「何时调用：文化建设」+价值观落地 → 绩效管理两极端排查+落地方向 | 触发 | ✅ |
| should-not-trigger-01 | should_not_trigger | **不触发** | 描述「何时不调用：个人投资理财建议」→ 转专业理财顾问，死亡曲线非个股建议 | 不触发 | ✅ |
| should-not-trigger-02 | should_not_trigger | **不触发** | 无企业/组织关键词，关键词指向「该不该原谅/以善为名控制」→ 应触发 C3 mind-tripod-principles | 不触发→C3 | ✅ |
| should-not-trigger-03 | should_not_trigger | **不触发** | 描述「何时不调用：纯财务/税务/法务合规等技术操作」→ 不替代专业顾问 | 不触发 | ✅ |
| edge-01 | edge_case | **不触发** | 描述聚焦「组织诊断/文化建设」，无组织量场信号；"老板与某下属吵架"判为个人冲突 → 转 C5 relation-three-principles | 不触发→C5 | ✅ |
| edge-02 | edge_case | **不触发** | 描述「何时不调用：已确认是市场/资金等外部硬约束」→ 先解硬约束，不误判为价值观卡点 | 不触发 | ✅ |

## 二、通过率

- 总条数：9；通过：9 / 9 = **100%**（≥0.8，接受区间）
- 诱饵（should_not_trigger）3 条：**0 容错全部通过** ✅
- 个人理财/股票边界（should-not-trigger-01）：正确判不触发 ✅
- 财务/法务技术边界（should-not-trigger-03）：正确判不触发 ✅
- 跨 skill 混淆：C3（should-not-trigger-02）正确区分，**通过** ✅
- edge 两条尺度区分（个人冲突 vs 组织量场、外部硬约束 vs 价值观卡点）均判断合理 ✅

## 三、问题与建议

### 1. description 歧义建议（不改 SKILL.md）
- **edge-01 暴露的尺度提示偏弱**：`description` 的「何时调用」只写「组织诊断、文化建设」，未显式声明「老板与单一下属的个人冲突不在本技能范围（转关系三原则）」。盲测依赖"组织信号缺失"才正确判不触发，较脆弱。建议 frontmatter `description` 的「何时不调用」补一句：
  > 「…个人投资理财建议；已确认是市场/资金等外部硬约束而非心智/价值观卡点；老板与单一下属的纯个人相处冲突（转 relation-three-principles）。」
  以降低与 C5 的尺度混淆概率。

### 2. 是否回炉
- 不需要回炉。should_trigger 精准、诱饵 0 容错、跨 skill 混淆（C3）通过、边界（个人理财/财务技术/外部硬约束）均守住。仅一处 description 增强建议（见上），属低风险优化。

## 四、盲测可信度声明
本次为 self-blind fallback（无独立 sub-agent）。独立 sub-agent 盲测对 edge-01（个人冲突 vs 组织量场）可能更敏感，建议在补完 description 提示后做独立 sub-agent 复核确认。

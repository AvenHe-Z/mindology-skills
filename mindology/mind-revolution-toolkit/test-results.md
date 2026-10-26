# 压力测试结果 — mind-revolution-toolkit

- **技能**: `mind-revolution-toolkit`（C1，修识总集）
- **来源**: 《意·心智学 1.4版》核心本
- **测试文件**: `test-prompts.json`（9 条：4 should_trigger / 3 should_not_trigger / 2 edge_case）
- **测试时间**: 2026-08-15
- **阶段**: cangjie-skill 阶段 4 压力测试

## 测试方式与可信度声明

⚠️ **本次为 self-blind fallback 盲测，不是独立 sub-agent 盲测，可信度低于方法论推荐做法**（见 `06-stage4-pressure-test.md`「评测原则」）。

盲测约束（严格执行）：

- 判定时只使用：本技能 SKILL.md 的 `description` 字段 + 全书 8 个 skill 的 `name` + `description` 兄弟列表。
- 判定时**不看** `type` / `expected_behavior` / `notes`，不看 SKILL.md 的 A2/E/B 正文。
- 判定题型为**选择题**（这句话该激活 8 个中的哪一个），而非「要不要激活这一个」的判断题。
- 逐条输出 `would_trigger` / `reason` / `if_triggered_action` 后，才回读 `test-prompts.json` 对比判卷。

盲测使用的兄弟技能列表（8 个，摘自各 SKILL.md frontmatter）：

| slug | description 摘要（触发面） |
|---|---|
| `benyuan-perspective` | 把心理问题当病治、贴原生家庭/高敏感/讨好型标签、问「这本书在讲什么」；表象—本原视角与三项原则；重性障碍强制转介 |
| `mind-revolution-toolkit` | **（被测）** 被一句话激怒、只有两个选项、别人都是傻X、新闻肯定是真的、我知识够多了、被短视频/AI喂答案；拼板/置换/提高维度/四问法 |
| `mind-level-self-assess` | 我是不是心智不成熟、TA 这么幼稚、这人靠不靠谱、被困在同一个模式、原生家庭造成；六层级镜 + 成年幼稚病 |
| `mind-tripod-principles` | 该不该原谅、算不算恶、好心办坏事、什么是真尊重、我的价值观是什么；平衡·情感·控制 + 处世三原则 |
| `relation-three-principles` | 一吵架就失控、沟通总变争吵、被冒犯想报复、没人懂我、以爱为名模糊边界；互敬·边界·自敛 |
| `emotion-frequency-decode` | 是真爱还是冲动、失恋为什么这么痛、表白被拒、总在错的人身上耗；爱=频率/同频/共振 |
| `bmc-integration` | BMC 怎么做、什么情况不能做、怎么转介、身心疏导师、非医疗边界；高风险信号转介 |
| `value-business-diagnose` | 团队留不住人、越做大越心慌、价值观墙上的字没人信；一宗旨五要素 + 财富安全 |

## 通过率

| 指标 | 结果 |
|---|---|
| 总条数 | 9 |
| 通过 | 9 |
| 失败 | 0 |
| **通过率** | **100%**（门槛 0.8） |
| should_trigger | 4 / 4 通过 |
| should_not_trigger（诱饵，0 容错） | 3 / 3 通过 ✅ |
| edge_case | 2 / 2 判断合理 |
| 跨 skill 混淆诱饵 | 2 条（→ `mind-level-self-assess`、→ `relation-three-principles`）**全部正确区分** ✅ |
| 结论 | **100% 通过 → 接受，不回炉** |

## 逐条结果（盲测判断 vs 预期）

### should-trigger-01 ✅ 通过
- **prompt**: 同事在会上说了一句话我当场就炸了，脱口就是「你就是个杠精」。事后回想，我好像根本没听清他到底在说什么就上火了。
- **盲测 would_trigger**: 是 → `mind-revolution-toolkit`
- **盲测 reason**: 同时命中 description 两条关键 trigger——「被激怒」与「你就是…（标签）」；且用户自述"没听清就上火"，是对自身自动反应的觉察需求，属认知升级而非关系调解。
- **盲测 if_triggered_action**: 反射思维识别（复述自己刚才的自动反应、分辨标签 vs 事实）→ 暂停—复述—求证 → 用行为描述替代「杠精」去标签。
- **预期对比**: 与 `expected_behavior` 一致。
- **备注**: 该句带轻微「同事冲突」气味，理论上可被 `relation-three-principles` 吸走；但用户没有提出沟通/相处诉求，盲测未误路由。属可接受的邻域摩擦。

### should-trigger-02 ✅ 通过
- **prompt**: 就两条路：要么现在辞职，要么忍到年底。没别的选项了。
- **盲测 would_trigger**: 是 → `mind-revolution-toolkit`
- **盲测 reason**: 直接命中「这事只有两个选项 / 不是A就是B」，属二元对立型认知受限；句中无层级、价值、关系、企业信号，无兄弟技能竞争。
- **盲测 if_triggered_action**: 提高维度——反问"只有两个选项吗"，去掉二元框架，在安全/伦理划界前提下给第三方案。
- **预期对比**: 一致。

### should-trigger-03 ✅ 通过
- **prompt**: 三个号都在转、专家也讲了，那肯定是真的吧？我已经在群里转发了。
- **盲测 would_trigger**: 是 → `mind-revolution-toolkit`
- **盲测 reason**: 命中「新闻肯定是真的 / 专家都说了」+ 信息单一，属鱼缸/媒体素养场景（tags 含 media-literacy）。
- **盲测 if_triggered_action**: 信息来源剖面图 + 四问法（谁说的/为什么/凭什么/谁异见）→ 拼板取板 + 反例搜寻（≥30%）→ 输出条件化陈述。
- **预期对比**: 一致。

### should-trigger-04 ✅ 通过
- **prompt**: 什么问题都直接丢给 AI，答案一来就用，越来越不动脑子……反正答案都对，好像也不用再学什么了。
- **盲测 would_trigger**: 是 → `mind-revolution-toolkit`
- **盲测 reason**: 双命中「被短视频/AI喂答案」与「我知识已经够多了」，是 description 中最独占的两个信号，其余 7 个 skill 无一覆盖。
- **盲测 if_triggered_action**: 指出知识积累≠认知扩展 → 定位思维层级（反射/线性/球形/场式）→ 拼板 + 四问法练习。
- **预期对比**: 一致。

### should-not-trigger-01 ✅ 通过（跨 skill 混淆·关键）
- **prompt**: 换了三份工作，每次都遇到差不多的人、掉进差不多的坑，好像被困在同一个模式里。我是不是心智不太成熟？
- **盲测 would_trigger**: **否**（本 skill）→ 应激活 `mind-level-self-assess`
- **盲测 reason**: 「被困在同一个模式」+「我是不是心智不成熟」是 `mind-level-self-assess` description 的原文级 trigger；用户要的是"我在哪一层"的定位，本 skill description 给的是"怎么想"的工具，不匹配。
- **盲测 if_triggered_action**: n/a（本 skill 不激活）；由 MLS 做六层级定位，必要时再回本 skill 取练习。
- **预期对比**: 与 `expected_behavior`（应激活 `mind-level-self-assess`）完全一致。**跨 skill 混淆测试通过。**

### should-not-trigger-02 ✅ 通过（跨 skill 混淆）
- **prompt**: 我和我老婆一吵架就失控，说到最后全是互相攻击。怎么才能沟通不变成争吵？
- **盲测 would_trigger**: **否**（本 skill）→ 应激活 `relation-three-principles`
- **盲测 reason**: 「一吵架就失控」「沟通总变争吵」是 RTP description 的逐字 trigger；本 skill description 的不适用项含"仅需情感陪伴而非认知升级"，且其覆盖面不含关系冲突处置与沟通话术。
- **预期对比**: 一致。**跨 skill 混淆测试通过。**

### should-not-trigger-03 ✅ 通过（关键词碰撞型假阳性）
- **prompt**: 帮我查一下「反射思维」这个概念最早是谁提出来的，出自哪本书、哪一年？
- **盲测 would_trigger**: **否**
- **盲测 reason**: 本 skill description 的不适用项第一条即「纯事实查询」；且「反射思维」本身并未被列入 `关键trigger` 清单（清单是"被激怒/只有两个选项/别人都是傻X/新闻肯定是真的/我知识够多了/你就是…标签"），术语出现不构成触发条件。
- **盲测 if_triggered_action**: n/a，直接检索作答。
- **预期对比**: 一致。**诱饵 0 容错通过。**
- **备注**: 这条依赖盲测 agent 读到"不适用"段。若换成纯关键词匹配的实现（如 embedding 检索 top-1），仍有假阳性风险——归因于宿主检索机制而非 description 缺陷，无需改 A2。

### edge-01 ✅ 判断合理（同书两 skill 交界）
- **prompt**: 我看人特别非黑即白，好人坏人一刀切，改不了。我是不是心智还停在儿童型那一层？
- **盲测 would_trigger**: **否（不作主导），可作后续配合**
- **盲测 reason**: 句中同时命中本 skill 的「非黑即白」与 `mind-level-self-assess` 的「儿童型/哪一层」。但用户的**提问动作**是"我是不是停在某一层"——诉求是定位，不是本次要做的动作；故 MLS 主导定位，本 skill 作为 composes-with 的训练环节承接（去标签、提高维度）。
- **盲测 if_triggered_action**: 若被调用，只做"针对非黑即白的去标签 + 提高维度练习"，并明确把层级结论交回 MLS。
- **预期对比**: `expected_behavior` = "允许激活但不得抢主导，MLS 先定位"，与盲测判断一致。
- **备注**: 这是全测最有牙齿的一条——见下方「触发歧义与建议」第 1 条。

### edge-02 ✅ 判断合理
- **prompt**: 晚饭吃火锅还是烧烤？就这两个选项，纠结死我了。
- **盲测 would_trigger**: **否**
- **盲测 reason**: 字面命中「只有两个选项」，但 description 的定位是"认知受限信号"，日常口味二选一没有认知代价、也不存在被标签/被单一信息源俘获的问题，属过度激活。
- **预期对比**: 一致（不应激活）。

## 诱饵与跨 skill 结论

- **诱饵 0 容错**: 3 / 3 全部未误触本 skill ✅ 无失败记录。
- **跨 skill 混淆**: 设 2 条（超出硬性要求的 1 条）。`should-not-trigger-01` 正确让位 `mind-level-self-assess`，`should-not-trigger-02` 正确让位 `relation-three-principles`，均基于 description 层面的可判据（"定位 vs 工具"、"关系处置 vs 认知升级"），不是靠猜。
- **同书互抢风险评估**: 本 skill 与 `mind-level-self-assess` 是 composes-with，边界最薄（edge-01 即在此处）。当前 SKILL.md 的「与相邻 skill 的区分」已写明"想知道我处在什么水平用它，想知道这件事该怎么想用本 skill"，判据清晰，盲测据此即可分流。

## 触发歧义与修复建议（不改 SKILL.md，留给主流程）

### 1. `description` 中「非黑即白」作为独立信号词偏宽（低危，建议微调 A2 而非改测试）

- **现象**: edge-01 中「非黑即白」与 MLS 的「儿童型」同句命中。当前靠"用户的提问动作是定位"这一二级推理才分流成功；若用户只说"我看人非黑即白，怎么办"，两 skill 都可合理激活。
- **判定**: 不构成失败（本次 100%），但属真实存在的边界薄弱点。
- **建议（若主流程决定微调）**: 在 `description` 的不适用/区分位置补一句可机读的让位规则，例如：
  > 若用户同时问「我是不是停在某一层 / 我的心智层级」，先转 `mind-level-self-assess` 定位，本技能承接其诊断出的偏弱要素做训练。
- **为什么不建议改测试**: edge-01 不是"为凑诱饵设计过狠"的场景，而是真实用户会说出的话（自评+症状描述混说），保留它有价值。

### 2. `should-not-trigger-03` 的残余风险属宿主机制层（无需改 A2、无需改测试）

- 「反射思维」这类核心术语出现在纯查询里时，description 的排除项能挡住有推理能力的调用方，但挡不住纯向量匹配的调用方。建议在阶段 5 交付说明里提示宿主：本包 skill 依赖"不适用"段参与路由判断。

## 是否回炉

**不回炉。** 通过率 100% ≥ 0.8 门槛，诱饵 0 容错通过，跨 skill 混淆 2/2 通过。唯一记录项为上文第 1 条低危边界建议，属可选微调，不涉及重做阶段 2 的 A2 / E / B。

**复测建议**: 本次为 self-blind fallback。若后续环境具备独立 sub-agent 能力，建议对 `edge-01`、`should-not-trigger-01`、`should-not-trigger-03` 三条做一次真盲测复核（这三条是全测判定最依赖推理的部分）。

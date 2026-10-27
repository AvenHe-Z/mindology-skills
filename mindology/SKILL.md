---
name: mindology
version: 1.3.0
description: |
  心智学技能总路由（1核心 + 2分支，共 28 个 skill）。当用户涉及「心智成熟/心智层级/心智评估、青少年养育（手机沉迷/厌学/叛逆/空心病）、职场心智（PUA/上下级/同事/客户/边界）、组织心智/护城河、老板心智四观、价值观商业、BMC 身心整合/全效养生、原生家庭思维偏差、情感频率、思维革命/修识、意理念三基石、关系三原则」等心智学议题时，由本技能按场景路由到对应子技能。本技能是入口与红线总纲，不直接替代子技能的方法论。
display_name: "心智学技能套装"
display_name_en: "Mindology Skill Suite"
description_zh: "心智学技能总路由（入口与红线总纲），覆盖心智评估、青少年养育、职场心智、组织心智/护城河、老板心智四观、价值观商业、BMC身心整合等28个子技能，按场景路由到对应子技能。"
description_en: "Mindology skill router (entry + red-line hub) covering 28 sub-skills: mind assessment, youth parenting, workplace mind, org mind, boss four-views, value-business, BMC integration — routes by scenario."
visibility: "public"
type: router
related_skills:
  - slug: benyuan-perspective
    relation: member
  - slug: bmc-integration
    relation: member
  - slug: emotion-frequency-decode
    relation: member
  - slug: mind-level-self-assess
    relation: member
  - slug: mind-revolution-toolkit
    relation: member
  - slug: mind-tripod-principles
    relation: member
  - slug: relation-three-principles
    relation: member
  - slug: value-business-diagnose
    relation: member
  - slug: bmc-youth-boundary
    relation: member
  - slug: camp-toolkit
    relation: member
  - slug: four-wu-screen
    relation: member
  - slug: growth-orientation-ai
    relation: member
  - slug: origin-family-rebuttal
    relation: member
  - slug: parent-child-comm
    relation: member
  - slug: parent-observer-mode
    relation: member
  - slug: youth-emotion-frequency-test
    relation: member
  - slug: youth-issue-decode
    relation: member
  - slug: youth-mind-level-test
    relation: member
  - slug: bata-business-boundary
    relation: member
  - slug: boss-mind-fourviews
    relation: member
  - slug: corp-mind-coach
    relation: member
  - slug: org-mind-diagnosis
    relation: member
  - slug: origin-family-bias-break
    relation: member
  - slug: startup-wealth-safety
    relation: member
  - slug: value-business-hr
    relation: member
  - slug: workplace-competent-selfassess
    relation: member
  - slug: workplace-pua-guard
    relation: member
  - slug: workplace-relation-rebuild
    relation: member
---

# 心智学技能总路由 · mindology

> **1 核心 + 2 分支**三书体系的统一入口。核心本《意·心智学 1.4》、青少年分支《青少年·心智学 1.5》、职场分支《职场心智学》蒸馏出的 28 个 skill 全部在本目录（`mindology/`）下，按场景路由。

## 本技能做什么 / 不做什么

- **做**：判断用户意图落在哪一本书、哪一个 skill；给出命中路径与触发关键词；携带**全局红线**确保任何子技能都不越界。
- **不做**：不直接执行子技能的方法论（如 BMC 手法、具体测评计分、企业教练个案）。需要落地时，**直接调用命中的子 skill 并严格按其流程执行**——宿主已自动发现本目录全部子 skill，可直接调用，无需用户手动 `@<slug>`；若子技能自带交互网页，子技能会负责定位并打开网页、引导用户作答，路由层确保**命中后即进入子技能执行、不停留在介绍**。仅当宿主无打开能力 / 打开失败时，子技能才回退到聊天式自评并说明原因。

## 三本书一句话定位

- **核心本（8 skill）**：意识本原 / 觉识粒子 / 六层级 / 意理念三基石 / 关系三原则 / 修识思维革命 / 情感频率 / BMC 三环一体 / 价值观商业诊断——体系的**世界观与方法底座**。
- **青少年本（10 skill）**：把核心框架落到 10–20 岁——五层心智测评、情感频率测评、四无筛查、成长导向、原生家庭反驳、议题归因、亲子沟通、观察者模式、营地工具、BMC 青少年护栏。
- **职场本（10 skill）**：把核心框架落到职场与组织——合格职场人自评、关系五重构、原生家庭偏差破除、老板四观、组织心智护城河、价值观商业 HR、创业财富安全、职场 PUA 防护、企业心智教练、BATA 商业化边界。

## 全量技能路由表

### 核心本（8）

| slug | 用途 | 触发关键词 |
|---|---|---|
| `benyuan-perspective` | 表象—本原双重视角；心理即心智成长、反标签反病理化、本体论澄清 | 心理问题是病吗 / 原生家庭标签 / 这本书在说什么 / 觉识粒子 |
| `bmc-integration` | BMC 三环一体身心整合框架与转介护栏（其他 skill 的底层技术依赖） | BMC 怎么操作 / 什么情况不能做 / 怎么转介 |
| `emotion-frequency-decode` | 爱=频率/爱情=同频/相爱=共振；失恋/真爱/跨量场求认同 | 这是真爱还是冲动 / 失恋为什么痛 / 总在错的人身上耗 |
| `mind-level-self-assess` | 六层级镜 + 成年幼稚病 + 心智成熟三维自评 | 我心智成不成熟 / 这人靠不靠谱 / 总遇到同一种人 |
| `mind-revolution-toolkit` | 反射思维识别 + 拼板/置换/提高维度等认知升维工具 | 被一句话激怒 / 非黑即白 / 这事只有两个选项 |
| `mind-tripod-principles` | 平衡·情感·控制三基石 + 尊重/宽容/谦和 价值检核 | 好心办坏事 / 该不该原谅 / 怎么算真尊重 |
| `relation-three-principles` | 互敬·边界·自敛三原则 + 情绪省察期/自我回归期 | 一吵架就失控 / 被冒犯想报复 / 以爱为名模糊边界 |
| `value-business-diagnose` | 价值观商业诊断（一宗旨五要素）、组织/文化建设复盘 | 越做大越心慌 / 价值观墙上字没人信 / 平衡最大化 |

### 青少年本（10）

| slug | 用途 | 触发关键词 |
|---|---|---|
| `growth-orientation-ai` | 成长导向 vs 治疗导向；AI 时代心智风险 | 这算病还是成长缺口 / 空心病 / AI 让人空心 |
| `youth-mind-level-test` | 青少年五层心智模型（10–20 岁）自评 | 孩子不懂事 / 测测心智到哪层 / 12岁比18岁懂事 |
| `youth-emotion-frequency-test` | 青少年情感频率 随机抽题 25 题 + 五项雷达图 | 孩子情绪/同伴/亲子哪块偏科 / 情感频率什么样 |
| `four-wu-screen` | "四无"（无动力/无能力/无兴趣/无感）筛查与五维方案 | 孩子懒宅没劲没意义 / 啥都不想干 |
| `youth-issue-decode` | 手机沉迷/厌学/叛逆/空心病 心智学归因与处置 | 手机沉迷 / 不肯上学 / 活着没意思 / 该不该没收手机 |
| `origin-family-rebuttal` | 原生家庭归因→成长者叙事（带真实创伤转介） | 都是父母害的 / 原生家庭决定一生吗 |
| `parent-child-comm` | 亲子沟通三转向 + 行为描述法 | 一开口就吵 / 孩子不肯说 / 我为他好他却烦 |
| `parent-observer-mode` | 控制者→观察者 静观+顺势启迪 | 越管越反 / 想放手不敢 / 催作业吵到摔门 |
| `camp-toolkit` | 营地/日常养育真实社会演练工具包 | 要啥秒满足 / 手机依赖 / 遇麻烦家长兜底 |
| `bmc-youth-boundary` | 青少年 BMC 应用与转介护栏（从业者专用） | 青少年 BMC 什么情况停 / 药能不能停 |

### 职场本（10）

| slug | 用途 | 触发关键词 |
|---|---|---|
| `workplace-competent-selfassess` | 合格职场人四能力+三维度自评 | 我合格/成熟吗 / 太玻璃心 / 自敛还是怂 |
| `workplace-relation-rebuild` | 职场关系五重构 + 边界四维度 | 上下级/同事/客户 关系 / 不会拒绝 / 被当家人 |
| `workplace-pua-guard` | 职场 PUA 识别与应对（归还判断力） | 被上级贬低冷暴力 / 玻璃心 / 是不是我想多了 |
| `origin-family-bias-break` | 职场场景原生家庭思维偏差破除 | 童年害我 / 跳槽都遇同类老板 / 受害者叙事 |
| `boss-mind-fourviews` | 老板心智四观（利益/员工/风险/价值观）自检 | 老板心智 / 员工观 / 逆发展顺平衡 / 老板天花板 |
| `org-mind-diagnosis` | 组织心智护城河 + 双向奔赴组织变革（组织总纲） | 组织心智 / 护城河 / 成人型心智占比 / 心智教育导入 |
| `value-business-hr` | 价值观商业 HR/经营落地 + 诊断 | 价值观上墙没人信 / 绩优则仕 / 卡在哪一级 |
| `startup-wealth-safety` | 创业财富安全（死亡曲线/三陷阱/无安全慎发展） | 再做大就安全 / 偶发当常态 / 无安全慎发展 |
| `corp-mind-coach` | 企业心智教练能力地图 + IAMS 认证 | 企业心智教练 / IAMS / 我适不适合做教练 |
| `bata-business-boundary` | BATA 全效养生商业化经营边界 | BATA / 全效养生加盟 / 调理非治病 / 招商话术 |

## 路由决策逻辑

1. **先排红线**（见下），再路由。任何涉及医学/真实创伤/劳资正当诉求的信号，优先转介或走法律通道，不进心智成长话术。
2. **按对象分书**：问孩子/青少年 → 青少年本；问职场/组织/老板/创业 → 职场本；问通用心智成熟/关系/思维/情感/价值观 → 核心本。
3. **按动作选技能**：自评定位 → `*self-assess` / `*mind-level-test`；关系冲突 → `relation-*` / `parent-child-comm` / `workplace-relation-rebuild`；归因偏差 → `origin-family-*`；组织经营 → `org-mind-diagnosis` / `value-business-*` / `boss-mind-*`；创业风险 → `startup-wealth-safety`；技术/手法 → `bmc-*`；认证/从业 → `corp-mind-coach` / `bmc-youth-boundary` / `bata-business-boundary`。
4. **跨技能联动**：子技能已在 `related_skills` 中声明 `composes-with` / `contrasts-with`；拿不准时回看 `org-mind-diagnosis`（职场组织总纲）与 `bmc-integration`（核心技术）的边界。

## 全局红线（任何子技能必须继承）

1. **医学/转介红线（最高优先级）**：重性精神障碍、急性自伤/自杀风险、幻觉妄想、器质性病变、严重成瘾、服药者擅自停减药——心智学不替代医疗，立即转介精神科/专业心理机构。各 `bmc-*` / `-boundary` / `-guard` 技能均含此边界。
2. **劳资 gaslighting 红线（职场本核心）**：低薪/过劳/不安全/欠社保等正当诉求，不得读成"心智不成熟/不同频/量场共识"（ce01/ce03/ce43）；不得用"提升心智"替代制度修复（ce12）；不得用"心智教育"替代监管成本与员工权益（ce02/ce22）；不得用"价值观不同频"作解雇/请退理由（ce03）或"情感频率"做招聘筛选（ce45，涉就业歧视）；不得把"逆发展·顺平衡"当拒加薪拒扩编话术（ce44）。命中即走协商与法律通道。
3. **真实创伤红线**：原生家庭/童年虐待/长期忽视史，不得只做"成长者叙事改写"替代专业评估（ce05）；停止二次否定。
4. **高危人群红线（BATA）**：老人/孕产妇/术后/精神科在治/未成年人，BATA 三天速成不得无差别上手，不替代就医（ce28/ce46）；招商不得渲染暴富，须披露成本/回本/失败率（ce29）。
5. **认证边界**：IAMS 等认证外部无第三方效力，质量闭环存疑（ce31/ce47）；企业付费双委托方保密冲突须事前约定（ce34）。

## 相关资源（本目录内）

- 核心本精华：[`../yi-xinlixue-1.4/DIGEST.md`](../yi-xinlixue-1.4/DIGEST.md) · 索引 [`../yi-xinlixue-1.4/INDEX.md`](../yi-xinlixue-1.4/INDEX.md) · 术语母典 [`../yi-xinlixue-1.4/GLOSSARY.md`](../yi-xinlixue-1.4/GLOSSARY.md)
- 青少年本精华：[`../qingshaonian-1.5/DIGEST.md`](../qingshaonian-1.5/DIGEST.md) · 索引 [`../qingshaonian-1.5/INDEX.md`](../qingshaonian-1.5/INDEX.md) · 术语 [`../qingshaonian-1.5/GLOSSARY.md`](../qingshaonian-1.5/GLOSSARY.md)
- 职场本精华：[`zhichang/DIGEST.md`](zhichang/DIGEST.md) · 索引 [`zhichang/INDEX.md`](zhichang/INDEX.md) · 术语 [`zhichang/GLOSSARY.md`](zhichang/GLOSSARY.md)
- 各子技能均带 `test-prompts.json`（darwin 兼容），可接 `darwin evolve` 自动进化。

## 安装与进化

- 本目录（`mindology/`）整体置于宿主 `skills/` 下即可。若宿主只扫描一级目录，本路由 SKILL.md 作为入口；子技能若需独立触发，请将各 `<slug>/` 也平铺到 `skills/`。
- 旧版 `mind/` 心智学套装已移出（见 `backup/`），避免与本书同名/同体系技能冲突。

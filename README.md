# mindology · 心智学技能包

> 一套基于「心智学」体系、可装在 WorkBuddy 里自动触发的技能集合（skill suite）。
> 由 **1 个路由技能 + 28 个成员技能** 组成，覆盖：心智评估、青少年养育、职场与组织心智。

- 版本：`1.2.2`（详见 `mindology/_meta.json`）
- 体系结构：**1 核心本 + 2 分支本**（核心本 / 青少年本 / 职场本）
- 适用宿主：WorkBuddy（`~/.workbuddy/skills/` 用户级，或项目 `.workbuddy/skills/` 项目级）
- 许可证：MIT（见 `LICENSE`）

---

## 这是什么

心智学是一套关于「心智成熟 / 心智层级 / 关系 / 组织心智」的成长框架，强调**非病理化、非临床诊断**——它是成长陪伴工具，不替代医疗。本仓库把三本书（《意·心智学 1.4》核心本、《青少年·心智学 1.5》、《职场心智学》）蒸馏成 28 个可触发的技能，并由 `mindology` 路由技能按场景分发。

- `mindology/SKILL.md` —— 总路由与**全局红线总纲**，负责判断意图落在哪本书、哪个技能，并携带不可越界的红线。
- `mindology/<slug>/` —— 28 个成员技能，每个含 `SKILL.md`（方法论）及部分参考/测试文件。
- 7 个**交互式测评 HTML**（`boss-mind-fourviews.html`、`four-wu-screen.html`、`mind-level-self-assessment.html`、`org-mind-diagnosis.html`、`workplace-competent-selfassess.html`、`youth-emotion-frequency-test.html`、`youth-mind-level-test.html`）可直接在浏览器打开使用。

---

## 安装

1. 把本仓库的 **`mindology/` 整个文件夹**放入 `~/.workbuddy/skills/`（推荐用户级）或项目的 `.workbuddy/skills/`。
2. 安装后**重启一次 WorkBuddy**，再开新任务，确保技能索引刷新。
3. 触发方式：
   - **显式调用（最稳）**：问题前加 `@<slug>`，如 `@mind-level-self-assess 测一下我的心智水平`、`@youth-issue-decode 孩子沉迷手机怎么办`。
   - **自然语言**：各技能描述内置触发词，正常提问即可自动匹配（如"我想评估心智成熟度""老板心智成熟吗""职场 PUA 怎么应对"）。

> 若宿主只扫描一级技能目录，请将 `mindology/` 下各 `<slug>/` 也平铺到 `skills/` 以保证子技能独立触发；`mindology/SKILL.md` 仍作为总入口。

---

## 全量技能索引

### 核心本（8）· 世界观与方法底座

| slug | 用途 |
|---|---|
| `benyuan-perspective` | 表象—本原双重视角；反标签反病理化、本体论澄清 |
| `bmc-integration` | BMC 三环一体身心整合框架与转介护栏（其他技能底层技术依赖） |
| `emotion-frequency-decode` | 爱=频率 / 爱情=同频 / 相爱=共振；失恋、跨量场求认同 |
| `mind-level-self-assess` | 六层级镜 + 成年幼稚病 + 心智成熟三维自评 |
| `mind-revolution-toolkit` | 反射思维识别 + 拼板/置换/提高维度等认知升维工具 |
| `mind-tripod-principles` | 平衡·情感·控制三基石 + 尊重/宽容/谦和 价值检核 |
| `relation-three-principles` | 互敬·边界·自敛三原则 + 情绪省察期/自我回归期 |
| `value-business-diagnose` | 价值观商业诊断（一宗旨五要素）、组织/文化建设复盘 |

### 青少年本（10）· 落到 10–20 岁

| slug | 用途 |
|---|---|
| `growth-orientation-ai` | 成长导向 vs 治疗导向；AI 时代心智风险 |
| `youth-mind-level-test` | 青少年五层心智模型（10–20 岁）自评 |
| `youth-emotion-frequency-test` | 青少年情感频率随机抽题 25 题 + 五项雷达图 |
| `four-wu-screen` | "四无"（无动力/无能力/无兴趣/无感）筛查与五维方案 |
| `youth-issue-decode` | 手机沉迷/厌学/叛逆/空心病 心智学归因与处置 |
| `origin-family-rebuttal` | 原生家庭归因→成长者叙事（带真实创伤转介） |
| `parent-child-comm` | 亲子沟通三转向 + 行为描述法 |
| `parent-observer-mode` | 控制者→观察者 静观+顺势启迪 |
| `camp-toolkit` | 营地/日常养育真实社会演练工具包 |
| `bmc-youth-boundary` | 青少年 BMC 应用与转介护栏（从业者专用） |

### 职场本（10）· 落到职场与组织

| slug | 用途 |
|---|---|
| `workplace-competent-selfassess` | 合格职场人四能力+三维度自评 |
| `workplace-relation-rebuild` | 职场关系五重构 + 边界四维度 |
| `workplace-pua-guard` | 职场 PUA 识别与应对（归还判断力） |
| `origin-family-bias-break` | 职场场景原生家庭思维偏差破除 |
| `boss-mind-fourviews` | 老板心智四观（利益/员工/风险/价值观）自检 |
| `org-mind-diagnosis` | 组织心智护城河 + 双向奔赴组织变革（组织总纲） |
| `value-business-hr` | 价值观商业 HR/经营落地 + 诊断 |
| `startup-wealth-safety` | 创业财富安全（死亡曲线/三陷阱/无安全慎发展） |
| `corp-mind-coach` | 企业心智教练能力地图 + IAMS 认证 |
| `bata-business-boundary` | BATA 全效养生商业化经营边界 |

---

## 全局红线（任何子技能必须继承）

1. **医学/转介红线（最高优先级）**：重性精神障碍、急性自伤/自杀风险、幻觉妄想、器质性病变、严重成瘾、服药者擅自停减药——心智学不替代医疗，立即转介精神科/专业机构。
2. **劳资 gaslighting 红线**：低薪/过劳/不安全/欠社保等正当诉求，不得读成"心智不成熟/不同频"；不得以"提升心智"替代制度修复或监管成本；不得用"价值观不同频"作解雇理由或招聘筛选（涉就业歧视）。
3. **真实创伤红线**：原生家庭/童年虐待/长期忽视史，不得只做"成长者叙事改写"替代专业评估，停止二次否定。
4. **高危人群红线（BATA）**：老人/孕产妇/术后/精神科在治/未成年人，BATA 三天速成不得无差别上手，不替代就医；招商不得渲染暴富，须披露成本/回本/失败率。
5. **认证边界**：IAMS 等认证外部无第三方效力；企业付费双委托方保密冲突须事前约定。

---

## 目录结构

```
mindology-skills/
├── README.md              # 本文件
├── LICENSE                # MIT
└── mindology/             # 技能包本体（复制到 ~/.workbuddy/skills/ 下）
    ├── SKILL.md           # 总路由 + 红线总纲
    ├── _meta.json         # 版本信息
    ├── <slug>/            # 28 个成员技能（各含 SKILL.md）
    └── ...
```

> 注：`mindology/SKILL.md` 中提到的三本书精华（`*DIGEST.md` / `*INDEX.md` / `*GLOSSARY.md`）为配套资料，未随本包发布；不影响技能触发与核心功能。

---

## 免责声明

本技能包用于心智成长陪伴与自我觉察，**不是临床诊断工具**。涉及严重心理/精神障碍、自伤他伤风险、器质性病变，请转介专业医疗或精神科。使用即表示理解并同意：作者不对基于本技能内容的任何决策后果承担责任。

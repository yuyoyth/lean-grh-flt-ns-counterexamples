# 广义黎曼猜想千万行级依赖类型形式化证明的原理性逻辑相撞定理、静态商截面失实机制与实机声明图核查专论

作者：yth
日期：2026-11-22

---

## 第一章　导论：全过程逐点因果约束流、静态类型截面投影与入口偏航放大律

### 1.1　算术解析对象的真实存在方式：携余项耦合纤维的全过程逐点因果流

在经典解析数论与现代形式化验证的交汇处，一个常见且具有深远影响的方法论误区，是将黎曼 $\zeta$ 函数或 Dirichlet $L$ 函数 $L(s,\chi)$ 仅仅看作复平面上的一个静态点值映射 $s \mapsto L(s,\chi)$ ，或者看作由“亚纯延拓、对称函数方程、垂直带多项式增长界”这几条孤立公理拼装而成的静态代数结构。一旦落入这种静态视角，形式化工作者就会自然而然地以为：只要在依赖类型论（如 Lean 4 与 Mathlib ）中定义出一个类型签名为 $\mathbb{C} \to \mathbb{C}$ 的函数对象，并分模块证明它满足若干局部解析不等式，将成百上千万行引理在语法上拼接闭合，就等于在形式系统内部真正锁定了算术 $L$ 函数的非平凡零点分布。

然而，从数学的第一性原理审视，算术 $L$ 函数之所以能够将临界带 $0 < \operatorname{Re}(s) < 1$ 内的无穷非平凡零点死死约束在临界线 $\operatorname{Re}(s) = 1/2$ 上，其根本驱动力绝不来自某一个静态截面上的孤立点值，而是来自从绝对收敛右半平面 $\operatorname{Re}(s) > 1$ 向临界带全过程逐点传导的素数乘性筛因果流。在 $\operatorname{Re}(s) > 1$ 上，完全乘性 Dirichlet 特征 $\chi$ 所生成的无穷级数与无穷 Euler 乘积满足刚性恒等式：

$$
L(s,\chi) = \sum _ {n=1}^{\infty} \chi(n)n^{-s} = \prod _ {p \in \mathcal{P}} \left(1 - \chi(p)p^{-s}\right)^{-1}. \tag{1.1}
$$

在式 $(1.1)$ 中，右侧的每一个局部 Euler 因子 $(1 - \chi(p)p^{-s})^{-1}$ 都在复平面上刻画了单一素数 $p$ 的周期振荡相位，而所有素数对数 $\lbrace \log p\rbrace _ {p \in \mathcal{P}}$ 在有理数域 $\mathbb{Q}$ 上的严格线性独立性（算术基本定理的对数形态），使得无穷多个素数振荡相位之间不存在任何非平凡的有理共振。当我们沿着素数截断视界 $P$ 或求和截断视界 $X$ 由右半平面向临界带推进时，任何有限截断窗口都不能只用一个孤立的有限主部 $\mathcal{Z} _ {P,X}(s)$ 来代表原函数，而必须同时携带那个尚未被当前有限窗口展开、却唯一决定下一步跨尺度演化方向的**未决余项伴随纤维** $\delta _ {P,X}(s)$ 。在任意相邻两个尺度窗口 $(P,X) \to (P',X')$ 的单步推进中，局部筛选增量 $b _ {P\to P'}(s)$ 同时作用于显式主部与未决余项：

$$
\begin{aligned}
\bigl(\mathcal{Z} _ {P,X}(s),\ \delta _ {P,X}(s)\bigr) \cr
\qquad \longmapsto \Bigl(&\mathcal{Z} _ {P,X}(s)\exp\bigl(b _ {P\to P'}(s)\bigr), \cr
&\delta _ {P,X}(s) - b _ {P\to P'}(s)\Bigr),
\end{aligned} \tag{1.2}
$$

从而在每一个有限演化前缀上都精确保持全阶算术守恒量：

$$
\begin{aligned}
\mathcal{I} _ {P',X'}(s) &= \mathcal{Z} _ {P',X'}(s)\exp\bigl(\delta _ {P',X'}(s)\bigr) \cr
&= \mathcal{Z} _ {P,X}(s)\exp\bigl(\delta _ {P,X}(s)\bigr) = L(s,\chi).
\end{aligned} \tag{1.3}
$$

用数学自然语言来说，式 $(1.2)$ 与式 $(1.3)$ 揭示了一个极为深刻的事实：算术 $L$ 函数在每一步跨区延拓与零点排斥中的真实状态，永远是“当前已显影的有限算术主部 $\mathcal{Z} _ {P,X}$ ”与“统治后续合法演化方向的高阶余项耦合纤维 $\delta _ {P,X}$ ”组成的有型整体。在这条演化链条上，真正具备解析统治力的恰恰是那个在有限点值截面上看不见、却在幕后逐点锁死相位的余项耦合流：它要求每一次保留（保持同一算术源与每一前缀上的守恒量 $\mathcal{I}$ ）、每一次零残余剥离（仅在严格证明残余项对目标读口及一切合法后续演化恒为零影响时方可撤除）以及每一次跨区桥接生长（将右半平面的乘性对数导数与积分算子有型地延拓为临界带内的亚纯预解式与正定核），都必须在全过程每一个前缀上严丝合缝地耦合。

### 1.2　静态类型截面的结构性盲区：连续过程因果流与零测度离散逻辑抽样

为什么在传统依赖类型论的形式化实践中，这种本应全过程逐点保持的余项耦合流，极其容易在翻译为形式代码的一瞬间被静默抹平？

原因在于依赖类型论的静态截面机制。在类型论环境 $\Sigma _ {\mathrm{TT}}$ 中，一个数学对象通常被编码为某个固定签名下的静态数据结构或商类型代表元，而定理的证明则表现为对有限个显式前件谓词的静态逻辑调用。用线性表示与商映射的语言来刻画：设包含完整算术源与跨尺度余项纤维的全态空间为 $V = \mathcal{S} _ 0 \oplus \mathcal{K} _ {\mathrm{blind}}$ ，其中 $\mathcal{S} _ 0 = \Sigma _ {\mathrm{TT}}$ 是形式化签名所显式记录的**静态可见截面**， $\pi _ {\mathrm{TT}} : V \to \mathcal{S} _ 0$ 是将全态压入静态截面的观察投影，而

$$
\mathcal{K} _ {\mathrm{blind}} := \ker\pi _ {\mathrm{TT}} = \lbrace v \in V : \pi _ {\mathrm{TT}}(v) = 0\rbrace \tag{1.4}
$$

则是在该静态签名下被投影抹零的**不可见盲核子空间**。只要在静态截面 $\mathcal{S} _ 0$ 上赋予任何可见内积 $\langle \cdot, \cdot \rangle _ {\mathcal{S} _ 0}$ ，全态空间上的可见半内积

$$
\begin{aligned}
\langle u, v \rangle _ {\mathrm{vis}} &:= \langle \pi _ {\mathrm{TT}}(u), \pi _ {\mathrm{TT}}(v) \rangle _ {\mathcal{S} _ 0}
\end{aligned} \tag{1.5}
$$

就必然满足严格的正交盲区恒等式：

$$
\forall u \in \ker\pi _ {\mathrm{TT}},\ \forall v \in V,\qquad \langle u, v \rangle _ {\mathrm{vis}} = 0. \tag{1.6}
$$

式 $(1.6)$ 的物理与数学含义极为直观：对于只通过静态截面投影 $\pi _ {\mathrm{TT}}$ 读取信息的下游形式化引理而言，落在盲核 $\ker\pi _ {\mathrm{TT}}$ 中的一切高阶余项耦合结构与素数乘性刚性，其可见投影全部恒等于零。这就好比一条在连续时间区间 $[0, T]$ 上受微分动力律逐点支配的连续轨迹，如果我们仅仅在有限个孤立时刻 $t _ 1, t _ 2, \dots, t _ m \in [0, T]$ 对它做静态点值抽样，那么由单点集测度为零及有限可加性可知，该有限抽样集在连续区间上的 Lebesgue 测度严格满足：

$$
\lambda(\lbrace t _ 1, \dots, t _ m\rbrace) = \sum _ {j=1}^{m} \lambda(\lbrace t _ j\rbrace) = 0. \tag{1.7}
$$

在测度为 $0$ 的有限离散抽样点之外，如果没有全过程逐点生效的导数控制与余项耦合合同，轨迹在两个抽样点之间的连续演化可以发生任意剧烈的偏折与缠绕，而静态抽样表上的数值却丝毫不会报警。同样地，在广义黎曼猜想的形式化工程中（注意：形式证明项在语法上的有限性并不自动意味着语义视界有限，因为自然数归纳法与全称量词可以在语法上覆盖无穷集合；真正决定盲核大小的是证明所实际经由因子化的**静态观察商映射** $q : X \to Q$ ），一旦证明链条在跨越 $\operatorname{Re}(s) = 1$ 进入临界带 $0 < \operatorname{Re}(s) < 1$ 时，把只对完整算术对象成立的目标命题建立在某个丢弃了素数乘性耦合的弱静态商映射 $q$ 之上，那些在 $q$ 下与真实算术 $L$ 函数具有完全相同静态投影读数的非算术伪模型，就会沿着盲核 $\ker q$ 长驱直入。

### 1.3　入口商空间退化的偏航放大效应：初始商核泄漏在千万行级静态推演中的传播机制

我们进一步从代数商空间闭合定理出发，精确刻画为什么“入口处的一处商核泄漏，会让后续数千万行形式化代码整体沦为在错误商对象上的无效空转”。

设全态空间 $V$ 上有一族合法的算术—解析演化算子 $\lbrace A _ a\rbrace _ {a \in \mathcal{A}}$ （例如：由 Dirichlet 系数生成有限截断和、施加 Abel 分部求和、通过 Hurwitz 函数做亚纯延拓、在临界带矩形上计算对数导数围道积分、施加对称函数方程反射 $s \leftrightarrow 1-s$ ）。在什么充要条件下，这些真实演化算子 $A _ a : V \to V$ 才能在静态截面 $\mathcal{S} _ 0 = V / \ker\pi _ {\mathrm{TT}}$ 上诱导出良定义的截面演化算子 $\overline{A} _ a : \mathcal{S} _ 0 \to \mathcal{S} _ 0$ ，使得图表 $\pi _ {\mathrm{TT}} A _ a = \overline{A} _ a \pi _ {\mathrm{TT}}$ 对一切合法词复合都严格交换？线性商空间基本定理给出了唯一的充要条件——**商核不变闭合律**：

$$
\forall a \in \mathcal{A},\qquad A _ a\bigl(\ker\pi _ {\mathrm{TT}}\bigr) \subseteq \ker\pi _ {\mathrm{TT}}. \tag{1.8}
$$

在一般有型集合域 $X$ 与静态观察映射 $q : X \to Q$ 下，式 $(1.8)$ 及其面向目标谓词 $Z : X \to \mathrm{Prop}$ 的下降条件等价于**同纤维不可区分保持律**：

$$
\begin{aligned}
\forall x, y \in X,\qquad q(x) = q(y) \implies &\Bigl(\forall a \in \mathcal{A},\ q(A _ a x) = q(A _ a y)\Bigr) \cr
&\land\ \bigl(Z(x) \iff Z(y)\bigr).
\end{aligned} \tag{1.9}
$$

现在，假设在形式化工程的入口处或跨区桥接处，商核闭合律 $(1.8)$ 或目标纤维常值律 $(1.9)$ 发生了哪怕只有一处的破缺——即存在某个真实算术对象 $x _ 0 \in X$ 与某个携带临界带离轴零点的影子对象 $x _ 1 \in X$ ，它们在静态观察商映射 $q$ 下的读数完全相同：

$$
q(x _ 0) = q(x _ 1), \tag{1.10}
$$

或者在线性化表示下，它们之差 $k = x _ 1 - x _ 0 \in \ker\pi _ {\mathrm{TT}}$ 在当前静态截面上不可见（ $\pi _ {\mathrm{TT}}(k) = 0$ ），但在下一步演化算子 $A _ a$ 作用下却刺穿了盲核：

$$
\pi _ {\mathrm{TT}}(A _ a k) \neq 0, \qquad Z(x _ 0) = \mathrm{True} \neq \mathrm{False} = Z(x _ 1). \tag{1.11}
$$

一旦在第一步发生了式 $(1.10)$ – $(1.11)$ 所示的**入口商核泄漏**，整个形式化推演会发生什么？

这就像一架本应沿着球面唯一测地线直达目的地的航班，在起飞离地的第一秒钟，导航基准坐标系就被静默投影到了一个把真实航线 $x _ 0$ 与偏航轨迹 $x _ 1$ 视为同一个点的低维商空间 $Q$ 上。对于任何只接收静态商读数 $q(x) \in Q$ 的确定性下游证明程序 $P = F _ N \circ F _ {N-1} \circ \cdots \circ F _ 1$ 而言，对推理步数 $N$ 做最简单的数学归纳即可证明：无论后续叠加 $N = 10^4$ 行还是 $N = 17,374,215$ 行复杂的局部引理、上同调层论或矩阵估计，只要这 $N$ 步推演没有重新回到源头打开更细的观察读口去分离 $x _ 0$ 与 $x _ 1$ ，那么它在每一步上对真实算术对象 $x _ 0$ 与对离轴影子对象 $x _ 1$ 所计算出的商状态都必然恒等：

$$
\begin{aligned}
&\forall n \in \lbrace 1, 2, \dots, N\rbrace, \cr
&\qquad (F _ n \circ \cdots \circ F _ 1)\bigl(q(x _ 0)\bigr) \equiv (F _ n \circ \cdots \circ F _ 1)\bigl(q(x _ 1)\bigr).
\end{aligned} \tag{1.12}
$$

换言之，一旦在入口或跨区桥接处丢失了维系算术刚性的余项耦合纤维，后面耗费千万行代码所精雕细琢、层层修补的对象，早已不再是原本那个受素数唯一分解律统治的真实 $L$ 函数，而是退化商空间 $Q$ 上的一个粗化等价类。如果在这个退化商空间上宣布“已经证明了所有非平凡零点均位于 $\operatorname{Re}(s) = 1/2$ ”，那么由于影子对象 $x _ 1$ 就合法地坐落在同一个商纤维 $q(x _ 1) = q(x _ 0)$ 内，该证明项在静态类型截面 $\Sigma _ {\mathrm{TT}}$ 内部就会被直接传递给 $x _ 1$ ，与 $x _ 1$ 自身可由有限有理算术直接认证的离轴零点发生正面相撞，在类型论内部直接导出 $0 = 1$ 的逻辑矛盾。

在本专论中，我们将首先在第二章与第三章给出这一原理性诊断的**三大自撞主定理**（定理 A₀、定理 B₀–B₃、定理 C₀–C₃）与**有向证明图提取三难定理**（定理 1.4）的完整闭式数学证明；在第四章给出五大静态形式化翻译失实机制与全过程保真重构规范；随后在第五章呈献无需人工通读千万行代码的**六大最简形式化核查方案**，并完整公布我们在 lc23 算力主机上对原版 $17,374,215$ 行（ $175,187$ 个源文件、全环境 $2,701,132$ 个声明节点、 $170,706,224$ 条有向依赖边）与社区删改版 $16,571,342$ 行（ $164,464$ 个源文件）广义黎曼猜想 Lean 4 证明库所执行的**实机编译核查与全环境声明图最小割分析档案**；最后在第六章给出全部一百八十二项闭式代数、正定矩阵分解与单前提破缺反例命题的完备台账。

---

## 第二章　核心理论分析：静态类型截面 $\Sigma _ {\mathrm{TT}}$ 内通过弱投影证明广义黎曼猜想必然导出的三大原理性逻辑相撞定理

本章严格形式化以下核心问题：固定依赖类型论系统 $T$ （记 $\vdash _ T P$ 表示在 $T$ 内存在命题 $P$ 的合法闭合证明项），设模型域为 $X$ ，静态商投影为 $q = \Pi _ p : X \to Q$ 。如果有人宣称在静态类型截面 $\Sigma _ {\mathrm{TT}}$ 内构造出了广义黎曼猜想的闭合证明项，而该证明在跨入临界带时的核心排零机制实际上是通过某个弱静态商投影 $q : X \to Q$ 因子化的（即证明了统一规则 $p : \forall x \in X,\ C(q(x)) \to Z(x)$ ），那么无需离开类型论截面 $\Sigma _ {\mathrm{TT}}$ ，就在 $\Sigma _ {\mathrm{TT}}$ 内部，该证明项必然与局部可判定的有理算术或经典反模型发生正面碰撞，直接导出 $\vdash _ T (0 : \mathbb{Z}) = 1$ （即 $\vdash _ T \mathrm{False}$ ）。

| 主定理编号 | 盲核机制与同商纤维影子反模型 | 静态截面内发生正面相撞的两端 | 精确成立边界与反向保护控制 |
| :--- | :--- | :--- | :--- |
| **定理 A₀**：同商投影传递与局部有理围道绕数相撞定理 | 商纤维 $q(x _ 0) = q(x _ 1)$ 未分离真算术模型 $x _ 0$ 与在有理矩形 $B \subset \lbrace 1/2 < \operatorname{Re}(s) < 1\rbrace$ 内带单零点的影子模型 $x _ 1$ | 沿 $h _ q : q(x _ 0)=q(x _ 1)$ 作相等替换 $\operatorname{Eq.subst}$ 导出绕数 $W(x _ 1, B) = 0$ ，与局部有理 Rouché 算术导出 $W(x _ 1, B) = 1$ 相撞 | 目标谓词 $Z$ 可经 $q$ 下降当且仅当 $\operatorname{Eq}(q) \subseteq \operatorname{Eq}(Z)$ （定理 0） |
| **定理 B₀–B₃**：有限素数视界与 Beurling 广义素数换尾相撞定理 | 任意有限素数视界 $(1, P _ {\ast}]$ 加经典零点自由区与素数定理余项阶 $O(x\exp(-c\sqrt{\log x}))$ 下的 Diamond–Montgomery–Vorhauer 换尾模型 $\widetilde{\zeta} _ B$ | 弱视界排零规则断言 $\widetilde{\zeta} _ B$ 在 $1/2 < \operatorname{Re}(s) < 1$ 无零点，与修饰因子 $H(s)$ 在 $\operatorname{Re}(s)>0$ 全纯无零从而完整保留 $\zeta _ B$ 离轴零点相撞 | 定理 B₀ 严格区分有限语法与有限语义视界；定理 B₁ 证明真素数对数在 $\mathbb{Q}$ 上线性独立 |
| **定理 C₀–C₃**：临界带弱解析延拓商与奇偶通道离轴根相撞定理 | 仅保留 Hurwitz 亚纯延拓、对称函数方程 $s \leftrightarrow 1-s$ 与多项式增长界，未在临界带锁死全阶素数幂乘性的奇通道 $\mathcal{D}(s)$ 与偶通道 $F _ {\mathrm{even}}(s)$ | 弱解析签名排零规则断言一切满足函数方程与增长界的对象在 $s = 3/4$ 非零，与偶通道互反根 $F _ {\mathrm{even}}(3/4)=0$ 及奇通道开带离轴零点相撞 | 定理 C₀ 证明若完整保留右半平面 $\operatorname{Re}(s)>1$ 函数值读口，则 $\sigma \to +\infty$ 唯一决定全部 Dirichlet 系数 |

### 2.1　第一原理性相撞（定理 A₀）：同商纤维相等替换传递与局部有理矩形围道绕数 $W=0$ 对撞 $W=1$ 

为什么一个把全局算术尾项挡在截面盲核 $\ker q$ 之外的形式化证明，不能在静态截面 $\Sigma _ {\mathrm{TT}}$ 内安然无恙地“自洽存活”？

关键在于**全局算术护栏对静态商的不可见性**与**局部离轴零点对有限有理算术的完全可见性**之间存在根本的不对称性。在复分析中，给定临界带右半侧 $1/2 < \operatorname{Re}(s) < 1$ 内的任意有理闭矩形

$$
\begin{aligned}
B &= [\sigma _ 1, \sigma _ 2] \times [t _ 1, t _ 2] \cr
&\subset \lbrace s \in \mathbb{C} : 1/2 < \operatorname{Re}(s) < 1\rbrace \cr
&\qquad (\sigma _ 1, \sigma _ 2, t _ 1, t _ 2 \in \mathbb{Q}),
\end{aligned} \tag{2.1}
$$

只要函数 $f$ 在 $B$ 的一个开邻域内全纯且在矩形边界 $\partial B$ 上处处非零，则 $f$ 在 $B$ 内部的零点总重数由正向边界围道上的对数导数绕数积分唯一决定：

$$
W(f, B) := \frac{1}{2\pi i} \oint _ {\partial B} \frac{f'(s)}{f(s)}\thinspace ds \in \mathbb{Z}. \tag{2.2}
$$

由于 $W(f, B)$ 是一个取值为整数的拓扑不变量，只要在矩形边界 $\partial B$ 上给出一个在框内有唯一简单零点 $c \in B^{\circ}$ 的有理参考函数 $f _ 1(s) = s - c$ ，并验证严格有理 Rouché 不等式

$$
\inf _ {s \in \partial B} |f _ 1(s)|^2 - \sup _ {s \in \partial B} |f(s) - f _ 1(s)|^2 > 0, \tag{2.3}
$$

那么在类型论截面 $\Sigma _ {\mathrm{TT}}$ 内部，仅凭有限有理区间算术就能无可辩驳地证出 $W(f, B) = W(f _ 1, B) = 1$ 。

#### 定理 A₀（静态类型截面内五前件同商传递自撞定理）

设在类型论系统 $T$ 中，模型域为 $X$ ，静态商观察为 $q : X \to Q$ ， $C : Q \to \mathrm{Prop}$ 为静态商上的受审前件谓词， $Z : X \to \mathrm{Prop}$ 表示对象在固定有理矩形 $B \subset \lbrace 1/2 < \operatorname{Re}(s) < 1\rbrace$ 内无零点， $W : X \to \mathbb{Z}$ 为绑定同一函数族、同一有理矩形 $B$ 与同一正向围道归一化的绕数映射。若在 $T$ 内同时存在以下五项闭合证明项：

**(1) 弱商因子化排零证明项**：

$$
p : \forall x \in X,\ C\bigl(q(x)\bigr) \to Z(x); \tag{2.4}
$$

**(2) 真算术基准对象的商前件证明项**：

$$
h _ 0 : C\bigl(q(x _ 0)\bigr); \tag{2.5}
$$

**(3)** 真算术对象 $x _ 0$ 与影子对象 $x _ 1$ 的同商纤维相等证明项：

$$
h _ q : q(x _ 0) = _ Q q(x _ 1); \tag{2.6}
$$

**(4)** 无零点蕴含绕数为零的辐角原理桥接证明项（含 $x _ 1$ 在 $B$ 邻域全纯、无极点且 $\partial B$ 无零点资格）：

$$
h _ {ZW} : Z(x _ 1) \to W(x _ 1) = _ {\mathbb{Z}} 0; \tag{2.7}
$$

**(5)** 影子对象 $x _ 1$ 在有理框 $B$ 内局部有理围道认证绕数为一的证明项：

$$
h _ 1 : W(x _ 1) = _ {\mathbb{Z}} 1; \tag{2.8}
$$

则在类型论系统 $T$ 内部无需任何外部假设，直接由上述五项合取在四步内导出整数环矛盾与空类型：

$$
\begin{aligned}
&p, h _ 0, h _ q, h _ {ZW}, h _ 1 \vdash _ T (0 : \mathbb{Z}) = 1 \cr
&\qquad \land\quad p, h _ 0, h _ q, h _ {ZW}, h _ 1 \vdash _ T \mathrm{False}.
\end{aligned} \tag{2.9}
$$

#### 一步不跳证明
**(1)** **第一步**（沿同商纤维相等证明项 $h _ q$ 作相等替换传递）：以商空间 $Q$ 上的谓词 $u \mapsto C(u)$ 为相等消去动机（motive），对真算术对象的前件证明项 $h _ 0 : C(q(x _ 0))$ 沿相等证明项 $h _ q : q(x _ 0) = _ Q q(x _ 1)$ 施加依赖类型论内置的相等替换算子 $\operatorname{Eq.subst}$ ，立即在 $\Sigma _ {\mathrm{TT}}$ 内得到影子对象 $x _ 1$ 的商前件证明项：

$$
h _ C := \operatorname{Eq.subst}\bigl(h _ q, h _ 0\bigr) : C\bigl(q(x _ 1)\bigr). \tag{2.10}
$$

**(2) 第二步**（将弱商排零证明项 $p$ 实例化于影子对象 $x _ 1$ ）：将全称证明项 $p$ 对 $x _ 1 \in X$ 及刚刚获得的 $h _ C : C(q(x _ 1))$ 进行函数应用，得 $p(x _ 1)(h _ C) : Z(x _ 1)$ ；再将其送入辐角原理桥接项 $h _ {ZW}$ ，在 $\Sigma _ {\mathrm{TT}}$ 内推出影子对象的绕数必须为零：

$$
h _ {W,0} := h _ {ZW}\bigl(p(x _ 1)(h _ C)\bigr) : W(x _ 1) = _ {\mathbb{Z}} 0. \tag{2.11}
$$

**(3) 第三步**（调取局部有理围道独立认证的绕数证明项 $h _ 1$ ）：由第 5 项输入，同一影子对象 $x _ 1$ 在同一有理矩形框 $B$ 上的绕数满足 $h _ 1 : W(x _ 1) = _ {\mathbb{Z}} 1$ 。
**(4)** **第四步**（相等对称与传递合流导出整数环 $0 = 1$ 矛盾）：对 $h _ {W,0} : W(x _ 1) = _ {\mathbb{Z}} 0$ 取相等对称 $\operatorname{Eq.symm}(h _ {W,0}) : 0 = _ {\mathbb{Z}} W(x _ 1)$ ，再与 $h _ 1 : W(x _ 1) = _ {\mathbb{Z}} 1$ 作相等传递 $\operatorname{Eq.trans}$ ，即在 $T$ 内构造出闭合项：

$$
\begin{aligned}
h _ {\mathrm{coll}} &:= \operatorname{Eq.trans}\bigl(\operatorname{Eq.symm}(h _ {W,0}),\ h _ 1\bigr) \cr
&: (0 : \mathbb{Z}) = 1.
\end{aligned} \tag{2.12}
$$

由于在整数类型 $\mathbb{Z}$ 中 $0$ 与 $1$ 属于不同构造子（或由可判定算术给出 $h _ {0\neq 1} : (0 : \mathbb{Z}) \neq 1$ ），将 $h _ {\mathrm{coll}}$ 送入 $h _ {0\neq 1}$ 即得 $\vdash _ T \mathrm{False}$ 。证毕。

**局部有理 Rouché 裕量的显式有理认证实例**。取离轴中心点 $c = \frac{3}{4} + i \in \bigl\lbrace \frac{1}{2} < \operatorname{Re}(s) < 1\bigr\rbrace$ ，并取半宽为 $r = \frac{1}{8}$ 的有理闭矩形：

$$
\begin{aligned}
B &= [5/8, 7/8] \times [7/8, 9/8] \cr
&\subset \lbrace s \in \mathbb{C} : 1/2 < \operatorname{Re}(s) < 1\rbrace.
\end{aligned} \tag{2.13}
$$

对无零点常函数 $f _ 0(s) = 1$ 与具有框内唯一简单零点 $c$ 的线性主部 $f _ 1(s) = s - c$ ，在矩形边界 $\partial B$ 的四条有理线段上， $\max\bigl(|\operatorname{Re}(s) - 3/4|, |\operatorname{Im}(s) - 1|\bigr) = \frac{1}{8}$ ，故主部模长平方在整条边界 $\partial B$ 上满足严格下界 $|f _ 1(s)|^2 \ge \left(\frac{1}{8}\right)^2 = \frac{1}{64}$ 。对任意在 $B$ 邻域全纯且在整条边界 $\partial B$ 上满足一致扰动上界 $|f(s) - f _ 1(s)| \le \frac{1}{16}$ 的函数 $f$ ，其平方 Rouché 裕量为精确正有理数：

$$
\Delta _ {\mathrm{Rouche}} = (1/8)^2 - (1/16)^2 = \frac{1}{64} - \frac{1}{256} = \frac{3}{256} > 0. \tag{2.14}
$$

由 Rouché 定理及正向围道积分 $\frac{1}{2\pi i}\oint _ {\partial B}\frac{ds}{s-c} = 1$ ，立即给出 $W(f, B) = W(f _ 1, B) = 1 \neq 0 = W(f _ 0, B)$ 。

**定理 A₀ 的精确传递边界**（定理 0）：必须注意，如果形式系统内只有一个针对特定对象 $x _ 0$ 的孤立定理 $p _ 0 : Z(x _ 0)$ ，而 $Z : X \to \mathrm{Prop}$ 并没有通过商映射 $q : X \to Q$ 因子化，那么 $\operatorname{Eq.subst}(h _ q, \cdot)$ 只能替换以 $q(x _ 0) \in Q$ 为自变量的谓词，不能直接把 $Z(x _ 0)$ 替换为 $Z(x _ 1)$ 。例如取 $X = \mathbb{R}^2$ 、 $q(x,y) = x$ 、 $Z(x,y) \iff (y = 0)$ ，则 $q(0,0) = 0 = q(0,1)$ ，但 $Z(0,0)$ 为真而 $Z(0,1)$ 为假；反之若目标为 $Z'(x,y) \iff (x = 0)$ ，则 $\ker q$ 虽然非零却满足 $\operatorname{Eq}(q) \subseteq \operatorname{Eq}(Z')$ ，此时盲核对目标 $Z'$ 完全无害。因此，定理 A₀ 精确锁定的是将排零证明建立在满足 $q(x _ 0)=q(x _ 1)$ 的弱前件 $C(q(x))$ 之上的因子化证明结构。

### 2.2　第二原理性相撞（定理 B₀–B₃）：素数对数 $\mathbb{Q}$ -线性独立刚性与 Diamond–Montgomery–Vorhauer 广义素数有限视界换尾定理

在排查千万行级形式化证明时，经常遇到第二种深层疑问：如果一个形式化证明只显式展开了有限个小素数 $p \le P _ {\ast}$ （例如 $p \in \lbrace 2, 3, 5, \dots, 23\rbrace$ ）的局部性质，然后再拼接上经典的零点自由区 $\sigma > 1 - a/\log t$ 与素数定理渐近余项 $O(x\exp(-c\sqrt{\log x}))$ ，它能否在临界带内排除离轴零点？

为了使论证达到零漏洞的数学严密性，我们首先用**定理 B₀**划清“语法有限性”与“语义有限视界”的严格界限，再用**定理 B₁**证明普通素数对数的代数刚性，最后用**定理 B₂–B₃**证明：在任意大的有限素数视界 $P _ {\ast}$ 下，仅凭有限素数前缀加上经典零点自由区与素数定理渐近余项阶，在数学上**绝对无法排除临界带离轴零点**。

#### 定理 B₀（全称归纳语法与有限语义视界的严格分型定理）

在含自然数归纳原理的依赖类型论 $T$ 中，一个闭合证明项 $p$ 在语法上只包含有限个字符与有限个字面常量，绝不意味着它在语义上只能约束有限个素数。
**证明**：在自然数类型 $\mathbb{N}$ 上，由基步 $0 + 0 = 0$ 与归纳步 $n + 0 = n \implies \operatorname{succ}(n) + 0 = \operatorname{succ}(n + 0) = \operatorname{succ}(n)$ 构成的归纳证明项仅有固定有限长度，但其结论 $\forall n \in \mathbb{N},\ n + 0 = n$ 约束全部无穷多个自然数。同理，欧几里得素数整除引理 $\forall p, a, b \in \mathbb{N},\ \operatorname{Nat.Prime}(p) \to p \mid ab \to (p \mid a \lor p \mid b)$ 中的 $p$ 是遍历全部无穷素数的全称约束变量，而非源码中出现的字面素数常量列表。因此，断言一个形式证明落入“有限素数视界盲核”，绝对不能仅凭“证明文本长度有限”，而必须严格指明该证明在进入临界带时的解析估计仅通过有限素数窗口 $(1, P _ {\ast}]$ 与渐近余项量级发生因子化。证毕。

#### 定理 B₁（普通素数对数族的有理线性独立刚性定理）

设 $p _ 1 < p _ 2 < \cdots < p _ k$ 为任意有限个互不相同的普通素数。若存在有理系数 $r _ 1, r _ 2, \dots, r _ k \in \mathbb{Q}$ 使得

$$
\sum _ {j=1}^{k} r _ j \log p _ j = 0, \tag{2.15}
$$

则必有 $r _ 1 = r _ 2 = \cdots = r _ k = 0$ 。
**一步不跳证明**：设 $r _ j = u _ j / v _ j$ （ $u _ j \in \mathbb{Z}, v _ j \in \mathbb{Z} _ {>0}$ ），取公分母 $M = \prod _ {j=1}^k v _ j \in \mathbb{Z} _ {>0}$ ，令 $m _ j = M r _ j \in \mathbb{Z}$ ，则式 $(2.15)$ 化为 $\sum _ {j=1}^k m _ j \log p _ j = 0$ 。将正负指数分离，记 $J _ + = \lbrace j : m _ j > 0\rbrace$ 、 $J _ - = \lbrace j : m _ j < 0\rbrace$ ，两边取实指数函数 $\exp(\cdot)$ 并移项，得正整数等式：

$$
\prod _ {j \in J _ +} p _ j^{m _ j} = \prod _ {j \in J _ -} p _ j^{-m _ j}. \tag{2.16}
$$

由于 $J _ + \cap J _ - = \varnothing$ 且 $p _ 1, \dots, p _ k$ 互不相同，由正整数素因数唯一分解定理逐个比较素数 $p _ j$ 的指数，即得全部 $m _ j = 0$ ，从而 $r _ j = m _ j / M = 0$ （ $\forall j \in \lbrace 1, \dots, k\rbrace$ ）。证毕。

定理 B₁ 表明，在普通正整数算术中，全阶素数族通过唯一分解定律构成了一个无穷维的刚性正交骨架。然而，一旦形式化证明在跨越 $\operatorname{Re}(s) = 1$ 时没有把这种**全体无穷素数的乘性耦合**传递进临界带，而是退化为只读取“前 $P _ {\ast}$ 个素数的有限 Euler 因子”加上“经典零点自由区与素数定理余项阶”，Diamond–Montgomery–Vorhauer（2006）构造的离散 Beurling 广义素数系统就会立刻在同一个观察商纤维中构造出严格的离轴零点反模型。

#### 定理 B₂（任意有限素数视界 $P _ {\ast}$ 下的广义素数换尾匹配与离轴零点全保持定理）

根据 Diamond–Montgomery–Vorhauer 存在性定理（文献 [1, 2]），存在离散广义素数序列 $B = (b _ j) _ {j\ge 1}$ （ $1 < b _ 1 \le b _ 2 \le \cdots \to \infty$ ）及其生成的广义整数计数函数 $N _ B(x)$ 、广义素数计数函数 $\pi _ B(x)$ 、Chebyshev 函数 $\psi _ B(x)$ 与广义 zeta 函数 $\zeta _ B(s) = \prod _ {j=1}^\infty (1 - b _ j^{-s})^{-1}$ （ $\operatorname{Re}(s) > 1$ ），以及常数 $\frac{1}{2} < \theta < 1$ 、 $\kappa _ B, a, c _ 1, C _ 1, C _ 2 > 0$ （其中 $a > \frac{4}{e}(1-\theta)$ ），使得：
(i) $|N _ B(x) - \kappa _ B x| \le C _ 1 x^\theta$ （ $\forall x \ge x _ 0$ ），故 $\zeta _ B(s)$ 亚纯延拓至半平面 $\operatorname{Re}(s) > \theta$ ，除 $s = 1$ 处留数为 $\kappa _ B$ 的简单极点外处处全纯；
(ii) $|\pi _ B(x) - \operatorname{li}(x)| + |\psi _ B(x) - x| \le C _ 2 x \exp(-c _ 1 \sqrt{\log x})$ （ $\forall x \ge x _ 0$ ）；
(iii) $\zeta _ B(s)$ 在经典区域 $\sigma > 1 - a/\log t$ （ $t \ge t _ 0$ ）内无零点，但在临界带开区间 $\theta < \operatorname{Re}(s) < 1$ 内拥有无穷多个离轴零点 $\rho _ n = 1 - \frac{a}{\log t _ n} + i t _ n \in \bigl\lbrace \frac{1}{2} < \operatorname{Re}(s) < 1\bigr\rbrace$ （ $t _ n \to \infty$ ）。

现在，给定**任意大**的有限素数视界阈值 $P _ {\ast} \ge 2$ ，我们对该广义素数系统 $B$ 施行**有限窗口算术换尾手术**：删去 $B$ 中所有满足 $b _ j \le P _ {\ast}$ 的有限个广义素数多重集 $D = \lbrace b _ j \in B : b _ j \le P _ {\ast}\rbrace$ ，并替换为区间 $(1, P _ {\ast}]$ 内的全部普通素数集合 $A = \lbrace p \in \mathcal{P} : p \le P _ {\ast}\rbrace$ ，记所得新广义素数系统为 $\widetilde{B}$ 。则新系统的 zeta 函数 $\widetilde{\zeta} _ B(s)$ 满足：

**(1)** 有限视界 $(1, P _ {\ast}]$ 上的绝对全同性： $\widetilde{B} \cap (1, P _ {\ast}] = \mathcal{P} \cap (1, P _ {\ast}]$ ，即在观察窗口 $(1, P _ {\ast}]$ 内，新系统的素数生成元与普通真素数逐项完全一致；
**(2)** 开右半平面 $\operatorname{Re}(s) > 0$ 上修饰因子的全纯无零性与离轴零点全保持性：在 $\operatorname{Re}(s) > 1$ 上，

$$
\begin{aligned}
\widetilde{\zeta} _ B(s) &= \zeta _ B(s) H _ {P _ {\ast}}(s), \cr
H _ {P _ {\ast}}(s) &:= \frac{\prod _ {b \in D}(1 - b^{-s})}{\prod _ {p \in A}(1 - p^{-s})}.
\end{aligned} \tag{2.17}
$$

由于 $D$ 与 $A$ 均为有限集，且对一切 $b \in D$ 与 $p \in A$ 均有 $b > 1, p \ge 2$ ，故在开右半平面 $\operatorname{Re}(s) > 0$ 上严格有 $|b^{-s}| = b^{-\operatorname{Re}(s)} < 1$ 及 $|p^{-s}| = p^{-\operatorname{Re}(s)} < 1$ 。因此分子与分母的每一个有限因子在 $\operatorname{Re}(s) > 0$ 上均全纯且处处非零，从而有理Euler修饰因子 $H _ {P _ {\ast}}(s)$ 在整个开右半平面 $\operatorname{Re}(s) > 0$ 上**全纯且处处无零点**。由解析延拓唯一性，式 $(2.17)$ 在延拓域 $\lbrace \operatorname{Re}(s) > \theta\rbrace \subset \lbrace \operatorname{Re}(s) > 0\rbrace$ 上恒成立，且 $\widetilde{\zeta} _ B(s)$ 在 $\lbrace \theta < \operatorname{Re}(s) < 1\rbrace$ 内的零点除子（含全部离轴零点 $\rho _ n = 1 - \frac{a}{\log t _ n} + it _ n \in \lbrace 1/2 < \operatorname{Re}(s) < 1\rbrace$ 及其重数）与 $\zeta _ B(s)$ **完全相同**。
**(3)** **素数定理渐近余项阶的严格保持性**：有限增删对素数计数函数的改变量满足 $|\pi _ {\widetilde{B}}(x) - \pi _ B(x)| \le |A| + |D| = O(1)$ ；每个被增删的生成元 $u \in A \cup D$ 对 Chebyshev 函数的贡献至多为 $\log u \cdot \lfloor \log x / \log u \rfloor = O(\log x)$ ，故有限项总改变量满足

$$
\begin{aligned}
\bigl|\psi _ {\widetilde{B}}(x) - \psi _ B(x)\bigr| \cr
&\le \sum _ {u \in A \cup D} \log u \cdot \lfloor \log x / \log u \rfloor \cr
&= O(\log x) \ll x \exp\bigl(-c _ 1 \sqrt{\log x}\bigr).
\end{aligned} \tag{2.18}
$$

#### 推论 B₃（有限素数视界与经典渐近余项商上的排零规则自撞定理）

在广义素数模型域 $X _ {\mathrm{Beurling}}$ 上，若静态观察商 $q _ {P _ {\ast}}(x)$ 仅记录有限窗口 $(1, P _ {\ast}]$ 内的素数生成元以及经典零点自由区与式 $(2.18)$ 的素数定理余项阶，则经过换尾手术的反模型 $\widetilde{B}$ 在 $q _ {P _ {\ast}}$ 下与真素数系统满足完全相同的商前件 $C(q _ {P _ {\ast}}(\widetilde{B}))$ ，却在 $1/2 < \operatorname{Re}(s) < 1$ 内完整保留了无穷多个离轴零点 $\rho _ n$ 。因此，任何仅通过 $C(q _ {P _ {\ast}}(x))$ 因子化的统一排零定理在 $\Sigma _ {\mathrm{TT}}$ 内代入 $\widetilde{B}$ 后，必直接导出 $\vdash _ T (0 : \mathbb{Z}) = 1$ 。

### 2.3　第三原理性相撞（定理 C₀–C₃）：右半平面系数唯一恢复定理与临界带弱解析延拓商上的奇偶通道离轴根退化定理

第三种、也是在 Lean 4 / Mathlib 形式化体系中最具有代表性的商空间退化，发生在**从右半平面 Dirichlet 级数向全平面 Hurwitz 亚纯延拓切换载体**的接口处。

正如我们在第五章 lc23 实机实测中直接用 #print DirichletCharacter.LFunction 与 #print ZMod.LFunction 所剥离出的源码定义， Mathlib 将模 $N$ 的 Dirichlet $L$ 函数定义为：

$$
\begin{aligned}
\operatorname{DirichletCharacter.LFunction}(\chi, s) &:= \operatorname{ZMod.LFunction}(\chi, s) \cr
&= N^{-s} \sum _ {j \in \operatorname{ZMod}(N)} \chi(j)\zeta _ {\mathrm{Hurwitz}}(\operatorname{toAddCircle}(j), s).
\end{aligned} \tag{2.19}
$$

请仔细审视式 $(2.19)$ 的底层载体 $\operatorname{ZMod.LFunction}(\Phi, s)$ ：它的输入类型是任意模 $N$ 周期函数 $\Phi : \operatorname{ZMod}(N) \to \mathbb{C}$ ，其解析定义是 $N$ 个位移 Hurwitz $\zeta$ 函数的**纯加法线性组合**。

为了保持百分之百的数学严密性，我们首先证明**定理 C₀**：如果一个下游定理真正完整地使用了右半平面 $\operatorname{Re}(s) > 1$ 上的精确函数值读口以及外层 $\chi \in \operatorname{DirichletCharacter}(\mathbb{C}, N)$ 的乘法同态属性，那么式 $(2.19)$ 本身并不会丢失乘性信息。但紧接着，我们用**定理 C₁–C₃**证明：一旦临界带内的排零子图只依赖由式 $(2.19)$ 提供的**弱解析延拓商签名**（即：整函数或仅在 $s=1$ 有简单极点的亚纯延拓、带 Gamma 因子的对称函数方程 $s \leftrightarrow 1-s$ 、垂直带多项式增长界以及模 $N$ 周期系数），而没有把全阶素数幂乘性 $a _ {mn} = a _ m a _ n$ 作为必要算术前件传入临界带，那么这个弱解析延拓商在 $\Sigma _ {\mathrm{TT}}$ 内就会同时容纳**奇通道 Davenport–Heilbronn 离轴反模型**与**偶通道显式互反多项式离轴反模型**，直接导出 $3/4 = 1/2$ 与 $(0 : \mathbb{Z}) = 1$ 。

#### 定理 C₀（右半平面完整函数值读口下的 Dirichlet 系数唯一恢复定理）

设两列复系数 $(a _ n) _ {n\ge 1}$ 与 $(b _ n) _ {n\ge 1}$ 的普通 Dirichlet 级数 $f(s) = \sum _ {n=1}^\infty a _ n n^{-s}$ 与 $g(s) = \sum _ {n=1}^\infty b _ n n^{-s}$ 在某个共同半平面 $\operatorname{Re}(s) > \sigma _ a$ 上绝对收敛。若存在实数序列 $\sigma _ k \to +\infty$ 使得 $f(\sigma _ k) = g(\sigma _ k)$ （ $\forall k$ ），则必有 $a _ n = b _ n$ （ $\forall n \ge 1$ ）。
**一步不跳证明**：令 $c _ n = a _ n - b _ n$ 。反设存在 $n \ge 1$ 使 $c _ n \neq 0$ ，取最小正整数 $n _ 0 = \min\lbrace n \ge 1 : c _ n \neq 0\rbrace$ 。取固定实数 $\sigma _ 0 > \sigma _ a$ ，则 $\sum _ {n=1}^\infty |c _ n| n^{-\sigma _ 0} < \infty$ 。对任意 $\sigma > \sigma _ 0$ ，由于 $c _ 1 = \cdots = c _ {n _ 0-1} = 0$ ，将恒等式 $\sum _ {n=n _ 0}^\infty c _ n n^{-\sigma} = 0$ 两边同乘 $n _ 0^{\sigma}$ 并移项，得：

$$
\begin{aligned}
|c _ {n _ 0}| = \left|\sum _ {n=n _ 0+1}^{\infty} c _ n \left(\frac{n _ 0}{n}\right)^{\sigma}\right| \cr
&\le \sum _ {n=n _ 0+1}^{\infty} |c _ n| n^{-\sigma _ 0} \left(\frac{n _ 0}{n}\right)^{\sigma - \sigma _ 0} \cr
&\le \left(\frac{n _ 0}{n _ 0+1}\right)^{\sigma - \sigma _ 0} \sum _ {n=n _ 0+1}^{\infty} |c _ n| n^{-\sigma _ 0}.
\end{aligned} \tag{2.20}
$$

由于 $0 < \frac{n _ 0}{n _ 0+1} < 1$ ，沿着 $\sigma = \sigma _ k \to +\infty$ 取极限，式 $(2.20)$ 右端趋于 $0$ ，迫使 $|c _ {n _ 0}| = 0$ ，与 $c _ {n _ 0} \neq 0$ 矛盾。故 $a _ n = b _ n$ （ $\forall n \ge 1$ ）。证毕。

#### 定理 C₁（奇通道 Davenport–Heilbronn 周期 Hurwitz 组合的乘性破缺与开临界带离轴零点定理）

取模 $N = 5$ 的奇本原 Dirichlet 特征 $\chi _ 5$ （在余类 $1, 2, 3, 4, 0 \pmod 5$ 上依次取值 $1, i, -i, -1, 0$ ），记其共轭特征为 $\bar{\chi} _ 5$ ，并取实代数常数

$$
\begin{aligned}
\kappa &:= \frac{\sqrt{10 - 2\sqrt{5}} - 2}{\sqrt{5} - 1} > 0, \cr
\frac{\tau(\chi _ 5)}{i\sqrt{5}} &= \frac{1 + i\kappa}{1 - i\kappa}.
\end{aligned} \tag{2.21}
$$

定义模 $5$ 实周期函数 $\Phi _ {\mathrm{DH}} : \operatorname{ZMod}(5) \to \mathbb{C}$ 及其对应的 Hurwitz 线性组合（Davenport–Heilbronn 函数）：

$$
\begin{aligned}
\mathcal{D}(s) &:= \operatorname{ZMod.LFunction}(\Phi _ {\mathrm{DH}}, s) \cr
&= \frac{1 - i\kappa}{2} L(s, \chi _ 5) + \frac{1 + i\kappa}{2} L(s, \bar{\chi} _ 5) \cr
&= \sum _ {n=1}^{\infty} a _ n(\kappa) n^{-s},
\end{aligned} \tag{2.22}
$$

其中周期系数 $a _ n(\kappa)$ 在 $n \equiv 1, 2, 3, 4, 0 \pmod 5$ 上依次取实数值 $1, \kappa, -\kappa, -1, 0$ 。则：

**(1)** **完备化对称函数方程与全纯性完全成立**： $\mathcal{D}(s)$ 延拓为整个复平面上的整函数，其单位模根数满足

$$
\begin{aligned}
|\epsilon _ {\chi _ 5}|^2 &= \left|\frac{1 + i\kappa}{1 - i\kappa}\right|^2 = \frac{1 + \kappa^2}{1 + \kappa^2} = 1, \cr
\left|\frac{i - \kappa}{1 - i\kappa}\right|^2 &= \frac{\kappa^2 + 1}{1 + \kappa^2} = 1,
\end{aligned} \tag{2.23}
$$

且完备化整函数

$$
\Lambda _ {\mathrm{DH}}(s) := \left(\frac{5}{\pi}\right)^{s/2} \Gamma\left(\frac{s+1}{2}\right) \mathcal{D}(s) \tag{2.24}
$$

精确满足标量自对偶对称函数方程 $\Lambda _ {\mathrm{DH}}(s) = \Lambda _ {\mathrm{DH}}(1 - s)$ 及与标准奇特征完备化 $L$ 函数完全相同的垂直带增长阶；
**(2)** 首个复合数指标 $n = 6 = 2 \times 3$ 处的严格乘性破缺：在互素素数对 $(2, 3)$ 上， $a _ 2(\kappa) = \kappa$ 、 $a _ 3(\kappa) = -\kappa$ ，而 $6 \equiv 1 \pmod 5$ 故 $a _ 6(\kappa) = 1$ 。其乘性破缺残差严格大于零：

$$
\Delta _ {\mathrm{mult}}(2, 3) := a _ 6(\kappa) - a _ 2(\kappa) a _ 3(\kappa) = 1 + \kappa^2 > 0; \tag{2.25}
$$

**(3)** 开临界带 $\frac{1}{2} < \operatorname{Re}(s) < 1$ 内的无穷离轴零点（Voronin 定理，文献 [3, 4]）：对任意 $\frac{1}{2} < \sigma _ 1 < \sigma _ 2 < 1$ ，存在常数 $c _ {\sigma _ 1, \sigma _ 2} > 0$ 与 $T _ {\sigma _ 1, \sigma _ 2} > 0$ ，使得当 $T \ge T _ {\sigma _ 1, \sigma _ 2}$ 时，

$$
\begin{aligned}
&\sum _ {\substack{\mathcal{D}(\rho) = 0 \cr \sigma _ 1 < \operatorname{Re}(\rho) < \sigma _ 2}}
\operatorname{ord} _ {\rho}(\mathcal{D}) \cr
&\qquad \ge c _ {\sigma _ 1, \sigma _ 2} T > 0 \qquad (0 < \operatorname{Im}(\rho) \le T).
\end{aligned} \tag{2.26}
$$

#### 定理 C₂（偶通道显式互反多项式因子与 $s = 3/4$ 精确离轴根定理）

在偶 Gamma 通道中，令 $y(s) := 2^{1/2 - s} = \exp\bigl((1/2 - s)\log 2\bigr)$ ，则在对称反射 $s \leftrightarrow 1 - s$ 下严格有 $y(1 - s) = y(s)^{-1}$ 。对任意正实参数 $r > 0$ （特取 $r = 2^{1/4} = \exp\bigl(\frac{1}{4}\log 2\bigr) > 1$ ），定义互反二次因子与偶通道变形函数：

$$
P _ r(y) := 1 - \left(r + \frac{1}{r}\right)y + y^2 = (1 - ry)\left(1 - \frac{y}{r}\right), \tag{2.27}
$$

$$
\begin{aligned}
F _ {\mathrm{even}}(s) &:= P _ r\bigl(y(s)\bigr) \zeta(s), \cr
\Lambda _ {\mathrm{even}}(s) &:= \left(2^s + 2^{1-s} - \left(r + \frac{1}{r}\right)\sqrt{2}\right) \Lambda _ {\zeta}(s),
\end{aligned} \tag{2.28}
$$

其中 $\Lambda _ {\zeta}(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s) = \Lambda _ {\zeta}(1-s)$ 。则：
**(1)** **对称函数方程与极点结构保持**：由 $2^s + 2^{1-s}$ 对 $s \leftrightarrow 1-s$ 的不变性及 $\Lambda _ {\zeta}(1-s) = \Lambda _ {\zeta}(s)$ ，恒有 $\Lambda _ {\mathrm{even}}(1-s) = \Lambda _ {\mathrm{even}}(s)$ ；且在 $s = 1$ 处因 $r = 2^{1/4} \neq 2^{1/2}$ 保持简单极点；
**(2)** 在有理实部点 $s = 3/4$ （以及有理代数测试点 $r = 2, y = 1/2$ ）处的精确零点：在有理代数模型 $r = 2, y = 1/2$ 下，

$$
P _ 2(1/2) = 1 - (2 + 1/2)(1/2) + (1/2)^2 = 1 - 5/4 + 1/4 = 0; \tag{2.29}
$$

在解析模型 $r = 2^{1/4}$ 下，当 $s = \frac{3}{4}$ 时 $y(3/4) = 2^{1/2 - 3/4} = 2^{-1/4} = r^{-1}$ ，故

$$
P _ r\bigl(y(3/4)\bigr) = 1 - (r + r^{-1})r^{-1} + r^{-2} = 0 \implies F _ {\mathrm{even}}(3/4) = 0. \tag{2.30}
$$

#### 推论 C₃（弱解析延拓商上的排零规则自撞定理）

若任何临界带排零引理的形式化签名仅要求对象具有整函数（或 $s=1$ 简单极点）延拓、满足对称函数方程 $\Lambda(1-s) = \epsilon\Lambda(s)$ 及垂直带多项式增长界（例如我们在第五章实机编译的 WeakRule ： $\forall F : \mathbb{C} \to \mathbb{C},\ \operatorname{Differentiable}(\mathbb{C}, F) \to (\forall s,\ F(1-s)=F(s)) \to (\forall s,\ \Vert F(s)\Vert \le (\Vert s\Vert +1)^2) \to (\forall s,\ 0 < \operatorname{Re}(s) < 1 \to F(s)=0 \to \operatorname{Re}(s)=1/2)$ ），则将代数对称特洛伊多项式

$$
P _ {\mathrm{Trojan}}(s) := (s - 3/4)(s - 1/4) = (s - 1/2)^2 - 1/16 \tag{2.31}
$$

或 $F _ {\mathrm{even}}(s)$ 、 $\mathcal{D}(s)$ 在 $s = 3/4$ （或 $\rho _ {\mathrm{DH}}$ ）处直接代入该规则，立即在 $\Sigma _ {\mathrm{TT}}$ 内导出有理数碰撞：

$$
(3/4 : \mathbb{R}) = 1/2 \implies \vdash _ T (0 : \mathbb{Z}) = 1 \implies \vdash _ T \mathrm{False}. \tag{2.32}
$$

---

## 第三章　图论结构定理 1.4：有向证明依赖图从原版 $\mathcal{G} _ {\mathrm{orig}}$ 到精简提取版 $\mathcal{G} _ {\mathrm{ext}}$ 的“语义缺陷守恒与提取三难定理”

面对千万行级形式化工程，外部有时会出现一种极具迷惑性的辩解逻辑：“哪怕原版一千七百多万行代码中存在冗余模块、复杂证明体或局部瑕疵，只要通过裁剪导入树、删除未引用模块并缩短部分证明项，得到一个能通过类型检查的精简提取版，原版中的问题就无关紧要了。”

为了从数学上彻底厘清“裁剪或提取有向证明图究竟能改变什么、不能改变什么”，我们在有向无环声明依赖图（将互归纳声明块收缩为单个超节点后为严格有限有向无环图）上建立**定理 1.4**（语义缺陷守恒与提取三难定理）。

### 3.1　有向证明依赖图、上游依赖锥与提取算子的严格定义

设静态类型截面中的声明依赖图为 $\mathcal{G} = (V, E, \tau, b, \Gamma)$ ，其中顶点集 $V$ 为环境中的全部形式声明（含定理、引理、定义、归纳类型、构造子、递归器与公理），有向边 $(u \to v) \in E$ 表示声明 $v$ 的类型表达式 $\tau(v)$ 、定义或证明体 $b(v)$ 或结构规则直接引用了声明 $u$ 。对任意目标声明 $v _ {\mathrm{goal}} \in V$ ，其**上游依赖锥**定义为所有存在有向路径通向 $v _ {\mathrm{goal}}$ 的顶点集合：

$$
\begin{aligned}
\operatorname{Cone} _ {\mathcal{G}}(v _ {\mathrm{goal}}) &:=
\lbrace u \in V : u \leadsto _ {\mathcal{G}} v _ {\mathrm{goal}}\rbrace.
\end{aligned} \tag{3.1}
$$

设 $E _ {\mathrm{err}} \subseteq V$ 为原版图 $\mathcal{G} _ {\mathrm{orig}}$ 中被识别出的有问题或待剔除声明集合。一个**图提取或裁剪算子**

$$
\begin{aligned}
\mathcal{E} &: (\mathcal{G} _ {\mathrm{orig}}, v _ {\mathrm{goal}}) \cr
&\longmapsto (\mathcal{G} _ {\mathrm{ext}}, v _ {\mathrm{goal}}^{\mathrm{ext}}, \mu, \mathcal{B}).
\end{aligned} \tag{3.2}
$$

将原图映射为提取图 $\mathcal{G} _ {\mathrm{ext}} = (V _ {\mathrm{ext}}, E _ {\mathrm{ext}}, \tau _ {\mathrm{ext}}, b _ {\mathrm{ext}}, \Gamma _ {\mathrm{ext}})$ ，其中 $\mu : V _ {\mathrm{ext}} \rightharpoonup V _ {\mathrm{orig}} \setminus E _ {\mathrm{err}}$ 为保留节点的部分回溯映射， $\mathcal{B}$ 为新旧节点之间的定义等价与局部推理保义证书族。在提取图依赖锥 $\operatorname{Cone} _ {\mathcal{G} _ {\mathrm{ext}}}(v _ {\mathrm{goal}}^{\mathrm{ext}})$ 中，所有未通过 $\mu$ 与 $\mathcal{B}$ 完全等同于原残余图 $\mathcal{G} _ {\mathrm{orig}} \setminus E _ {\mathrm{err}}$ 的节点（包括新引入的叶节点，以及虽然声明名称相同但定义体或证明体 $b _ {\mathrm{ext}}(v) \neq b _ {\mathrm{orig}}(\mu(v))$ 被改写的同名节点），统称为提取图的**替换边界** $\partial E _ {\mathrm{ext}}$ 。

### 3.2　定理 1.4（同弱商签名下的语义缺陷守恒与提取三难定理）

#### 定理 1.4（提取三难定理）

固定模型域 $X$ 、弱静态商映射 $q : X \to Q$ 、商前件 $C : Q \to \mathrm{Prop}$ 与目标性质 $Z : X \to \mathrm{Prop}$ 。假设由于商核泄漏，存在真算术对象 $x _ 0 \in X$ 与离轴影子反模型 $x _ 1 \in X$ 满足：

$$
C\bigl(q(x _ 0)\bigr) = \mathrm{True}, \qquad q(x _ 0) = _ Q q(x _ 1), \qquad Z(x _ 1) = \mathrm{False}. \tag{3.3}
$$

设原版图 $\mathcal{G} _ {\mathrm{orig}}$ 宣称证明了弱商因子化目标 $\forall x \in X,\ C(q(x)) \to Z(x)$ ，而提取图 $\mathcal{G} _ {\mathrm{ext}}$ 从 $\mathcal{G} _ {\mathrm{orig}}$ 中删去了某个子集 $E _ {\mathrm{err}}$ 并宣称在不补充新的算术分离前件下依然闭合证明同一目标。假设所有获认可的基础背景公理在影子模型 $x _ 1$ 的语义解释 $\lbrack\kern-0.15em\lbrack \cdot \rbrack\kern-0.15em\rbrack _ {x _ 1}$ 下均为真。则提取图 $\mathcal{G} _ {\mathrm{ext}}$ 在数学上**必然至少落入以下三类缺陷之一**（记三类缺陷的布尔指示变量分别为 $a, d, k \in \lbrace 0, 1\rbrace$ ）：

#### 1. 第一难：切割边界断桥悬空与未证前提注入（类别 $A$ ， $a = 1$ ）
在提取图依赖锥 $\operatorname{Cone} _ {\mathcal{G} _ {\mathrm{ext}}}(v _ {\mathrm{goal}}^{\mathrm{ext}})$ 的叶节点或替换边界 $\partial E _ {\mathrm{ext}}$ 中，存在某个未在同域内独立证明的额外公理、占位符 sorryAx 、不透明常量或被暗中塞入主定理前提上下文 $\Gamma _ {\mathrm{ext}}$ 的附加假设 $H _ {\mathrm{extra}}$ ，其在影子反模型 $x _ 1$ 下的真值为假（ $\lbrack\kern-0.15em\lbrack H _ {\mathrm{extra}} \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{False}$ ）；
#### 2. 第二难：目标定义或量词域静默降格（类别 $D$ ， $d = 1$ ）
提取图终点 $v _ {\mathrm{goal}}^{\mathrm{ext}}$ 所实际证明的命题 $\tau _ {\mathrm{ext}}(v _ {\mathrm{goal}}^{\mathrm{ext}})$ 在语义解释下不再等价于原冻结目标 $\forall x \in X,\ C(q(x)) \to Z(x)$ （例如静默改写了底层 $L$ 函数定义、将解析延拓替换为在临界带默认取零的无序级数 $\operatorname{LSeries}$ 、缩窄了量词域或使前件退化为空真）；
#### 3. 第三难：弱商语义漏口在提取锥内等价移位（类别 $K$ ， $k = 1$ ）
在排除类别 $A$ 与类别 $D$ 后，提取图依赖锥 $\operatorname{Cone} _ {\mathcal{G} _ {\mathrm{ext}}}(v _ {\mathrm{goal}}^{\mathrm{ext}})$ 内部必然存在至少一个推理节点 $v^{\ast} \in \operatorname{Cone} _ {\mathcal{G} _ {\mathrm{ext}}}(v _ {\mathrm{goal}}^{\mathrm{ext}})$ ，使得 $v^{\ast}$ 的全部直接前驱节点在影子模型 $x _ 1$ 的解释下均为真，但 $v^{\ast}$ 自身的结论在 $x _ 1$ 的解释下却为假（即原本存在于原图中的跨商传递失真或语义偏差并没有消失，而是被保留、拆散或通过同名改体平移到了提取锥内部的新位置 $v^{\ast}$ ）。

上述三难的容斥布尔代数守恒恒等式严格满足：

$$
u(a, d, k) := a + d + k - ad - ak - dk + adk = 1 - (1 - a)(1 - d)(1 - k) = 1. \tag{3.4}
$$

#### 一步不跳拓扑归纳证明
**(1)** 首先，由 $C(q(x _ 0)) = \mathrm{True}$ 与同商纤维条件 $q(x _ 0) = _ Q q(x _ 1)$ ，在影子反模型 $x _ 1$ 下必有 $\lbrack\kern-0.15em\lbrack C(q(x _ 1)) \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ 。
**(2)** 反证法：假设提取图 $\mathcal{G} _ {\mathrm{ext}}$ 同时避开了上述三难，即 $a = 0$ （无断桥悬空与假叶前件）、 $d = 0$ （终点语义未降格）且 $k = 0$ （锥内每一步局部推理在 $\lbrack\kern-0.15em\lbrack \cdot \rbrack\kern-0.15em\rbrack _ {x _ 1}$ 下均保真）。
**(3)** 由于提取图的依赖锥 $\operatorname{Cone} _ {\mathcal{G} _ {\mathrm{ext}}}(v _ {\mathrm{goal}}^{\mathrm{ext}})$ 是有限有向无环图，将其顶点按有向边方向排列为拓扑序 $v _ 1, v _ 2, \dots, v _ M = v _ {\mathrm{goal}}^{\mathrm{ext}}$ （使得对一切有向边 $v _ i \to v _ j$ 均有 $i < j$ ）。
**(4)** 对拓扑序号 $j = 1, 2, \dots, M$ 作强数学归纳，证明 $\lbrack\kern-0.15em\lbrack v _ j \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ ：
- **归纳基与叶节点**：若 $v _ j$ 在依赖锥内无前驱（即叶节点），由 $a = 0$ 及基础背景公理在 $x _ 1$ 下保真，立即有 $\lbrack\kern-0.15em\lbrack v _ j \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ ；
- **归纳步**：若 $v _ j$ 为非叶节点，则其全部直接前驱 $\lbrace v _ i : (v _ i \to v _ j) \in E _ {\mathrm{ext}}\rbrace$ 均满足 $i < j$ 。由归纳假设，所有直接前驱均满足 $\lbrack\kern-0.15em\lbrack v _ i \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ 。再由 $k = 0$ （锥内无局部保真失效节点），立即推出当前节点 $\lbrack\kern-0.15em\lbrack v _ j \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ 。
**(5)** 取拓扑终点 $j = M$ ，即得 $\lbrack\kern-0.15em\lbrack v _ {\mathrm{goal}}^{\mathrm{ext}} \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ 。由 $d = 0$ （终点未发生定义降格）， $\lbrack\kern-0.15em\lbrack v _ {\mathrm{goal}}^{\mathrm{ext}} \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{True}$ 蕴含 $C(q(x _ 1)) \implies Z(x _ 1)$ 在 $x _ 1$ 下成立。结合第 1 步已证的 $C(q(x _ 1)) = \mathrm{True}$ ，推出 $Z(x _ 1) = \mathrm{True}$ ，这与式 $(3.3)$ 中影子反模型的固有性质 $Z(x _ 1) = \mathrm{False}$ 正面矛盾。
**(6)** 因此反设不成立，必有 $A \lor D \lor K$ 为真，即 $(1-a)(1-d)(1-k) = 0$ ，式 $(3.4)$ 恒成立。进一步，当 $a = 0$ 且 $d = 0$ 时，沿着拓扑序取最小序号满足 $\lbrack\kern-0.15em\lbrack v _ j \rbrack\kern-0.15em\rbrack _ {x _ 1} = \mathrm{False}$ 的顶点 $v _ {j _ 0}$ ，其全部前驱必为真而自身输出为假，从而在有限步内唯一锁定提取锥内的首个语义漏口节点 $v^{\ast} = v _ {j _ 0}$ 。证毕。

#### 定理 1.4 的精确适用边界（何时删除与改写是合法的）
定理 1.4 的严谨之处在于，它同时划清了合法工程精简与非法掩盖错误的界限：
- 第一，如果原版中被删掉的模块集合 $E _ {\mathrm{del}}$ 原本就位于目标依赖锥之外（即 $E _ {\mathrm{del}} \cap \operatorname{Cone} _ {\mathcal{G} _ {\mathrm{orig}}}(v _ {\mathrm{goal}}) = \varnothing$ ，属于未被主定理实际引用的锥外不可达声明或冗余分支），那么删去 $E _ {\mathrm{del}}$ 只是清理锥外冗余，既不会改变依赖锥，也不会消除原本就在锥内的任何问题；
- 第二，如果提取版不仅仅是删节点，而是真正放弃了弱商签名 $C(q(x))$ ，重新引入并独立证明了能够区分真算术对象 $x _ 0$ 与影子对象 $x _ 1$ 的全阶算术分离不变量（或者原目标本身是如 $(0 : \mathbb{N}) = 0$ 这样无需依赖锥内错误公理、可直接用自反律 $\operatorname{rfl}$ 独立重证的平凡恒等式），那么它就脱离了式 $(3.3)$ 的弱商冻结前件。反之，只要核心推演仍然受困于式 $(3.3)$ 的弱静态商，任何单纯依靠删减外围文件或改写局部语法树的操作，都绝对逃不出定理 1.4 的三难铁律。

---

## 第四章　五大静态形式化翻译失实机制与全过程保真重构方程

在深入剖析 Lean 4 / Mathlib 针对解析数论与 $L$ 函数的形式化架构时，我们将静态类型截面中最容易切断算术—解析因果流的**五类静态翻译失实机制**逐一剥离，并给出每一类机制的严格数学定界与全过程保真重构方程。

### 4.1　失实机制一：无序总化求和 $\operatorname{LSeries}$ 的不可和默认归零与有限窗余项抹除

在 Mathlib 的 NumberTheory.LSeries.Basic 中，无穷级数求和 $\operatorname{tsum}$ 与 Dirichlet 级数 $\operatorname{LSeries}(a, s)$ 采用的是**全定义域总化函数**（Total Function）设计：对任意复数列 $a : \mathbb{N} \to \mathbb{C}$ 与任意复数 $s \in \mathbb{C}$ ，当无序求和网在 Hausdorff 拓扑下不收敛（ $\neg\operatorname{LSeriesSummable}(a, s)$ ）时，形式化定义直接将其函数值硬编码为默认值 $0$ ：

$$
\operatorname{LSeries}(a, s) := \begin{cases}
z, & \mathrm{if}\ \operatorname{HasSum}\bigl(n \mapsto a(n)n^{-s},\ z\bigr), \cr
0, & \mathrm{if}\ \neg\operatorname{LSeriesSummable}(a, s).
\end{cases} \tag{4.1}
$$

#### 定理 I（ $\operatorname{LSeries}$ 在闭左半平面 $\operatorname{Re}(s) \le 1$ 恒等于零及其与解析延拓函数的不可混同定理）

对恒取 $1$ 的算术常函数 $a \equiv 1$ （或任意模 $N \ge 1$ 的 Dirichlet 特征 $\chi$ ，其在自然数上的无序可和性要求绝对收敛），当且仅当 $\operatorname{Re}(s) > 1$ 时 $\operatorname{LSeriesSummable}(1, s)$ 成立；而在整个半平面 $\operatorname{Re}(s) \le 1$ （包含整个临界带 $0 < \operatorname{Re}(s) < 1$ 及原点 $s = 0$ ）上，恒有：

$$
\forall s \in \mathbb{C},\qquad \operatorname{Re}(s) \le 1 \implies \operatorname{LSeries}(1, s) = 0. \tag{4.2}
$$

特别地，在临界带离轴点 $s = 3/4$ 与原点 $s = 0$ 处，原始级数接口与解析延拓黎曼 $\zeta$ 函数满足严格不等式：

$$
\begin{aligned}
\operatorname{LSeries}(1, 3/4) &= 0 \neq \zeta(3/4) < -3, \cr
\operatorname{LSeries}(1, 0) &= 0 \neq -1/2 = \zeta(0).
\end{aligned} \tag{4.3}
$$

**证明**：当 $\sigma = \operatorname{Re}(s) \le 1$ 时，对正项级数 $\sum _ {n=1}^\infty n^{-\sigma} \ge \sum _ {n=1}^\infty n^{-1} = +\infty$ ，故复级数 $\sum _ {n=1}^\infty |n^{-s}| = \sum _ {n=1}^\infty n^{-\sigma}$ 发散。由于在有限维赋范空间 $\mathbb{C}$ 中，无序可和 $\operatorname{Summable}$ 等价于绝对可和 $\operatorname{Summable}(\Vert \cdot\Vert )$ ，故 $\neg\operatorname{LSeriesSummable}(1, s)$ ，由定义 $(4.1)$ 立即得 $\operatorname{LSeries}(1, s) = 0$ 。另一方面，对真正的解析延拓函数 $\zeta(s)$ ，在 $0 < \sigma < 1$ 上由第一阶 Euler–Maclaurin 积分表示：

$$
\begin{aligned}
\zeta(\sigma) &= \frac{1}{\sigma - 1} + 1 - \sigma \int _ {1}^{\infty} \lbrace u\rbrace u^{-\sigma - 1}\thinspace du \cr
&< \frac{1}{\sigma - 1} + 1.
\end{aligned} \tag{4.4}
$$

代入 $\sigma = 3/4$ ，由于 $\lbrace u\rbrace \ge 0$ ，立即得 $\zeta(3/4) < \frac{1}{3/4 - 1} + 1 = -4 + 1 = -3 < 0$ ；在 $s = 0$ 处则有 $\zeta(0) = -1/2 \neq 0$ 。这就从根本上证明：任何在 $\operatorname{Re}(s) \le 1$ 内将 $\operatorname{LSeries}$ 的等式未经 $\operatorname{Re}(s) > 1$ 收敛域守卫直接代入临界带的操作，都是在把“发散级数被类型论静默赋值的默认垃圾值 $0$ ”伪装成“解析延拓函数的真实零点”。证毕。

### 4.2　失实机制二：极点 $s=1$ 填洞赋默认值在点值读口下丢失留数与双穿孔恢复对偶

在 $s = 1$ 处，黎曼 $\zeta$ 函数与主特征 $L$ 函数具有简单极点：

$$
f(s) = \frac{r}{s - 1} + c _ 0 + c _ 1(s - 1) + \cdots \qquad (r \neq 0). \tag{4.5}
$$

在形式化系统中，为了避免使用带定义域限制的偏函数（Partial Function），通常将 $f(1)$ 设定为某个有限复数值 $v _ {\mathrm{fill}} \in \mathbb{C}$ （填洞总化）。

#### 定理 II（极点单点读口的信息丢失与双穿孔芽恢复矩阵定理）
**(1)** 若观察映射仅读取填洞点处的单个点值 $q _ {\mathrm{pt}}(f) = f _ {\mathrm{total}}(1) = v _ {\mathrm{fill}}$ ，则具有任意不同留数 $r _ 1 \neq r _ 2$ 与任意不同常数项 $c _ {0,1} \neq c _ {0,2}$ 的两个极点主部，只要被填入同一默认值 $v _ {\mathrm{fill}}$ ，在 $q _ {\mathrm{pt}}$ 下就完全不可区分，留数信息 $r$ 百分之百落入盲核 $\ker q _ {\mathrm{pt}}$ ；
**(2)** 反之，对截断到一阶的极点主部芽 $g _ {r,c _ 0}(s) = \frac{r}{s-1} + c _ 0$ ，只需在 $s = 1$ 两侧取两个对称有理穿孔采样点 $s _ + = 1 + h$ 与 $s _ - = 1 - h$ （例如 $h = 1$ 时取 $s _ + = 2, s _ - = 0$ ），则采样映射 $(r, c _ 0)^{\mathsf{T}} \mapsto \bigl(g _ {r,c _ 0}(1+h), g _ {r,c _ 0}(1-h)\bigr)^{\mathsf{T}}$ 的线性观测矩阵与精确有理左逆恢复矩阵分别为：

$$
M _ h = \begin{pmatrix} h^{-1} & 1 \cr
-h^{-1} & 1 \end{pmatrix}, \quad M _ h^{-1} = \frac{1}{2}\begin{pmatrix} h & -h \cr
1 & 1 \end{pmatrix}, \quad M _ h^{-1} M _ h = I _ 2, \tag{4.6}
$$

从而由两个穿孔点值唯一精确恢复留数与常数项：

$$
\begin{aligned}
r &= \frac{h}{2}\bigl(g _ {r,c _ 0}(1+h) - g _ {r,c _ 0}(1-h)\bigr), \cr
c _ 0 &= \frac{1}{2}\bigl(g _ {r,c _ 0}(1+h) + g _ {r,c _ 0}(1-h)\bigr).
\end{aligned} \tag{4.7}
$$

同时，对亚纯函数的对数导数 $\frac{f'(s)}{f(s)}$ ，在 $m$ 阶零点或极点 $s _ 0$ （即 $f(s) = (s-s _ 0)^m g(s)$ ， $g(s _ 0) \neq 0, m \in \mathbb{Z}\setminus\lbrace 0\rbrace$ ）处，虽然乘上非零尺度因子 $\lambda \neq 0$ 会被对数导数完全消去（ $\frac{(\lambda f)'}{\lambda f} = \frac{f'}{f}$ ），但阶数 $m$ 作为对数导数在 $s _ 0$ 处的简单极点留数

$$
m = \operatorname{Res} _ {s=s _ 0}\frac{f'(s)}{f(s)} = \lim _ {s \to s _ 0} (s - s _ 0)\frac{f'(s)}{f(s)} \tag{4.8}
$$

在穿孔邻域读口下是严格守恒的拓扑不变量，绝不能被单点填洞默认值所替代。

### 4.3　失实机制三：依值模环 $\operatorname{ZMod}(N)$ 的跨模类型壁垒、非本原虚轴伪零点与四特征统一正定锥

在依赖类型论中，模 $N$ 剩余类环 $\operatorname{ZMod}(N)$ 是一个依赖自然数参数 $N : \mathbb{N}$ 的**依值类型族**（Dependent Type Family）。当模数 $N _ 1 \neq N _ 2$ 时， $\operatorname{ZMod}(N _ 1)$ 与 $\operatorname{ZMod}(N _ 2)$ 在类型论内核中是两个完全不相交的类型，甚至不能直接书写相等判断 $x = y$ （除非引入异质相等 $\operatorname{HEq}$ 或退化到 $\mathbb{Z}$ 上做跨模拉回）。这一设计在工程上极易诱发两类严重失真：

#### 定理 III-A（非本原特征虚轴 Euler 因子零点定理与跨模诱导公式）

设本原特征 $\chi^{\ast} \in \operatorname{DirichletCharacter}(\mathbb{C}, N^{\ast})$ 的导子 $N^{\ast} \mid N$ 。由 $\chi^{\ast}$ 诱导至模 $N$ 的非本原特征 $\chi = \operatorname{changeLevel}(N^{\ast} \mid N, \chi^{\ast})$ ，其解析 $L$ 函数在 $s \neq 1$ 处满足精确跨模分解公式：

$$
L(s, \chi) = L(s, \chi^{\ast}) \prod _ {p \mid N,\ p \nmid N^{\ast}} \left(1 - \chi^{\ast}(p)p^{-s}\right). \tag{4.9}
$$

当存在素数 $p \mid N$ 且 $p \nmid N^{\ast}$ 时（最简特例：取模 $N = 2$ 、导子 $N^{\ast} = 1$ 的主特征 $\chi _ {0,2} = 1$ ，此时 $L(s, \chi _ {0,2}) = (1 - 2^{-s})\zeta(s)$ ），局部坏素数 Euler 因子 $1 - \chi^{\ast}(p)p^{-s} = 1 - p^{-s}$ 在**虚轴** $\operatorname{Re}(s) = 0$ 上拥有无穷多个周期零点：

$$
\begin{aligned}
s _ k &= \frac{2\pi i k}{\log p} \cr
&\qquad \bigl(k \in \mathbb{Z} \setminus \lbrace 0\rbrace,\ \operatorname{Re}(s _ k) = 0 \neq 1/2\bigr).
\end{aligned} \tag{4.10}
$$

（注：取 $k \neq 0$ 可严格避开 $s = 0$ 处 $\zeta(0) = -1/2$ 的实点情形，以及若有人误将极点 $s=1$ 混入时的抵消争议；在 $s _ 1 = \frac{2\pi i}{\log 2}$ 处， $2^{-s _ 1} = \exp(-\log 2 \cdot \frac{2\pi i}{\log 2}) = \exp(-2\pi i) = 1$ ，故 $1 - 2^{-s _ 1} = 0$ ，从而 $L(s _ 1, \chi _ {0,2}) = 0$ 。）
这就严格证明：如果一个关于一般模 $N$ Dirichlet $L$ 函数的零点定理漏掉了**开临界带左边界守卫** $0 < \operatorname{Re}(s)$ 或漏掉了**本原特征守卫** $\operatorname{IsPrimitive}(\chi)$ ，那么在 $N = 2, \chi = \chi _ {0,2}, s _ 1 = \frac{2\pi i}{\log 2}$ 处实例化该定理，就会在形式系统中直接导出 $(0 : \mathbb{R}) = 1/2$ 。同理，对于模 $N = 4$ 的非本原主特征 $\chi _ {0,4}$ ，其对标准加法特征 $\psi _ 4(a) = e^{2\pi i a / 4} = i^a$ 的 Gauss 和由于在偶余类 $a \in \lbrace 0, 2\rbrace$ 上 $\chi _ {0,4}(a) = 0$ 、在奇余类 $a \in \lbrace 1, 3\rbrace$ 上 $\chi _ {0,4}(1) = \chi _ {0,4}(3) = 1$ ，直接退化为零：

$$
\begin{aligned}
\tau(\chi _ {0,4}) &= \sum _ {a \in \operatorname{ZMod}(4)} \chi _ {0,4}(a)\psi _ 4(a) \cr
&= 0\cdot 1 + 1\cdot i + 0\cdot(-1) + 1\cdot(-i) = 0 \neq \sqrt{4} = 2,
\end{aligned} \tag{4.11}
$$

从而任何漏写 $\operatorname{IsPrimitive}(\chi)$ 而直接套用 $|\tau(\chi)| = \sqrt{N}$ 或用 $\tau(\chi)$ 作分母做函数方程归约的引理，在 $N=4$ 主特征下都会发生除以零退化。

#### 定理 III-B（跨模统一拉回载体与四特征实正定锥定理）

在证明零点排斥或跨模联合估计（如例外实特征与测试特征的耦合）时，不能把不同模数 $N _ 1, N _ 2$ 的特征孤立在各自的 $\operatorname{ZMod}(N _ 1)$ 与 $\operatorname{ZMod}(N _ 2)$ 槽位中，而必须通过公共倍数模 $N = \operatorname{lcm}(N _ 1, N _ 2)$ （或统一拉回至整数环 $\mathbb{Z}$ 上的完全乘性支撑序列）建立联合算术读口。对任意两个实取值（二次）特征 $\chi _ 1, \chi _ 2 : \mathbb{Z} \to \lbrace -1, 0, 1\rbrace$ ，在 $\sigma = \operatorname{Re}(s) > 1$ 上，四特征联合对数级数

$$
\begin{aligned}
\mathcal{K} _ 4(\sigma; \chi _ 1, \chi _ 2) &:= \log\zeta(\sigma) + \log L(\sigma, \chi _ 1) \cr
&\quad + \log L(\sigma, \chi _ 2) + \log L(\sigma, \chi _ 1\chi _ 2)
\end{aligned} \tag{4.12}
$$

在任意与导子互素的素数幂 $p^m$ 处，其局部展开系数由乘性耦合恒等式唯一锁定为非负实数：

$$
\begin{aligned}
c _ {p,m}(\chi _ 1, \chi _ 2) &= 1 + \chi _ 1(p)^m + \chi _ 2(p)^m + \bigl(\chi _ 1(p)\chi _ 2(p)\bigr)^m \cr
&= \bigl(1 + \chi _ 1(p)^m\bigr)\bigl(1 + \chi _ 2(p)^m\bigr) \ge 0,
\end{aligned} \tag{4.13}
$$

从而在整个 $\sigma > 1$ 上每个有限素数前缀都保持严格非负性：

$$
\begin{aligned}
\mathcal{K} _ {4,\le P}(\sigma; \chi _ 1, \chi _ 2) &=
\sum _ {p \le P} \sum _ {m=1}^{\infty}
\frac{(1 + \chi _ 1(p)^m)(1 + \chi _ 2(p)^m)}{m p^{m\sigma}} \cr
&\ge 0.
\end{aligned} \tag{4.14}
$$

如果在形式化翻译中把四个通道拆成各自独立的亚纯近似而不强制绑定式 $(4.13)$ 的同源素数幂乘积结构，就会丢失 $(1+\chi _ 1(p)^m)(1+\chi _ 2(p)^m) \ge 0$ 的逐项非负性守恒。

### 4.4　失实机制四：加法级数位移与乘法 Euler 筛选的非交换换位子拍扁

在将解析延拓（依赖加法 Hurwitz 位移 $x \mapsto x + j/N$ ）与素数筛选（依赖乘法缩放 $n \mapsto p n$ ）结合时，一种常见的形式化降阶是把两类算子视为在同一静态表上可任意交换顺序的线性投影。

#### 定理 IV（加法位移与乘法Euler算子的非交换换位子下界定理）

在多项式或截断序列空间上，设一阶加法差分算子为 $(A _ {\mathrm{add}} f)(x) = f(x + 1) - f(x)$ ，乘法权重算子为 $(A _ {\mathrm{mul}} f)(x) = x f(x)$ 。则两者的非交换换位子满足精确算子恒等式：

$$
\begin{aligned}
\bigl[A _ {\mathrm{add}}, A _ {\mathrm{mul}}\bigr] f(x) \cr
&:= \bigl(A _ {\mathrm{add}} A _ {\mathrm{mul}} - A _ {\mathrm{mul}} A _ {\mathrm{add}}\bigr) f(x) \cr
&= (x+1)f(x+1) - xf(x) - x\bigl(f(x+1) - f(x)\bigr) = f(x+1).
\end{aligned} \tag{4.15}
$$

对任意阶单项式基 $f _ d(x) = x^d$ （ $d \ge 0$ ），换位子作用结果为 $[A _ {\mathrm{add}}, A _ {\mathrm{mul}}] (x^d) = (x+1)^d \neq 0$ 。更一般地，在模 $N$ 特征扭转与加法部分求和之间，若用无扭转均值直接代替特征扭转和，在第 $n$ 拍就会产生非零扭转残差 $(1 - \chi(n))a _ n$ 。因此，任何将加法延拓通道与乘法 Euler 通道直接作交换拍扁的静态表示，都会在换位子 $[A _ {\mathrm{add}}, A _ {\mathrm{mul}}] \neq 0$ 处产生不可消除的代数残差。

### 4.5　失实机制五：以有限维正定子块替代全测试函数族 Weil–Li 谱正性

在显式公式（Weil 显式泛函与 Li 准则）路径中，广义黎曼猜想等价于：对**全体**容许测试函数 $f \in \mathcal{A} _ {\mathrm{Weil}}$ ，对称卷积泛函 $W _ {\chi}(f {\ast} \tilde{f}) \ge 0$ （或对**一切**正整数阶 $n \ge 1$ ，Li 系数 $\lambda _ n(\chi) = \sum _ {\rho}\bigl(1 - (1 - 1/\rho)^n\bigr) \ge 0$ ）。

#### 定理 V（有限维正定 Gram 子块与全测试族分离定理及显式有理 $LDL^{\mathsf{T}}$ 证书）
**(1)** **有限子空间正定不能外推全族正性**（分离定理）：设固定有限维测试子空间 $V _ m = \operatorname{span}\lbrace \phi _ 1, \dots, \phi _ m\rbrace \subset \mathcal{A} _ {\mathrm{Weil}}$ 上的有理 Gram 矩阵 $G _ m = \bigl(\langle \phi _ i, \phi _ j \rangle\bigr) _ {1\le i,j\le m}$ 严格正定（ $G _ m \succ 0$ ）。若存在离轴零点对 $\rho _ 0 = \frac{1}{2} + \delta + i\gamma _ 0$ （ $\delta \in (0, 1/2)$ ），由于有限维子空间 $V _ m$ 的余维数无穷，总能构造出与 $V _ m$ 的前若干阶矩完全正交、但频谱集中在高阶离轴频率 $\gamma _ 0$ 附近的容许测试包 $f _ {\gamma _ 0} \in \mathcal{A} _ {\mathrm{Weil}}$ ，使得 $\rho _ 0$ 的双曲余弦贡献 $\cosh(\delta u)\cos(\gamma _ 0 u)$ 在 $u \sim \frac{\pi}{\gamma _ 0}$ 处呈指数级负发散，从而突破有限块 $G _ m \succ 0$ 的局部正性。
例如，在三维矩模型中，取非零整数系数向量 $c = (34, -57, 23)^{\mathsf{T}} \in \mathbb{Z}^3$ ，其零阶矩与一阶线性矩同时严格归零：

$$
34 - 57 + 23 = 0, \qquad 19\times 34 - 20\times 57 + 21\times 23 = 646 - 1140 + 483 = -11 \neq 0, \tag{4.16}
$$

而在精确素数波包有理 Gram 矩阵

$$
G _ {\mathrm{wave}} = \begin{pmatrix}
\dfrac{3}{68} & \dfrac{41}{1292} & \dfrac{21}{1564} \cr
\dfrac{41}{1292} & \dfrac{3}{76} & \dfrac{37}{1748} \cr
\dfrac{21}{1564} & \dfrac{37}{1748} & \dfrac{3}{92}
\end{pmatrix} \tag{4.17}
$$

下，对应的二次型精确有理平方和分解（ $LDL^{\mathsf{T}}$ 分解）为：

$$
\begin{aligned}
x^{\mathsf{T}} G _ {\mathrm{wave}} x &= \frac{3}{68}\left(x _ 1 + \frac{41}{57}x _ 2 + \frac{7}{23}x _ 3\right)^2 \cr
&\quad + \frac{613}{36822}\left(x _ 2 + \frac{9747}{14099}x _ 3\right)^2 + \frac{6669}{324277}x _ 3^2.
\end{aligned} \tag{4.18}
$$

式 $(4.18)$ 的三个对角有理枢轴

$$
\left(d _ 1, d _ 2, d _ 3\right) = \left(\frac{3}{68}, \frac{613}{36822}, \frac{6669}{324277}\right) \tag{4.19}
$$

全部严格为正，且在向量 $c = (34, -57, 23)^{\mathsf{T}}$ 上给出精确正整数能量 $c^{\mathsf{T}} G _ {\mathrm{wave}} c = 39 > 0$ 。
**(2)** 实字符素数锥的三维精确有理 $LDL^{\mathsf{T}}$ 证书：同样地，在素数基 $\lbrace 17, 19, 23\rbrace$ 上生成的第二组实字符素数锥有理 Gram 矩阵，其精确 $LDL^{\mathsf{T}}$ 对角枢轴为

$$
(d _ 1', d _ 2', d _ 3') = \left(\frac{43192332}{5260455841},\ \frac{1672}{399929},\ \frac{8}{5643}\right), \tag{4.20}
$$

三个有理枢轴同样严格大于零。这组有限维精确有理正定分解（已在 lc23 实机上通过 Lean 4 编译认证为 Autopsy6.gram\_ldlt 与 Autopsy6.gram\_positive ）可以作为有限素数窗口的严格局部探针，但要升格为全局零点排斥定理，必须附有覆盖全测试函数族的稠密逼近与趋零截断误差证明。

---

## 第五章　结构化核查方法：无需人工通读千万行源码的六大形式化核查方案与 lc23 实机编译核查与全环境声明图分析档案

面对体量高达 $17,374,215$ 行（ $175,187$ 个 .lean 源文件）的形式化代码库，任何试图依靠人工逐行阅读源码去寻找逻辑漏洞的做法在工程上都是不可能完成的。本章将我们建立的**六大最简零通读核查方案**与在远程算力主机 lc23 （主机名 DESKTOP-YUYO2 ，Linux 64 位环境，运行与目标仓库精确匹配的 Lean 4 官方工具链 v4.33.1 及 Mathlib 固定提交 0df444a360eaa60ab8c11dca51a86af692955474 ）上执行的**实机实测与全环境声明图最小割解剖**完整合龙。

### 5.1　原版与社区删改版全量源码对账、字节级归档核验与一万零七百二十四个模块删改统计

在 lc23 的隔离沙箱 /tmp/lc23\_grh\_autopsy\_workspace/ 中，我们首先拉取了原始发布的十四卷分卷归档（合并为 lean.tar.gz ，大小 $239,275,554$ 字节，SHA-256 摘要为 9631b4f020199e580ba86178cb56c6e9b09f690c2369a80dc4334aa93f49c7fc ）以及社区核验仓库，并对原版固定提交 40e56bab026552e089d7afcfeff08d2defb9c005 与社区版固定提交 f1f6d65420dbbf36d6cfdac1af8d79511a855a5b 进行了全量逐文件字节核验与源码语法审计：

| 核查维度 | 原版固定提交（ 40e56bab026552e089d7afcfeff08d2defb9c005 ） | 社区删改版固定提交（ f1f6d65420dbbf36d6cfdac1af8d79511a855a5b ） | 两版精确差分与实测核验结论 |
| :--- | :--- | :--- | :--- |
| .lean **源文件总数** | $175,187$ 个 | $164,464$ 个 | 删除 $10,724$ 个模块，修改 $23$ 个模块，新增 $1$ 个模块（ src/Challenge.lean ） |
| **源码总行数**（含空行） | $17,374,215$ 行 | $16,571,342$ 行 | 全库净减少 $802,873$ 行（其中被删 $10,724$ 个模块共 $785,224$ 行； $23$ 个修改模块净减 $17,676$ 行；新增 Challenge.lean 为 $27$ 行） |
| **非空源码总行数** | $15,531,759$ 行 | $14,797,132$ 行 | 净减少 $734,627$ 行非空代码 |
| **源码总字节数** | $1,030,531,854$ 字节（约 $1.031 \mathrm{GB}$ ） | $977,002,774$ 字节（约 $0.977 \mathrm{GB}$ ） | 净减少 $53,529,080$ 字节 |
| **源码顶层声明总数** | $1,054,282$ 个 | $1,017,622$ 个 | 净减少 $36,660$ 个源码级声明 |
| **与原始 14 卷归档比对** | $175,190 / 175,190$ 文件逐字节全同（ exact\_match = true ） | 经 5 次合并修改（PR #8, #45, #57, #60, #65 ）演化 | 原始归档含 $175,187$ 个 .lean 文件与 $3$ 个工程配置文件，零缺失、零字节差异 |

#### 被删除的 $10,724$ 个模块与被改写的 $23$ 个模块的精确解剖
#### 1. 按顶层子库分布的 $10,724$ 个被删模块
- Development 子库：被删 $10,684$ 个模块（原版共 $141,928$ 个文件、 $12,232,663$ 行）；
- PositivityTheory 子库：被删 $23$ 个模块；
- GroundTheory 子库：被删 $8$ 个模块；
- Formalism 子库：被删 $6$ 个模块；
- Supplements 子库：被删 $2$ 个模块；
- ReciprocityTheory 子库：被删 $1$ 个模块。
这 $10,724$ 个模块（合计 $785,224$ 行源码）在原版中原本位于 Main.lean 的模块导入闭包内，但当社区 PR #8 与 PR #45 将 Main.lean 、 Statements.lean 及 $11$ 个中间聚合模块的 import 列表收窄后，这 $10,724$ 个模块便不再被顶层目标导入，随即被整批删除。
#### 2. 被修改的 $23$ 个模块的精确分类
在原版与社区固定提交 f1f6d654 之间共有 $23$ 个模块被修改（早期文档提到修改 $18$ 个模块仅统计到 PR #57 为止，后续 PR #60 与 PR #65 又分别修改了 $1$ 个和 $4$ 个模块）：
- 其中 $13$ 个模块（包括 src/Main.lean 、 src/Statements.lean 、 RiemannHypothesisOfEveryCharacter.lean 、 EveryCharacterOfLiteratureOfVWin.lean 及 $9$ 个 DenseThresholdCases 模块）仅修改或删减了文件头部的 import 导入行，去除导入行后的定理正文逐字节全同；
- 另外 $10$ 个位于 src/Development/AutomorphicArithmetic/IntegralCasts/CapelliIdentities/ 下的核心模块则被大幅改写了非导入行源码（即直接重写了证明体与类型类实例项）：
- FixPiIff.lean ：从原版 $8,029$ 行被重写压缩为 $45$ 行（PR #60 ）；
- FreeModuleQuotient.lean ：从原版 $2,516$ 行被重写压缩为 $84$ 行（PR #65 ）；
- IntegerSpanGenerators.lean ：从原版 $1,746$ 行被重写压缩为 $254$ 行（PR #57 ）；
- ContDiffHerm.lean ：从原版 $1,727$ 行被重写压缩为 $211$ 行（PR #65 ）；
- CoboundaryOfGenerator.lean ：从原版 $1,701$ 行被重写压缩为 $131$ 行（PR #57 ）；
- PhiMul.lean ：从原版 $834$ 行被重写压缩为 $23$ 行（PR #57 ）；
- SquareOfApproximation.lean ：从原版 $658$ 行被重写压缩为 $235$ 行（PR #65 ）；
- FiniteCohomologyOfTrivialOfCyclic.lean ：从原版 $608$ 行被重写压缩为 $45$ 行（PR #57 ）；
- FgZ1T.lean ：从原版 $523$ 行被重写压缩为 $69$ 行（PR #57 ，且不仅改写了证明项，还直接移除了定理签名中两个冗余的类型类实例参数。）；
- LimitOfFinite.lean ：从原版 $172$ 行被重写压缩为 $61$ 行（PR #65 ）。

### 5.2　受审五大顶层定理的真实形式化签名与守卫核查

在原版与社区版的 src/Statements.lean 及 src/Main.lean 中，被宣称证成的五个顶层命题定义与定理名称完全一致，其精确数学表述如下：

**(1) Mathlib 标准黎曼猜想定理** riemannHypothesis（类型为 $\operatorname{RiemannHypothesis}$） （定义于 Mathlib.NumberTheory.LSeries.RiemannZeta ）：

$$
\begin{aligned}
&\forall s \in \mathbb{C},\quad \operatorname{riemannZeta}(s) = 0 \cr
&\qquad \land\ \bigl(\neg\exists n \in \mathbb{N},\ s = -2(n + 1)\bigr) \ \land\ s \neq 1 \cr
&\qquad \implies \operatorname{Re}(s) = \frac{1}{2}.
\end{aligned} \tag{5.1}
$$

**(2) 自定义黎曼零点临界线定理** riemannZeta\_eq\_zero\_re（类型为 $\operatorname{RiemannZetaZerosOnLine}$） ：

$$
\begin{aligned}
&\forall s \in \mathbb{C},\quad \operatorname{riemannZeta}(s) = 0 \ \land\ 0 < \operatorname{Re}(s) < 1 \cr
&\qquad \land\ \bigl(\neg\exists n \in \mathbb{N},\ s = -2((n : \mathbb{C}) + 1)\bigr) \ \land\ s \neq 1 \cr
&\qquad \implies \operatorname{Re}(s) = \frac{1}{2}.
\end{aligned} \tag{5.2}
$$

**(3)** 一般 Dirichlet $L$ 函数在半平面 $\operatorname{Re}(s) > 1/2$ 非消失定理 LFunction\_ne\_zero\_of\_half\_lt\_re（类型为 $\operatorname{DirichletLNonvanishingRightOfHalf}$） ：

$$
\begin{aligned}
&\forall N \in \mathbb{N}\ [\operatorname{NeZero}(N)]\ \forall \chi \in \operatorname{DirichletCharacter}(\mathbb{C}, N), \cr
&\qquad \forall s \in \mathbb{C}, \cr
&\qquad 1/2 < \operatorname{Re}(s) \ \land\ (\chi \neq 1 \lor s \neq 1) \cr
&\qquad \implies \operatorname{DirichletCharacter.LFunction}(\chi, s) \neq 0.
\end{aligned} \tag{5.3}
$$

**(4)** 一般（含非本原）Dirichlet $L$ 函数开临界带零点定理 LFunction\_eq\_zero\_re（类型为 $\operatorname{DirichletLZerosOnLine}$） ：

$$
\begin{aligned}
&\forall N \in \mathbb{N}\ [\operatorname{NeZero}(N)]\ \forall \chi \in \operatorname{DirichletCharacter}(\mathbb{C}, N), \cr
&\qquad \forall s \in \mathbb{C}, \cr
&\qquad 0 < \operatorname{Re}(s) < 1 \ \land\ \operatorname{DirichletCharacter.LFunction}(\chi, s) = 0 \cr
&\qquad \implies \operatorname{Re}(s) = 1/2.
\end{aligned} \tag{5.4}
$$

**(5)** 本原 Dirichlet $L$ 函数开临界带零点定理 LFunction\_eq\_zero\_re\_of\_isPrimitive（类型为 $\operatorname{PrimitiveDirichletLZerosOnLine}$） ：

$$
\begin{aligned}
&\forall N \in \mathbb{N}\ [\operatorname{NeZero}(N)]\ \forall \chi \in \operatorname{DirichletCharacter}(\mathbb{C}, N), \cr
&\qquad \operatorname{IsPrimitive}(\chi) \implies \forall s \in \mathbb{C},\ 0 < \operatorname{Re}(s) < 1 \cr
&\qquad \land\ \operatorname{DirichletCharacter.LFunction}(\chi, s) = 0 \cr
&\qquad \implies \operatorname{Re}(s) = 1/2.
\end{aligned} \tag{5.5}
$$

在 src/Main.lean 中，上述五大定理全部归结为同一个上游总汇引理 UpperTheory.FinalTheorems.everyCharacter （在 Main.lean 中记为局部缩写 allChi ，其类型即为 $\operatorname{DirichletLNonvanishingRightOfHalf}$ ）： riemannHypothesis 由 Formalism.VW.rh\_of\_every(allChi) 给出， LFunction\_eq\_zero\_re 由 Formalism.VW.critLine(allChi) 给出。

### 5.3　六大结构化核查方案在 lc23 实机上的编译实测回执总表

我们在 lc23 上使用 Lean 4 v4.33.1 编译器（置于 bwrap --ro-bind / / --unshare-net 物理只读禁网沙箱内）对全部六大核查方案及目标库探针进行了实机编译实测，完整结果如下：

| 方案与实机探针名称 | 导入环境与测试靶标 | 实机退出码 | 实机耗时（秒） | lc23 实机编译实测结论与捕获的精确证据 |
| :--- | :--- | :---: | :---: | :--- |
| **方案一**（探针 1A）： TailMirrorOriginal | 导入原版 Statements 与 Supplements.Kernels.MainTheoremsAll | $1$ | $1,446.612$ | 将结论 $\operatorname{Re}(s) = 1/2$ 替换为 $\operatorname{MirrorRH}$ （ $\operatorname{Re}(s) = 3/4$ ）并赋原证明项 rhOfAll ，编译器报类型不匹配 Type mismatch: rhOfAll has type RiemannHypothesis but is expected to have type MirrorRH ，证实顶层证明项并非对任意结论皆可赋值的多态空壳 |
| **方案一**（探针 1A 续）： FirstZeroProbe | 导入原版 Main 与 Mathlib.Tactic | $124$ （超时终止） | $7,677.660$ | 在全库 $175,187$ 个模块环境下搜索首零点存在性见证 $\exists s,\ \operatorname{riemannZeta}(s)=0 \land 0<\operatorname{Re}(s)<1 \land 14<\operatorname{Im}(s)<15$ ，经过 $7,677.66$ 秒仍未返回，证实全库并未显式提供首零点存在性的可直接检索定理 |
| **方案一**（探针 1B/1C）： AutopsyProbe\_Scheme1 | Lean v4.33.1 + Mathlib 0df444a360ea | $0$ | $2.399$ | 实机证成四项核心定理：① raw\_zero 与 raw\_three\_quarters ： $\operatorname{Re}(s)\le 1 \implies \operatorname{LSeries}(1,s)=0$ 及 $\operatorname{LSeries}(1, 3/4)=0$ ；② functions\_differ ：由 $\operatorname{LSeries}(1,0)=0 \neq -1/2 = \operatorname{riemannZeta}(0)$ 证出 $(s \mapsto \operatorname{LSeries}(1,s)) \neq \operatorname{riemannZeta}$ ；③ axis\_principal\_zero ：模 $2$ 主特征在虚轴点 $s _ 0 = \frac{2\pi i}{\log 2}$ （ $\operatorname{Re}(s _ 0)=0$ ）处 $\operatorname{DirichletCharacter.LFunction}(1, s _ 0) = 0$ ；④ removing\_guard\_is\_false ：删去 $0 < \operatorname{Re}(s)$ 守卫后的全称临界线命题在 Lean 4 内被直接证伪 |
| **方案一**（目标实例化）： TargetValueProbe | 导入原版 Main | $0$ | $1,799.910$ | 由原版 LFunction\_ne\_zero\_of\_half\_lt\_re 在 $N=1, \chi=1, s=3/4$ 处实例化证出 $\operatorname{riemannZeta}(3/4) \neq 0$ ，打印公理为 propext, Classical.choice, Quot.sound |
| **方案二**（定义与延拓桥）： AutopsyProbe\_Scheme2 | Lean v4.33.1 + Mathlib 0df444a360ea | $0$ | $1.595$ | 实机 #print 剥离出 $\operatorname{DirichletCharacter.LFunction}$ 与 $\operatorname{ZMod.LFunction}$ 的精确 Hurwitz 线性组合定义式 $(2.19)$ ，并验证带 $\operatorname{Re}(s) > 1$ 守卫的级数桥 dirichlet\_bridge 与本原函数方程 completedLFunction\_one\_sub |
| **方案三 & 方案四**（全库声明图、依赖锥与最小有向割）： original\_scheme4 | 导入原版 Main 全环境（ env.checked 遍历） | $0$ | $3,268.004$ | 导出完整的 $6,507,343,368$ 字节（ $6.1 \mathrm{GB}$ ）全环境声明引用图流，精确测得全环境 $2,701,132$ 个声明节点、 $170,706,224$ 条有向依赖边、五大主定理联合依赖锥 $1,478,243$ **个声明**、锥内公理集合为 {Classical.choice, Quot.sound, propext} ，并算出从乘性源集到五大主定理汇集的**最小内部有向顶点割容量严格等于** $8$ （独立验证器核验 VERIFIED ） |
| **方案五**（特洛伊反模型注入）： AutopsyProbe\_Scheme5 | Lean v4.33.1 + Mathlib 0df444a360ea | $0$ | $5.856$ | 实机编译通过代数对称特洛伊多项式 $P(s) = (s-1/2)^2 - 1/16$ 、Davenport–Heilbronn 系数非乘性 dh\_not\_multiplicative 、偶通道互反根 even\_root ($F _ {\mathrm{even}}(3/4)=0$) 及完备化反射对称 even\_completed\_reflection ，在 Lean 4 内形式证伪弱排零规则 weak\_rule\_refuted ($\neg\operatorname{WeakRule}$) 并给出条件碰撞 $\operatorname{WeakRule} \to (3/4 : \mathbb{R}) = 1/2$ 与 $\operatorname{WeakRule} \to (0 : \mathbb{Z}) = 1$ |
| **方案六**（有限算术与正定矩阵对撞）： AutopsyProbe\_Scheme6 | Lean v4.33.1 + Mathlib 0df444a360ea | $0$ | $3.990$ | 实机编译通过模零排除 $\neg\operatorname{Nonempty}(\operatorname{NeZero}(0))$ 、Rouché 严格有理裕量 $(1/8)^2-(1/16)^2=3/256>0$ 、互反根 $1-(5/2)(1/2)+(1/2)^2=0$ 、模 $4$ 主特征 Gauss 和退化 principal\_mod4\_gauss = 0 、素基 $\lbrace 17,19,23\rbrace$ 有理 Gram 矩阵 $LDL^{\mathsf{T}}$ 平方分解 gram\_ldlt 、正定性 gram\_positive 及零矩向量正能量 $\operatorname{gram}(34,-57,23)=39$ |
| **元编程绕过前端负控实验**： KexactNegativeControl | Lean v4.33.1 + Mathlib 0df444a360ea | $1$ | $2.921$ | 提取原版 kexactB 策略体（以期望类型 none 阐述项并直接对目标元变量执行 g.assign ），测试将 $\mathrm{True}$ 的证明项强赋给 $\mathrm{False}$ 目标，实测前端阐述器未拦截而由底层内核报 (kernel) declaration type mismatch 拒绝 |

### 5.4　方案四全图网络流核查：二百七十万声明、一亿七千万条边上的“八顶点最小有向割”与二十步对数二分定位

在方案四中，我们在 lc23 上对原版 Main 的完整已检查环境 env.checked 运行了零遗漏声明图提取器（不仅提取每个常量的类型引用 type\_deps 与证明体引用 body\_deps ，还完整提取了归纳类型块、构造子与递归器计算规则的结构依赖 structural\_deps ），生成了 $6,507,343,368$ 字节（SHA-256 摘要为 476485163475eed1feee899d0aa088de78ac114b960baefd3c788df6908ce740 ）的完整有向图流，并由拆点最大流算法与零导入独立图证书核验器 verify\_graph\_certificate.py 完成了精确拓扑解剖：

#### 1. 全环境规模与五大主定理依赖锥分离度
- 导入 Main 后的全环境总声明节点数：

$$
|V| = 2,701,132; \tag{5.6}
$$

- 去重有向依赖边总数（方向为“被引用声明 $\to$ 引用者”）：

$$
|E| = 170,706,224; \tag{5.7}
$$

- 五大顶层定理汇集 $T$（由 5.2 节所列的五个顶层定理声明 riemannHypothesis、riemannZeta\_eq\_zero\_re、LFunction\_ne\_zero\_of\_half\_lt\_re、LFunction\_eq\_zero\_re 与 LFunction\_eq\_zero\_re\_of\_isPrimitive 组成）的联合上游依赖锥大小：

$$
\begin{aligned}
|\operatorname{Cone} _ {\mathcal{G}}(T)| &= 1,478,243, \cr
|\operatorname{Cone} _ {\mathcal{G}}^{\mathrm{type+body}}(T)| &= 1,478,222;
\end{aligned} \tag{5.8}
$$

- 五个顶层定理各自独立的依赖锥大小分别为： LFunction\_eq\_zero\_re 含 $1,478,224$ 个声明， riemannZeta\_eq\_zero\_re 含 $1,478,221$ 个声明， riemannHypothesis 含 $1,478,219$ 个声明， LFunction\_eq\_zero\_re\_of\_isPrimitive 含 $1,478,214$ 个声明， LFunction\_ne\_zero\_of\_half\_lt\_re 含 $1,478,211$ 个声明；
- **落在五大主定理联合依赖锥之外的声明总数**：

$$
\begin{aligned}
|V \setminus \operatorname{Cone} _ {\mathcal{G}}(T)| &= 2,701,132 - 1,478,243 = 1,222,889, \cr
\frac{1,222,889}{2,701,132} &\approx 0.452732.
\end{aligned} \tag{5.9}
$$

#### 2. 从乘性／Euler 乘积源集 $S$ 到五大主定理汇集 $T$ 的八顶点最小有向割
固定乘性同态与命名 Euler 乘积源节点集合（注：由于在 Mathlib 中乘法特征类型 $\operatorname{MulChar}$ 继承自乘法幺半群同态 $\operatorname{MonoidHom}$ ，其乘性法则投影在环境中的真实声明名为父投影 MonoidHom.map\_mul' ）：

$$
\begin{aligned}
S &= \bigl\lbrace s _ {\mathrm{mul}},\ s _ {\mathrm{sum}},\ s _ {\mathrm{EP,Dir}}, \cr
&\qquad s _ {\mathrm{EP,exp}},\ s _ {\mathrm{EP,\zeta}} \bigr\rbrace, \qquad |S| = 5,
\end{aligned} \tag{5.10}
$$

其中 $s _ {\mathrm{mul}}, s _ {\mathrm{sum}}, s _ {\mathrm{EP,Dir}}, s _ {\mathrm{EP,exp}}, s _ {\mathrm{EP,\zeta}}$ 分别对应环境中的五个源声明 MonoidHom.map\_mul'、dirichletSummandHom、DirichletCharacter.LSeries\_eulerProduct、DirichletCharacter.LSeries\_eulerProduct\_exp\_log 与 riemannZeta\_eulerProduct。在全图 $2,701,132$ 个节点中，同时位于源集 $S$ 的下游可达集且位于汇集 $T$ 的上游依赖锥内的活动子图规模为：

$$
\begin{aligned}
|V _ {\mathrm{active}}| &= |\operatorname{Reach} _ {\mathcal{G}}(S) \cap \operatorname{Cone} _ {\mathcal{G}}(T)| \cr
&= 1,072,980.
\end{aligned} \tag{5.11}
$$

我们将活动子图中的每一个内部声明节点 $v \in V _ {\mathrm{active}} \setminus (S \cup T)$ 拆分为入点 $v^{\mathrm{in}}$ 与出点 $v^{\mathrm{out}}$ ，赋予内部顶点容量 $c(v^{\mathrm{in}} \to v^{\mathrm{out}}) = 1$ ，赋予有向引用边容量 $+\infty$ ，求解最小内部有向顶点割：

$$
\begin{aligned}
\lambda(S \to T) := \min\bigl\lbrace &|C| : C \subseteq V _ {\mathrm{active}} \setminus (S \cup T), \cr
&S \not\leadsto _ {\mathcal{G} - C} T\bigr\rbrace.
\end{aligned} \tag{5.12}
$$

实测与独立流证书验证得出了一个极其震撼的拓扑事实：在这座拥有 $1,072,980$ 个活动声明节点、一亿七千多万条边的庞大依赖迷宫中，连接选定乘性／Euler 乘积源集 $S$ 与五大顶层定理汇集 $T$ 的最小内部有向顶点割容量仅仅为 $\lambda(S \to T) = 8$ （最大整流量 $|f _ {\max}| = 8 = |C _ {\min}|$ ，独立证书校验 VERIFIED ）。这 $8$ 个扼守全部 $1,072,980$ 个活动节点的咽喉瓶颈声明精确为：
1. DirichletCharacter.FactorsThrough 
2. Formalism.VW.critLine 
3. Formalism.VW.rh\_of\_every 
4. HurwitzZeta.hurwitzZetaEven 
5. UpperTheory.FinalTheorems.everyCharacter 
6. ZMod.LFunction 
7. claimAll 
8. starRingEnd.\_proof\_2 

请看这 $8$ 个最小割顶点中的第 4 项 HurwitzZeta.hurwitzZetaEven 与第 6 项 ZMod.LFunction ，以及第 5 项总汇桥 UpperTheory.FinalTheorems.everyCharacter 和第 7 项 claimAll ：这用实机全图网络流数据直观地印证了我们的理论预判——尽管全库堆砌了一千七百三十七万行源码、一百零七万个源汇活动声明，但从底层载体到顶层定理的咽喉通道，确实高度收束在 ZMod.LFunction 、 HurwitzZeta.hurwitzZetaEven 与顶层汇总引理 everyCharacter / claimAll 这寥寥 $8$ 个窄口节点之上。

#### 3. 二十步对数二分断路轨迹（严格满足 $\le 25$ 步对数界）
在除去源汇端点的 $1,072,972$ 个内部活动声明上，按字典序定义单调断路谓词 $P _ {\mathrm{disc}}(k)$ （删除前 $k$ 个内部活动声明后源集 $S$ 与汇集 $T$ 是否彻底断路）。由于 $\lceil \log _ 2(1,072,972) \rceil = 20 \le 25$ ，二分算法仅用整整 $20$ 步便从一百零七万个候选中精确锁定了唯一断路跳变阈值 $k^{\ast} = 955,506$ （在 $k = 955,505$ 时连通 $\mathrm{False}$ ，在 $k = 955,506$ 时断路 $\mathrm{True}$ ）：

$$
\begin{aligned}
(0,\ 1,072,972) &\to 536,486(\mathrm{F}) \to 804,729(\mathrm{F}) \to 938,850(\mathrm{F}) \cr
&\to 1,005,911(\mathrm{T}) \to 972,380(\mathrm{T}) \cr
&\to 955,615(\mathrm{T}) \to 947,232(\mathrm{F}) \to 951,423(\mathrm{F}) \to 953,519(\mathrm{F}) \to 954,567(\mathrm{F}) \cr
&\to 955,091(\mathrm{F}) \to 955,353(\mathrm{F}) \to 955,484(\mathrm{F}) \to 955,549(\mathrm{T}) \to 955,516(\mathrm{T}) \cr
&\to 955,500(\mathrm{F}) \to 955,508(\mathrm{T}) \to 955,504(\mathrm{F}) \to 955,506(\mathrm{T}) \to 955,505(\mathrm{F}).
\end{aligned} \tag{5.13}
$$

### 5.5　原版元编程绕过前端检查策略（ kexactB 、 kcopy 、 addDecl ）与互归纳自反成员在主定理依赖锥内的实机定位

在 lc23 的全量源码与全环境声明图交叉审计中，我们进一步将原版代码库中使用的非标准元编程策略与特殊互归纳构造在五大主定理依赖锥 $\operatorname{Cone} _ {\mathcal{G}}(T)$ 内的精确位置完整标定：

#### 1. 自定义元编程策略 kexactB 的依赖锥定位（62 个锥内模块、1,816 个声明）
在原版文件 src/Formalism/LocalToGlobal/IndefiniteReal/HeckeNonvanishing/Imports.lean （SHA-256 摘要 8be7d65dc54c7786712817d5709559796783044f7c147729368d2105c0283364 ）第 $1$ 至 $8$ 行，原版作者定义了如下元编程策略：

$$
\mathrm{kexactB}(t) : g \mapsto \mathrm{assign}\bigl(g,\ \mathrm{elabTermAndSynthesize}(t,\ \mathrm{none})\bigr). \tag{5.14}
$$

在标准 Lean 4 的 exact t 策略中，前端阐述器（Elaborator）必须传入当前目标的期望类型 some targetType ，并调用合一器（Unifier）验证所构造项 $e$ 的类型与目标类型定义等价。而式 $(5.14)$ 中的 kexactB 却将期望类型硬性设为 none ，在**完全不经前端阐述器核对所生成项的类型是否与当前证明目标匹配**的情况下，直接调用底层元变量赋值 g.assign e 将项直接赋给目标元变量。
不仅如此，在 IwasawaDecomposition 与 ThirdPlaceSeries 等模块中，原版还定义了局部单字符宏

$$
\begin{aligned}
\operatorname{macro}(\mathrm{kc}) &: e \longmapsto \operatorname{quote}\bigl(\mathrm{kexactB}(e)\bigr), \cr
\operatorname{macro}(\mathrm{kq}) &: e \longmapsto \operatorname{quote}\bigl(\mathrm{kexactQ}(e)\bigr),
\end{aligned} \tag{5.15}
$$

在单个百行级证明项中连续嵌套数十次 kc% 直接元变量赋值。
我们的全库扫描与依赖锥交叉比对证实：全库共有 $67$ 个文件涉及 kexactB （ $1$ 个定义文件 $+ 66$ 个调用文件，其中 $50$ 个文件字面出现 kexactB ， $17$ 个文件通过宏 kc% / kq% 调用）。更重要的是，将这 $66$ 个调用模块与五大主定理的依赖锥 $\operatorname{Cone} _ {\mathcal{G}}(T)$ 求交后发现： $66$ 个调用模块中有 $62$ 个模块（占比 93.94% ）、合计 $1,816$ 个声明直接位于五大主定理的结构依赖锥 $\operatorname{Cone} _ {\mathcal{G}}(T)$ 内部。（仅 ParameterOfDiscreteSeriesRay.lean 、 ReductionSeriesB2.lean 、 SeriesAtOfExpRelation.lean 、 SeriesAtThetaTwist.lean 四个 IwasawaDecomposition 下的同名副本模块未入锥）。
此外，原版还在 src/Formalism/LocalToGlobal/NumberFieldFamilies/OwnStruct.lean （SHA-256 摘要 7355c5048106319548400334473294635069231350a887495763a02c504fd79c ）第 $53$ 至 $64$ 行定义了按字段拆解重构并直接 g.assign 的 kcopy 与 kcopy\_probe ，在 src/Formalism/HermitianCurvature/HermitianCurvatureProofs/CutCptCopy.lean （SHA-256 摘要 1587849505e41203121427592d6574c04725a05545968468889438f734934338 ）第 $20$ 至 $43$ 行定义了用 addDecl 批量克隆声明的 copyAll 。
虽然我们在 lc23 上的负控实验 KexactNegativeControl 表明：当把 kexactB 用于最简单的 $\mathrm{True} \to \mathrm{False}$ 赋值时，前端虽放行但最终被 Lean 4 内核以 (kernel) declaration type mismatch 拦截，但这恰恰说明：在所有使用 kexactB 与 kcopy 的 $1,816$ 个入锥声明处，前端阐述器的类型安全防线已被完全旁路，全部类型一致性压力被百分百压到了单一的 Lean v4.33.1 内核与运行时之上。

#### 2. 导致独立检查器退出码 2 报错的锥内互归纳自反结构（PrincipalizationCertificate 与 OrderCertificate）
在原版模块 src/Development/ResolutionOfSingularities/EmbeddedResolution/IdealPrincipalization/PrincipalizationCertificate.lean （SHA-256 摘要 8a3b482722a1176158c383157255178968153463621719507036045423965239 ）第 $12$ 至 $90$ 行，定义了互归纳类型块 PrincipalizationCertificate 与 OrderCertificate 。其中第 $36$ 至 $38$ 行 localize 构造子含有函数型自反递归参数：

$$
\begin{aligned}
\mathrm{hcert} &: \forall z \in \operatorname{Spec}(R),\ z \notin V(I) \cr
&\qquad \implies \operatorname{PrincipalizationCertificate}(R, I, z, \dots).
\end{aligned} \tag{5.16}
$$

我们的依赖图追踪证实： PrincipalizationCertificate （含 $11$ 个相关入锥声明）与 OrderCertificate （含 $12$ 个相关入锥声明）均真真切切地位于五大主定理的类型与证明体依赖锥 $\operatorname{Cone} _ {\mathcal{G}}(T)$ 内部。
正是由于这两个互归纳类型在依赖锥内，随 Lean v4.36.0 附带的独立内核检查器 con-leche 与 con-ron 在检查导出文件时均以退出码 $2$ 报错停止（ reflexive member ），导致仓库的 comparator.json 配置文件删去了 con-leche 、 con-ron 与 lean4lean （后者在 $4.36.0$ 下因核心库 Decidable.intro 变更而拒绝 $4.33.1$ 导出），仅保留了 Lean 自身加固版与 nanoda 。
本着百分之百的科学客观与证据完整性，我们也同时记录两项对称事实：
- 一方面，外部 MIT 核验页后续公布的更新日志显示，针对该互归纳自反成员扩展支持后的新版 con-leche （版本 cd2eceab ）与 con-ron （版本 3f22699b ）已在外部机器上接受了含 $1,468,418$ 个导出声明的完整导出包并确认了五个顶层声明（该记录属于外部历史日志，并非本轮在 lc23 上对全部 $175,187$ 个模块从源码重编译的本地复现）；
- 另一方面，目标工程锁定的工具链 Lean v4.33.1 （发布于 2026-08-21）确实早于 Lean v4.34.1 的两项重要运行时内存与引用计数可靠性修复——PR #15241 （修复因引用计数上溢或下溢被冻结的对象在级联释放中可能引发的释放后重用 use-after-free 漏洞，官方发布说明明确指出在至少 $18 \mathrm{GB}$ 内存机器上可被特定构造的输入转化为无公理的 $\mathrm{False}$ 证明）与 PR #15289 （修复极大共享子项引用计数超过 INT\_MAX 时的溢出问题）。虽然不能仅凭源码体量断言该证明利用了上述运行时漏洞，但在一个广泛使用 kexactB 旁路前端检查、证明图边数高达 $1.707$ 亿条的超巨型工程中，将编译通过完全寄托在早于 #15241 / #15289 修复的 v4.33.1 构建缓存之上，绝不能替代对其底层数学商结构与算术保真性的实质审查。

### 5.6　建设性保真形式化规范与六方案零通读秒级核查协议的纯闭式方程

为了使外部数学家与形式化验证专家在任何机器上都能立即复现本专论的诊断，同时为未来真正无失真的解析数论形式化提供建设性基准，我们将**六大最简核查方案的标准操作协议**与**携余项纤维的建设性保真状态规范**凝练为如下纯闭式方程组：

#### 1. 建设性保真有型状态对 $(\mathcal{Z} _ {P,X}, \delta _ {P,X})$ 与跨区桥接四要素
任何声称连接右半平面算术定义与临界带零点排斥的形式化架构，禁止使用不带定义域守卫的裸点值总化函数作为唯一通道，而必须显式维护有型状态对

$$
\begin{aligned}
\mathcal{S} _ {P,X}(s; \chi) := \Bigl(&N^{\ast},\ \chi^{\ast},\ (P, X), \cr
&\mathcal{Z} _ {P,X}(s; \chi),\ \delta _ {P,X}(s; \chi),\ \mathcal{C} _ {\mathrm{hol}}(B)\Bigr),
\end{aligned} \tag{5.17}
$$

其中：
- $N^{\ast} \mid N$ 为本原导子， $\chi^{\ast}$ 为诱导 $\chi$ 的唯一本原特征，显式分离坏素数局部 Euler 因子 $\prod _ {p\mid N, p\nmid N^{\ast}}(1 - \chi^{\ast}(p)p^{-s})$ 在虚轴 $\operatorname{Re}(s) = 0$ 上的周期零点；
- $\mathcal{Z} _ {P,X}(s; \chi)$ 为当前有限素数窗口 $p \le P$ （或求和窗口 $n \le X$ ）的显式算术主部， $\delta _ {P,X}(s; \chi)$ 为满足步进守恒律 $(1.2)$ – $(1.3)$ 的未决余项耦合纤维；
- $\mathcal{C} _ {\mathrm{hol}}(B)$ 为目标有理矩形 $B \subset \lbrace 1/2 < \operatorname{Re}(s) < 1\rbrace$ 上的无极点、边界无零点及显式有理 Rouché 裕量证书 $\Delta _ {\mathrm{Rouche}} > 0$ 。

#### 2. 六大最简零通读秒级核查方案的闭式判定准则
- **方案一**（证明尾部插入与边界守卫剥离检验）：在证明树末端新建独立测试模块，固定主定理证明项 $p$ ，分别测试：
- **(1A)** 镜像结论替换 $\operatorname{Re}(s) = 3/4$ 是否被内核拒绝；
- **(1B)** 原始级数 $\operatorname{LSeries}(1, 3/4) = 0$ 与解析延拓值 $\operatorname{riemannZeta}(3/4) \neq 0$ 的严格分离；
- **(1C)** 剥离左边界守卫 $0 < \operatorname{Re}(s)$ 后，用模 $2$ 主特征在虚轴零点 $s _ 0 = \frac{2\pi i}{\log 2}$ 处的等式 $\operatorname{DirichletCharacter.LFunction}(1, s _ 0) = 0$ 直接在数秒内证伪无守卫命题。
- **方案二**（底层定义打印与右半平面收敛桥守卫审计）：对顶层定理链条中的 $\operatorname{LFunction}$ 与 $\operatorname{ZMod.LFunction}$ 执行定义展开，核查从右半平面 Euler 乘积向临界带延拓的每一步桥接引理是否携带显式收敛域前件 $\operatorname{Re}(s) > 1$ 。
- **方案三**（全递归依赖锥公理审查与绕过前端策略排查）：在完整导入环境上递归遍历类型引用、证明体引用与归纳结构引用，核对五大主定理依赖锥 $\operatorname{Cone} _ {\mathcal{G}}(T)$ 内的公理集，并检索锥内是否存在将阐述期望类型设为 none 并直接执行底层元变量赋值的自定义策略（如 kexactB 、 kcopy 、 addDecl ）及触发独立检查器退出码 $2$ 的互归纳自反成员。
- **方案四**（源汇有向依赖网络最小顶点割与二十步对数二分）：在全环境有向声明图 $\mathcal{G} = (V, E)$ 上，以乘性同态及 Euler 乘积定理集为源集 $S$ 、以顶层主定理集为汇集 $T$ ，求解拆点单位容量最大流与最小内部有向顶点割 $\lambda(S \to T)$ ，并用 $\lceil \log _ 2 |V _ {\mathrm{active}}| \rceil \le 25$ 步对数二分锁定咽喉瓶颈节点。
- **方案五**（同商纤维特洛伊反模型注入）：构造满足对称函数方程与多项式增长界、但在 $1/2 < \operatorname{Re}(s) < 1$ 内带显式离轴零点的测试对象——代数对称多项式 $P _ {\mathrm{Trojan}}(s) = (s-3/4)(s-1/4)$ 、偶通道互反变形函数 $F _ {\mathrm{even}}(s) = P _ r(2^{1/2-s})\zeta(s)$ （在 $s = 3/4$ 处恒为零）与奇通道 Davenport–Heilbronn 周期 Hurwitz 组合 $\mathcal{D}(s)$ （在 $n = 6$ 处乘性残差为 $1 + \kappa^2 > 0$ ），直接注入任何未绑定全阶素数幂乘性的临界带排零引理以触发 $(3/4 : \mathbb{R}) = 1/2$ 。
- **方案六**（有限模数、Gauss 和退化与有理正定 Gram 矩阵对撞）：用模零排除 $\neg\operatorname{Nonempty}(\operatorname{NeZero}(0))$ 、模 $4$ 非本原主特征 Gauss 和 $\tau(\chi _ {0,4}) = 0 \neq 2$ 及三维有理 Gram 矩阵 $LDL^{\mathsf{T}}$ 精确平方和分解与零矩非零向量 $c = (34, -57, 23)^{\mathsf{T}}$ （能量 $c^{\mathsf{T}} G _ {\mathrm{wave}} c = 39 > 0$ ）检验局部有限算术引理的前件完整性。

---

## 第六章　一百八十二项闭式代数、观察恢复、正定矩阵分解与单前提破缺反例命题完备台账（命题 A.1–A.120 与命题 B.1–B.62）

本章将支撑前述全部主定理、五大静态失实机制与六大核查方案的一百二十项正向闭式命题（命题 A.1 至命题 A.120）与六十二项单前提剥离破缺反例命题（命题 B.1 至命题 B.62）逐一列出。每一项命题均仅由标准有理矩阵运算、多项式恒等式与显式有限维线性代数构成，可在任何计算机代数系统或手算中逐项独立核验。

### 6.1　正向闭式命题台账（命题 A.1–A.120）

#### 6.1.1　A01 族：总化级数截断、有限和与未决余项伴随纤维（命题 A.1–A.12）

**命题 A.1**。在四维截断系数与余项状态空间中，取观察矩阵、合法保持算子、零空间生成基与不变读口向量分别为

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}, \cr
& A _ {\mathrm{keep}} = \begin{pmatrix}
1 & 0 & 0 & 0 \cr
0 & 1 & 0 & 0 \cr
0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1
\end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr 0 & 1 \cr -1 & 0 \cr 0 & -1 \end{pmatrix}, \cr
& c _ {\mathrm{inv}} = \begin{pmatrix} 1 \cr 1 \cr 1 \cr 1 \end{pmatrix}.
\end{aligned}
$$

则商核闭合条件 $E A _ {\mathrm{keep}} K = 0$ 、守恒不变式 $A _ {\mathrm{keep}}^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ 以及伴随对冲步进 $\delta = (-1, 0, 1, 0)^{\mathsf{T}} \in \ker E$ （ $E\delta = 0$ ）同时精确成立。

**命题 A.2**。在命题 A.1 的状态空间中，取单步窗口转移算子与双方向对冲增量分别为

$$
\begin{aligned}
& A _ {\mathrm{transfer}} = \begin{pmatrix}
0 & 0 & 0 & 0 \cr
0 & 1 & 0 & 0 \cr
1 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1
\end{pmatrix}, \cr
& \delta _ 1 = \begin{pmatrix} -1 \cr 0 \cr 1 \cr 0 \end{pmatrix}, \cr
& \delta _ 2 = \begin{pmatrix} 0 \cr -1 \cr 0 \cr 1 \end{pmatrix}.
\end{aligned}
$$

则商核保持 $E A _ {\mathrm{transfer}} K = 0$ 、全阶和守恒 $A _ {\mathrm{transfer}}^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ 及双增量零干扰 $E\delta _ 1 = 0, E\delta _ 2 = 0$ 严格成立。

**命题 A.3**。在五维带可剥离辅助槽位的状态空间中，取观察矩阵、零空间基、剥离算子与有效增量分别为

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 1 & 0 \cr -1 & 0 & 0 \cr 0 & -1 & 0 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& A _ {\mathrm{prune}} = \operatorname{diag}(1, 1, 1, 1, 0), \cr
& \delta = \begin{pmatrix} -1 \cr 1 \cr 1 \cr -1 \cr 0 \end{pmatrix}.
\end{aligned}
$$

由于第五分量对观察矩阵 $E$ 与守恒向量 $c _ {\mathrm{inv}} = (1, 1, 1, 1, 0)^{\mathsf{T}}$ 均为零残余，故 $E A _ {\mathrm{prune}} K = 0$ 、 $A _ {\mathrm{prune}}^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ 及 $E\delta = 0$ 严格成立。

**命题 A.4**。在四维截断空间中，取第一分量向第三分量合并算子 $A _ 1$ 与第二分量向第四分量合并算子 $A _ 2$ ：

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix} 0 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 0 & 0 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

则对一切复合词（含 $A _ 1, A _ 2, A _ 1 A _ 2, A _ 2 A _ 1$ ），均有 $E A _ i K = 0$ 与 $A _ i^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ 成立。

**命题 A.5**。在二维显式主部与余项对偶空间中，取总和观察行向量 $E = (1, 1)$ 、零空间基 $K = (1, -1)^{\mathsf{T}}$ 、转移算子 $A$ 、不变量 $c _ {\mathrm{inv}} = (1, 1)^{\mathsf{T}}$ 与对冲步进 $\delta = (-1, 1)^{\mathsf{T}}$ ：

$$
A = \begin{pmatrix} 0 & 0 \cr 1 & 1 \end{pmatrix}.
$$

则 $E A K = 0$ 、 $A^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ 与 $E\delta = 0$ 同时成立。

**命题 A.6**。在三维部分和与双级余项空间中，取观察行向量 $E = (1, 1, 1)$ 、零空间基与两步推进算子分别为

$$
\begin{aligned}
& K = \begin{pmatrix} 1 & 0 \cr -1 & 1 \cr 0 & -1 \end{pmatrix}, \cr
& A _ {1\to 2} = \begin{pmatrix} 0 & 0 & 0 \cr 1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& A _ {2\to 3} = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 0 & 0 \cr 0 & 1 & 1 \end{pmatrix}.
\end{aligned}
$$

则 $E A _ {1\to 2} K = 0$ 、 $E A _ {2\to 3} K = 0$ ，且两步推进均保持总和向量 $c _ {\mathrm{inv}} = (1, 1, 1)^{\mathsf{T}}$ 不变。

**命题 A.7**。在三维带静默辅助坐标的截断空间中，取 $E = (1, 1, 0)$ 、零空间基 $K$ 、主部转移算子 $A _ 1$ 与静默坐标剥离算子 $A _ 2 = \operatorname{diag}(1, 1, 0)$ ：

$$
\begin{aligned}
& K = \begin{pmatrix} 1 & 0 \cr -1 & 0 \cr 0 & 1 \end{pmatrix}, \cr
& A _ 1 = \begin{pmatrix} 0 & 0 & 0 \cr 1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

则 $E A _ 1 K = 0$ 、 $E A _ 2 K = 0$ ，且两者均保持 $c _ {\mathrm{inv}} = (1, 1, 0)^{\mathsf{T}}$ 与对冲步进 $\delta = (-1, 1, 0)^{\mathsf{T}} \in \ker E$ 。

**命题 A.8**。在四维双通道部分和空间中，取观察矩阵 $E$ 、零空间基 $K$ ，以及第一通道合并算子 $A _ 1$ 、第二通道合并算子 $A _ 2$ ：

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr -1 & 0 \cr 0 & 1 \cr 0 & -1 \end{pmatrix}, \cr
& A _ 1 = \begin{pmatrix} 0 & 0 & 0 & 0 \cr 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
\end{aligned}
$$

则 $E A _ 1 K = E A _ 2 K = 0$ ，且联合步进 $\delta = (-1, 1, -1, 1)^{\mathsf{T}}$ 严格满足 $E\delta = 0$ 。

**命题 A.9**。在命题 A.8 的双通道空间中，将有理比例转移算子取为

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix}
\frac{1}{2} & -\frac{1}{2} & 0 & 0 \cr
\frac{1}{2} & \frac{3}{2} & 0 & 0 \cr
0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1
\end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix}
1 & 0 & 0 & 0 \cr
0 & 1 & 0 & 0 \cr
0 & 0 & \frac{1}{2} & -\frac{1}{2} \cr
0 & 0 & \frac{1}{2} & \frac{3}{2}
\end{pmatrix}.
\end{aligned}
$$

则 $A _ 1, A _ 2$ 不仅保持各自通道的总和读口 $E A _ i K = 0$ ，而且在盲核子空间 $\ker E$ 上具有非平凡幂零作用 $(A _ i - I)^2 = 0$ 。

**命题 A.10**。在五维三读口截断空间中，取完备观察矩阵 $E$ （满行秩 $3$ ）与互补核基 $K$ 。则在部分对冲转移算子

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr 0 & 1 \cr -1 & 0 \cr 0 & -1 \cr 0 & 0 \end{pmatrix}.
\end{aligned}
$$

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix}
\frac{1}{2} & 0 & -\frac{1}{2} & 0 & 0 \cr
0 & 1 & 0 & 0 & 0 \cr
\frac{1}{2} & 0 & \frac{3}{2} & 0 & 0 \cr
0 & 0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 0 & 1
\end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix}
1 & 0 & 0 & 0 & 0 \cr
0 & \frac{1}{2} & 0 & -\frac{1}{2} & 0 \cr
0 & 0 & 1 & 0 & 0 \cr
0 & \frac{1}{2} & 0 & \frac{3}{2} & 0 \cr
0 & 0 & 0 & 0 & 1
\end{pmatrix}
\end{aligned}
$$

下，商核闭合条件 $E A _ 1 K = E A _ 2 K = 0$ 与三通道总和不变式 $A _ i^{\mathsf{T}} (1,1,1,1,1)^{\mathsf{T}} = (1,1,1,1,1)^{\mathsf{T}}$ 恒成立。

**命题 A.11**。在四维单极点留数、常数项与双余项对偶空间中，取留数与常数项双读口矩阵 $E$ ，在有理半步转移算子 $A _ 1, A _ 2$ 下，任何形如 $\delta = (-r, c, r, -c)^{\mathsf{T}}$ （如 $\delta = (-1, 1, 1, -1)^{\mathsf{T}}$ ）的耦合转移步进均满足 $E\delta = 0$ ，保证显式主部与余项纤维之间的能量交换不产生读口漂移。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.12**。在五维带可撤除诊断支架的状态空间中，取观察矩阵 $E$ 与撤架投影 $A _ {\mathrm{drop}} = \operatorname{diag}(1, 1, 1, 1, 0)$ 。当诊断支架所在的第五坐标与前四维生产坐标解耦时， $A _ {\mathrm{drop}}$ 与所有生产转移算子交换，且满足零漂移撤除条件 $E(I - A _ {\mathrm{drop}}) = 0$ 。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}.
$$

#### 6.1.2　A02 族：极点主部芽、对数导数留数与双穿孔观测恢复矩阵（命题 A.13–A.24）

**命题 A.13**。在三维（极点留数 $r$ 、常数项 $c _ 0$ 、一阶导数项 $c _ 1$ ）亚纯芽空间中，若观察矩阵完整保留前两阶奇异读口 $E$ ，则盲核仅由高阶正则项 $K = (0, 0, 1)^{\mathsf{T}}$ 张成；任何在正则项上的裁剪算子 $A _ {\mathrm{reg}} = \operatorname{diag}(1, 1, 0)$ 均满足 $E A _ {\mathrm{reg}} K = 0$ 且严格保持留数读口 $c _ {\mathrm{res}} = (1, 0, 0)^{\mathsf{T}}$ 不变。

$$
E = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 1 & 0 \end{pmatrix}.
$$

**命题 A.14**。在四维（留数 $r$ 、常数项 $c _ 0$ 、穿孔采样差、高阶背景项）空间中，取穿孔差分观察矩阵 $E$ 与互补核基 $K$ 。在留数归并算子 $A _ 1$ 与背景剥离算子 $A _ 2 = \operatorname{diag}(1, 1, 1, 0)$ 下， $E A _ 1 K = E A _ 2 K = 0$ 且留数总和向量 $(1, 0, 1, 0)^{\mathsf{T}}$ 严格守恒。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 0 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr 0 & 0 \cr -1 & 0 \cr 0 & 1 \end{pmatrix}, \cr
& A _ 1 = \begin{pmatrix} 0 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.15**。对极点主部芽 $g _ {r,c _ 0}(s) = \frac{r}{s-1} + c _ 0$ 在对称穿孔点 $s _ + = 2, s _ - = 0$ （步长 $h = 1$ ）及辅助正则通道构成的 $3 \times 3$ 观测矩阵

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 1 & 0 \cr -1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix} \frac{1}{2} & -\frac{1}{2} & 0 \cr \frac{1}{2} & \frac{1}{2} & 0 \cr 0 & 0 & 1 \end{pmatrix},
\end{aligned}
$$

严格有 $L M = I _ 3$ 。由此对任意采样读数 $(y _ +, y _ -, y _ 3)^{\mathsf{T}}$ ，留数 $r = \frac{1}{2}(y _ + - y _ -)$ 与常数项 $c _ 0 = \frac{1}{2}(y _ + + y _ -)$ 被唯一无损恢复。

**命题 A.16**。当对称穿孔步长缩小为 $h = \frac{1}{2}$ （采样点 $s _ + = \frac{3}{2}, s _ - = \frac{1}{2}$ ）时， $g _ {r,c _ 0}(s)$ 的 $3 \times 3$ 穿孔观测矩阵与精确有理左逆恢复矩阵分别为

$$
\begin{aligned}
& M _ {1/2} = \begin{pmatrix} 2 & 1 & 0 \cr -2 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& L _ {1/2} = M _ {1/2}^{-1} = \begin{pmatrix}
\frac{1}{4} & -\frac{1}{4} & 0 \cr
\frac{1}{2} & \frac{1}{2} & 0 \cr
0 & 0 & 1
\end{pmatrix}, \cr
& L _ {1/2} M _ {1/2} = I _ 3.
\end{aligned}
$$

**命题 A.17**。在含有一阶线性项的极点芽 $g(s) = \frac{r}{s-1} + c _ 0 + c _ 1(s-1)$ 空间中，采用三点穿孔与导数联合观测矩阵 $M$ 及其精确有理逆矩阵 $L$ ：

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 1 & 0 \cr -1 & 1 & 0 \cr 0 & 1 & 1 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix}
\frac{1}{2} & -\frac{1}{2} & 0 \cr
\frac{1}{2} & \frac{1}{2} & 0 \cr
-\frac{1}{2} & -\frac{1}{2} & 1
\end{pmatrix},
\end{aligned}
$$

严格满足 $L M = I _ 3$ ，可同时唯一恢复极点留数 $r$ 、常数项 $c _ 0$ 与一次斜率 $c _ 1$ 。

**命题 A.18**。在步长 $h = \frac{1}{3}$ （采样点 $s _ \pm = 1 \pm \frac{1}{3}$ ）加上三阶耦合通道的观测模型中，观测矩阵与精确有理左逆矩阵分别为

$$
\begin{aligned}
& M _ {1/3} = \begin{pmatrix} 3 & 1 & 0 \cr -3 & 1 & 0 \cr 0 & 1 & 2 \end{pmatrix}, \cr
& L _ {1/3} = M _ {1/3}^{-1} = \begin{pmatrix}
\frac{1}{6} & -\frac{1}{6} & 0 \cr
\frac{1}{2} & \frac{1}{2} & 0 \cr
-\frac{1}{4} & -\frac{1}{4} & \frac{1}{2}
\end{pmatrix}, \cr
& L _ {1/3} M _ {1/3} = I _ 3.
\end{aligned}
$$

**命题 A.19**。在四维双极点主部与正则背景分解中，取上三角耦合观测矩阵 $M$ 与精确有理左逆矩阵 $L$ ：

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 1 & 0 & 0 \cr -1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix}
\frac{1}{2} & -\frac{1}{2} & 0 & 0 \cr
\frac{1}{2} & \frac{1}{2} & 0 & 0 \cr
0 & 0 & 1 & -1 \cr
0 & 0 & 0 & 1
\end{pmatrix},
\end{aligned}
$$

严格满足 $L M = I _ 4$ 。

**命题 A.20**。在双穿孔步长 $h _ 1 = 1$ 与 $h _ 2 = \frac{1}{2}$ 的四维联合采样模型中，块对角对称穿孔观测矩阵与精确有理逆矩阵满足：

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 1 & 0 & 0 \cr -1 & 1 & 0 & 0 \cr 0 & 0 & 2 & 1 \cr 0 & 0 & -2 & 1 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix}
\frac{1}{2} & -\frac{1}{2} & 0 & 0 \cr
\frac{1}{2} & \frac{1}{2} & 0 & 0 \cr
0 & 0 & \frac{1}{4} & -\frac{1}{4} \cr
0 & 0 & \frac{1}{2} & \frac{1}{2}
\end{pmatrix}, \cr
& L M = I _ 4.
\end{aligned}
$$

**命题 A.21**。在四维交错极点—正则采样基下，观测矩阵与精确有理逆矩阵满足：

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \cr 1 & 0 & -1 & 0 \cr 0 & 1 & 0 & -1 \end{pmatrix}, \cr
& L = M^{-1} = \frac{1}{2}\begin{pmatrix}
1 & 0 & 1 & 0 \cr
0 & 1 & 0 & 1 \cr
1 & 0 & -1 & 0 \cr
0 & 1 & 0 & -1
\end{pmatrix}, \cr
& L M = I _ 4.
\end{aligned}
$$

**命题 A.22**。在三维非对称穿孔采样点（取 $s _ 1 = 2, s _ 2 = \frac{1}{2}, s _ 3 = 3$ ）耦合观测下，观测矩阵与精确有理左逆矩阵满足：

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 2 & 0 \cr -1 & 2 & 0 \cr 1 & 0 & 3 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix}
\frac{1}{2} & -\frac{1}{2} & 0 \cr
\frac{1}{4} & \frac{1}{4} & 0 \cr
-\frac{1}{6} & \frac{1}{6} & \frac{1}{3}
\end{pmatrix}, \cr
& L M = I _ 3.
\end{aligned}
$$

**命题 A.23**。在三维对数导数极点阶数 $m$ 、正则值 $g(s _ 0)$ 与一阶导数 $g'(s _ 0)$ 的耦合展开中，取观测矩阵与精确有理逆矩阵：

$$
\begin{aligned}
& M = \begin{pmatrix} 2 & 1 & 0 \cr 1 & 1 & 0 \cr 0 & 1 & 1 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix} 1 & -1 & 0 \cr -1 & 2 & 0 \cr 1 & -2 & 1 \end{pmatrix}, \qquad L M = I _ 3,
\end{aligned}
$$

从而零点或极点阶数 $m$ 被第一行差分 $(1, -1, 0)$ 唯一整数恢复。

**命题 A.24**。在四维完备极点芽与对数导数联合读口空间中，若观察矩阵包含全部三个核心算术—解析自由度 $E$ ，且第四坐标为纯填洞默认槽位 $K = (0, 0, 0, 1)^{\mathsf{T}}$ ，则由于填洞默认槽位已被完全隔离在 $\ker E$ 内，无论在第四槽位上施加幂零归零 $A _ 2 = \operatorname{diag}(1,1,1,0)$ 还是尺度变换 $A _ 1 = \operatorname{diag}(1,1,1,2)$ ，均满足 $E A _ 1 K = E A _ 2 K = 0$ ，绝不污染前三维真实奇异芽读数。

$$
E = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 0 \end{pmatrix}.
$$

#### 6.1.3　A03 族：跨模统一拉回、本原导子分解与四特征耦合守恒（命题 A.25–A.36）

**命题 A.25**。在四维双模特征拉回空间（代表本原特征分量与诱导余项分量）中，取跨模合并观察矩阵 $E$ 与核基 $K$ 。在拉回归并算子 $A _ 1$ 下，商核闭合条件 $E A _ 1 K = 0$ 与跨模总特征和守恒 $A _ 1^{\mathsf{T}}(1,1,1,1)^{\mathsf{T}} = (1,1,1,1)^{\mathsf{T}}$ 严格成立。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr 0 & 1 \cr -1 & 0 \cr 0 & -1 \end{pmatrix}, \cr
& A _ 1 = \begin{pmatrix} 0 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.26**。在五维带非本原坏素数局部修正槽位的跨模空间中，取观察矩阵 $E$ 。当坏素数局部因子被显式剥离至独立方程后，在主部上的归并算子 $A _ 1$ 与第五槽位静默化算子 $A _ 2 = \operatorname{diag}(1,1,1,1,0)$ 满足 $E A _ 1 K = E A _ 2 K = 0$ 。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}.
$$

**命题 A.27**。在四维（主特征 $1$ 、第一实特征 $\chi _ 1$ 、第二实特征 $\chi _ 2$ 、乘积特征 $\chi _ 1\chi _ 2$ ）空间中，当 $\chi _ 1(p) = \chi _ 2(p) = -1$ 时，由式 $(4.13)$ 知四通道系数向量为 $(1, -1, -1, 1)^{\mathsf{T}}$ ，其总和（即四特征正定核读口 $E = (1, 1, 1, 1)$ ）满足 $1 - 1 - 1 + 1 = 0$ 。更一般地，取单行总和观察 $E = (1, 1, 1, 1)$ 与三维零和核基

$$
K = \begin{pmatrix} 1 & 0 & 0 \cr -1 & 1 & 0 \cr 0 & -1 & 1 \cr 0 & 0 & -1 \end{pmatrix},
$$

则任何保持四通道总和的邻接能量交换算子 $A _ 1, A _ 2$ 均满足 $E A _ 1 K = E A _ 2 K = 0$ ，且四特征对冲增量 $\delta = (-1, 1, -1, 1)^{\mathsf{T}}$ 严格满足 $E\delta = 0$ 。

**命题 A.28**。在六维三模公倍数 $\operatorname{lcm}(N _ 1, N _ 2, N _ 3)$ 统一拉回空间中，取三维标准读口矩阵 $E$ 与三维核基 $K = (I _ 3, -I _ 3)^{\mathsf{T}}$ 。则分通道拉回算子 $A _ 1, A _ 2$ 在全部复合路径上均满足 $E A _ 1 K = E A _ 2 K = 0$ 及总和守恒。

$$
E = \begin{pmatrix} 1 & 0 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 0 & 1 & 0 \cr 0 & 0 & 1 & 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.29**。在命题 A.25 的四维双模拉回空间中，交换归并顺序（先归并第二模通道 $A _ 1$ ，再归并第一模通道 $A _ 2$ ），商核闭合 $E A _ i K = 0$ 与单通道对冲步进 $\delta = (0, -1, 0, 1)^{\mathsf{T}} \in \ker E$ 依然严格成立。

**命题 A.30**。在四维有理加权跨模拉回模型中，取平均分配算子

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix}
\frac{1}{2} & 0 & -\frac{1}{2} & 0 \cr
0 & 1 & 0 & 0 \cr
\frac{1}{2} & 0 & \frac{3}{2} & 0 \cr
0 & 0 & 0 & 1
\end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix}
1 & 0 & 0 & 0 \cr
0 & \frac{1}{2} & 0 & -\frac{1}{2} \cr
0 & 0 & 1 & 0 \cr
0 & \frac{1}{2} & 0 & \frac{3}{2}
\end{pmatrix}.
\end{aligned}
$$

则对跨模读口 $E$ ，恒有 $E A _ 1 K = E A _ 2 K = 0$ 且双通道对称增量 $\delta = (-1, -1, 1, 1)^{\mathsf{T}} \in \ker E$ 。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.31**。在五维带显式导子指示位（第五坐标固定为 $1$ ）的跨模空间中，取三行观察矩阵 $E$ 。由于导子指示位被第三读口直接锁定（不再落入盲核 $\ker E$ ），跨模归并算子 $A _ 1, A _ 2$ 在保持前两行特征和的同时，精确保持导子指示位恒定不变。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.32**。在五维双特征簇与独立零和辅助平面上，取观察矩阵 $E$ 与三维核基 $K$ 。则簇内归并算子 $A _ 1, A _ 2$ 严格满足 $E A _ 1 K = E A _ 2 K = 0$ 。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 1 & 0 & 0 & 0 \cr 0 & 0 & 1 & 1 & 0 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 & 0 \cr -1 & 0 & 0 \cr 0 & 1 & 0 \cr 0 & -1 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.33**。在三维模 $4$ 特征分解空间（本原奇特征分量、主特征奇余类分量、偶余类零分量）中，取奇余类总和读口 $E = (1, 1, 0)$ ，则在奇余类内部转移算子 $A _ 1$ 与偶余类归零算子 $A _ 2 = \operatorname{diag}(1, 1, 0)$ 下， $E A _ 1 K = E A _ 2 K = 0$ 恒成立。

**命题 A.34**。在四维交错双模读口 $E$ 下，取有理半步交错算子

$$
E = \begin{pmatrix} 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
$$

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix}
\frac{1}{2} & -\frac{1}{2} & 0 & 0 \cr
\frac{1}{2} & \frac{3}{2} & 0 & 0 \cr
0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1
\end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix},
\end{aligned}
$$

则 $E A _ 1 K = E A _ 2 K = 0$ 且反对称增量 $\delta = (-1, 1, 1, -1)^{\mathsf{T}} \in \ker E$ 。

**命题 A.35**。在四维对称有理拉回模型中，若第一簇采用幂等归并 $A _ 1$ ，第二簇采用有理半步转移 $A _ 2$ ，则两者交换（ $A _ 1 A _ 2 = A _ 2 A _ 1$ ）且共同保持观察矩阵 $E$ 的商核闭合。

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix} 0 & 0 & 0 & 0 \cr 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr
0 & 1 & 0 & 0 \cr
0 & 0 & \frac{1}{2} & -\frac{1}{2} \cr
0 & 0 & \frac{1}{2} & \frac{3}{2} \end{pmatrix}, \cr
& E = \begin{pmatrix} 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.36**。在六维带静默第六槽位的三通道跨模空间中，取观察矩阵 $E$ 。在通道归并算子 $A _ 1$ 与第六槽位撤除算子 $A _ 2 = \operatorname{diag}(1,1,1,1,1,0)$ 下，商核闭合条件 $E A _ 1 K = E A _ 2 K = 0$ 与五维有效总和向量 $(1,1,1,1,1,0)^{\mathsf{T}}$ 严格守恒。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 & 0 \cr 0 & 0 & 0 & 0 & 1 & 0 \end{pmatrix}.
$$

#### 6.1.4　A04 族：加法 Hurwitz 延拓与乘法 Euler 筛选的非交换换位子（命题 A.37–A.48）

**命题 A.37**。在四维截断多项式与余项空间中，取一阶加法位移表示矩阵 $A _ {\mathrm{add}}$ 与乘法权重表示矩阵 $A _ {\mathrm{mul}}$ 分别为

$$
\begin{aligned}
& A _ {\mathrm{add}} = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& A _ {\mathrm{mul}} = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 2 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

则两者的非交换换位子严格非零：

$$
\bigl[A _ {\mathrm{add}}, A _ {\mathrm{mul}}\bigr] = \begin{pmatrix}
0 & 0 & 0 & 0 \cr
0 & 0 & 0 & 0 \cr
0 & 0 & 0 & -1 \cr
0 & 0 & 0 & 0 \end{pmatrix} \neq 0.
$$

当且仅当观察矩阵完整锁定前两维守恒量 $E$ 且将非交换内禀剪切完全容纳于伴随纤维 $K$ 中时，才有 $E A _ {\mathrm{add}} K = E A _ {\mathrm{mul}} K = 0$ 。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \end{pmatrix}, \cr
& K = \begin{pmatrix} 0 & 0 \cr 0 & 0 \cr 1 & 0 \cr 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.38**。在命题 A.37 的空间中，将乘法缩放因子推广为素数 $p = 3$ 的局部作用 $A _ {\mathrm{mul},3} = \operatorname{diag}(1, 1, 3, 1)$ ，与二阶加法位移 $A _ {\mathrm{add},2}$ 求换位子，得

$$
A _ {\mathrm{add},2} = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 2 \cr 0 & 0 & 0 & 1 \end{pmatrix}.
$$

$$
\bigl[A _ {\mathrm{add},2}, A _ {\mathrm{mul},3}\bigr] = \begin{pmatrix} 0 & 0 & 0 & 0 \cr
0 & 0 & 0 & 0 \cr
0 & 0 & 0 & -4 \cr
0 & 0 & 0 & 0 \end{pmatrix} \neq 0,
$$

换位子幅值随素数尺度与位移步长呈乘性放大（ $2\times(3-1) = 4$ ）。

**命题 A.39**。取下三角加法累积算子 $A _ 1$ 与非均匀乘法缩放算子 $A _ 2 = \operatorname{diag}(1, 1, 2, 3)$ ，其换位子为

$$
A _ 1 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
$$

$$
[A _ 1, A _ 2] = A _ 1 A _ 2 - A _ 2 A _ 1 = \begin{pmatrix} 0 & 0 & 0 & 0 \cr
0 & 0 & 0 & 0 \cr
0 & 0 & 0 & 0 \cr
0 & 0 & -1 & 0 \end{pmatrix} \neq 0,
$$

证实无论加法位移方向取上三角还是下三角，与非标量乘法缩放均不可交换。

**命题 A.40**。在五维带三阶非交换伴随纤维的空间中，取观察矩阵 $E$ ，以及三阶幂零位移生成元 $A _ 1$ 与对角缩放生成元 $A _ 2$ ：

$$
E = \begin{pmatrix} 1 & 0 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 & 0 \end{pmatrix}.
$$

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix}
1 & 0 & 0 & 0 & 0 \cr
0 & 1 & 0 & 0 & 0 \cr
0 & 0 & 1 & 1 & 0 \cr
0 & 0 & 0 & 1 & 1 \cr
0 & 0 & 0 & 0 & 1
\end{pmatrix}, \cr
& A _ 2 = \operatorname{diag}(1, 1, 2, 3, 5).
\end{aligned}
$$

则不仅一阶换位子 $[A _ 1, A _ 2] \neq 0$ ，二阶嵌套换位子 $\bigl[A _ 1, [A _ 1, A _ 2]\bigr]$ 在 $(3,5)$ 槽位上亦严格非零（取值为 $(2-3) - (3-5) = 1 \neq 0$ ），生成完整的 Heisenberg 型非交换李代数。

**命题 A.41**。在三维极小非交换模型中，取第一坐标为守恒主读口 $E = (1, 0, 0)$ ，后两维为伴随纤维 $K$ 。在 $A _ 1$ 与 $A _ 2 = \operatorname{diag}(1, 2, 1)$ 下， $[A _ 1, A _ 2] \neq 0$ ，且 $E A _ 1 K = E A _ 2 K = 0$ 。

$$
\begin{aligned}
& K = \begin{pmatrix} 0 & 0 \cr 1 & 0 \cr 0 & 1 \end{pmatrix}, \cr
& A _ 1 = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 1 & 1 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& [A _ 1, A _ 2] = \begin{pmatrix} 0 & 0 & 0 \cr 0 & 0 & -1 \cr 0 & 0 & 0 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 A.42**。在命题 A.41 的三维模型中，取步长 $3$ 的位移 $A _ 1$ 与缩放比 $(1, 4, 2)$ 的乘法算子 $A _ 2 = \operatorname{diag}(1, 4, 2)$ ，则换位子 $[A _ 1, A _ 2]$ 的 $(2,3)$ 元等于 $3\times(2 - 4) = -6 \neq 0$ 。

$$
A _ 1 = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 1 & 3 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.43**。在四维耦合商空间中，取观察矩阵 $E$ 与互补核基 $K$ 。定义耦合算子

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 0 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr 0 & 0 \cr -1 & 0 \cr 0 & 1 \end{pmatrix}.
\end{aligned}
$$

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix} 1 & 0 & 0 & -1 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix}
\frac{3}{2} & 0 & -\frac{1}{2} & 0 \cr
0 & 1 & 0 & 0 \cr
-\frac{1}{2} & 0 & \frac{3}{2} & 0 \cr
0 & 0 & 0 & 1
\end{pmatrix}.
\end{aligned}
$$

则 $[A _ 1, A _ 2] \neq 0$ ，且由于换位子的像恰好落在 $\operatorname{span}\lbrace (1,0,-1,0)^{\mathsf{T}}\rbrace \subset \ker E$ 内，故 $E[A _ 1, A _ 2] = 0$ 且 $E A _ 1 K = E A _ 2 K = 0$ 。这给出了“算子在全空间严格非交换、但其换位子被伴随余项纤维精准吸收从而保持商读口闭合”的显式矩阵模型。

$$
[A _ 1, A _ 2] = \begin{pmatrix} 0 & 0 & 0 & 1 \cr 0 & 0 & 0 & 0 \cr 0 & 0 & 0 & -1 \cr 0 & 0 & 0 & 0 \end{pmatrix} \neq 0.
$$

**命题 A.44**。在四维第二通道耦合模型中，取观察矩阵 $E$ 与核基 $K$ 。定义

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}, \cr
& K = \begin{pmatrix} 0 & 0 \cr 1 & 0 \cr 0 & 1 \cr -1 & 0 \end{pmatrix}.
\end{aligned}
$$

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & -1 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix}
1 & 0 & 0 & 0 \cr
0 & \frac{3}{2} & 0 & -\frac{1}{2} \cr
0 & 0 & 1 & 0 \cr
0 & -\frac{1}{2} & 0 & \frac{3}{2}
\end{pmatrix},
\end{aligned}
$$

则 $[A _ 1, A _ 2] \neq 0$ 、 $E[A _ 1, A _ 2] = 0$ 且 $E A _ 1 K = E A _ 2 K = 0$ 。

**命题 A.45**。在四维双读口 $E$ 下，取带负剪切的位移算子 $A _ 1$ 与缩放算子 $A _ 2 = \operatorname{diag}(1, 1, 3, 2)$ ，则 $[A _ 1, A _ 2]$ 的 $(3,4)$ 元等于 $(-2)\times(2-3) = 2 \neq 0$ 。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \end{pmatrix}, \cr
& A _ 1 = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & -2 \cr 0 & 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.46**。在五维三读口 $E$ 下，将后两维作为非交换旋转—剪切伴随平面，取 $A _ 1$ 与 $A _ 2 = \operatorname{diag}(1, 1, 1, 2, 1)$ ，则 $[A _ 1, A _ 2] \neq 0$ 且三个主读口保持零漂移。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 0 & 0 & 0 \cr 0 & 1 & 0 & 0 & 0 \cr 0 & 0 & 1 & 0 & 0 \end{pmatrix}, \cr
& A _ 1 = \operatorname{diag}\left(I _ 3, \begin{pmatrix} 1 & 1 \cr 0 & 1 \end{pmatrix}\right).
\end{aligned}
$$

**命题 A.47**。在五维双对冲读口 $E$ 下，取同时在第一、第三坐标与第五坐标之间发生非交换耦合的生成元

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}.
$$

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix}
1 & 0 & 0 & 0 & -1 \cr
0 & 1 & 0 & 0 & 0 \cr
0 & 0 & 1 & 0 & 1 \cr
0 & 0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 0 & 1
\end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix}
\frac{3}{2} & 0 & -\frac{1}{2} & 0 & 0 \cr
0 & 1 & 0 & 0 & 0 \cr
-\frac{1}{2} & 0 & \frac{3}{2} & 0 & 0 \cr
0 & 0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 0 & 1
\end{pmatrix},
\end{aligned}
$$

则 $[A _ 1, A _ 2] \neq 0$ 、 $E[A _ 1, A _ 2] = 0$ 且 $E A _ 1 K = E A _ 2 K = 0$ 。

**命题 A.48**。在六维三读口空间 $E = (I _ 3, 0 _ {3\times 3})$ 中，在后三维伴随纤维上取三阶 Jordan 位移块 $A _ 1$ 与互异素数对角块 $A _ 2 = \operatorname{diag}(1, 1, 1, 2, 3, 5)$ ，则 $[A _ 1, A _ 2] \neq 0$ 且 $E A _ 1 K = E A _ 2 K = 0$ 。

$$
A _ 1 = \operatorname{diag}\left(I _ 3, \begin{pmatrix} 1 & 1 & 0 \cr 0 & 1 & 1 \cr 0 & 0 & 1 \end{pmatrix}\right).
$$

#### 6.1.5　A05 族：Weil–Li 显式泛函、有理正定 Gram 矩阵 $LDL^{\mathsf{T}}$ 分解与测试族分离（命题 A.49–A.60）

**命题 A.49**。对三维标准对称三对角有理正定矩阵 $G _ 1$ ，其精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ 1 = \begin{pmatrix} 2 & -1 & 0 \cr -1 & 2 & -1 \cr 0 & -1 & 2 \end{pmatrix} = L _ 1 D _ 1 L _ 1^{\mathsf{T}}, \cr
& L _ 1 = \begin{pmatrix} 1 & 0 & 0 \cr -\frac{1}{2} & 1 & 0 \cr 0 & -\frac{2}{3} & 1 \end{pmatrix}, \cr
& D _ 1 = \operatorname{diag}\left(2, \frac{3}{2}, \frac{4}{3}\right),
\end{aligned}
$$

三个有理枢轴 $(2, 3/2, 4/3)$ 全部严格大于零。

**命题 A.50**。对三维素数对数矩强化有理正定矩阵 $G _ 2$ ，其精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ 2 = \begin{pmatrix} 4 & 2 & 1 \cr 2 & 5 & 2 \cr 1 & 2 & 6 \end{pmatrix} = L _ 2 D _ 2 L _ 2^{\mathsf{T}}, \cr
& L _ 2 = \begin{pmatrix} 1 & 0 & 0 \cr \frac{1}{2} & 1 & 0 \cr \frac{1}{4} & \frac{3}{8} & 1 \end{pmatrix}, \cr
& D _ 2 = \operatorname{diag}\left(4, 4, \frac{83}{16}\right) \succ 0.
\end{aligned}
$$

**命题 A.51**。对带负非对角耦合的三维有理 Gram 矩阵 $G _ 3$ ，其精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ 3 = \begin{pmatrix} 3 & -1 & 1 \cr -1 & 3 & -1 \cr 1 & -1 & 3 \end{pmatrix} = L _ 3 D _ 3 L _ 3^{\mathsf{T}}, \cr
& L _ 3 = \begin{pmatrix} 1 & 0 & 0 \cr -\frac{1}{3} & 1 & 0 \cr \frac{1}{3} & -\frac{1}{4} & 1 \end{pmatrix}, \cr
& D _ 3 = \operatorname{diag}\left(3, \frac{8}{3}, \frac{5}{2}\right) \succ 0.
\end{aligned}
$$

**命题 A.52**。对各向异性有理 Gram 矩阵 $G _ 4$ ，其精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ 4 = \begin{pmatrix} 5 & 1 & 2 \cr 1 & 4 & 1 \cr 2 & 1 & 3 \end{pmatrix} = L _ 4 D _ 4 L _ 4^{\mathsf{T}}, \cr
& L _ 4 = \begin{pmatrix} 1 & 0 & 0 \cr \frac{1}{5} & 1 & 0 \cr \frac{2}{5} & \frac{3}{19} & 1 \end{pmatrix}, \cr
& D _ 4 = \operatorname{diag}\left(5, \frac{19}{5}, \frac{40}{19}\right) \succ 0.
\end{aligned}
$$

**命题 A.53**。对四维对称三对角有理 Gram 矩阵 $G _ 5$ ，其精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ 5 = \begin{pmatrix}
2 & 1 & 0 & 0 \cr
1 & 2 & 1 & 0 \cr
0 & 1 & 2 & 1 \cr
0 & 0 & 1 & 2
\end{pmatrix} = L _ 5 D _ 5 L _ 5^{\mathsf{T}}, \cr
& L _ 5 = \begin{pmatrix}
1 & 0 & 0 & 0 \cr
\frac{1}{2} & 1 & 0 & 0 \cr
0 & \frac{2}{3} & 1 & 0 \cr
0 & 0 & \frac{3}{4} & 1
\end{pmatrix}, \cr
& D _ 5 = \operatorname{diag}\left(2, \frac{3}{2}, \frac{4}{3}, \frac{5}{4}\right) \succ 0.
\end{aligned}
$$

**命题 A.54**。对四维全耦合对称有理 Gram 矩阵 $G _ 6$ ，其精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ 6 = \begin{pmatrix}
4 & -1 & 0 & 1 \cr
-1 & 4 & -1 & 0 \cr
0 & -1 & 4 & -1 \cr
1 & 0 & -1 & 4
\end{pmatrix} = L _ 6 D _ 6 L _ 6^{\mathsf{T}}, \cr
& L _ 6 = \begin{pmatrix}
1 & 0 & 0 & 0 \cr
-\frac{1}{4} & 1 & 0 & 0 \cr
0 & -\frac{4}{15} & 1 & 0 \cr
\frac{1}{4} & \frac{1}{15} & -\frac{14}{55} & 1
\end{pmatrix}, \cr
& D _ 6 = \operatorname{diag}\left(4, \frac{15}{4}, \frac{55}{15}, \frac{192}{55}\right) \succ 0.
\end{aligned}
$$

**命题 A.55**。对定理 V 式 $(4.17)$ 中的三维素数波包有理 Gram 矩阵

$$
G _ {\mathrm{wave}} = \begin{pmatrix} \dfrac{3}{68} & \dfrac{41}{1292} & \dfrac{21}{1564} \cr
\dfrac{41}{1292} & \dfrac{3}{76} & \dfrac{37}{1748} \cr
\dfrac{21}{1564} & \dfrac{37}{1748} & \dfrac{3}{92} \end{pmatrix},
$$

其精确有理 $LDL^{\mathsf{T}}$ 下三角因子与正对角枢轴矩阵分别为：

$$
\begin{aligned}
& L _ {\mathrm{wave}} = \begin{pmatrix}
1 & 0 & 0 \cr
\dfrac{41}{57} & 1 & 0 \cr
\dfrac{7}{23} & \dfrac{9747}{14099} & 1
\end{pmatrix}, \cr
& D _ {\mathrm{wave}} = \operatorname{diag}\left(\frac{3}{68}, \frac{613}{36822}, \frac{6669}{324277}\right) \succ 0.
\end{aligned}
$$

**命题 A.56**。对定理 V 式 $(4.20)$ 中在素数基 $\lbrace 17, 19, 23\rbrace$ 上的三维实字符素数锥有理 Gram 矩阵

$$
G _ {\mathrm{cone}} = \begin{pmatrix}
\dfrac{43192332}{5260455841} & -\dfrac{58118056}{5260455841} & \dfrac{14925724}{5260455841} \cr
-\dfrac{58118056}{5260455841} & \dfrac{100181512}{5260455841} & -\dfrac{42063456}{5260455841} \cr
\dfrac{14925724}{5260455841} & -\dfrac{42063456}{5260455841} & \dfrac{34597924}{5260455841} \end{pmatrix},
$$

其精确有理 $LDL^{\mathsf{T}}$ 分解因子为：

$$
\begin{aligned}
& L _ {\mathrm{cone}} = \begin{pmatrix}
1 & 0 & 0 \cr
-\dfrac{14529514}{10798083} & 1 & 0 \cr
\dfrac{19}{57} & -\dfrac{2299}{1881} & 1
\end{pmatrix}, \cr
& D _ {\mathrm{cone}} = \operatorname{diag}(43192332/5260455841,\ 1672/399929,\ 8/5643) \succ 0.
\end{aligned}
$$

**命题 A.57**。在三维低阶矩观察空间中，若观察矩阵仅测量零阶总和矩与一阶线性权重矩 $M _ {\mathrm{mom}}$ ，则取高阶振荡测试向量 $c = (1, -2, 1)^{\mathsf{T}}$ ，其零阶矩 $1 - 2 + 1 = 0$ 且一阶矩 $19 - 40 + 21 = 0$ ，即 $M _ {\mathrm{mom}} c = (0, 0)^{\mathsf{T}}$ 。这从代数上证明：任何有限维低阶矩读口 $M _ {\mathrm{mom}}$ 都存在非零高阶核向量 $c \in \ker M _ {\mathrm{mom}}$ ，必须引入覆盖高阶差分的完备读口才能消除谱盲核。

$$
M _ {\mathrm{mom}} = \begin{pmatrix} 1 & 1 & 1 \cr 19 & 20 & 21 \end{pmatrix}.
$$

**命题 A.58**。在定理 V 的三维矩模型中，取双矩观察矩阵 $M _ {\mathrm{mom},2}$ 与非零整数系数向量 $c = (34, -57, 23)^{\mathsf{T}}$ ，则

$$
M _ {\mathrm{mom},2} = \begin{pmatrix} 1 & 1 & 1 \cr 57 & 34 & 57 \end{pmatrix}.
$$

$$
\begin{aligned}
& M _ {\mathrm{mom},2} c = \begin{pmatrix}
34 - 57 + 23 \cr
57\times 34 - 34\times 57 + 57\times 23
\end{pmatrix} = \begin{pmatrix}
0 \cr
1311
\end{pmatrix}, \cr
& (1, 1, 1)c = 0,
\end{aligned}
$$

且若观察矩阵仅取对称前两阶矩 $M _ {\mathrm{sym}}$ 在对应核向量 $c' = (23, -34, 11)^{\mathsf{T}}$ 上同样满足 $M _ {\mathrm{sym}} c' = 0$ ，而在命题 A.55 的波包正定矩阵 $G _ {\mathrm{wave}}$ 下则严格有 $c^{\mathsf{T}} G _ {\mathrm{wave}} c = 39 > 0$ 。

$$
M _ {\mathrm{sym}} = \begin{pmatrix} 1 & 1 & 1 \cr 23 & 34 & 57 \end{pmatrix}.
$$

**命题 A.59**。在四维有限测试子空间与离轴高阶频率分离模型中，取前两阶矩读口 $E$ 。在保持前两阶矩的变换 $A _ 1, A _ 2$ 下，高阶正交振荡模式 $\delta = (-1, 1, 1, -1)^{\mathsf{T}}$ 完全位于 $\ker E$ 内（ $E\delta = 0$ ），证明有限维子块上的正定性约束无法自动锁定 $\ker E$ 内的高频离轴分量。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.60**。在五维带可剥离辅助测试模式的 Weil–Li 截断空间中，取观察矩阵 $E$ ，在正交模式归并算子 $A _ 1$ 与第五维零残余剥离算子 $A _ 2 = \operatorname{diag}(1,1,1,1,0)$ 下，商核闭合 $E A _ 1 K = E A _ 2 K = 0$ 严格成立。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}.
$$

#### 6.1.6　P1 族：定理 A₀ 局部有理矩形围道绕数、Rouché 裕量与同商相等传递（命题 A.61–A.80）

**命题 A.61**。在四维绕数与商特征联合状态空间中，取观察矩阵 $E$ 与核基 $K$ 。在商保持转移算子 $A _ 1, A _ 2$ 下，当且仅当绕数读口被纳入守恒不变量 $c _ {\mathrm{inv}} = (1, 1, 1, 1)^{\mathsf{T}}$ 时，同商纤维内不会发生 $W = 0$ 与 $W = 1$ 的分裂。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}, \cr
& K = \begin{pmatrix} 1 & 0 \cr 0 & 1 \cr -1 & 0 \cr 0 & -1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.62**。在五维带局部边界扰动槽位的围道模型中，取观察矩阵 $E$ 。当边界有理扰动严格小于 Rouché 阈值（落在第五维零残余核内）时，扰动剥离算子 $A _ 2 = \operatorname{diag}(1,1,1,1,0)$ 满足 $E A _ 2 K = 0$ ，保证整数绕数 $W(f, B)$ 在小扰动下严格不变。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}.
$$

**命题 A.63**。在定理 A₀ 的有理矩形 $B = [5/8, 7/8] \times [7/8, 9/8]$ （中心 $c = 3/4 + i$ ，半宽 $r = 1/8$ ）上，线性主部 $f _ 1(s) = s - c$ 在边界 $\partial B$ 上的最小模平方为 $(1/8)^2 = 1/64$ ，最大允许有理扰动模平方为 $(1/16)^2 = 1/256$ 。其二阶对角裕量矩阵与精确有理平方差为：

$$
\begin{aligned}
& D _ {\mathrm{Rouche}} = \operatorname{diag}\left(\frac{1}{64}, \frac{3}{256}\right) \succ 0, \cr
& \Delta _ {\mathrm{Rouche}} = \left(\frac{1}{8}\right)^2 - \left(\frac{1}{16}\right)^2 = \frac{3}{256} > 0.
\end{aligned}
$$

**命题 A.64**。当有理矩形半宽取为 $r = \frac{1}{6}$ 、边界一致扰动上界取为 $\varepsilon = \frac{1}{12}$ 时，边界主部模平方下界为 $(1/6)^2 = 1/36$ ，扰动模平方上界为 $(1/12)^2 = 1/144$ ，对应的精确有理 Rouché 裕量为：

$$
\begin{aligned}
\Delta _ {\mathrm{Rouche},1/6} &= \left(\frac{1}{6}\right)^2 - \left(\frac{1}{12}\right)^2 \cr
&= \frac{1}{36} - \frac{1}{144} = \frac{1}{48} > 0.
\end{aligned}
$$

**命题 A.65**。在四维围道四边分段积分累加模型中，取顶边、底边、左边、右边四段有理积分对偶空间，观察矩阵 $E$ 。在水平边与垂直边对称分段归并算子 $A _ 1, A _ 2$ 下，四段闭合围道总积分 $c _ {\mathrm{inv}} = (1, 1, 1, 1)^{\mathsf{T}}$ 严格守恒（ $A _ i^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ ）。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.66**。在四维围道边界含角点非交换折转的积分模型中，取角点折转算子 $A _ 1$ 与边内重参数化算子 $A _ 2$ 。虽然折转与重参数化不可交换（ $[A _ 1, A _ 2] \neq 0$ ），但由于角点折转封闭在零和余项核 $\ker E$ 内，故闭合围道总绕数满足 $E[A _ 1, A _ 2] = 0$ 与 $E A _ i K = 0$ 。

$$
\begin{aligned}
& A _ 1 = \begin{pmatrix} 1 & 0 & 0 & -1 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \cr 0 & 0 & 0 & 1 \end{pmatrix}, \cr
& A _ 2 = \begin{pmatrix} \frac{3}{2} & 0 & -\frac{1}{2} & 0 \cr
0 & 1 & 0 & 0 \cr
-\frac{1}{2} & 0 & \frac{3}{2} & 0 \cr
0 & 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.67**。在三维（商前件值 $C(q(x))$ 、目标排零值 $Z(x)$ 、局部绕数值 $W(x)$ ）状态模型中，取双读口矩阵 $E$ ，将局部绕数 $W(x)$ 作为第二行独立显式读口锁定，则盲核仅一维 $K = (1, -1, 0)^{\mathsf{T}}$ ，彻底阻断了在不改变读口的情况下将 $W = 0$ 混淆为 $W = 1$ 的可能。

$$
E = \begin{pmatrix} 1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.68**。在三维（实部偏移 $\sigma - 3/4$ 、虚部偏移 $t - 1$ 、绕数读数 $W$ ）局部坐标空间中，通过可逆观测矩阵 $M$ 与左逆 $L$ ， $L M = I _ 3$ 唯一恢复离轴零点的局部实虚部坐标与绕数 $W = 1$ 。

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 1 & 0 \cr -1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& L = \begin{pmatrix} \frac{1}{2} & -\frac{1}{2} & 0 \cr \frac{1}{2} & \frac{1}{2} & 0 \cr 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.69**。在三维有理矩形四顶点联合采样与中心恢复模型中，取观测矩阵 $M$ 及其精确整数逆矩阵

$$
M = \begin{pmatrix} 1 & 1 & 1 \cr 1 & 2 & 2 \cr 1 & 2 & 3 \end{pmatrix}.
$$

$$
L = M^{-1} = \begin{pmatrix} 2 & -1 & 0 \cr -1 & 2 & -1 \cr 0 & -1 & 1 \end{pmatrix}, \qquad L M = I _ 3,
$$

由有理网格采样点唯一整数恢复中心值、一阶差分与二阶曲率。

**命题 A.70**。在二维（全局排零断言 $W = 0$ 、局部 Rouché 认证 $W = 1$ ）对撞核验空间中，取总和读口 $E = (1, 1)$ 与对冲核 $K = (1, -1)^{\mathsf{T}}$ 。任何保持守恒和的传递算子 $A$ 均将两端的差异集中到同一目标槽位，使得 $0$ 与 $1$ 的不一致在终点必然暴露。

$$
A = \begin{pmatrix} 0 & 0 \cr 1 & 1 \end{pmatrix}.
$$

**命题 A.71**。在四维双矩形并集 $B = B _ 1 \cup B _ 2$ （共享一条内部公共有理边）的围道积分模型中，取双框绕数读口 $E$ 。由于公共内部边在两个子框正向围道中方向相反、积分严格抵消，对应的内部边对冲向量 $\delta = (-1, 1, -1, 1)^{\mathsf{T}}$ 满足 $E\delta = 0$ ，保证绕数的有限可加性 $W(f, B _ 1 \cup B _ 2) = W(f, B _ 1) + W(f, B _ 2)$ 。

$$
E = \begin{pmatrix} 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
$$

**命题 A.72**。在定理 A₀ 的一般有理半宽 $r = \frac{1}{2k}$ 与边界扰动 $\varepsilon = \frac{1}{4k}$ 族中，取 $k = 4$ （ $r = 1/8, \varepsilon = 1/16$ ）与 $k = 5$ （ $r = 1/10, \varepsilon = 1/20$ ）联合构成的 $3\times 3$ 裕量正定矩阵，其精确 $LDL^{\mathsf{T}}$ 枢轴为 $\operatorname{diag}(3/256, 3/400, 1) \succ 0$ 。

**命题 A.73**。在定理 0（商下降充要条件 $\operatorname{Eq}(q) \subseteq \operatorname{Eq}(Z)$ ）的四维验证模型中，当且仅当目标谓词矩阵的核包含观察矩阵 $E$ 的核 $K$ 时，沿同商纤维相等证明 $h _ q : q(x _ 0) = q(x _ 1)$ 的替换操作满足 $E A _ i K = 0$ 。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.74**。在四维带边界距离保护裕量的围道模型中，取有理半步收缩算子 $A _ 1, A _ 2$ ，在每次将矩形向离轴零点 $c = 3/4 + i$ 同心二分收缩时，只要零点不落在新增分割线上，商核闭合条件 $E A _ 1 K = E A _ 2 K = 0$ 与框内总零点重数恒保持不变。

**命题 A.75**。在五维带完备全纯资格位（第五坐标标记框内无极点且边界无零点）的围道空间中，取三行满秩观察矩阵 $E$ 。由于全纯资格位被第三行直接锁定在盲核之外，任何合法围道变形 $A _ 1, A _ 2$ 均不能在不触发第三行警报的前提下越过极点或边界零点。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.76**。在三维围道局部泰勒主部 $f(s) = a _ 0 + a _ 1(s-c) + a _ 2(s-c)^2$ 的三点穿孔采样模型中，观测矩阵 $M$ 与精确整数左逆矩阵 $L$ 满足 $L M = I _ 3$ 。当 $a _ 0 = 0, a _ 1 = 1$ 时，唯一锁定 $c$ 为一阶简单零点。

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 0 & 0 \cr 1 & 1 & 0 \cr 1 & 1 & 1 \end{pmatrix}, \cr
& L = \begin{pmatrix} 1 & 0 & 0 \cr -1 & 1 & 0 \cr 0 & -1 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.77**。在四维复实部与虚部分离的 Cauchy–Riemann 围道积分矩阵中，取实虚部对称观测矩阵 $M$ 与精确有理左逆 $L = \frac{1}{2}M^{\mathsf{T}}$ ，严格满足 $L M = I _ 4$ 。

$$
M = \begin{pmatrix} 1 & 1 & 0 & 0 \cr -1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \cr 0 & 0 & -1 & 1 \end{pmatrix}.
$$

**命题 A.78**。在五维双矩形分割与角点非交换修正联合模型中，观察矩阵 $E$ 与耦合生成元 $A _ 1, A _ 2$ 满足 $[A _ 1, A _ 2] \neq 0$ 、 $E[A _ 1, A _ 2] = 0$ 及 $E A _ i K = 0$ 。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \end{pmatrix}.
$$

**命题 A.79**。在三维 Rouché 边界三段弧最小模下界联合正定证书中，对角耦合正定矩阵 $G$ 的精确有理 $LDL^{\mathsf{T}}$ 分解枢轴为 $D = \operatorname{diag}(2, 3/2, 1) \succ 0$ 。

$$
G = \begin{pmatrix} 2 & -1 & 0 \cr -1 & 2 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.80**。在六维三框联立围道细分模型中，观察矩阵 $E$ 与细分转移算子 $A _ 1, A _ 2$ 满足 $E A _ 1 K = E A _ 2 K = 0$ 及三框绕数总和守恒。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 & 0 \cr 0 & 0 & 0 & 0 & 1 & 0 \end{pmatrix}.
$$

#### 6.1.7　P2 族：定理 B₀–B₃ 素数对数有理独立性与广义素数有限视界换尾（命题 A.81–A.100）

**命题 A.81**。在三维前三个素数 $\lbrace 2, 3, 5\rbrace$ 的指数向量空间 $\mathbb{Q}^3$ 中，唯一分解定理赋予每个素数坐标独立的标准基。取标准单射观测矩阵 $M = I _ 3$ 与左逆 $L = I _ 3$ ，则 $L M = I _ 3$ ，证实若 $\sum _ {j=1}^3 r _ j \log p _ j = 0$ （ $r _ j \in \mathbb{Q}$ ），则指数坐标映射唯一恢复 $(r _ 1, r _ 2, r _ 3) = (0, 0, 0)$ （定理 B₁）。

**命题 A.82**。在三维素数乘积复合基底 $\lbrace 2, 2\times 3 = 6, 2\times 3\times 5 = 30\rbrace$ 的对数坐标变换中，基底变换矩阵 $M$ 与精确整数逆矩阵 $L$ 分别为

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 0 & 0 \cr 1 & 1 & 0 \cr 1 & 1 & 1 \end{pmatrix}, \cr
& L = M^{-1} = \begin{pmatrix} 1 & 0 & 0 \cr -1 & 1 & 0 \cr 0 & -1 & 1 \end{pmatrix}, \qquad L M = I _ 3,
\end{aligned}
$$

由 $(\log 2, \log 6, \log 30)^{\mathsf{T}}$ 唯一无损恢复独立素数对数 $(\log 2, \log 3, \log 5)^{\mathsf{T}}$ 。

**命题 A.83**。在四维前四个素数 $\lbrace 2, 3, 5, 7\rbrace$ 的累积乘积（素数阶乘 $2, 6, 30, 210$ ）对数基底中，下三角全 $1$ 观测矩阵 $M _ 4$ 与精确一阶差分左逆矩阵 $L _ 4 = M _ 4^{-1}$ 满足 $L _ 4 M _ 4 = I _ 4$ ，证明任意有限长度的普通素数对数族在 $\mathbb{Q}$ 上满秩线性独立。

**命题 A.84**。在四维（有限视界 $(1, P _ {\ast}]$ 内素数主部、经典零点自由区宽度、素数定理余项阶、视界外 $p > P _ {\ast}$ 的高阶广义素数尾项）状态空间中，若观察矩阵仅读取前两类有限视界商特征 $E$ ，则定理 B₂ 的有限换尾手术（删去 $D = B \cap (1, P _ {\ast}]$ 并补入真素数 $A = \mathcal{P} \cap (1, P _ {\ast}]$ ）恰好对应于 $\ker E$ 内的零漂移换尾向量 $\delta = (-1, 0, 1, 0)^{\mathsf{T}}$ （ $E\delta = 0$ ），从而换尾后的 $\widetilde{\zeta} _ B$ 在静态商 $E$ 下与真算术前缀完全同纤维。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.85**。在定理 B₂ 的有理 Euler 修饰因子 $H _ {P _ {\ast}}(s) = \prod _ {b \in D}(1 - b^{-s}) / \prod _ {p \in A}(1 - p^{-s})$ 中，对任意 $p \ge 2$ 及实点 $\sigma \in \lbrace 1/2, 3/4, 1\rbrace \subset \lbrace \operatorname{Re}(s) > 0\rbrace$ ，局部因子 $1 - p^{-\sigma}$ 严格大于零。特别地，在有理测试点 $p^{-s} \in \lbrace 1/2, 1/4, 1/8\rbrace$ 处，局部因子构成的 $3\times 3$ 对角正定矩阵

$$
D _ {\mathrm{Euler}} = \operatorname{diag}(1 - 1/2,\ 1 - 1/4,\ 1 - 1/8) = \operatorname{diag}(1/2, 3/4, 7/8) \succ 0
$$

其对角元全部严格为正，绝无零点与极点。

**命题 A.86**。在定理 B₂ 的有限换尾手术中，设被删有限集 $|D| = m _ 1$ 、被添有限集 $|A| = m _ 2$ 。在五维计数函数差空间中，有限增删对 $\pi _ B(x)$ 的有界偏移 $O(1)$ 与对 $\psi _ B(x)$ 的对数偏移 $O(\log x)$ 相对于次指数余项 $x\exp(-c _ 1\sqrt{\log x})$ 落在渐近等价核 $\ker E$ 内，剥离算子 $A _ 2 = \operatorname{diag}(1,1,1,1,0)$ 严格满足 $E A _ 2 K = 0$ 。

**命题 A.87**。在四维窗口递推 $P _ {\ast} \to P _ {\ast}'$ （将有限素数视界从 $P _ {\ast}$ 扩大到 $P _ {\ast}'$ ）的换尾模型中，两次连续换尾算子 $A _ 1, A _ 2$ 满足复合闭合 $E A _ 1 K = E A _ 2 K = 0$ ，证实对于**任意大**的有限素数阈值 $P _ {\ast}$ ，换尾反模型 $\widetilde{\zeta} _ B$ 均在 $(1, P _ {\ast}]$ 上与真素数全同且完整保留 $\frac{1}{2} < \theta < \operatorname{Re}(s) < 1$ 内的全部无穷离轴零点。

**命题 A.88**。在四维（有限素数筛算子 $A _ {\mathrm{sieve}}$ 与渐近余项推进算子 $A _ {\mathrm{asymp}}$ ）耦合模型中，两算子的非交换换位子 $[A _ {\mathrm{sieve}}, A _ {\mathrm{asymp}}] \neq 0$ 严格落在视界外尾项核 $\ker E$ 内（ $E[A _ {\mathrm{sieve}}, A _ {\mathrm{asymp}}] = 0$ ），说明仅靠渐近余项量级无法反推出视界外素数的精确代数相位。

**命题 A.89**。在三维素数对数加权观测矩阵 $M$ 与精确有理左逆矩阵 $L$ 下，严格有 $L M = I _ 3$ 。

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 2 & 0 \cr 0 & 1 & 2 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& L = \begin{pmatrix} 1 & -2 & 4 \cr 0 & 1 & -2 \cr 0 & 0 & 1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.90**。在素数基 $\lbrace 17, 19, 23\rbrace$ 的有理对数近似正定核验中，三阶对称有理矩阵 $G$ 的精确有理 $LDL^{\mathsf{T}}$ 分解枢轴为 $D = \operatorname{diag}(3, 8/3, 21/8) \succ 0$ 。

$$
G = \begin{pmatrix} 3 & 1 & 0 \cr 1 & 3 & 1 \cr 0 & 1 & 3 \end{pmatrix}.
$$

**命题 A.91**。在三维有限素数视界 $(1, P _ {\ast}]$ 观察空间中，若观察矩阵仅测量前两阶对称和 $M$ ，则非零尾项扰动向量 $c = (1, -2, 1)^{\mathsf{T}}$ 满足 $M c = (0, 0)^{\mathsf{T}}$ ，证明有限阶对称和读口存在非平凡盲核。

$$
M = \begin{pmatrix} 1 & 1 & 1 \cr 2 & 3 & 4 \end{pmatrix}.
$$

**命题 A.92**。在定理 B₀（语法有限性与语义全称归纳严格分型）的四维表示空间中，将全称量词绑定变量置入受保护的主读口行，将源码字面常量计数置入盲核行，则归纳步算子 $A _ 1, A _ 2$ 严格保持全称语义读口守恒（ $E A _ i K = 0$ ）。

**命题 A.93**。在五维带显式唯一分解指数读口的算术空间中，满行秩观察矩阵 $E$ 将唯一分解刚性位（第五维）锁定在盲核之外，此时任何破坏素数对数独立性的 Beurling 连续变形都会在第三行产生非零读数而被直接识别与阻断。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 \cr 0 & 0 & 0 & 0 & 1 \end{pmatrix}.
$$

**命题 A.94**。在四维双素数窗口 $\lbrace 2, 3\rbrace$ 与 $\lbrace 5, 7\rbrace$ 的块对角归并模型中，观察矩阵 $E$ 与有理半步算子 $A _ 1, A _ 2$ 满足 $E A _ 1 K = E A _ 2 K = 0$ 。

$$
E = \begin{pmatrix} 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
$$

**命题 A.95**。在四维有限 Euler 乘积取对数展开 $-\sum _ {p \le P _ {\ast}} \log(1 - p^{-s}) = \sum _ {p \le P _ {\ast}} \sum _ {m \ge 1} \frac{1}{m} p^{-ms}$ 的一阶素数项与高阶素数幂项（ $m \ge 2$ ）分解中，在 $\operatorname{Re}(s) > 1/2$ 上高阶素数幂级数 $\sum _ p \sum _ {m \ge 2} \frac{1}{m} p^{-ms}$ 绝对收敛且全纯，其与主部的分离算子满足 $E A _ i K = 0$ 。

**命题 A.96**。在三维 Chebyshev 阶梯函数 $\psi(x) = \sum _ {p^m \le x} \log p$ 的有限跳跃恢复模型中，三点差分观测矩阵 $M$ 与精确有理逆矩阵 $L$ （对非奇异修正 $M'$ 有 $L'$ ）满足 $L' M' = I _ 3$ 。

$$
\begin{aligned}
& M = \begin{pmatrix} 2 & 1 & 0 \cr 1 & 1 & 1 \cr 0 & 1 & 2 \end{pmatrix}, \cr
& L = \frac{1}{2}\begin{pmatrix} 1 & -2 & 1 \cr -2 & 4 & -2 \cr 1 & -2 & 1 \end{pmatrix} + \dots, \cr
& M' = \begin{pmatrix} 2 & 1 & 0 \cr 1 & 2 & 1 \cr 0 & 1 & 2 \end{pmatrix}, \cr
& L' = \frac{1}{4}\begin{pmatrix} 3 & -2 & 1 \cr -2 & 4 & -2 \cr 1 & -2 & 3 \end{pmatrix}.
\end{aligned}
$$

**命题 A.97**。在五维有限换尾因子分子 $\prod _ {b \in D}(1-b^{-s})$ 与分母 $\prod _ {p \in A}(1-p^{-s})$ 的对数导数差空间中，由于两有限集在 $\operatorname{Re}(s) > 0$ 上均无零点，其对数导数差在临界带 $\theta < \operatorname{Re}(s) < 1$ 内处处全纯，在任何有理矩形围道 $B \subset \lbrace \theta < \operatorname{Re}(s) < 1\rbrace$ 上的绕数贡献恒为 $0$ （落在围道读口核 $\ker E$ 内， $E A _ i K = 0$ ）。

**命题 A.98**。在三维广义素数密度余项 $|N _ B(x) - \kappa _ B x| \le C _ 1 x^\theta$ （ $1/2 < \theta < 1$ ）的有理指数分层中，取 $\theta = 3/4 \in (1/2, 1)$ ，则延拓半平面边界 $\operatorname{Re}(s) > 3/4$ 与临界线 $\operatorname{Re}(s) = 1/2$ 之间的有理间隙为 $3/4 - 1/2 = 1/4 > 0$ ，对应的正定对角裕量矩阵 $\operatorname{diag}(1/4, 3/4, 1) \succ 0$ 。

**命题 A.99**。在四维 Beurling 离轴零点序列 $\rho _ n = 1 - \frac{a}{\log t _ n} + i t _ n$ 的渐近轨迹投影中，当仅观察经典零点自由区边界 $\sigma > 1 - a/\log t$ 时，位于边界曲线上的零点序列与无零点模型在自由区内部读口下同纤维（ $E A _ i K = 0$ ）。

**命题 A.100**。在六维带全阶素数唯一分解耦合锁的加强空间中，观察矩阵 $E$ 配合完整算术转移算子 $A _ 1, A _ 2$ 满足 $E A _ 1 K = E A _ 2 K = 0$ ，给出了阻断广义素数换尾伪影的最小有型状态维度。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 1 & 0 & 0 \cr 0 & 0 & 0 & 0 & 1 & 0 \end{pmatrix}.
$$

#### 6.1.8　P3 族：定理 C₀–C₃ 系数唯一恢复、奇偶通道离轴反模型与提取三难定理 1.4（命题 A.101–A.120）

**命题 A.101**。在定理 C₀（右半平面 $\sigma \to +\infty$ 唯一恢复 Dirichlet 系数）的三阶截断模型 $f(\sigma) = a _ 1 + a _ 2 2^{-\sigma} + a _ 3 3^{-\sigma}$ 中，在三个有理采样点处构成的 Vandermonde 型有理观测矩阵 $M$ 可逆，或等价地在缩放整数基下

$$
M = \begin{pmatrix} 1 & 1 & 1 \cr 1 & 1/2 & 1/3 \cr 1 & 1/4 & 1/9 \end{pmatrix}.
$$

$$
\begin{aligned}
& M _ {\mathrm{coef}} = \begin{pmatrix} 1 & 1 & 1 \cr 0 & 1 & 2 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& L _ {\mathrm{coef}} = M _ {\mathrm{coef}}^{-1} = \begin{pmatrix} 1 & -1 & 1 \cr 0 & 1 & -2 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& L _ {\mathrm{coef}} M _ {\mathrm{coef}} = I _ 3,
\end{aligned}
$$

唯一无损恢复全部系数 $(a _ 1, a _ 2, a _ 3)^{\mathsf{T}}$ 。

**命题 A.102**。在定理 C₁ 的模 $5$ Davenport–Heilbronn 周期系数 $a _ n(\kappa)$ （在余类 $1, 2, 3, 4, 0 \pmod 5$ 上依次取 $1, \kappa, -\kappa, -1, 0$ ）中，取任意有理测试值（如 $\kappa = 1$ 或 $\kappa = 1/2$ ），在首个复合数 $n = 6 = 2 \times 3$ 处的乘性破缺残差为 $\Delta _ {\mathrm{mult}}(2,3) = a _ 6 - a _ 2 a _ 3 = 1 - (\kappa)(-\kappa) = 1 + \kappa^2$ 。在三维（ $a _ 2, a _ 3, a _ 6 - a _ 2 a _ 3$ ）正定核验中，有理对角矩阵 $\operatorname{diag}(1, \kappa^2, 1 + \kappa^2)$ 在 $\kappa = 1$ 时为 $\operatorname{diag}(1, 1, 2) \succ 0$ ，在 $\kappa = 1/2$ 时为 $\operatorname{diag}(1, 1/4, 5/4) \succ 0$ ，对一切实数 $\kappa$ 恒严格大于零。

**命题 A.103**。在定理 C₁ 的奇通道完备化函数方程中，根数因子 $\epsilon = \frac{1 + i\kappa}{1 - i\kappa}$ 的模平方等于 $\frac{1+\kappa^2}{1+\kappa^2} = 1$ 。在二维实虚部正交表示中，旋转反射算子保持范数二次型 $I _ 2 = L D L^{\mathsf{T}}$ （ $D = \operatorname{diag}(1, 1) \succ 0$ ）严格不变，而乘性残差坐标则完全落入弱解析延拓商（仅检查整函数延拓与对称函数方程）的盲核 $\ker E$ 内。

**命题 A.104**。在定理 C₂ 的偶通道显式互反多项式 $P _ r(y) = 1 - (r + r^{-1})y + y^2 = (1 - ry)(1 - y/r)$ 中，在有理代数模型 $r = 2, y = 1/2$ （对应解析模型 $r = 2^{1/4}, s = 3/4, y(3/4) = 2^{-1/4} = r^{-1}$ ）处，三项系数组合 $(1,\ -(2 + 1/2),\ 1)$ 作用于幂向量 $(1,\ 1/2,\ 1/4)^{\mathsf{T}}$ 严格归零：

$$
1 - \frac{5}{2}\cdot\frac{1}{2} + \frac{1}{4} = 1 - \frac{5}{4} + \frac{1}{4} = 0,
$$

即幂向量 $(4, 2, 1)^{\mathsf{T}}$ 严格位于偶通道因子行向量 $M _ {\mathrm{even}}$ 的零空间 $\ker M _ {\mathrm{even}}$ 内（ $M _ {\mathrm{even}}(4, 2, 1)^{\mathsf{T}} = (0, 0)^{\mathsf{T}}$ ）。

$$
M _ {\mathrm{even}} = \begin{pmatrix} 1 & -5/2 & 1 \cr 0 & 1 & -2 \end{pmatrix}.
$$

**命题 A.105**。在定理 C₂ 的偶通道对称反射 $s \leftrightarrow 1 - s$ （即 $y \leftrightarrow y^{-1}$ ）下，规范化对称因子 $Q _ r(y) := y^{-1} P _ r(y) = y + y^{-1} - (r + r^{-1})$ 对 $y \leftrightarrow y^{-1}$ 严格不变。在四维（偶函数方程对称位、 $s=1$ 极点位、 $s=3/4$ 互反根位、乘性检验位）状态空间中，仅检查前两位的弱解析商 $E$ 将互反根变形完全容纳于 $\ker E$ 内（ $E A _ i K = 0$ ）。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.106**。在推论 C₃ 与方案五的代数特洛伊多项式 $P _ {\mathrm{Trojan}}(s) = (s - 3/4)(s - 1/4) = s^2 - s + 3/16 = (s - 1/2)^2 - 1/16$ 中，在中心偏移坐标 $u = s - 1/2$ 下，奇次项系数严格为 $0$ （故满足精确反射对称 $P _ {\mathrm{Trojan}}(1-s) = P _ {\mathrm{Trojan}}(s)$ ），而在 $u = 1/4$ （即 $s = 3/4$ ）处， $u^2 - 1/16 = (1/4)^2 - 1/16 = 0$ 。在三维多项式系数恢复矩阵 $M$ 及其精确有理逆 $L = M^{-1}$ 下， $L M = I _ 3$ 。

$$
M = \begin{pmatrix} 1 & 0 & 0 \cr -1 & 1 & 0 \cr 3/16 & -1/2 & 1 \end{pmatrix}.
$$

**命题 A.107**。在定理 1.4（有向证明图提取三难定理）的三维布尔指示空间 $(a, d, k) \in \lbrace 0, 1\rbrace ^3$ 中，对全部 $7$ 种合法非空缺陷组合 $(1,0,0), (0,1,0), (0,0,1), (1,1,0), (1,0,1), (0,1,1), (1,1,1)$ ，容斥多项式 $u(a,d,k) = 1 - (1-a)(1-d)(1-k)$ 恒等于 $1$ ；而唯一使 $u = 0$ 的点 $(0,0,0)$ 在存在同商反模型 $x _ 1$ 时被拓扑归纳证伪。在四维提取锥状态空间中，任何未改变弱商观察矩阵 $E$ 的子图裁剪或同名证明体改写算子 $A _ {\mathrm{crop}}, A _ {\mathrm{rewrite}}$ 均满足 $E A _ {\mathrm{crop}} K = E A _ {\mathrm{rewrite}} K = 0$ ，即盲核 $\ker E$ 在提取前后严格守恒。

**命题 A.108**。在第五章 lc23 实机实测的源码删除对账方程中，被删 $10,724$ 个模块的原始行数 $L _ {\mathrm{del}} = 785,224$ 、被修改 $23$ 个模块的净减少行数 $\Delta L _ {\mathrm{mod}} = 17,676$ 与新增模块 Challenge.lean 的行数 $L _ {\mathrm{add}} = 27$ 满足精确线性守恒：

$$
\begin{aligned}
\Delta L _ {\mathrm{net}} &= L _ {\mathrm{del}} + \Delta L _ {\mathrm{mod}} - L _ {\mathrm{add}} = 785,224 + 17,676 - 27 \cr
&= 802,873 = 17,374,215 - 16,571,342.
\end{aligned}
$$

在三维对账观测矩阵 $M$ 与精确整数左逆 $L$ 下，严格满足 $L M = I _ 3$ 。

$$
\begin{aligned}
& M = \begin{pmatrix} 1 & 0 & 0 \cr 1 & 1 & 0 \cr 1 & 1 & -1 \end{pmatrix}, \cr
& L = \begin{pmatrix} 1 & 0 & 0 \cr -1 & 1 & 0 \cr 0 & 1 & -1 \end{pmatrix}.
\end{aligned}
$$

**命题 A.109**。在第五章 lc23 实机实测的全环境声明图规模分解中，五大主定理联合依赖锥节点数 $|V _ {\mathrm{cone}}| = 1,478,243$ 与锥外不可达节点数 $|V _ {\mathrm{out}}| = 1,222,889$ 满足精确分区守恒：

$$
|V| = |V _ {\mathrm{cone}}| + |V _ {\mathrm{out}}| = 1,478,243 + 1,222,889 = 2,701,132,
$$

且在锥外节点集 $V _ {\mathrm{out}}$ 上的任何裁剪算子 $A _ {\mathrm{out}} = \operatorname{diag}(I _ {\mathrm{cone}}, 0 _ {\mathrm{out}})$ 对锥内依赖观察矩阵 $E = (I _ {\mathrm{cone}}, 0)$ 恒满足 $E A _ {\mathrm{out}} K = 0$ （定理 1.4 第一边界：锥外不可达声明删除不改变锥内任何性质）。

**命题 A.110**。在方案四的拆点最大流与最小内部有向顶点割对偶中，从 $5$ 个乘性／Euler 乘积源节点到 $5$ 个主定理汇节点的 $8$ 条顶点不相交有向增广路与 $8$ 个最小割瓶颈顶点（ DirichletCharacter.FactorsThrough 、 Formalism.VW.critLine 、 Formalism.VW.rh\_of\_every 、 HurwitzZeta.hurwitzZetaEven 、 UpperTheory.FinalTheorems.everyCharacter 、 ZMod.LFunction 、 claimAll 、 starRingEnd.\_proof\_2 ）满足强最大流最小割对偶等式 $|f _ {\max}| = 8 = |C _ {\min}|$ 。在八通道单位容量流守恒模型中，入流与出流观测矩阵满足 $E A _ {\mathrm{flow}} K = 0$ 。

**命题 A.111**。在方案一（探针 1C）与定理 III-A 的非本原特征虚轴零点模型中，模 $N = 2$ 主特征在 $s _ 1 = \frac{2\pi i}{\log 2}$ 处的局部 Euler 因子满足 $1 - 2^{-s _ 1} = 1 - e^{-2\pi i} = 1 - 1 = 0$ ，且 $\operatorname{Re}(s _ 1) = 0 \neq 1/2$ 。在三维（左边界守卫 $0 < \operatorname{Re}(s)$ 、本原守卫 $\operatorname{IsPrimitive}(\chi)$ 、虚轴 Euler 因子值）状态空间中，保持左边界守卫的观察矩阵 $E$ 将虚轴零点合法隔离在开临界带定义域之外（ $E A _ i K = 0$ ）。

$$
E = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 1 & 0 \end{pmatrix}.
$$

**命题 A.112**。在方案六与式 $(4.11)$ 的模 $N = 4$ 非本原主特征 $\chi _ {0,4}$ Gauss 和模型中，四余类求和向量 $c _ {\mathrm{Gauss}} = (0, 1, 0, -1)^{\mathsf{T}}$ （对应 $\chi _ {0,4}(a) i^a$ 在 $a = 0, 1, 2, 3$ 处的虚部系数 $0, 1, 0, -1$ 与实部 $0, 0, 0, 0$ ）在总和与二阶周期观察矩阵 $M$ 下严格满足 $M c _ {\mathrm{Gauss}} = (0, 0)^{\mathsf{T}}$ ，证明 $\tau(\chi _ {0,4}) = 0 \neq \sqrt{4} = 2$ 。

$$
M = \begin{pmatrix} 1 & 1 & 1 & 1 \cr 1 & 0 & 1 & 0 \end{pmatrix}.
$$

**命题 A.113**。在方案六的依值模环 $\operatorname{ZMod}(0) \cong \mathbb{Z}$ 模零排除模型中，守卫 $\operatorname{NeZero}(N)$ 在 $N = 0$ 处为空类型 $\neg\operatorname{Nonempty}(\operatorname{NeZero}(0))$ 。在四维带模零隔离位的状态空间中，将 $N = 0$ 分支投影归零的守卫算子 $A _ {\mathrm{neZero}} = \operatorname{diag}(1, 1, 1, 0)$ 严格满足 $E A _ {\mathrm{neZero}} K = 0$ 。

**命题 A.114**。在第五章 kexactB 元编程策略的前端—内核双层验证模型中，设前端阐述器类型核对映射为 $E _ {\mathrm{elab}}$ ，底层内核声明类型核对映射为 $E _ {\mathrm{kernel}}$ 。标准 exact 策略同时通过双层读口 $(E _ {\mathrm{elab}}, E _ {\mathrm{kernel}})^{\mathsf{T}}$ ，而 kexactB 将前端期望类型置为 none （在前端读口上产生非零盲核 $K _ {\mathrm{elab}}$ ），仅依赖第二行 $E _ {\mathrm{kernel}}$ 拦截类型不匹配（如 KexactNegativeControl 在内核层报 declaration type mismatch ）。

**命题 A.115**。在第五章 $66$ 个 kexactB 调用模块的依赖锥分布中，入锥调用模块数 $62$ 与锥外调用模块数 $4$ 满足 $62 + 4 = 66$ ，加上 $1$ 个策略定义模块 Imports.lean 共 $67$ 个模块。在二维入锥／出锥分区观测矩阵 $M$ 与左逆 $L$ 下， $L M = I _ 2$ 。

$$
M = \begin{pmatrix} 1 & 1 \cr 0 & 1 \end{pmatrix} \qquad L = \begin{pmatrix} 1 & -1 \cr 0 & 1 \end{pmatrix}.
$$

**命题 A.116**。在第五章 $10$ 个被改写证明体的 CapelliIdentities 模块（全部位于五大主定理依赖锥内）中，同名节点的声明类型 $\tau(v)$ 保持不变而证明体 $b _ {\mathrm{orig}}(v) \mapsto b _ {\mathrm{ext}}(v)$ 被替换。在四维（声明名、类型签名、旧证明体、新证明体差）空间中，仅读取声明名与类型签名的接口观察矩阵 $E$ 下，证明体替换恰为 $\ker E$ 内的同纤维移位 $\delta = (-1, 0, 1, 0)^{\mathsf{T}}$ （对应定理 1.4 的替换边界 $\partial E _ {\mathrm{ext}}$ ）。

$$
E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}.
$$

**命题 A.117**。在方案四的 $20$ 步字典序二分断路过程中，区间长度从 $L _ 0 = 1,072,972$ 经 $20$ 次折半 $L _ {k} = \lfloor L _ {k-1}/2 \rfloor$ 收敛至 $L _ {20} = 1$ （锁定 $k^{\ast} = 955,506$ ），步数严格满足 $20 = \lceil \log _ 2(1,072,972) \rceil < 25$ 。在三阶对数缩放正定核验中，裕量矩阵 $\operatorname{diag}(25 - 20, 8, 1) = \operatorname{diag}(5, 8, 1) \succ 0$ 。

**命题 A.118**。在式 $(5.17)$ 的建设性保真状态对 $(\mathcal{Z} _ {P,X}, \delta _ {P,X})$ 中，当素数窗口与求和窗口同时作非交换两步推进 $(P, X) \to (P', X) \to (P', X')$ 与 $(P, X) \to (P, X') \to (P', X')$ 时，虽然中间主部与余项轨迹存在非交换换位子 $[A _ P, A _ X] \neq 0$ ，但全阶乘积守恒量读口 $E$ 满足 $E[A _ P, A _ X] = 0$ 与 $E A _ P K = E A _ X K = 0$ ，确保两条路径在终点合流于同一全阶算术对象。

**命题 A.119**。在建设性保真规范的四特征实正定锥联合状态（主特征、 $\chi _ 1$ 、 $\chi _ 2$ 、 $\chi _ 1\chi _ 2$ ）与双穿孔极点留数恢复的六维耦合空间中，块可逆观测矩阵 $M _ 6 = \operatorname{diag}(M _ {\mathrm{punct}}, M _ {\mathrm{coef}})$ 与精确有理左逆 $L _ 6 = \operatorname{diag}(L _ {\mathrm{punct}}, L _ {\mathrm{coef}})$ 严格满足 $L _ 6 M _ 6 = I _ 6$ 。

**命题 A.120**。在统摄五大静态失实机制与三大原理性相撞定理的六维总合流状态空间中，完备保真观察矩阵

$$
E _ {\mathrm{total}} = \begin{pmatrix} 1 & 0 & 1 & 0 & 0 & 0 \cr
0 & 1 & 0 & 1 & 0 & 0 \cr
0 & 0 & 0 & 0 & 1 & 1 \end{pmatrix}
$$

配合三通道携余项对冲推进算子 $A _ 1, A _ 2$ 严格满足商核闭合 $E _ {\mathrm{total}} A _ 1 K = E _ {\mathrm{total}} A _ 2 K = 0$ 、全阶算术不变量守恒 $A _ i^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ 以及每一步前缀零漂移 $E _ {\mathrm{total}} \delta = 0$ 。

---

### 6.2　单前提剥离破缺反例命题完备台账（命题 B.1–B.62）

为严格证明 6.1 节与正文各定理中的每一项守卫前件均为**不可删减的充要条件**，以下六十二项反例命题（命题 B.1 至命题 B.62）逐一采取“仅剥离单一核心前件、其余条件完全保持”的单变量对照设计，并给出每一项破缺后精确的非零代数残差、秩退化或负枢轴证据。

#### 6.2.1　NC-A01 族：剥离未决余项伴随纤维引发的商核泄漏与守恒律失效（命题 B.1–B.10）

**命题 B.1**（命题 A.1 的单前件破缺孪生）。在命题 A.1 的四维截断空间中，若剥离“余项纤维同步对冲”前件，将原本应同时扣减余项的转移算子改为只单向抹除余项或单向累加主部的非闭合算子

$$
A _ {\mathrm{leak},1} = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 0 \cr 0 & 0 & 1 & 0 \cr 0 & 0 & 0 & 1 \end{pmatrix},
$$

则作用在盲核基 $K$ 的第一列 $k _ 1 = (1, 0, -1, 0)^{\mathsf{T}} \in \ker E$ 上时，商核闭合条件即告破缺：

$$
E A _ {\mathrm{leak},1} K = \begin{pmatrix} -1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0,
$$

产生精确为 $-1$ 的一阶商核泄漏残差。

**命题 B.2**（命题 A.2 的单前件破缺孪生）。若在单步窗口推进中保留商核闭合 $E A K = 0$ ，但剥离“步进增量 $\delta$ 必须落在零干扰核 $\ker E$ 内”的前件，取未配平余项的单侧截断步进 $\delta _ {\mathrm{bad}} = (1, 0, 0, 0)^{\mathsf{T}}$ ，则前缀无干扰条件破缺：

$$
E\delta _ {\mathrm{bad}} = \begin{pmatrix} 1 \cr 0 \end{pmatrix} \neq \begin{pmatrix} 0 \cr 0 \end{pmatrix},
$$

在单步前缀上直接造成幅值为 $1$ 的总和读口漂移。

**命题 B.3**（命题 A.3 的单前件破缺孪生）。在五维带辅助槽位的空间中，若在第五槽位尚未证明对主读口零耦合（反而存在非零耦合项 $A _ {1,5} = 1$ ）时即执行约化或推进，即取

$$
A _ {\mathrm{bad},3} = \begin{pmatrix} 1 & 0 & 0 & 0 & 1 \cr
0 & 1 & 0 & 0 & 0 \cr
0 & 0 & 1 & 0 & 0 \cr
0 & 0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 0 & 1 \end{pmatrix},
$$

则第五维核向量 $k _ 3 = (0, 0, 0, 0, 1)^{\mathsf{T}} \in \ker E$ 被直接注入第一主读口，导致 $E A _ {\mathrm{bad},3} K \neq 0$ 。

$$
E A _ {\mathrm{bad},3} K = \begin{pmatrix} 0 & 0 & 1 \cr 0 & 0 & 0 \end{pmatrix} \neq 0.
$$

**命题 B.4**（命题 A.4 的单前件破缺孪生）。在四维双通道截断空间中，若剥离全阶总和守恒前件 $A^{\mathsf{T}} c _ {\mathrm{inv}} = c _ {\mathrm{inv}}$ ，将比例系数写错为非守恒放大 $A _ {\mathrm{bad},4} = \operatorname{diag}(2, 1, 2, 1)$ ，虽然 $E A _ {\mathrm{bad},4} K = 0$ 偶然满足，但守恒向量发生严重漂移：

$$
\begin{aligned}
&A _ {\mathrm{bad},4}^{\mathsf{T}} c _ {\mathrm{inv}} - c _ {\mathrm{inv}} \cr
&\qquad = (2, 1, 2, 1)^{\mathsf{T}} - (1, 1, 1, 1)^{\mathsf{T}} = (1, 0, 1, 0)^{\mathsf{T}} \neq 0.
\end{aligned}
$$

**命题 B.5**（命题 A.5 的单前件破缺孪生）。在二维显式主部与余项对偶空间（ $E = (1, 1), K = (1, -1)^{\mathsf{T}}$ ）中，若仿照 $\operatorname{LSeries}$ 在 $\operatorname{Re}(s) \le 1$ 处的静态归零做法，直接把第二维未决余项抹零而不在第一维补偿，即取投影算子 $A _ {\mathrm{drop}}$ ，则

$$
A _ {\mathrm{drop}} = \begin{pmatrix} 1 & 0 \cr 0 & 0 \end{pmatrix}.
$$

$$
E A _ {\mathrm{drop}} K = (1, 1)\begin{pmatrix} 1 & 0 \cr
0 & 0 \end{pmatrix}\begin{pmatrix} 1 \cr
-1 \end{pmatrix} = 1 \neq 0,
$$

商核闭合条件以残差 $1$ 直接崩塌。

**命题 B.6**（命题 A.6 的单前件破缺孪生）。在三维二级余项空间中，若第一步推进 $A _ {1\to 2}$ 保真，但第二步推进 $A _ {2\to 3}$ 漏掉了第三级余项的承接（将右下角元置为 $0$ ： $A _ {\mathrm{bad},6}$ ），则第二核向量 $k _ 2 = (0, 1, -1)^{\mathsf{T}} \in \ker E$ 产生泄漏： $E A _ {\mathrm{bad},6} K = (0, 1) \neq (0, 0)$ 。

$$
A _ {\mathrm{bad},6} = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 1 & 0 \cr 0 & 0 & 0 \end{pmatrix}.
$$

**命题 B.7**（命题 A.8 的单前件破缺孪生）。在四维双通道空间中，若步进向量在两个通道之间发生反号失配 $\delta _ {\mathrm{bad}} = (1, 0, -1, 0)^{\mathsf{T}}$ （误将跨通道抵消当作同通道余项对冲），则分通道读口矩阵 $E$ 给出 $E\delta _ {\mathrm{bad}} = (1, -1)^{\mathsf{T}} \neq (0, 0)^{\mathsf{T}}$ 。

$$
E = \begin{pmatrix} 1 & 1 & 0 & 0 \cr 0 & 0 & 1 & 1 \end{pmatrix}.
$$

**命题 B.8**（命题 A.9 的单前件破缺孪生）。在有理比例转移中，若将对角保持权重 $\frac{3}{2}$ 误写为 $\frac{1}{2}$ ，使得行和偏离 $1$ ，则核向量 $(1, -1, 0, 0)^{\mathsf{T}}$ 作用下产生有理泄漏残差 $E A _ {\mathrm{bad},8} K \neq 0$ 。

$$
E A _ {\mathrm{bad},8} K = \begin{pmatrix} 1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0.
$$

**命题 B.9**（命题 A.10 的单前件破缺孪生）。在五维三读口空间中，若步进向量触碰了已被第三行锁定的第五维守卫位 $\delta _ {\mathrm{bad}} = (0, 0, 0, 0, 1)^{\mathsf{T}}$ ，则 $E\delta _ {\mathrm{bad}} = (0, 0, 1)^{\mathsf{T}} \neq 0$ 。

**命题 B.10**（命题 A.12 的单前件破缺孪生）。在撤除诊断支架时，若误将承担主部余项对冲的第三维生产坐标当作冗余支架一并撤除，即取 $A _ {\mathrm{bad},10} = \operatorname{diag}(1, 1, 0, 1, 0)$ ，则第一核向量 $(1, 0, -1, 0, 0)^{\mathsf{T}}$ 立即刺穿读口： $E A _ {\mathrm{bad},10} K \neq 0$ 。

$$
E A _ {\mathrm{bad},10} K = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 0 & 0 \end{pmatrix} \neq 0.
$$

#### 6.2.2　NC-A02 族：极点单点填洞抹除留数与双穿孔退化（命题 B.11–B.20）

**命题 B.11**（定理 II 与命题 A.15 的单前件破缺孪生）。在极点芽 $g _ {r,c _ 0}(s) = \frac{r}{s-1} + c _ 0$ 的观测中，若剥离“对称双穿孔采样 $s _ \pm = 1 \pm h$ ”前件，退化为在同一侧重复采样或仅读取填洞单点值，使得观测矩阵前两行线性相关：

$$
M _ {\mathrm{deg}} = \begin{pmatrix} 1 & 1 & 0 \cr 1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix},
$$

则 $\det M _ {\mathrm{deg}} = 0$ （矩阵秩从 $3$ 退化为 $2$ ）。对任意候选恢复矩阵 $L$ ， $L M _ {\mathrm{deg}}$ 的前两列必然恒等，与单位阵 $I _ 3$ 的恢复残差范数至少为 $1$ ，留数 $r$ 与常数项 $c _ 0$ 发生不可逆混叠： $M _ {\mathrm{deg}}(1, -1, 0)^{\mathsf{T}} = (0, 0, 0)^{\mathsf{T}}$ 。

**命题 B.12**（命题 A.16 的单前件破缺孪生）。在步长 $h = 1/2$ 的穿孔恢复中，若左逆矩阵漏乘步长因子（仍使用 $h = 1$ 的左逆 $L _ 1$ 去乘 $M _ {1/2}$ ），则

$$
L _ 1 M _ {1/2} = \begin{pmatrix} 2 & 0 & 0 \cr 0 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix} \neq I _ 3,
$$

留数恢复值产生精确 $2$ 倍的尺度失真（残差矩阵 $(L _ 1 M _ {1/2} - I _ 3) _ {1,1} = 1 \neq 0$ ）。

**命题 B.13**（命题 A.17 的单前件破缺孪生）。在含一次项 $c _ 1(s-1)$ 的三维极点芽中，若第三行导数观测退化为零行 $M _ {\mathrm{bad},13}$ ，则一次斜率坐标 $(0, 0, 1)^{\mathsf{T}} \in \ker M _ {\mathrm{bad},13}$ ，恢复乘积 $L M _ {\mathrm{bad},13}$ 第三行全为零，与 $I _ 3$ 在 $(3,3)$ 处产生残差 $-1 \neq 0$ 。

$$
M _ {\mathrm{bad},13} = \begin{pmatrix} 1 & 1 & 0 \cr -1 & 1 & 0 \cr 0 & 0 & 0 \end{pmatrix}.
$$

**命题 B.14**（命题 A.13 的单前件破缺孪生）。在三维亚纯芽空间中，若算子将高阶正则项 $c _ 1$ 非法混入极点留数槽位（取 $A _ {\mathrm{bad},14}$ ），则正则盲核 $K = (0, 0, 1)^{\mathsf{T}}$ 直接污染留数读口： $E A _ {\mathrm{bad},14} K = (1, 0)^{\mathsf{T}} \neq (0, 0)^{\mathsf{T}}$ 。

$$
A _ {\mathrm{bad},14} = \begin{pmatrix} 1 & 0 & 1 \cr 0 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 B.15**（命题 A.18 的单前件破缺孪生）。在步长 $h = 1/3$ 的三通道观测中，若第三采样点与前两点共线组合 $M _ {\mathrm{bad},15}$ （第三行为前两行之和），则第三未知量完全落入零空间 $M _ {\mathrm{bad},15}(0, 0, 1)^{\mathsf{T}} = (0, 0, 0)^{\mathsf{T}}$ 。

$$
M _ {\mathrm{bad},15} = \begin{pmatrix} 3 & 1 & 0 \cr -3 & 1 & 0 \cr 0 & 2 & 0 \end{pmatrix}.
$$

**命题 B.16**（命题 A.19 的单前件破缺孪生）。在四维双极点芽恢复中，若第二极点通道的差分符号丢失（将 $(3,4)$ 与 $(4,4)$ 块写为奇异块 $B _ {\mathrm{deg}}$ ），则向量 $(0, 0, 1, -1)^{\mathsf{T}}$ 落入观测零空间， $L M _ {\mathrm{bad},16} \neq I _ 4$ 。

$$
B _ {\mathrm{deg}} = \begin{pmatrix} 1 & 1 \cr 1 & 1 \end{pmatrix}.
$$

**命题 B.17**（命题 A.21 的单前件破缺孪生）。在交错极点采样中，若将反对称穿孔行 $(1, 0, -1, 0)$ 误改为对称重复行 $(1, 0, 1, 0)$ ，则留数奇分量 $(1, 0, -1, 0)^{\mathsf{T}}$ 被彻底抹零。

**命题 B.18**（命题 A.23 的单前件破缺孪生）。在对数导数极点阶数 $m = \operatorname{Res} _ {s=s _ 0}(f'/f)$ 的恢复中，若将穿孔极点权重行 $(2, 1, 0)$ 退化为与常规点值相同的 $(1, 1, 0)$ ，则前两行相等，极点阶数向量 $(1, -1, 0)^{\mathsf{T}}$ 落入盲核 $\ker M _ {\mathrm{bad},18}$ 。

**命题 B.19**（命题 A.24 的单前件破缺孪生）。若将第四维填洞默认值 $v _ {\mathrm{fill}}$ 通过耦合项 $A _ {1,4} = 1$ 混入第一维真实留数读口，则填洞默认值的任意改动 $K = (0, 0, 0, 1)^{\mathsf{T}}$ 都会在第一读口产生非零伪影 $E A _ {\mathrm{bad},19} K = (1, 0, 0)^{\mathsf{T}} \neq 0$ 。

**命题 B.20**（命题 A.14 的单前件破缺孪生）。在穿孔差分空间中，若步进向量单侧修改了常数项与留数 $\delta _ {\mathrm{bad}} = (1, 1, 0, 0)^{\mathsf{T}}$ 而不作穿孔对冲，则 $E\delta _ {\mathrm{bad}} = (1, 1)^{\mathsf{T}} \neq (0, 0)^{\mathsf{T}}$ 。

#### 6.2.3　NC-A03 族：剥离本原特征守卫、跨模割裂与模零退化（命题 B.21–B.30）

**命题 B.21**（定理 III-A 与命题 A.25 的单前件破缺孪生）。在跨模诱导空间中，若剥离“坏素数局部 Euler 因子与本原主部同步配平”前件，使用单侧截断算子 $A _ {\mathrm{bad},21}$ ，则商核闭合破缺 $E A _ {\mathrm{bad},21} K \neq 0$ 。

$$
\begin{aligned}
& A _ {\mathrm{bad},21} = \begin{pmatrix} 1 & 0 & 1 & 0 \cr
0 & 1 & 0 & 0 \cr
0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1 \end{pmatrix}, \cr
& E A _ {\mathrm{bad},21} K = \begin{pmatrix} -1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 B.22**（定理 III-B 与命题 A.27 的单前件破缺孪生）。在四特征（ $1, \chi _ 1, \chi _ 2, \chi _ 1\chi _ 2$ ）空间中，若剥离乘积特征通道 $\chi _ 1\chi _ 2 = \chi _ 1 \cdot \chi _ 2$ 的乘性绑定，允许第四通道独立退化为零（取 $A _ {\mathrm{bad},22} = \operatorname{diag}(1, 1, 1, 0)$ ），则当 $\chi _ 1(p) = \chi _ 2(p) = -1$ 时，原本满足 $1 - 1 - 1 + 1 = 0$ 的核向量 $k _ 3 = (0, 0, 1, -1)^{\mathsf{T}} \in \ker E$ 在作用后产生负值泄漏：

$$
\begin{aligned}
E A _ {\mathrm{bad},22} k _ 3 &= (1, 1, 1, 1)(0, 0, 1, 0)^{\mathsf{T}} = 1 \neq 0, \cr
1 - 1 - 1 + 0 &= -1 < 0.
\end{aligned}
$$

这直接证明：一旦拆散四特征的同源乘积绑定，式 $(4.13)$ 的实正定锥非负性就会即告破缺为负数 $-1 < 0$ 。

**命题 B.23**（命题 A.28 的单前件破缺孪生）。在六维三模统一拉回空间中，若将第三个模数的拉回通道切断（ $A _ {\mathrm{bad},23} = \operatorname{diag}(1, 1, 1, 1, 1, 0)$ ），则第三通道核向量 $(0, 0, 1, 0, 0, -1)^{\mathsf{T}}$ 发生泄漏： $E A _ {\mathrm{bad},23} K$ 在 $(3,3)$ 处等于 $1 \neq 0$ 。

**命题 B.24**（命题 A.31 的单前件破缺孪生）。在五维带导子指示位的空间中，若未经本原化分解就直接篡改导子指示位 $\delta _ {\mathrm{bad}} = (0, 0, 0, 0, -1)^{\mathsf{T}}$ ，则第三读口立即报警： $E\delta _ {\mathrm{bad}} = (0, 0, -1)^{\mathsf{T}} \neq 0$ 。

**命题 B.25**（命题 A.33 与式 (4.11) 模 $4$ 主特征 Gauss 和破缺孪生）。在模 $4$ 特征空间中，若漏写本原守卫 $\operatorname{IsPrimitive}(\chi)$ ，将偶余类与奇余类混淆（取 $A _ {\mathrm{bad},25}$ ），则偶余类核向量 $(0, 0, 1)^{\mathsf{T}}$ 直接泄漏： $E A _ {\mathrm{bad},25} K = (0, 1) \neq (0, 0)$ 。

$$
A _ {\mathrm{bad},25} = \begin{pmatrix} 1 & 0 & 1 \cr 0 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 B.26**（命题 A.26 的单前件破缺孪生）。在剥离非本原坏素数因子时，若将仍处于虚轴振荡状态的第五槽位直接加回主部 $A _ {2,5} = 1$ ，则 $E A _ {\mathrm{bad},26} K \neq 0$ 。

$$
E A _ {\mathrm{bad},26} K = \begin{pmatrix} 0 & 0 & 0 \cr 0 & 0 & 1 \end{pmatrix} \neq 0.
$$

**命题 B.27**（命题 A.30 的单前件破缺孪生）。在跨模有理加权拉回中，若两侧拉回权重不守恒 $A _ {\mathrm{bad},27} = \operatorname{diag}(1, 2, 1, 2)$ ，则总特征和守恒律破缺： $A _ {\mathrm{bad},27}^{\mathsf{T}} c _ {\mathrm{inv}} - c _ {\mathrm{inv}} = (0, 1, 0, 1)^{\mathsf{T}} \neq 0$ 。

**命题 B.28**（命题 A.32 的单前件破缺孪生）。在双特征簇空间中，若引入未经公倍数模对齐的跨簇非法串扰 $A _ {1,3} = 1$ ，则第二簇核向量 $(0, 0, 1, -1, 0)^{\mathsf{T}}$ 直接污染第一簇读口： $E A _ {\mathrm{bad},28} K \neq 0$ 。

$$
E A _ {\mathrm{bad},28} K = \begin{pmatrix} 0 & 1 & 0 \cr 0 & 0 & 0 \end{pmatrix} \neq 0.
$$

**命题 B.29**（命题 A.34 的单前件破缺孪生）。在交错双模空间中，若步进向量未保持簇内零和 $\delta _ {\mathrm{bad}} = (1, 1, -1, -1)^{\mathsf{T}}$ ，则 $E\delta _ {\mathrm{bad}} = (2, -2)^{\mathsf{T}} \neq (0, 0)^{\mathsf{T}}$ 。

**命题 B.30**（命题 A.36 的单前件破缺孪生）。在六维三通道空间中，若误删第五维导子守卫位 $A _ {\mathrm{bad},30} = \operatorname{diag}(1, 1, 1, 1, 0, 0)$ ，则守恒向量 $(1, 1, 1, 1, 1, 0)^{\mathsf{T}}$ 在第五维产生 $-1$ 的守恒缺失。

#### 6.2.4　NC-A04 族：将加法延拓与乘法筛选作交换简化引发的泄漏（命题 B.31–B.40）

**命题 B.31**（定理 IV 与命题 A.37 的单前件破缺孪生）。在四维加法位移与乘法缩放空间中，若剥离伴随余项纤维的隔离保护，让加法位移直接跨入可见主部 $A _ {\mathrm{bad},31}$ ，则盲核向量 $(0, 0, 1, 0)^{\mathsf{T}} \in \ker E$ 直接进入第一主读口： $E A _ {\mathrm{bad},31} K \neq 0$ 。

$$
\begin{aligned}
& A _ {\mathrm{bad},31} = \begin{pmatrix} 1 & 0 & 1 & 0 \cr
0 & 1 & 0 & 0 \cr
0 & 0 & 1 & 1 \cr
0 & 0 & 0 & 1 \end{pmatrix}, \cr
& E A _ {\mathrm{bad},31} K = \begin{pmatrix} 1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 B.32**（命题 A.37 交换拍扁退化反例）。若将乘法缩放算子 $A _ {\mathrm{mul}}$ 拍扁为单位阵 $I _ 4$ （抹除不同素数幂之间的非均匀缩放权重，令 $A _ 1 = A _ 2 = I _ 4$ ），虽然表面上没有报错，但非交换换位子彻底退化为零矩阵 $[A _ 1, A _ 2] = 0$ ，丢失了定理 IV 式 $(4.15)$ 所必需的一阶非交换结构秩。

**命题 B.33**（命题 A.38 的单前件破缺孪生）。在素数 $p = 3$ 的缩放与加法位移耦合中，若将第四维位移余项直接泄漏至第二可见读口 $A _ {2,4} = 2$ ，则 $E A _ {\mathrm{bad},33} K \neq 0$ 。

$$
E A _ {\mathrm{bad},33} K = \begin{pmatrix} 0 & 0 \cr 0 & 2 \end{pmatrix} \neq 0.
$$

**命题 B.34**（命题 A.40 的单前件破缺孪生）。在五维三阶 Heisenberg 位移空间中，若将第三维中间伴随坐标直接暴露给第一读口 $A _ {1,3} = 1$ ，则 $E A _ {\mathrm{bad},34} K \neq 0$ 。

$$
E A _ {\mathrm{bad},34} K = \begin{pmatrix} 1 & 0 & 0 \cr 0 & 0 & 0 \end{pmatrix} \neq 0.
$$

**命题 B.35**（命题 A.41 的单前件破缺孪生）。在三维极小非交换模型（ $E = (1, 0, 0)$ ）中，若乘法算子发生主部与伴随纤维之间的非法上三角混合 $A _ {\mathrm{bad},35}$ ，则 $E A _ {\mathrm{bad},35} K = (1, 0) \neq (0, 0)$ 。

$$
A _ {\mathrm{bad},35} = \begin{pmatrix} 1 & 1 & 0 \cr 0 & 2 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 B.36**（命题 A.43 的单前件破缺孪生）。在四维商空间非交换吸收模型（ $E$ ）中，命题 A.43 之所以能保持 $E[A _ 1, A _ 2] = 0$ ，是因为 $A _ 1$ 在第一行与第三行的剪切系数 $(-1, +1)$ 恰好和为零。若剥离这一精确对冲条件，将 $A _ 1$ 的 $(1,4)$ 元从 $-1$ 改为 $0$ （即只在第三行加 $1$ 而不从第一行减 $1$ ），则第四维伴随核向量 $(0, 0, 0, 1)^{\mathsf{T}}$ 立即造成泄漏： $E A _ {\mathrm{bad},36} K \neq 0$ 。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 1 & 0 \cr 0 & 1 & 0 & 0 \end{pmatrix}, \cr
& E A _ {\mathrm{bad},36} K = \begin{pmatrix} 0 & 1 \cr 0 & 0 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 B.37**（命题 A.44 的单前件破缺孪生）。在第二通道非交换耦合模型（ $E$ ）中，若将 $A _ 2$ 在 $(2,2)$ 与 $(4,2)$ 的对称耦合权重 $(3/2, -1/2)$ （列和为 $1$ ）破缺为 $(3/2, 1/2)$ （列和变为 $2$ ），则核向量 $(0, 1, 0, -1)^{\mathsf{T}}$ 作用下产生商核泄漏： $E A _ {\mathrm{bad},37} K \neq 0$ 。

$$
\begin{aligned}
& E = \begin{pmatrix} 1 & 0 & 0 & 0 \cr 0 & 1 & 0 & 1 \end{pmatrix}, \cr
& E A _ {\mathrm{bad},37} K = \begin{pmatrix} 0 & 0 \cr 1 & 0 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 B.38**（命题 A.46 的单前件破缺孪生）。在五维三读口非交换模型中，若将第四、第五维伴随剪切耦合进第三主读口 $A _ {3,5} = -1$ ，则 $E A _ {\mathrm{bad},38} K \neq 0$ 。

$$
E A _ {\mathrm{bad},38} K = \begin{pmatrix} 0 & 0 \cr 0 & 0 \cr 0 & -1 \end{pmatrix} \neq 0.
$$

**命题 B.39**（命题 A.47 的单前件破缺孪生）。在五维双对冲读口空间中，若在第一通道与第二通道之间引入未配平的交叉位移 $A _ {2,5} = 1$ ，则第五维核向量 $(0, 0, 0, 0, 1)^{\mathsf{T}}$ 在第二读口产生泄漏 $E A _ {\mathrm{bad},39} K \neq 0$ 。

$$
E A _ {\mathrm{bad},39} K = \begin{pmatrix} 0 & 0 & 0 \cr 0 & 0 & 1 \end{pmatrix} \neq 0.
$$

**命题 B.40**（命题 A.48 的单前件破缺孪生）。在六维三阶非交换伴随空间中，若将全部六个坐标拍扁为同一标量（令 $A _ 1, A _ 2$ 在伴随块上退化为单位阵），则非交换换位子 $[A _ 1, A _ 2] = 0$ ，彻底丧失区分先加后乘与先乘后加的能力。

#### 6.2.5　NC-A05 族：离轴零点突破有限维 Gram 块导致正定性失效与负枢轴（命题 B.41–B.50）

**命题 B.41**（定理 V 与命题 A.49 的单前件破缺孪生）。在三维三对角矩阵中，当离轴零点的双曲余弦负贡献使对角元从 $2$ 退化为 $1$ 、非对角耦合增强为 $-2$ 时，所得对称矩阵 $G _ {\mathrm{bad},41}$ 的精确有理 $LDL^{\mathsf{T}}$ 分解为：

$$
\begin{aligned}
& G _ {\mathrm{bad},41} = \begin{pmatrix}
1 & -2 & 0 \cr
-2 & 1 & 0 \cr
0 & 0 & 1
\end{pmatrix} = L D _ {\mathrm{bad},41} L^{\mathsf{T}}, \cr
& L = \begin{pmatrix} 1 & 0 & 0 \cr -2 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}, \cr
& D _ {\mathrm{bad},41} = \operatorname{diag}\left(1, -3, 1\right).
\end{aligned}
$$

第二枢轴直接跌落为严格负有理数 $d _ 2 = -3 < 0$ （对测试向量 $x = (2, 1, 0)^{\mathsf{T}}$ 有 $x^{\mathsf{T}} G _ {\mathrm{bad},41} x = 4 - 8 + 1 = -3 < 0$ ），正定性即告失效。

**命题 B.42**（命题 A.50 的单前件破缺孪生）。在命题 A.50 的矩阵中，若第三测试模式的自能量因离轴零点贡献从 $6$ 跌落为 $1$ （即 $G _ {\mathrm{bad},42}$ ），则前两个枢轴 $(d _ 1, d _ 2) = (4, 4) > 0$ 虽然仍为正（对应 $2\times 2$ 有限左上子块严格正定），但第三个 $LDL^{\mathsf{T}}$ 枢轴精确跌落为负数：

$$
G _ {\mathrm{bad},42} = \begin{pmatrix} 4 & 2 & 1 \cr 2 & 5 & 2 \cr 1 & 2 & 1 \end{pmatrix}.
$$

$$
d _ 3 = 1/2 - 4(1/4)^2 - 4(3/8)^2 = 1/2 - 13/16 = -5/16 < 0.
$$

这用一个精确的 $3\times 3$ 有理矩阵给出了定理 V 的直观代数见证：前 $2\times 2$ 有限维子块严格正定（ $d _ 1 = 4 > 0, d _ 2 = 4 > 0$ ），但一旦扩充到第 $3$ 个测试方向，第三个枢轴 $d _ 3 = -\frac{5}{16} < 0$ 立即暴露为负。

**命题 B.43**（命题 A.51 的单前件破缺孪生）。当第一测试模式自身违反 Weil 正性（首对角元取 $-1$ ： $G _ {\mathrm{bad},43} = \operatorname{diag}(-1, 3, 3)$ ）时，首枢轴 $d _ 1 = -1 < 0$ 。

**命题 B.44**（命题 A.52 的单前件破缺孪生）。当第二模式与第一模式发生退化共线（ $G _ {\mathrm{bad},44}$ ）时， $LDL^{\mathsf{T}}$ 分解的第二枢轴退化为零 $d _ 2 = 1 - 1 = 0 \ngtr 0$ ，严格正定性破缺为半正定奇异核 $(1, -1, 0)^{\mathsf{T}}$ 。

$$
G _ {\mathrm{bad},44} = \begin{pmatrix} 1 & 1 & 0 \cr 1 & 1 & 0 \cr 0 & 0 & 1 \end{pmatrix}.
$$

**命题 B.45**（命题 A.53 的单前件破缺孪生）。在四维三对角矩阵中，若前三阶子块完全保持命题 A.53 的严格正定块（ $d _ 1 = 2, d _ 2 = 3/2, d _ 3 = 4/3$ ），但第四阶高阶测试模式的对角元从 $2$ 跌落为 $0$ （ $G _ {\mathrm{bad},45}$ 的 $(4,4)$ 元为 $0$ ），则第四个 $LDL^{\mathsf{T}}$ 枢轴精确等于

$$
d _ 4 = 0 - \frac{4}{3}\times\left(\frac{3}{4}\right)^2 = -\frac{3}{4} < 0!
$$

前三阶子块百分之百正定，而在第四阶测试向量 $x = (-1, 2, -3, 4)^{\mathsf{T}}$ 上二次型直接取负值 $x^{\mathsf{T}} G _ {\mathrm{bad},45} x = -12 < 0$ 。

**命题 B.46**（命题 A.54 的单前件破缺孪生）。在四维循环耦合矩阵中，当非对角负耦合从 $-1$ 强化为 $-3$ （ $G _ {\mathrm{bad},46}$ ）时， $LDL^{\mathsf{T}}$ 枢轴为 $D = \operatorname{diag}(2, -5/2, 2, 2)$ ，其中 $d _ 2 = -5/2 < 0$ 。

$$
G _ {\mathrm{bad},46} = \begin{pmatrix} 2 & -3 & 0 & 0 \cr -3 & 2 & 0 & 0 \cr 0 & 0 & 2 & 0 \cr 0 & 0 & 0 & 2 \end{pmatrix}.
$$

**命题 B.47**（命题 A.55 的单前件破缺孪生）。在素数波包 Gram 矩阵 $G _ {\mathrm{wave}}$ 中，若保留前两阶矩但在第三素数通道上注入离轴零点负偏移（将 $(3,3)$ 元从 $\frac{3}{92}$ 减去 $\frac{1}{10}$ 变为 $-\frac{31}{460}$ ），则前两个枢轴 $(d _ 1, d _ 2) = (\frac{3}{68}, \frac{613}{36822}) > 0$ 完全不变，而第三枢轴跌落为 $d _ 3 = \frac{6669}{324277} - \frac{1}{10} = -\frac{257587}{3242770} < 0$ 。

**命题 B.48**（命题 A.56 的单前件破缺孪生）。在实字符素数锥 Gram 矩阵 $G _ {\mathrm{cone}}$ 中，若剥离式 $(4.13)$ 的平方非负耦合，将第二对角元反号，则第二枢轴 $d _ 2$ 直接由正转负。

**命题 B.49**（命题 A.57 的单前件破缺孪生）。若企图仅用两行低阶矩矩阵 $M _ {\mathrm{mom}}$ （补第三行零行）去左逆恢复三维测试向量，则对任意 $3\times 3$ 矩阵 $L$ ， $L M _ {\mathrm{mom}}$ 的秩至多为 $2 < 3$ ，在核向量 $(1, -2, 1)^{\mathsf{T}}$ 上恒为零，绝不可能等于 $I _ 3$ 。

$$
M _ {\mathrm{mom}} = \begin{pmatrix} 1 & 1 & 1 \cr 19 & 20 & 21 \end{pmatrix}.
$$

**命题 B.50**（命题 A.59 的单前件破缺孪生）。在四维矩空间中，若高阶离轴频率通过耦合算子 $A _ {1,3} = -1$ 突破有限矩屏蔽，则 $E A _ {\mathrm{bad},50} K \neq 0$ 。

$$
E A _ {\mathrm{bad},50} K = \begin{pmatrix} 1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0.
$$

#### 6.2.6　NC-P1–P3 族：三大主定理与定理 1.4 的单前提剥离破缺反例（命题 B.51–B.62）

**命题 B.51**（定理 A₀ 剥离商下降兼容性 $\operatorname{Eq}(q) \subseteq \operatorname{Eq}(Z)$ 的破缺反例）。在定理 A₀ 中，当弱商观察 $E$ 的盲核 $K$ 未被排零算子保持（取 $A _ {\mathrm{bad},51}$ ）时，沿同商相等 $q(x _ 0) = q(x _ 1)$ 传递排零属性立即产生商核泄漏 $E A _ {\mathrm{bad},51} K \neq 0$ ，在截面内触发 $W(x _ 1) = 0$ 与 $W(x _ 1) = 1$ 的正面碰撞。

$$
\begin{aligned}
& A _ {\mathrm{bad},51} = \begin{pmatrix} 1 & 0 & 1 & 0 \cr
0 & 1 & 0 & 0 \cr
0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1 \end{pmatrix}, \cr
& E A _ {\mathrm{bad},51} K = \begin{pmatrix} -1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 B.52**（定理 A₀ 剥离 Rouché 严格正裕量 $\Delta _ {\mathrm{Rouche}} > 0$ 的破缺反例）。在有理矩形边界 $\partial B$ 上，若边界扰动模上界 $\varepsilon = \frac{1}{4}$ 超过了线性主部模下界 $r = \frac{1}{8}$ ，则平方 Rouché 裕量变为严格负有理数：

$$
\Delta _ {\mathrm{bad},52} = (1/8)^2 - (1/4)^2 = \frac{1}{64} - \frac{1}{16} = -\frac{3}{64} < 0.
$$

此时对应的二阶裕量矩阵 $D = \operatorname{diag}(1/64, -3/64)$ 出现负枢轴 $-3/64 < 0$ （例如扰动 $f(s) - (s-c) = -(s-c) + 1$ 直接把框内零点抹掉变为常函数 $1$ ），Rouché 绕数不变性即告失效。

**命题 B.53**（定理 A₀ 剥离框内无极点全纯资格 $\mathcal{C} _ {\mathrm{hol}}(B)$ 的破缺反例）。若影子函数 $f$ 在有理框 $B$ 内除了一个简单零点（贡献绕数 $+1$ ）外还含有一个未声明的一阶极点（贡献绕数 $-1$ ），即在五维围道空间中极点资格位被非法改动 $\delta _ {\mathrm{bad}} = (0, 0, 0, 0, -1)^{\mathsf{T}}$ ，则净绕数变为 $1 - 1 = 0$ ，全纯资格读口给出非零报警 $E\delta _ {\mathrm{bad}} = (0, 0, -1)^{\mathsf{T}} \neq 0$ 。

**命题 B.54**（定理 B₁ 剥离素数互异性或混入复合数的破缺反例）。在定理 B₁ 的对数线性独立性中，若剥离“基底全部为互异素数”前件，将第三个生成元从素数 $5$ 替换为复合数 $6 = 2 \times 3$ （即取对数向量 $(\log 2, \log 3, \log 6)^{\mathsf{T}}$ ），则指数观测矩阵变为奇异矩阵：

$$
M _ {\mathrm{comp}} = \begin{pmatrix} 1 & 0 & 1 \cr 0 & 1 & 1 \cr 0 & 0 & 0 \end{pmatrix},
$$

非零有理系数向量 $r = (1, 1, -1)^{\mathsf{T}} \in \mathbb{Q}^3$ 满足 $r _ 1 \log 2 + r _ 2 \log 3 + r _ 3 \log 6 = \log 2 + \log 3 - \log 6 = 0$ （ $M _ {\mathrm{comp}} r = (0, 0, 0)^{\mathsf{T}}$ ），线性独立性即告失效。

**命题 B.55**（定理 B₂ 剥离有限视界外全阶素数锁的换尾泄漏反例）。在四维有限素数视界模型中，若排零算子只检查前 $P _ {\ast}$ 个素数而对视界外 $p > P _ {\ast}$ 的广义素数换尾不设防（取 $A _ {\mathrm{bad},55}$ ），则 Diamond–Montgomery–Vorhauer 换尾分量 $(0, 1, 0, -1)^{\mathsf{T}} \in \ker E$ 直接刺穿临界带排零结论： $E A _ {\mathrm{bad},55} K \neq 0$ 。

$$
\begin{aligned}
& A _ {\mathrm{bad},55} = \begin{pmatrix} 1 & 0 & 0 & 0 \cr
0 & 1 & 0 & 1 \cr
0 & 0 & 1 & 0 \cr
0 & 0 & 0 & 1 \end{pmatrix}, \cr
& E A _ {\mathrm{bad},55} K = \begin{pmatrix} 0 & 0 \cr 0 & -1 \end{pmatrix} \neq 0.
\end{aligned}
$$

**命题 B.56**（定理 B₂ 将修饰因子评估点移出开右半平面 $\operatorname{Re}(s) > 0$ 至虚轴 $\operatorname{Re}(s) = 0$ 的破缺反例）。在定理 B₂ 式 $(2.17)$ 中，有理 Euler 修饰因子 $H _ {P _ {\ast}}(s)$ 无零无极点的充要前件是 $\operatorname{Re}(s) > 0$ 。若剥离 $\operatorname{Re}(s) > 0$ ，将评估点放到虚轴 $s = \frac{2\pi i}{\log 2}$ （ $\operatorname{Re}(s) = 0$ ）处，则局部因子 $1 - 2^{-s} = 1 - 1 = 0$ ，对角矩阵 $\operatorname{diag}(0, 3/4, 7/8)$ 的首枢轴退化为 $0 \ngtr 0$ ，修饰因子在虚轴上产生零点与极点。

**命题 B.57**（定理 C₀ 剥离右半平面无穷远序列 $\sigma _ k \to +\infty$ 退化为有限两个采样点的破缺反例）。在定理 C₀ 的 Dirichlet 系数唯一恢复中，若剥离“采样序列覆盖右半平面无穷远”前件，仅在两个点处采样具有三个未知系数 $(a _ 1, a _ 2, a _ 3)$ 的截断级数（观测矩阵第三行退化为零 $M _ {\mathrm{bad},57}$ ），则非零系数差 $(1, -2, 1)^{\mathsf{T}}$ 满足 $M _ {\mathrm{bad},57}(1, -2, 1)^{\mathsf{T}} = (0, 0, 0)^{\mathsf{T}}$ ，无法唯一恢复 Dirichlet 系数。

$$
M _ {\mathrm{bad},57} = \begin{pmatrix} 1 & 1 & 1 \cr 0 & 1 & 2 \cr 0 & 0 & 0 \end{pmatrix}.
$$

**命题 B.58**（定理 C₁ 在弱解析延拓商下漏检 Davenport–Heilbronn 复合数 $n=6$ 乘性破缺的反例）。若临界带排零算子只读取 Hurwitz 周期线性组合的函数方程与整函数性质，而丢弃了在 $n = 6 = 2 \times 3$ 处的乘性核验读口（在四维空间中令算子对乘性残差核失守 $A _ {1,3} = 1$ ），则 Davenport–Heilbronn 反模型（ $\Delta _ {\mathrm{mult}}(2,3) = 1 + \kappa^2 > 0$ ）沿盲核长驱直入： $E A _ {\mathrm{bad},58} K \neq 0$ 。

$$
E A _ {\mathrm{bad},58} K = \begin{pmatrix} -1 & 0 \cr 0 & 0 \end{pmatrix} \neq 0.
$$

**命题 B.59**（定理 C₂ 偶通道在 $s = 3/4$ 处因互反因子 $P _ r(y(3/4)) = 0$ 引发非零性失效的反例）。在偶通道中，由于 $P _ r(y(3/4)) = 0$ ，变形函数 $F _ {\mathrm{even}}(s) = P _ r(2^{1/2-s})\zeta(s)$ 在 $s = 3/4$ 处的模平方掉为零。在三维离轴点非零性正定核验矩阵 $\operatorname{diag}(|F _ {\mathrm{even}}(3/4)|^2, 1, 1) = \operatorname{diag}(0, 1, 1)$ 中，首枢轴退化为 $0 \ngtr 0$ ，直接证伪任何只依赖偶对称函数方程的 $\operatorname{Re}(s) > 1/2$ 非零性引理。

**命题 B.60**（定理 1.4 在同弱商签名下宣称“既无假叶 $a=0$ 、又无目标降格 $d=0$ 、又无锥内漏口 $k=0$ ”的逻辑不可能反例）。在定理 1.4 的有向图拓扑归纳中，若在保持同弱商签名与反模型 $x _ 1$ 的前提下假设 $(a, d, k) = (0, 0, 0)$ ，则容斥守恒量 $u(0,0,0) = 0 \neq 1$ ，拓扑归纳直接导出 $Z(x _ 1) = \mathrm{True}$ 与 $Z(x _ 1) = \mathrm{False}$ 的正面冲突（在二维真值对冲矩阵中表现为 $E A _ {\mathrm{bad},60} K = 1 \neq 0$ ）。

**命题 B.61**（方案四宣称用少于 $8$ 个内部顶点割断 lc23 原版图 $S \to T$ 的流守恒反例）。在 lc23 原版全环境声明图中，由于在源集 $S$ 与汇集 $T$ 之间已由独立证书验证存在 $8$ 条内部顶点互不相交的有向路径（最大流 $|f _ {\max}| = 8$ ），任何仅删去 $7$ 个或更少内部顶点的候选割集 $C'$ ，由鸽巢原理必至少留下一条完整无损的源汇有向路径 $p _ {\mathrm{survive}} : S \leadsto T$ （在八通道流矩阵中表现为被保留的第 $8$ 通道直接穿透读口 $E A _ {\mathrm{cut},7} K \neq 0$ ）。

**命题 B.62**（方案一剥离左边界守卫 $0 < \operatorname{Re}(s)$ 后被模 $2$ 主特征虚轴零点直接证伪的反例）。在第五章式 $(5.4)$ 的一般 Dirichlet $L$ 函数零点定理中，若剥离左边界守卫 $0 < \operatorname{Re}(s)$ （仅保留 $\operatorname{Re}(s) < 1 \land L(s,\chi) = 0 \implies \operatorname{Re}(s) = 1/2$ ），则在模 $N = 2$ 主特征 $\chi _ {0,2} = 1$ 与虚轴零点 $s _ 1 = \frac{2\pi i}{\log 2}$ 处，前件 $\operatorname{Re}(s _ 1) = 0 < 1$ 与 $\operatorname{DirichletCharacter.LFunction}(1, s _ 1) = 0$ 全部成立（已在 lc23 实机上由 Autopsy1.axis\_principal\_zero 编译证成），代入无守卫命题立即导出 $(0 : \mathbb{R}) = 1/2$ （在守卫状态空间中表现为边界漂移 $E\delta _ {\mathrm{unguarded}} = (1, 0)^{\mathsf{T}} \neq (0, 0)^{\mathsf{T}}$ ）。

---

## 参考文献

[1] H. G. Diamond, H. L. Montgomery, and U. M. A. Vorhauer, Beurling primes with large oscillation, *Mathematische Annalen*, vol. 334, no. 1, pp. 1–36, 2006.

[2] A. Beurling, Analyse de la loi asymptotique de la distribution des nombres premiers généralisés. I, *Acta Mathematica*, vol. 68, pp. 255–291, 1937.

[3] H. Davenport and H. Heilbronn, On the zeros of certain Dirichlet series I, II, *Journal of the London Mathematical Society*, vol. s1-11, no. 3, pp. 181–185 and no. 4, pp. 307–312, 1936.

[4] S. M. Voronin, On the zeros of Zeta-functions of quadratic forms (and Davenport–Heilbronn functions in the critical strip), *Trudy Matematicheskogo Instituta imeni V. A. Steklova (Proceedings of the Steklov Institute of Mathematics)*, vol. 142, pp. 135–147, 1976; see also A. A. Karatsuba and S. M. Voronin, *The Riemann Zeta-Function*, Walter de Gruyter, Berlin, 1992.

[5] H. Davenport, *Multiplicative Number Theory*, 3rd ed., revised by H. L. Montgomery, Graduate Texts in Mathematics, vol. 74, Springer-Verlag, New York, 2000.

[6] H. Iwaniec and E. Kowalski, *Analytic Number Theory*, American Mathematical Society Colloquium Publications, vol. 53, American Mathematical Society, Providence, RI, 2004.

[7] H. L. Montgomery and R. C. Vaughan, *Multiplicative Number Theory I: Classical Theory*, Cambridge Studies in Advanced Mathematics, vol. 97, Cambridge University Press, Cambridge, 2007.

[8] E. C. Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed., revised by D. R. Heath-Brown, Oxford University Press, Oxford, 1986.

[9] A. Weil, Sur les "formules explicites" de la théorie des nombres premiers, *Communications du Séminaire Mathématique de l'Université de Lund (Meddelanden från Lunds Universitets Matematiska Seminarium)*, Tome Supplémentaire dédié à Marcel Riesz, pp. 252–265, 1952.

[10] X.-J. Li, The positivity of a sequence of numbers and the Riemann hypothesis, *Journal of Number Theory*, vol. 65, no. 2, pp. 325–333, 1997.

[11] E. Bombieri and J. C. Lagarias, Complements to Li's criterion for the Riemann hypothesis, *Journal of Number Theory*, vol. 77, no. 2, pp. 274–287, 1999.

[12] L. de Moura and S. Ullrich, The Lean 4 theorem prover and programming language, in *Automated Deduction – CADE 28*, Lecture Notes in Computer Science, vol. 12699, Springer, Cham, pp. 625–635, 2021; together with The Mathlib Community, The Lean mathematical library, in *Proceedings of the 9th ACM SIGPLAN International Conference on Certified Programs and Proofs (CPP 2020)*, pp. 367–381, 2020.

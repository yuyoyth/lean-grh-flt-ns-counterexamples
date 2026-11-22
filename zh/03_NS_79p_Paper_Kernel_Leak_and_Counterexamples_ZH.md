# 同作者纳维－斯托克斯方程 79 页纸面证明核漏审查：流体动力学真体与高阶语义漂移伪影分离及跨面奇异测度逃逸专论（对外自然语言暗流主体与纯闭式版）

---

## 第一章　绪论：三维不可压流体动力学中的“真体”与“高阶语义漂移伪影”——为何静态商投影的核泄漏会制造虚假的闭合与虚假的奇点

在三维不可压纳维－斯托克斯（Navier–Stokes）方程长达一个世纪的现代分析史中，几乎所有关于“全局光滑性”与“有限时爆破”的重大争议，归根结底都源于同一个深层的方法论混淆：**分析学者往往把流体动力学算子在某一静态观测坐标系、分片逼近网格或粗粒化泛函读口下的“高阶语义漂移伪影”（High-Order Semantic-Drift Artifact），误当成了流体连续统在随流演化中的“动力学真体”（True Dynamical Continuation Body）。**

考虑三维空间 $\mathbb{R}^3$ 或三维周期环面 $\mathbb{T}^3$ 上的不可压纳维－斯托克斯方程组：

$$
\partial_t u + (u \cdot \nabla) u + \nabla p = \nu \Delta u, \qquad \nabla \cdot u = 0,
$$

以及对其取旋度 $\omega = \nabla \times u$ 后得到的涡度输运－拉伸－耗散方程：

$$
\partial_t \omega + (u \cdot \nabla) \omega - (\omega \cdot \nabla) u = \nu \Delta \omega.
$$

在真实的物理与几何演化中，流体状态是一个不可任意拆解的耦合整体：速度梯度张量 $L = \nabla u$ 既通过对流导数 $D_t = \partial_t + u \cdot \nabla$ 搬运涡度场，又通过非交换的涡度拉伸项 $(\omega \cdot \nabla)u = L\omega$ 改变涡管的主轴方向与局部强度；与此同时，黏性耗散算子 $\nu \Delta$ 与无散压力投影算子 $\mathbb{P} = I - \nabla \Delta^{-1} \operatorname{div}$ 在全空间或全频谱上保持瞬时耦合。这一完整的、携带全部边界面迹与非交换相位的流式演化算子，才是纳维－斯托克斯方程的**真体**。

然而，在传统的偏微分方程纸面推演与计算机辅助证明中，研究者为了将无穷维非线性演化纳入现成的巴拿赫空间范数或有限维矩阵不等式，总是先引入一个**静态读口投影（商映射）** $q : \mathcal{X} \to \mathcal{Y}$ 。例如：
1. 在球坐标或柱坐标的分片半空间样条网格上，只提取权函数二阶导数在开区域内的勒贝格（Lebesgue）绝对连续体积密度 $H_{\mathrm{bulk}}$ ，而因为分界平面 $\Sigma = \{y_3 = 0\}$ 的三维体积测度为零，便在读口 $q$ 中将集中在分界面上的奇异狄拉克（Dirac）面测度抹去；
2. 在傅里叶（Fourier）频谱或李特伍德－佩利（Littlewood–Paley）二进壳分解中，只读取各频率壳上的二次能量模方 $\|\Delta_j u\|_{L^2}^2$ 或单模厄米（Hermitian）能谱张量 $\hat{u}(k)\hat{u}(k)^*$ ，而在读口 $q$ 中抹去跨频率三波共振的奇次相对相位；
3. 在有限谐波与有限空间单元的截断证书中，将无穷维扰动场投影为有限维节点向量 $q(v)$ ，而将高阶多谐波耦合与跨界迹拼接留给未显式写出的外部余项。

从纯粹数学的第一性原理审视，任何此类读口映射 $q : \mathcal{X} \to \mathcal{Y}$ 都定义了一个等价核（或零空间纤维）：

$$
\ker_{\mathrm{rel}}(q) := \bigl\{(X_+, X_-) \in \mathcal{X} \times \mathcal{X} : q(X_+) = q(X_-)\bigr\}
$$

（在线性同域情形下即普通零空间 $\ker q = \{X \in \mathcal{X} : q(X) = 0\}$ ）。如果分析者试图仅凭读口输出 $q(X)$ 去控制、界定或唯一决定下游的物理泛函或下一拍演化算子 $f : \mathcal{X} \to \mathcal{Z}$ ，那么数学上得以成立的充要条件是**商核闭合条件**：

$$
q(X_+) = q(X_-) \implies f(X_+) = f(X_-) \qquad \text{（在线性同域下即}\ \ker q \subseteq \ker f\text{）},
$$

或者在单边强制性下界证明 $f(X) \ge g(q(X))$ 中，必须在同一定义域的全部合法状态纤维 $q^{-1}(y)$ 上满足一致下界：

$$
\inf_{X \in \mathcal{X},\, q(X)=y} f(X) \ge g(y).
$$

一旦在某个看似无害的坐标系转换、分部积分接缝或分片样条表示处，存在落在读口盲区内的非零结构分量 $\Sigma \in \ker q$ ，它在下游物理算子 $f$ 的作用下却产生严格非零的逃逸输出 $f(\Sigma) \neq 0$ （即 $\ker q \not\subseteq \ker f$ ，或在同一读口纤维 $q(X_+) = q(X_-)$ 内使目标不等式一正一负、彻底击穿下界），我们就称该证明接缝发生了**核漏（Kernel Leakage）**。

核漏一旦发生，纸面推导中所观察到的“强制性闭合”或“误差受控”，就不再是流体方程本身的物理性质，而是**读口投影** $q$ **擅自切掉真体自由度后产生的高阶语义漂移伪影**。过去数十年里，无论是试图用纯静态欧氏索伯列夫（Sobolev）范数一劳永逸证明全局光滑的尝试，还是试图用分片数值样条与有限维矩阵证书一举锁定自相似爆破的尝试，只要在某个算子接缝处将“投影后的伪影闭合”冒充为“原方程的真体闭合”，其纸面推演在发生核漏的那一拍就已失去了无条件数学证明的资格。

本专论以与广义黎曼猜想（GRH）宣称同作者（Levent Alpöge）于 2026 年 11 月 20 日同时公开的 79 页纳维－斯托克斯方程有限时爆破纸面证明原件（Levent Alpöge 与 Tristan Buckmaster 合著，标题为 *Finite-time blow-up for the Navier–Stokes equations*，全文共 79 页，公开归档于作者代码仓库 paper 目录下的 finite-time-blow-up-navier-stokes.pdf，文件字节数 1,615,293，SHA-256 摘要为 4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901）为唯一审查对象。我们完全撇开外部证明助手的形式化工程包装不谈，纯粹站在偏微分方程、分布理论、泛函分析与流体动力学内部，对该 79 页纸面证明进行逐节、逐公式的解剖，精确揭示其证明骨架、跨面奇异测度核漏接缝、两族全闭式解析反例、薄层修复的 $O(\delta^{-1})$ 曲率税守恒律，以及流体动力学中真体与伪影的根本分界。

---

## 第二章　同作者 79 页纳维－斯托克斯有限时爆破纸面证明的总体逻辑骨架与三层承重接缝

### 2.1 原件命题定位：不是全局光滑证明，而是基于计算机辅助证书的自相似旋转剖面有限时爆破宣称

首先需要向数学界澄清一个基本事实：Alpöge 与 Buckmaster 的这篇 79 页论文所宣称证明的，**不是**三维不可压纳维－斯托克斯方程的全局光滑存在性，而是恰恰相反的**有限时爆破（Finite-time blow-up）**。

具体而言，论文第一页至第三页的**定理 1.1（Theorem 1.1）**是一个明确的**有条件命题（Conditional Theorem）**：
在自相似重标度坐标

$$
y = \frac{x}{\sqrt{T-t}}, \qquad s = \log\frac{T}{T-t}
$$

之下，假设存在一个非零、光滑、关于自相似时间 $s$ 周期（周期为 $S > 0$ ）、满足 $\kappa$ -重离散旋转对称群 $\Gamma$ 等变性的自相似旋转速度－压力剖面 $(W, q)$ ，满足自相似纳维－斯托克斯方程（第 2 页公式 (1.2)）：

$$
\partial_s W + \frac{1}{2}W + \frac{1}{2}(y \cdot \nabla)W + (W \cdot \nabla)W + \nabla q - \Delta W = 0, \qquad \nabla \cdot W = 0,
$$

以及远场衰减与线性化单周期算子（Monodromy operator）谱分离假设（第 2 页公式 (1.3)）；那么，便可在全空间 $\mathbb{R}^3$ 上构造紧支集光滑无散初值 $u_0 \in C_c^\infty(\mathbb{R}^3)$ ，并在三维环面 $\mathbb{T}^3$ 上构造光滑无散初值，使得对应的纳维－斯托克斯解在有限时刻 $T > 0$ 发生爆破，且速度梯度 $L^2$ 范数按精确自相似率发散：

$$
\|\nabla u(\cdot, t)\|_{L^2} \sim (T-t)^{-1/4} \qquad (t \uparrow T),
$$

对应于平方涡量（拟能，Enstrophy）按 $\|\omega(\cdot, t)\|_{L^2}^2 \sim (T-t)^{-1/2}$ 发散。

为了获得定理 1.1 前件所要求的这个非零自相似周期剖面 $(W, q)$ ，论文并没有给出任何纯解析构造，而是建立了一条横跨第七节（第 29–46 页）与附录 B（第 49–70 页）的**三级条件蕴涵链**：

$$
\exists\, d \in \mathcal{D}_B\ \text{满足附录 B 矩阵与单元证书条件}\ \mathsf{Valid}_B(d) \xRightarrow{\text{定理 B.14 (p.69)}} \exists\, c \in \mathcal{C}_7\ \text{满足第七节先验估计证书}\ \mathsf{Cert}_7(c) \xRightarrow{\text{定理 7.1 (p.35)}} \exists\, (W,q)\ \text{满足定理 1.1 剖面前件} \xRightarrow{\text{定理 1.1 (p.3)}} \mathbb{R}^3,\ \mathbb{T}^3\ \text{有限时爆破}.
$$

### 2.2 逐节核对中确认的合理分析环节（不妄加指控的部分）

在进入核漏病灶之前，严谨的数学审查必须首先把论文中逻辑自洽的经典分析步骤与真正存在核漏或证据缺失的环节严格区分开来。经逐页核对 79 页原件，以下五个环节在各自声明的局部前件下是规范的，**不应**被草率指控为核漏：
1. **自相似坐标变换（第 2 页公式 (1.4)）**：在任意 $t < T$ 的开区间上， $(x,t) \mapsto (y,s)$ 是光滑可逆微分同胚，只改变各阶范数的时空尺度因子，不抹除高频模态。
2. **无散空间上的模梯度商（第 30 页第 7.1 节公式 (7.2) 与第 7.8 节公式 (7.33)）**：论文在无散测试空间 $H$ 上定义模去梯度场的等价关系，这与勒雷（Leray）无散投影 $\mathbb{P}$ 完全同构；第 7.8 节伴随条件 (7.33) 对一切代表元成立，取 $v = 0$ 即迫使伴随测试场 $\psi$ 正交于梯度核，此处不存在“把有旋速度残差当梯度丢弃”的核漏。
3. **对称化双线性算子与有限余维里兹（Riesz）投影（第 10 页公式 (2.3) 与第 18–21 页引理 4.4–4.6）**：对称双线性算子 $K(\tau)(u,v) = -\frac{1}{2}e^{\tau\Delta}\mathbb{P}[(u\cdot\nabla)v + (v\cdot\nabla)u]$ 在对角线 $u=v$ 上精确还原原始非线性项 $(u\cdot\nabla)u$ ；第四节对单周期算子 $M$ 的不稳定子空间投影 $P_u \chi_n$ 采用向后收敛级数求解，而对稳定补空间 $(I - P_u)\chi_n$ 完整保留了向前递推，并未将稳定分量直接置零。
4. **局部紧性与强弱乘积收敛（第 37–43 页命题 7.5 与命题 7.10）**：从有限维伽辽金（Galerkin）近似过渡到极限解时，论文先由局部时空 $H^1$ 一致界利用奥班－利翁斯（Aubin–Lions）紧性引理提取局部 $L^2$ 强收敛 $v_k \to v$ ，再与弱收敛梯度 $\nabla v_k \rightharpoonup \nabla v$ 配对通过二次非线性项，并未犯“弱收敛直接乘弱收敛”的低级错误。
5. **有限维辅助外力的不动点消去（第 43–44 页公式 (7.30)–(7.37)）**：第七节先引入带有限维修正力 $\beta$ 的辅助方程，随后在拓扑度/不动点处利用 $\alpha' \in K$ 、 $\alpha = N(\alpha') \implies \alpha = \alpha'$ 及矩阵 $V$ 的可逆性推出总外力 $\beta^a + \beta = 0$ ，并非凭空抹去外力项。

### 2.3 纸面证明真正的三大结构病灶与核漏接缝

当上述外围分析框架被剥离之后，整篇 79 页论文将“无穷维三维流体扰动在近似自相似剖面 $W^r$ 附近具有严格正定强制性（Coercivity，即单周期谱被严格约束在假定不稳定模态之内）”这一最核心的动力学义务，全部压在了**附录 B（第 49–70 页）的加权乘子分部积分与有限树矩阵归约**上。正是在这一核心承重区，暴露出三重层层递进的数学病灶：

1. **第一重病灶（已获全闭式反例严格证伪的跨面奇异测度核漏）**：
   在第 53 页定义权函数 $D, Z$ 的半空间分侧样条表示，并在第 55–56 页推导核心强制性乘子不等式**命题 B.1 / 公式 (B.20)** 时，如果仅依据各半空间 $y_3 > 0$ 与 $y_3 < 0$ 上的分侧 $C^2$ 样条正则性并直接用体积海森（Hessian）矩阵 $H_{\mathrm{bulk}}$ 执行分部积分，而遗漏跨赤道平面 $\Sigma = \{y_3 = 0\}$ 的法向一阶导数接合前件 $[\partial_{y_3} D]_\Sigma = 0$ 与 $[\partial_{y_3} Z]_\Sigma = 0$ ，则分布海森算子 $D^2 W = H_{\mathrm{bulk}}\,dy + [\partial_{y_3} W]\,e_3\otimes e_3\,dS_\Sigma$ 中的**奇异狄拉克界面测度**被体积读口 $q_{\mathrm{bulk}}$ 直接抹零（ $\Sigma_W \in \ker q_{\mathrm{bulk}}$ ），却在无散场分部积分泛函 $f_v$ 中产生巨大的正向爆破贡献（ $\Sigma_W \notin \ker f_v$ ），直接击穿命题 B.1 的核心不等式 (B.20)！
2. **第二重病灶（强接合修复下的** $O(\delta^{-1})$ **薄层曲率税不可零剥离律与纸面－代码双标裂缝）**：
   哪怕通过在赤道平面 $|y_3| \le \delta\rho$ 两侧插入光滑过渡样条 $s_\delta(\eta)$ 强行恢复全局 $C^2(\mathbb{R}^3)$ 跨面接合，奇异面测度虽然转化为体积海森密度，但过渡薄层内的法向二阶导数必然以 $\max s_\delta'' = \frac{3}{2\delta}$ 的速度尖峰化；当薄层宽度 $\delta \downarrow 0$ 时，体积海森算子范数在薄层上的积分**绝不趋于零**，而是严格收敛回原来的奇异界面积分！这意味着曲率质量具有严格的拓扑－测度守恒性，绝不能以“薄层体积为 $O(\delta)$ ”为由在纸面估计中白白抹除。
3. **第三重病灶（纸面证明的“悬空桥墩”与流体暗流的静态读口盲区）**：
   在 79 页 PDF 原件中，直接承担非交换涡度拉伸与多谐波耦合吸收的**命题 B.1（第 55–56 页）、公式 (B.16) 的五类误差系数（第 54 页）、命题 B.4（第 59–60 页）以及定理 B.14 之后的附加实例条件（第 70 页）全部省略了纸面证明或省略了显式系数**，作者在正文中明言将它们外置给外部代码；而整条蕴涵链最左端的存在性基石——那个据称满足全部条件的数值证书 $d \in \mathcal{D}_B$ ，在整篇论文（第 1、4、70 页）和公开仓库中**根本没有提供任何数据字节**，仅印了一串 64 位十六进制 SHA-256 摘要（3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5），且验证该证书的 128 位区间算术程序同样未公开且游离于形式核之外。

下面我们用纯闭式数学推导，逐一对这三重结构进行彻底解剖。

---

## 第三章　第一重核心核漏实证：附录 B（第 53–56 页）半空间分侧样条权函数与命题 B.1 强制性乘子不等式（B.20）在赤道平面 $y_3 = 0$ 上的奇异界面测度逃逸

### 3.1 命题 B.1 与核心不等式 (B.20) 的分部积分接缝

在论文附录 B（第 49–56 页）中，作者旨在对满足离散旋转－反射对称群 $\Gamma$ （由绕 $y_3$ 轴旋转 $\pi/\kappa$ 并平移半周期的生成元 $(R_{\pi/\kappa}, 1/2)$ ，以及反射矩阵 $R_* = \operatorname{diag}(1, -1, -1)$ 生成）的无散扰动场 $v \in \mathcal{D}_S^\Gamma$ 建立加权强制性下界。

记自相似空间坐标为 $y = (y_1, y_2, y_3) \in \mathbb{R}^3$ ，球半径 $\rho = |y| = \sqrt{y_1^2 + y_2^2 + y_3^2}$ ，柱半径 $r = \sqrt{y_1^2 + y_2^2}$ ，竖直坐标 $z = y_3$ ，以及论文第 53 页引入的紧致化径向坐标与球面余纬参数：

$$
\sigma = \frac{\rho}{1+\rho} \in [0, 1), \qquad \eta = \frac{z}{\rho} \in [-1, 1].
$$

在第 53 页中，权函数 $D(y)$ 与 $Z(y)$ 被表示为分居上、下半空间 $z > 0$ 与 $z < 0$ 的 $(\sigma, \eta)$ 分片多项式样条。为了推导第 55–56 页命题 B.1 的主不等式 (B.20)，作者需要将含权函数的二阶与一阶二次型（见第 54 页公式 (B.16) 中的 $I_2, I_2', I_1', I_1, I_0$ ）与无散场的旋度平方项进行分部积分换位。

这一换位的核心数学恒等式如下：对任意光滑无散向量场 $u$ （即 $\nabla \cdot u = \sum_{i=1}^3 \partial_i u_i = 0$ ），由三维列维－奇维塔（Levi-Civita）张量收缩恒等式，点态成立：

$$
|\nabla u|^2 - |\operatorname{curl} u|^2 = \sum_{i,j=1}^3 (\partial_i u_j)^2 - \sum_{i,j=1}^3 \bigl((\partial_i u_j)^2 - \partial_i u_j\,\partial_j u_i\bigr) = \sum_{i,j=1}^3 \partial_i u_j\,\partial_j u_i.
$$

当我们将上式乘以标量权函数 $W(y)$ 并在全空间 $\mathbb{R}^3$ 上积分时，必须对下标 $i$ 和 $j$ 执行**两次分部积分**（利用无散条件 $\sum_{i=1}^3 \partial_i u_i = 0$ 与 $\sum_{j=1}^3 \partial_j u_j = 0$ ）：

**定理 3.1（分侧** $C^2$ **权函数在无散场分部积分下的分布海森分解与奇异界面测度定理）**
设权函数 $W : \mathbb{R}^3 \to \mathbb{R}$ 在全空间 $\mathbb{R}^3$ 上连续，在开上半空间 $\mathbb{R}_+^3 = \{z > 0\}$ 与开下半空间 $\mathbb{R}_-^3 = \{z < 0\}$ 上分别属于 $C^2$ 直至赤道分界面 $\Sigma = \{z = 0\}$ ，其开区域二阶经典导数矩阵 $H_W(y) = (\partial_{i}\partial_{j} W(y))_{1\le i,j\le 3}$ 局部可积，且在分界面 $\Sigma$ 上具有有限的上下侧法向一阶导数迹。记跨平面 $\Sigma$ 的法向导数跳跃为

$$
[\partial_z W](y_1, y_2) := \lim_{z \downarrow 0} \partial_z W(y_1, y_2, z) - \lim_{z \uparrow 0} \partial_z W(y_1, y_2, z).
$$

则 $W$ 在 $\mathbb{R}^3$ 上的二阶分布导数（分布海森张量测度 $D^2 W$ ）具有如下精确的勒贝格－拉东－尼科迪姆（Lebesgue–Radon–Nikodym）分解：

$$
D^2 W = H_W(y)\,dy + [\partial_z W](y_1, y_2)\,e_3 \otimes e_3\,dS_\Sigma, \tag{3.1}
$$

其中 $dS_\Sigma = dy_1\,dy_2$ 为赤道平面 $\Sigma = \{z=0\}$ 上的二维面积测度。进而，对任意紧支集 $C^2$ 无散向量场（或速降施瓦茨 Schwartz 无散向量场） $u$ ，恒有精确恒等式：

$$
\int_{\mathbb{R}^3} W(y)\bigl(|\nabla u|^2 - |\operatorname{curl} u|^2\bigr)\,dy = \langle D^2 W,\, u \otimes u \rangle = \int_{\mathbb{R}^3} u(y)^T H_W(y) u(y)\,dy + \int_{z=0} [\partial_z W](y_1, y_2)\,u_3(y_1, y_2, 0)^2\,dS_\Sigma. \tag{3.2}
$$

**证明**：将全空间积分拆分为上半空间 $\mathbb{R}_+^3$ 与下半空间 $\mathbb{R}_-^3$ 之和。在每个半空间内，因 $W$ 直至边界 $\Sigma$ 均为 $C^2$ 且 $\nabla \cdot u = 0$ ，第一次分部积分利用 $\partial_i(u_j \partial_j u_i) = \partial_i u_j\,\partial_j u_i + u_j \partial_j(\nabla \cdot u) = \partial_i u_j\,\partial_j u_i$ ，给出：

$$
\int_{\mathbb{R}_\pm^3} W \sum_{i,j=1}^3 \partial_i u_j\,\partial_j u_i\,dy = -\int_{\mathbb{R}_\pm^3} \sum_{i,j=1}^3 (\partial_i W) u_j \partial_j u_i\,dy \mp \int_{z=0} W(y_1, y_2, 0^\pm) \sum_{j=1}^3 u_j \partial_j u_3\,dS_\Sigma.
$$

由于 $W$ 跨平面 $z=0$ 连续，即 $W(y_1, y_2, 0^+) = W(y_1, y_2, 0^-)$ ，上下两侧的第一次边界积分符号相反、数值相等，故精确相消！接着对右端体积项关于下标 $j$ 执行第二次分部积分（再次利用 $\sum_{j=1}^3 \partial_j u_j = 0$ ）：

$$
-\int_{\mathbb{R}_\pm^3} \sum_{i,j=1}^3 (\partial_i W) u_j \partial_j u_i\,dy = \int_{\mathbb{R}_\pm^3} \sum_{i,j=1}^3 (\partial_j \partial_i W) u_i u_j\,dy \pm \int_{z=0} \sum_{i=1}^3 (\partial_i W)(y_1, y_2, 0^\pm)\,u_i u_3\,dS_\Sigma.
$$

对于切向导数 $i \in \{1, 2\}$ ，因 $W$ 在 $z=0$ 上连续，切向导数由同一平面迹 $W|_{\Sigma}$ 求导所得，故 $\partial_1 W(y_1, y_2, 0^+) = \partial_1 W(y_1, y_2, 0^-)$ 且 $\partial_2 W(y_1, y_2, 0^+) = \partial_2 W(y_1, y_2, 0^-)$ ，上下两侧的 $i=1,2$ 边界项再次精确相消。唯独法向分量 $i = 3$ （即 $\partial_z W$ ），当上下半空间相加时，留下一项不可相消的面测度积分：

$$
\int_{z=0} \bigl(\partial_z W(y_1, y_2, 0^+) - \partial_z W(y_1, y_2, 0^-)\bigr)\,u_3(y_1, y_2, 0)^2\,dS_\Sigma = \int_{z=0} [\partial_z W]\,u_3^2\,dS_\Sigma.
$$

这便严格证明了分布分解 (3.1) 与配对恒等式 (3.2)。证毕。

### 3.2 商映射 $q_{\mathrm{bulk}}$ 的核漏机制

现在审视论文第 54 页公式 (B.16) 与第 55–56 页命题 B.1 公式 (B.20)。
在公式 (B.16) 中，作者定义五类二次型系数：

$$
I_2 = D - \frac{3}{50}, \qquad I_2' = 1 - D, \qquad I_1' = \frac{1}{4} - Z, \qquad I_1 = Z - \|H_D\|_{\mathrm{op}} - \frac{3w}{50}, \qquad I_0 = -\|H_Z\|_{\mathrm{op}}, \tag{3.3}
$$

其中 $\|H_D\|_{\mathrm{op}}$ 与 $\|H_Z\|_{\mathrm{op}}$ 仅在开区域 $z \neq 0$ 上读取经典逐点海森矩阵的算子范数， intended 用于控制体积积分 $\sum_{k=1}^3 \int (\partial_k v)^T H_D (\partial_k v)\,dy$ 与 $\int v^T H_Z v\,dy$ 。

用商映射语言表述：
- **静态体积读口** $q_{\mathrm{bulk}}(D^2 W) := H_W$ 只读取分布海森测度 $D^2 W$ 的勒贝格绝对连续密度 $H_W$ ，将一切集中在零体积面 $\Sigma = \{z=0\}$ 上的奇异面测度 $\Sigma_W = [\partial_z W]\,e_3\otimes e_3\,dS_\Sigma$ 映射为零：

$$
\Sigma_W \in \ker q_{\mathrm{bulk}}.
$$

- **实际分部积分泛函** $f_u(D^2 W) := \langle D^2 W, u \otimes u \rangle$ 则同时读取体积密度与界面奇异测度。
- 当我们将定理 3.1 分别应用于二阶导数层（取 $W = D$ ， $u = \partial_k v$ 并对 $k=1,2,3$ 求和）与一阶导数层（取 $W = Z$ ， $u = v$ ）时，命题 B.1 不等式 (B.20) 的“右端减左端”差值泛函 $E_D(v)$ 与 $E_Z(v)$ （命题 B.1 要求 $\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$ ）精确展开为：

$$
E_D(v) = \sum_{k=1}^3 \int_{\mathbb{R}^3} (\partial_k v)^T H_D (\partial_k v)\,dy - \int_{\mathbb{R}^3} \|H_D\|_{\mathrm{op}}\,|\nabla v|^2\,dy + \int_{z=0} [\partial_z D]\,|\nabla v_3|^2\,dS_\Sigma, \tag{3.4}
$$

$$
E_Z(v) = \int_{\mathbb{R}^3} v^T H_Z v\,dy - \int_{\mathbb{R}^3} \|H_Z\|_{\mathrm{op}}\,|v|^2\,dy + \int_{z=0} [\partial_z Z]\,v_3^2\,dS_\Sigma. \tag{3.5}
$$

请看公式 (3.4) 与 (3.5) 的右侧：前两项之和 $\sum_k \int (\partial_k v)^T H_D (\partial_k v)\,dy - \int \|H_D\|_{\mathrm{op}}|\nabla v|^2\,dy$ 永远小于或等于零（这正是作者设计 $I_1 = -\|H_D\|_{\mathrm{op}} - \cdots$ 与 $I_0 = -\|H_Z\|_{\mathrm{op}}$ 的初衷！）。**但是，第三项——来自** $\ker q_{\mathrm{bulk}}$ **的奇异界面积分** $\int_{z=0} [\partial_z D]|\nabla v_3|^2\,dS_\Sigma$ **与** $\int_{z=0} [\partial_z Z]v_3^2\,dS_\Sigma$ **——完全没有被** $-\|H_D\|_{\mathrm{op}}$ **或** $-\|H_Z\|_{\mathrm{op}}$ **控制！**

更微妙的是：也许有人会问，论文中的扰动场 $v$ 受对称群 $\Gamma$ 中的反射算子 $R_* = \operatorname{diag}(1, -1, -1)$ 约束，对于轴对称零谐波场， $R_*$ 对称性岂不是迫使竖直速度分量 $v_3$ 关于 $z$ 为奇函数，从而在赤道平面 $z = 0$ 上恒有 $v_3(y_1, y_2, 0) = 0$ 吗？
答案是：**对**  $D$  **权项而言，出现在界面积分 (3.4) 中的不是**  $v_3$  **本身，而是**  $|\nabla v_3|^2 = |\partial_1 v_3|^2 + |\partial_2 v_3|^2 + |\partial_z v_3|^2$  **！尽管奇对称迫使**  $v_3|_{z=0} = 0$  **且切向导数**  $\partial_1 v_3|_{z=0} = \partial_2 v_3|_{z=0} = 0$  **，但奇函数关于**  $z$  **的一阶法向导数**  $\partial_z v_3$  **却是关于**  $z$  **的偶函数，在赤道平面**  $z = 0$  **上完全可以严格非零！而对**  $Z$  **权项而言，在非零谐波模态**  $\pm(2,1)$  **下，**  $R_*$  **对称由角度相位的奇偶性配平，竖直速度**  $v_3$  **本身在赤道平面**  $z = 0$  **上就严格非零！**

下面我们给出两族没有任何数值近似、100% 纯闭式有理系数与高斯矩的精确反例，直接从正面击穿删去跨面接合要求的命题 B.1 / 不等式 (B.20)。

---

### 3.3 全闭式反例族 A：轴对称紧支无散扰动在 $D$ 权接缝上的严格正破坏裕量与双模型分离

取论文附录 B 第 50–55 页的合法基准参数：时间周期 $S = 1$ ，旋转重数 $\kappa = 3$ ，对称群 $\Gamma = \langle (R_{\pi/3}, 1/2), (R_*, 0) \rangle$ ，参考剖面 $W^r = 0$ ，权重 $Z = 0$ ，离散索引集 $P_\lambda = P_\mu = \varnothing$ ，自由维数 $n = N = 0$ ， $K = \mathbb{R}^0$ ，辅助场列表为空， $c_\mu = 1/2$ ， $n_\lambda = n_{\nabla\lambda} = n_\mu = 0$ 。对时间不变的紧支无散场 $v$ ，算子作用简化为：

$$
F = T_1 v = \frac{1}{2}v + \frac{1}{2}(y \cdot \nabla)v - \Delta v, \qquad M v = -\Delta v, \qquad J = 0, \qquad \|v\|_\mu = 0, \qquad c_M^2 = \frac{50}{3}, \qquad w_* = \frac{39}{50}.
$$

此时由无散场帕塞瓦尔（Parseval）恒等式 $\langle T_1 v, -\Delta v\rangle = \|\Delta v\|_{L^2}^2 + \frac{1}{4}\|\nabla v\|_{L^2}^2$ ，不等式 (B.20) 中的辅助常数 $w$ 与 $3/50$ 完全相消， $\mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}}$ 精确等于公式 (3.4) 的 $E_D(v)$ 。

**构造分侧** $C^2$ **双权函数** $D_\pm$ ：
令五次埃尔米特（Hermite）平滑阶跃多项式为 $h(t) = 6t^5 - 15t^4 + 10t^3$ （满足 $h(0)=h'(0)=h''(0)=0$ ， $h(1)=1$ ， $h'(1)=h''(1)=0$ ，且在 $[0,1]$ 上 $h'(t) = 30t^2(1-t)^2 \ge 0$ ）。定义径向截断函数：

$$
\chi(\sigma) = \begin{cases} 0, & 0 \le \sigma \le \dfrac{1}{4}, \\[6pt] h(12\sigma - 3), & \dfrac{1}{4} < \sigma < \dfrac{1}{3}, \\[6pt] 1, & \dfrac{1}{3} \le \sigma < 1, \end{cases}
$$

并定义一对分侧 $C^2$ 多项式样条权函数：

$$
D_\pm(y) := \frac{1}{2} \pm \frac{1}{4}\chi(\sigma)\,|\eta| = \frac{1}{2} \pm \frac{1}{4}\chi\!\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho}, \qquad D_\pm(0) = \frac{1}{2}. \tag{3.6}
$$

显然， $D_+$ 与 $D_-$ 在原点邻域 $\rho \le 1/3$ 内恒等于常数 $1/2$ ，在上下半空间各自属于 $C^2$ 分片多项式，全域满足 $\frac{1}{4} \le D_\pm \le \frac{3}{4}$ （故 $I_2' = 1 - D_\pm \ge \frac{1}{4} > 0$ ），轴对称且关于 $z$ 偶对称。在 $\rho \ge \frac{1}{2}$ （即 $\sigma \ge \frac{1}{3}$ ）的区域内， $\chi(\sigma) = 1$ ， $D_+(y) = \frac{1}{2} + \frac{|z|}{4\rho}$ ，故跨赤道平面 $z=0$ 的法向一阶导数跳跃为：

$$
[\partial_z D_+](r) = \frac{1}{2r}, \qquad [\partial_z D_-](r) = -\frac{1}{2r} \qquad \left(r \ge \frac{1}{2}\right). \tag{3.7}
$$

**构造紧支集** $C^2$ **轴对称无散扰动场** $v_\varepsilon$ ：
取紧支集偶多项式母函数 $a(t) := (1 - t^2)_+^4 \in C_c^3(\mathbb{R})$ （支集为 $[-1, 1]$ ， $a(0)=1$ ），对 $0 < \varepsilon \le \frac{1}{4}$ ，定义轴对称流函数 $\psi_\varepsilon$ 与无散速度场 $v_\varepsilon$ （柱坐标分量 $(v_r, v_\varphi, v_3)$ ）：

$$
\psi_\varepsilon(r, z) := \varepsilon z\,a\!\left(\frac{r-1}{\varepsilon}\right) a\!\left(\frac{z}{\varepsilon}\right), \qquad v_r = -\frac{1}{r}\partial_z \psi_\varepsilon, \qquad v_\varphi = 0, \qquad v_3 = \frac{1}{r}\partial_r \psi_\varepsilon. \tag{3.8}
$$

记局部标度变量 $s = \frac{r-1}{\varepsilon} \in [-1,1]$ ， $t = \frac{z}{\varepsilon} \in [-1,1]$ ，则

$$
v_r(r,z) = -\frac{\varepsilon}{r}a(s)\bigl(a(t) + t a'(t)\bigr), \qquad v_3(r,z) = \frac{\varepsilon}{r}t a'(s)a(t). \tag{3.9}
$$

直接核验可知：
1. **严格无散与紧支正则性**： $\operatorname{div} v_\varepsilon = \frac{1}{r}\partial_r(r v_r) + \partial_z v_3 = -\frac{1}{r}\partial_r\partial_z \psi_\varepsilon + \frac{1}{r}\partial_z\partial_r \psi_\varepsilon \equiv 0$ ；支集位于环形管道 $\{|r-1| \le \varepsilon,\, |z| \le \varepsilon\}$ ，远离对称轴 $r=0$ 与原点（在支集上 $\rho \ge r \ge 1 - \varepsilon \ge \frac{3}{4} > \frac{1}{2}$ ，故 $\chi(\sigma) \equiv 1$ ）；且 $a \in C_c^3 \implies v_\varepsilon \in C_c^2(\mathbb{R}^3)$ 。
2. **严格满足** $\Gamma$ **对称性**： $v_\varepsilon$ 轴对称且时间不变， $v_r$ 关于 $z$ 为偶函数， $v_3$ 关于 $z$ 为奇函数，故在 $R_* = \operatorname{diag}(1, -1, -1)$ 反射下严格不变，属于合法空间 $\mathcal{D}_S^\Gamma$ 。
3. **赤道平面法向导数非零逃逸**：在平面 $z = 0$ （即 $t = 0$ ）上，虽然 $v_3(r,0) = 0$ 且 $\partial_r v_3(r,0) = 0$ ，但因为 $a(0) = 1$ ，法向导数为

$$
\partial_z v_3(r, 0) = \frac{a'(s)}{r} \neq 0!
$$

**定理 3.2（反例族 A 的精确有理破坏裕量与简化读口双模型分离定理）**
在上述合法弱合同数据与扰动场 $v_\varepsilon$ （取 $a(t) = (1-t^2)_+^4$ ， $\varepsilon = 2^{-16} = \frac{1}{65536}$ ）下，命题 B.1 的核心不等式 (B.20)（原命题要求 $E_D(v) := \mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} \le 0$ ）被 $D_+$ 严格击穿，其精确闭式有理下界为：

$$
E_{D_+}(v_\varepsilon) \ge \gamma_\varepsilon := \frac{\pi}{65536}\cdot\frac{633509743}{432432000} > 0. \tag{3.10}
$$

同时，在读取“体积海森算子范数场 $\|H_D\|_{\mathrm{op}}$ 、赤道平面权值 $D|_{z=0}$ 、共同上下界 $[1/4, 3/4]$ 及全部基准结构参数”的简化读口 $q_{\mathrm{red}}$ 下，双权函数 $(D_+, D_-)$ 完全同值（ $q_{\mathrm{red}}(D_+) = q_{\mathrm{red}}(D_-)$ ），但它们在 (B.20) 中的泛函输出却发生一正一负的严格对称撕裂：

$$
E_{D_+}(v_\varepsilon) \ge +\gamma_\varepsilon > 0, \qquad E_{D_-}(v_\varepsilon) \le -\gamma_\varepsilon < 0, \qquad E_{D_+}(v_\varepsilon) - E_{D_-}(v_\varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} > 0. \tag{3.11}
$$

**证明**：
第一步，精确计算界面奇异积分 $T_\varepsilon$ 。在支集 $r \in [1-\varepsilon, 1+\varepsilon] \subset [3/4, 5/4]$ 上， $[\partial_z D_+] = \frac{1}{2r}$ ， $|\nabla v_3(r,0)|^2 = |\partial_z v_3(r,0)|^2 = \frac{a'(s)^2}{r^2}$ ，面积元 $dS = 2\pi r\,dr = 2\pi \varepsilon (1 + \varepsilon s)\,ds$ 。由于 $1 + \varepsilon s \le \frac{5}{4}$ ，有 $(1 + \varepsilon s)^{-1} \ge \frac{4}{5}$ ，故

$$
T_\varepsilon = \int_{z=0} \frac{|\nabla v_3|^2}{2r}\,dS = \pi \varepsilon \int_{-1}^1 \frac{a'(s)^2}{1 + \varepsilon s}\,ds \ge \pi \varepsilon \int_{-1}^1 \frac{a'(s)^2}{(1 + \varepsilon s)^2}\,ds \ge \frac{16\pi}{25}\varepsilon A,
$$

其中一维有理矩 $A$ 为（利用 $a'(s) = -8s(1-s^2)^3$ ）：

$$
A = \int_{-1}^1 a'(s)^2\,ds = 64 \int_{-1}^1 s^2(1-s^2)^6\,ds = 128 \sum_{j=0}^6 \frac{(-1)^j \binom{6}{j}}{2j+3} = \frac{131072}{45045}. \tag{3.12}
$$

第二步，精确控制开区域体积海森算子范数 $\|H_{D_+}\|_{\mathrm{op}}$ 。在支集 $\rho \ge \frac{3}{4}$ 上， $D_+ = \frac{1}{2} + \frac{|z|}{4\rho}$ 。直接对 $\frac{z}{\rho}$ 求二阶笛卡尔导数：

$$
\nabla^2\!\left(\frac{z}{\rho}\right) = -\frac{e_3 \otimes y + y \otimes e_3 + z I_3}{\rho^3} + \frac{3z\,y \otimes y}{\rho^5},
$$

故在支集上 $\|H_{D_+}\|_{\mathrm{op}} = \frac{1}{4}\left\|\nabla^2\frac{|z|}{\rho}\right\|_{\mathrm{op}} \le \frac{3}{2\rho^2} \le \frac{3}{2(3/4)^2} = \frac{8}{3} < 3 =: M$ 。

第三步，精确控制速度梯度平方 $|\nabla v_\varepsilon|^2$ 与体积损失。在 $[-1,1]$ 上， $|a(t)| \le 1$ ； $a'(t)^2 = 64 t^2(1-t^2)^6$ 在 $t^2 = 1/7$ 处达到极大值 $\frac{64 \times 6^6}{7^7} = \frac{2985984}{823543} < 4$ ，故 $|a'(t)| \le 2$ ； $a''(t) = -8(1-t^2)^2(1-7t^2)$ 在 $t=0$ 处绝对值为 $8$ 、在 $t^2 = 3/7$ 处绝对值为 $\frac{256}{49} < 8$ ，故 $|a''(t)| \le 8$ 。代入轴对称柱坐标梯度五分量：

$$
|\nabla v_\varepsilon|^2 = |\partial_r v_r|^2 + |\partial_z v_r|^2 + \left|\frac{v_r}{r}\right|^2 + |\partial_r v_3|^2 + |\partial_z v_3|^2,
$$

在 $r \ge \frac{3}{4}$ 、 $\varepsilon \le \frac{1}{4}$ 下，五项的一致上界依次为 $|\partial_r v_r| \le \frac{28}{3}$ 、 $|\partial_z v_r| \le 16$ 、 $|v_r/r| \le \frac{4}{3}$ 、 $|\partial_r v_3| \le \frac{104}{9}$ 、 $|\partial_z v_3| \le 8$ ，平方求和得精确有理常数：

$$
|\nabla v_\varepsilon|^2 \le K := \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}. \tag{3.13}
$$

支集环形管道的体积为 $\operatorname{Vol}(\operatorname{supp} v_\varepsilon) = \int_{- \varepsilon}^{\varepsilon} dz \int_{1-\varepsilon}^{1+\varepsilon} 2\pi r\,dr = 8\pi \varepsilon^2$ 。在公式 (3.4) 中，前两项体积积分的绝对值之和至多为 $2 \int \|H_{D_+}\|_{\mathrm{op}}|\nabla v_\varepsilon|^2\,dy \le 2 M K \cdot 8\pi \varepsilon^2 = 16\pi M K \varepsilon^2$ 。因此：

$$
E_{D_+}(v_\varepsilon) \ge T_\varepsilon - 16\pi M K \varepsilon^2 \ge \pi \varepsilon\left(\frac{16}{25}A - 16 M K \varepsilon\right). \tag{3.14}
$$

将 $A = \frac{131072}{45045}$ 、 $M = 3$ 、 $K = \frac{43936}{81}$ 与 $\varepsilon = \frac{1}{65536}$ 代入括号内，执行精确有理数通分：

$$
\frac{16}{25}\cdot\frac{131072}{45045} - 16\times 3\times \frac{43936}{81}\times \frac{1}{65536} = \frac{2097152}{1126125} - \frac{1373}{3456} = \frac{633509743}{432432000} > 0,
$$

这便立得不等式 (3.10)。
最后，由于 $H_{D_-} = -H_{D_+}$ 且 $[\partial_z D_-] = -[\partial_z D_+]$ ，记权函数非常数部分 $\pm\frac{1}{4}\chi|\eta|$ 的完整分布配对线性项为 $\pm J_v$ ，共同体积算子范数罚项为 $C_v = \int \|H_{D_+}\|_{\mathrm{op}}|\nabla v_\varepsilon|^2\,dy \ge 0$ ，则 $E_{D_+}(v_\varepsilon) = J_v - C_v \ge \gamma_\varepsilon$ implies $J_v \ge C_v + \gamma_\varepsilon$ ，从而 $E_{D_-}(v_\varepsilon) = -J_v - C_v \le -2C_v - \gamma_\varepsilon \le -\gamma_\varepsilon < 0$ ，证得双模型分离 (3.11)。（注：若将 $a(t)$ 替换为 $C_c^\infty$ 光滑隆起函数 $a_\infty(t) = \exp(1 - (1-t^2)^{-1})\mathbf{1}_{|t|<1}$ 并取 $\varepsilon = 10^{-15}$ ，同样有 $E_{D_+}(v_\varepsilon) \ge \frac{4\pi}{9}\times 10^{-15} > 0$ ，说明反例与紧支扰动是否达到 $C^\infty$ 无关。）证毕。

---

### 3.4 全闭式反例族 B：施瓦茨高斯无散 $\pm(2,1)$ 模态扰动在 $Z$ 权接缝上的严格破坏下界（ $> 400c$ ）

为了证明奇异界面测度核漏不仅发生在二阶权 $D$ 与零谐波轴对称场上，而且同样发生在一阶权 $Z$ 与非零角度谐波场上，我们给出第二族完全独立的解析反例。

保持第 3.3 节的基准空数据（ $S=1, \kappa=3, W^r=0, D=0, P_\lambda=P_\mu=\varnothing, n=N=0$ ），取复多项式实部与虚部

$$
C_6(x,y) + i S_6(x,y) := (x + i y)^6,
$$

以及各向异性三维高斯包络函数

$$
g(x,y,z) := \exp\!\left(-\frac{x^2 + y^2}{2} - 6z^2\right).
$$

定义三维施瓦茨（Schwartz）向量场 $v = (v_1, v_2, v_3)$ ：

$$
v(x,y,z) := g(x,y,z)\,\bigl(-2 z y C_6(x,y),\ 2 z x C_6(x,y),\ -S_6(x,y)\bigr). \tag{3.15}
$$

同时，取分侧 $C^2$ 样条权函数

$$
Z(y) := c\,P(\sigma)\,|\eta| = c\,P\!\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho} \qquad (c > 0), \tag{3.16}
$$

其中径向截断函数 $P(\sigma)$ 在 $[0, \frac{1}{20}]$ 上恒为 $0$ ，在 $[\frac{1}{20}, \frac{1}{10}]$ 上为 $h(20\sigma - 1)$ ，在 $[\frac{1}{10}, 1)$ 上恒为 $1$ 。

**定理 3.3（反例族 B 的高斯** $\pm(2,1)$ **模态无散对称资格与** $> 400c$ **严格破坏定理）**
向量场 (3.15) 严格属于无散施瓦茨空间 $\mathcal{S}(\mathbb{R}^3) \cap \mathcal{D}_S^\Gamma$ ，在论文第 50 页公式 (B.2) 的基谐波展开 $E_\iota = \exp(i[2\pi(2\iota_2 - \iota_1)\theta + \kappa\iota_1\varphi])$ （ $\kappa=3$ ，时间不变 $\theta$ 无依赖即 $2\iota_2 = \iota_1$ ，角度频率 $\kappa\iota_1 = \pm 6 \implies \iota_1 = \pm 2, \iota_2 = \pm 1$ ）下精确对应于谐波模态 $\iota = \pm(2,1)$ 。其梯度与向量拉普拉斯算子的精确 $L^2$ 高斯矩及不等式 (B.20) 左端精确值为：

$$
\|\nabla v\|_{L^2(\mathbb{R}^3)}^2 = 14880\,\frac{\pi^{3/2}}{2\sqrt{3}}, \qquad \|\Delta v\|_{L^2(\mathbb{R}^3)}^2 = 431280\,\frac{\pi^{3/2}}{2\sqrt{3}}, \tag{3.17}
$$

$$
\mathrm{LHS}_{\mathrm{B.20}} = \frac{47}{50}\|\Delta v\|_{L^2}^2 + \frac{127}{625}\|\nabla v\|_{L^2}^2 = \frac{51053352}{125}\,\frac{\pi^{3/2}}{2\sqrt{3}} = \frac{8508892}{125}\sqrt{3}\pi^{3/2}. \tag{3.18}
$$

而在分侧 $C^2$ 权函数 $Z = c P(\sigma)|\eta|$ （ $c > 0$ ）下，不等式 (B.20) 的右端减左端差值 $\Delta := \mathrm{RHS}_{\mathrm{B.20}} - \mathrm{LHS}_{\mathrm{B.20}} = E_Z(v)$ 满足不依赖任何数值积分的纯闭式解析下界：

$$
\frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > \frac{26311}{64} > 400 > 0. \tag{3.19}
$$

**证明**：
第一步，验证精确无散性与 $\Gamma$ 对称性。因为 $C_6 + i S_6 = (x+iy)^6$ 是全纯多项式，由柯西－黎曼（Cauchy–Riemann）方程及欧拉齐次定理， $x\partial_x C_6 + y\partial_y C_6 = 6 C_6$ ， $x\partial_y C_6 - y\partial_x C_6 = -6 S_6$ 。直接计算水平散度与竖直散度：

$$
\partial_x v_1 + \partial_y v_2 = 2z g\bigl[(-y\partial_x C_6 + x\partial_y C_6) + (-xy + xy)C_6\bigr] = -12 z g S_6,
$$

$$
\partial_z v_3 = -\partial_z(g S_6) = +12 z g S_6,
$$

故 $\operatorname{div} v = -12 z g S_6 + 12 z g S_6 \equiv 0$ ！在柱坐标 $(r, \varphi, z)$ 下， $v_r = 0$ ， $v_\varphi = 2 z r^7 g \cos(6\varphi)$ ， $v_3 = -r^6 g \sin(6\varphi)$ 。在反射 $R_* : (x, y, z) \mapsto (x, -y, -z)$ （即 $\varphi \mapsto -\varphi, z \mapsto -z$ ）下， $C_6 = r^6\cos(6\varphi)$ 不变， $S_6 = r^6\sin(6\varphi)$ 变号， $z$ 变号，故 $(v_1, v_2, v_3)(R_* y) = (v_1, -v_2, -v_3)(y) = R_* v(y)$ ，且绕 $z$ 轴旋转 $\pi/3$ （ $\varphi \mapsto \varphi + \pi/3$ ）使 $6\varphi \mapsto 6\varphi + 2\pi$ 严格不变，故 $v \in \mathcal{D}_S^\Gamma$ 。

第二步，计算赤道界面奇异积分的正贡献。跨平面 $z=0$ 的法向导数跳跃为 $[\partial_z Z](r) = \frac{2c P(r/(1+r))}{r}$ 。在赤道平面 $z=0$ 上， $v_3(r,\varphi,0) = -r^6 e^{-r^2/2}\sin(6\varphi)$ （严格非零！）。不做原点小邻域截止时的完整高斯界面积分为（利用 $\int_0^{2\pi} \sin^2(6\varphi)\,d\varphi = \pi$ 及伽马积分 $\int_0^\infty r^{12} e^{-r^2}\,dr = \frac{11!!}{2^{7}}\sqrt{\pi} = \frac{10395}{128}\sqrt{\pi}$ ）：

$$
A_0 = \int_{z=0} \frac{2c}{r} v_3^2\,dS = 2\pi c \int_0^\infty r^{12} e^{-r^2}\,dr = \frac{10395}{64}\pi^{3/2}c. \tag{3.20}
$$

由于 $p(\rho) := P(\rho/(1+\rho))$ 在 $\rho \ge \frac{1}{9}$ （即 $\sigma \ge \frac{1}{10}$ ）上恒等于 $1$ ，原点截止损失至多为 $2\pi c \int_0^{1/9} r^{12}\,dr = \frac{2\pi c}{13\cdot 9^{13}}$ 。

第三步，精确计算外部开区域 $\rho \ge \frac{1}{9}$ 与过渡球壳 $\frac{1}{19} \le \rho \le \frac{1}{9}$ 上的体积海森损失。
在外部区域 $\rho \ge \frac{1}{9}$ 上， $Z(y) = c\frac{|z|}{\rho}$ 。在球坐标正交标架 $(e_\rho, e_\theta, e_\varphi)$ 下，记 $t = \frac{|z|}{\rho} \in [0,1]$ ，矩阵 $\rho^2 H_{|z|/\rho}$ 的精确形式为：

$$
\rho^2 H_{|z|/\rho} = \begin{pmatrix} 0 & -\sqrt{1-t^2} & 0 \\ -\sqrt{1-t^2} & -t & 0 \\ 0 & 0 & -t \end{pmatrix},
$$

其三个本征值为 $\frac{-t \pm \sqrt{4-3t^2}}{2}$ 与 $-t$ ；最大本征值绝对值 $\frac{t + \sqrt{4-3t^2}}{2}$ 在 $t = \frac{1}{\sqrt{3}}$ 处达到全域最大值 $\frac{2}{\sqrt{3}}$ 。因此：

$$
\|H_Z(y)\|_{\mathrm{op}} \le \frac{2c}{\sqrt{3}\rho^2} \qquad \left(\rho \ge \frac{1}{9}\right). \tag{3.21}
$$

利用 $\rho^2 \ge r^2$ ，计算加权高斯体积积分 $J := \int_{\mathbb{R}^3} \frac{|v|^2}{\rho^2}\,dy$ ：

$$
J \le \pi \int_{-\infty}^\infty dz \int_0^\infty e^{-r^2 - 12z^2}\bigl(4z^2 r^{13} + r^{11}\bigr)\,dr = \pi \left[4\cdot\frac{\sqrt{\pi}}{24\sqrt{12}}\cdot\frac{6!}{2} + \frac{\sqrt{\pi}}{\sqrt{12}}\cdot\frac{5!}{2}\right] = \frac{60}{\sqrt{3}}\pi^{3/2}.
$$

在公式 (3.5) 中， $\int v^T H_Z v\,dy - \int \|H_Z\|_{\mathrm{op}}|v|^2\,dy \ge -2\int \|H_Z\|_{\mathrm{op}}|v|^2\,dy$ ，故外部区域两项体积损失总和不超过 $2 \cdot \frac{2c}{\sqrt{3}} J = 80\pi^{3/2}c$ 。
在微小过渡球壳 $\frac{1}{19} \le \rho \le \frac{1}{9}$ 上，由 $|P'(\sigma)| \le \frac{75}{2}$ 、 $|P''(\sigma)| \le 6000$ 及乘积求导链式法则得 $\|H_Z\|_{\mathrm{op}} < 9000c$ ，而球壳上 $|v|^2 \le 2\rho^{12}$ ，积分 $\int_{\rho \le 1/9} |v|^2\,dy \le \frac{8\pi}{15\cdot 9^{15}}$ ，故两项过渡区体积损失总和不超过 $\frac{9600\pi c}{9^{15}}$ 。
将界面主项 $\frac{10395}{64}\pi^{3/2}c$ 减去外部体积最大损失 $80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ ，恰好余下 $\frac{10395 - 5120}{64}\pi^{3/2}c = \frac{5275}{64}\pi^{3/2}c$ ！再扣除两项极小有理指数尾项，利用 $\pi > 3 \implies \pi^{3/2} > 5$ ，即得 $\frac{\Delta}{c} > \frac{26375 - 64}{64} = \frac{26311}{64} > 400$ 。证毕。

---

## 第四章　强接合修复下的 $O(\delta^{-1})$ 薄层曲率税守恒律，以及纸面文本与代码强前件之间的语义裂缝

### 4.1 为什么奇异界面测度不能靠“微小圆角磨平”白白消除？

面对第三章的两族严格反例，一个最自然的修补冲动是：“既然分侧样条在赤道平面 $z = 0$ （即 $\eta = 0$ ）处的尖角 $|\eta|$ 产生了法向导数跳跃 $[\partial_z W] \neq 0$ ，那么我们只需在赤道平面两侧宽度为 $2\delta$ （ $0 < \delta \le 1$ ）的极薄夹层 $|\eta| \le \delta$ 内，把尖角 $|\eta|$ 磨平为一个二阶连续可微的偶多项式样条 $s_\delta(\eta)$ ，不就能让跨面跳跃 $[\partial_z W]_\Sigma = 0$ 彻底消失，从而恢复 $E_{D_\delta}(v) \le 0$ 了吗？”

这一追问触及了连续统偏微分方程中“分布奇异性”与“光滑曲率税”之间最深刻的守恒律。让我们写出唯一满足端点二阶射流（2-jet）匹配条件的极小四次偶多项式过渡样条：

$$
s_\delta(\eta) := \begin{cases} \dfrac{3\delta}{8} + \dfrac{3\eta^2}{4\delta} - \dfrac{\eta^4}{8\delta^3}, & |\eta| \le \delta, \\[10pt] |\eta|, & |\eta| \ge \delta, \end{cases} \qquad D_\delta(y) := \frac{1}{2} + \frac{1}{4}\chi(\sigma)\,s_\delta(\eta). \tag{4.1}
$$

在 $|\eta| < \delta$ 内部，求一阶与二阶导数：

$$
s_\delta'(\eta) = \frac{3\eta}{2\delta} - \frac{\eta^3}{2\delta^3}, \qquad s_\delta''(\eta) = \frac{3}{2\delta}\left(1 - \frac{\eta^2}{\delta^2}\right). \tag{4.2}
$$

在接缝端点 $\eta = \pm \delta$ 处， $s_\delta(\pm\delta) = \delta$ ， $s_\delta'(\pm\delta) = \pm 1$ ， $s_\delta''(\pm\delta) = 0$ ，故 $s_\delta \in C^2([-1,1])$ ，从而 $D_\delta \in C^2(\mathbb{R}^3)$ 是真正全局二阶连续可微的强合同权函数！此时，跨面法向导数跳跃 $[\partial_z D_\delta]_\Sigma = 0$ ，定理 3.1 中的奇异面测度项确实恒等于零，公式 (3.4) 给出的 $E_{D_\delta}(v) \le 0$ 重新成立。

**然而，原本集中在赤道平面上的奇异曲率去哪儿了？**
它分毫不差地转化为了薄层 $|\eta| \le \delta$ 内部呈 $O(\delta^{-1})$ 爆炸的**体积海森曲率税**！

**定理 4.1（强接合薄层修复的** $O(\delta^{-1})$ **曲率峰值与奇异界面质量守恒极限律）**
对于全局 $C^2(\mathbb{R}^3)$ 强接合权函数族 $D_\delta = \frac{1}{2} + \frac{1}{4}\chi(\sigma)s_\delta(\eta)$ （ $0 < \delta \le 1$ ）：
1. **点态曲率峰值反比发散**：样条二阶导数在 $\eta = 0$ 处达到峰值 $\max_{|\eta|\le\delta} s_\delta''(\eta) = \frac{3}{2\delta}$ （归一化界面核 $\frac{1}{2}s_\delta''$ 的峰值为 $\frac{3}{4\delta}$ ），其总曲率质量对一切 $\delta \in (0,1]$ 恒为守恒常数：

$$
\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2, \qquad \int_{-\delta}^{\delta} \frac{1}{2}s_\delta''(\eta)\,d\eta = 1. \tag{4.3}
$$

   在赤道平面 $z = 0$ （ $r > 0$ ）上， $D_\delta$ 的竖直二阶笛卡尔偏导数精确等于：

$$
\partial_{zz} D_\delta(r, 0) = \frac{3\,\chi\!\left(\frac{r}{1+r}\right)}{8\,\delta\,r^2} + \frac{3\,\delta\,\chi'\!\left(\frac{r}{1+r}\right)}{32\,r(1+r)^2}. \tag{4.4}
$$

2. **薄层体积海森罚项的不可零剥离极限**：对任意紧支集连续非负测试场 $f \in C_c(\mathbb{R}^3)$ （例如 $f = |\nabla v|^2$ ），当薄层厚度 $\delta \downarrow 0$ 时，尽管薄层 $\{|\eta| < \delta\}$ 的三维体积以 $O(\delta)$ 趋于零，但体积海森算子范数 $\|H_{D_\delta}\|_{\mathrm{op}}$ 在薄层上的体积积分**绝不趋于零**，而是严格收敛到未磨平前奇异界面测度的配对积分：

$$
\lim_{\delta \downarrow 0} \int_{|\eta| < \delta} \|H_{D_\delta}(y)\|_{\mathrm{op}}\,f(y)\,dy = \int_{z=0} \frac{\chi\!\left(\frac{r}{1+r}\right)}{2r}\,f(y_1, y_2, 0)\,dS_\Sigma > 0. \tag{4.5}
$$

**证明**：公式 (4.3) 由直接积分 $\int_{-\delta}^{\delta} \frac{3}{2\delta}(1-\eta^2/\delta^2)\,d\eta = \frac{3}{2\delta}\cdot\frac{4\delta}{3} = 2$ 得到。在 $z=0$ 处，由 $\eta = z/\rho$ 与 $\sigma = \rho/(1+\rho)$ ，有 $\partial_z \eta = \frac{1}{r}$ 、 $\partial_{zz}\eta = 0$ 、 $\partial_z \sigma = 0$ 、 $\partial_{zz}\sigma = \frac{1}{r(1+r)^2}$ ，代入复合求导链式法则及 $s_\delta(0) = \frac{3\delta}{8}$ 、 $s_\delta'(0) = 0$ 、 $s_\delta''(0) = \frac{3}{2\delta}$ ，即得 (4.4)。
对于极限 (4.5)，在远离原点的支集上（ $\chi$ 在 $\rho \le 1/3$ 内恒为零，故无原点奇性），将 $H_{D_\delta}$ 分解为主部秩一张量与有界余项： $H_{D_\delta} = A_\delta + R_\delta$ ，其中

$$
A_\delta(y) = \frac{1}{4}\chi(\sigma)s_\delta''(\eta)\,\nabla\eta \otimes \nabla\eta \succeq 0,
$$

而 $R_\delta$ 仅含 $s_\delta(\eta) = O(\delta)$ 、 $s_\delta'(\eta) = O(1)$ 及光滑坐标导数，故 $\|R_\delta\|_{\mathrm{op}}$ 关于 $\delta \in (0,1]$ 一致有界。因薄层 $|\eta| < \delta$ 在紧集上的体积为 $O(\delta)$ ，余项贡献 $\int_{|\eta|<\delta} \|R_\delta\|_{\mathrm{op}} f\,dy = O(\delta) \to 0$ 。对主部 $\|A_\delta\|_{\mathrm{op}} = \frac{1}{4}\chi(\sigma)s_\delta''(\eta)|\nabla\eta|^2$ ，固定柱坐标 $(r, \varphi)$ ，以 $z = \frac{r\eta}{\sqrt{1-\eta^2}}$ 换元，则 $|\nabla\eta|^2 = \frac{1-\eta^2}{\rho^2} = \frac{(1-\eta^2)^2}{r^2}$ ， $dz = \frac{r}{(1-\eta^2)^{3/2}}\,d\eta$ ，从而薄层竖直积分为

$$
\int_{|z| < r\delta/\sqrt{1-\delta^2}} \|A_\delta\|_{\mathrm{op}}\,f\,dz = \int_{-\delta}^{\delta} \frac{\chi(\sigma)}{4r} s_\delta''(\eta)\sqrt{1-\eta^2}\,f\,d\eta = \int_{-1}^{1} \frac{\chi}{4r}\cdot\frac{3}{2}(1-t^2)\sqrt{1-\delta^2 t^2}\,f(y_1,y_2,\tfrac{r\delta t}{\sqrt{1-\delta^2 t^2}})\,dt.
$$

由勒贝格控制收敛定理及 $\int_{-1}^1 \frac{3}{2}(1-t^2)\,dt = 2$ ，令 $\delta \downarrow 0$ 并对 $r\,dr\,d\varphi = dS_\Sigma$ 积分，立得 (4.5)。证毕。

### 4.2 纸面弱合同与代码强合同的分型定界

定理 3.2、定理 3.3 与定理 4.1 共同揭示了一条铁律：**在命题 B.1 的加权乘子不等式 (B.20) 中，跨赤道平面** $y_3 = 0$ **的法向接合条件与薄层体积海森罚项是生死攸关的承重结构。**
- 在论文第 53 页的文字叙述中，作者一方面将权函数写成了上下半空间的分侧样条公式，另一方面又笼统地使用了“定义在 $\mathbb{R}^3$ 上”和“属于 $C^2$ 类（of class $C^2$ ）”的字眼。
- 如果读者或验证者按照第 53 页的分侧样条公式，仅检验上下半空间各自的分片多项式 $C^2$ 正则性而删去跨 $y_3=0$ 平面的法向导数接合前件（即**分侧无接合弱合同**），那么命题 B.1 的主不等式 (B.20) **已被上述反例族 A（公式 (3.10)）与反例族 B（公式 (3.19)）从数学上彻底证伪**（这也正是作者公开仓库第 2 号与第 3 号问题单中被外部研究者独立捕捉到的接缝漏洞，而我们在此给出了不依赖任何浮点积分的全闭式解析证明）。
- 反之，如果按照全空间 $C^2(\mathbb{R}^3)$ **强合同**解读（作者在公开仓库的伴随说明文件 CellLayerChallenge 与 ExtendedCoerciveChallenge 中，确实对权函数显式加上了带 $(-1)^o$ 奇偶符号的跨平面二阶接合条件与全空间二阶连续可微条件，从而在定义域入口处排除了未接合的 $D_\pm$ 与 $Z$ ），那么反例族 A 与 B 因不满足跨面一阶接合（在支集上 $\frac{1}{4} \neq -\frac{1}{4}$ 且 $cP \neq -cP$ ）而被挡在强合同定义域之外；但此时，**任何满足强合同的真实权函数证书都必须在** $I_1 = Z - \|H_D\|_{\mathrm{op}} - \frac{3w}{50}$ **与** $I_0 = -\|H_Z\|_{\mathrm{op}}$ **中真金白银地支付定理 4.1 所揭示的跨平面二阶曲率成本**！而作者所谓的数值证书是否真的在不损失强制性裕量的前提下支付了这笔成本，引出了下面第五章的第二重核心审查。

---

## 第五章　第二重结构审查：纸面证明的“悬空桥墩”——被省略的 (B.16)/B.1/B.4 耦合系数、未公开的外部数值证书与树状 Schur 主元刚性判据

### 5.1 为什么说该 79 页 PDF 本身不是一份自足闭合的纸面证明？

即使我们给予作者最强的全局 $C^2(\mathbb{R}^3)$ 跨面接合解读，将 79 页 PDF 作为一份**数学纸面证明**来衡量，它依然存在四座在纸面上完全悬空的“无桥墩跨梁”：

| 纸面位置 | 承重数学内容 | 79 页 PDF 原件的真实状态 | 对纸面闭合性的实质影响 |
|:---|:---|:---|:---|
| 第 1、4、70 页 | 满足附录 B 全部不等式与接合条件的有限维数值证书实例 $d \in \mathcal{D}_B$ | **零数据字节**；全文仅印出一串 64 位十六进制 SHA-256 哈希值 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 | 蕴涵链最左端的存在性前件 $\exists\, d \in \mathcal{D}_B\,\mathsf{Valid}_B(d)$ 在纸面上完全无法独立核验 |
| 第 4、10 页（第 1.5 节） | 对数值证书的 128 位区间算术（Arb / FLINT）矩阵与样条不等式验证 | 作者明言该区间算术计算位于形式化内核之外，且公开仓库中未提供该证书数据与验证输出 | 外部数值接触（External Contact）处于黑箱未公开态 |
| 第 54–56 页（公式 (B.16) 与命题 B.1） | 五类二次型系数中的高阶误差吸收系数，以及从分侧样条到全局乘子下界 (B.20) 的完整证明 | 第 54 页 (B.16) 省略了显式误差系数；第 55–56 页仅给出分部积分概要，声明完整证明移交外部代码 | 纸面读者无法仅凭 PDF 重建完整的标量系数不等式 |
| 第 59–60 页（命题 B.4）与第 70 页（定理 B.14 之后） | 从任意无散扰动到有限空间单元未知量、压力规范、跨单元迹拼接、无穷谐波尾界 (B.32)–(B.34) 及第 70 页列出的 7 项未展开条件 | 命题 B.4 证明在纸面被省略；第 70 页在定理 B.14 证明末尾直接罗列了“单元压力归一化、局部到全局未知量映射、 $W^r$ 遗漏谐波耦合、 $y_3=0$ 附近矩形单元、 $\iota\mapsto -\iota$ 对称”等未在纸面写出的附加条件 | 蕴涵箭头 $\mathsf{Valid}_B(d) \implies \mathsf{Cert}_7(\Phi(d))$ 在纸面上不是一个闭合、可枚举的公理合同 |

在严格的数学规范下，**一份哈希摘要不是一个数学对象，一段“详见外部代码”的声明也不是一段纸面证明**。因此，该 79 页 PDF 实质上是一份“关于定理 1.1、定理 7.1 及附录 B 树状矩阵归约框架的条件纲领与扩展摘要”，而非自足完备的纳维－斯托克斯有限时爆破纸面证明。

### 5.2 引理 B.7 树状二次型递推与命题 B.8 自由块补偿的完整数学重建及同域破缺判据

尽管外部大矩阵证书未公开，但附录 B 第 62–64 页的**引理 B.7（树状分块二次型正定传递）**与**命题 B.8（自由块非正性与受限严格正定推出唯一自由补偿）**构成了整套有限维证书的代数心脏。我们在此给出其完整的闭式数学证明，并确立检验任何此类矩阵证书是否发生核漏或正定崩溃的**两条精确充要判据**。

**定理 5.1（引理 B.7 任意有限树加权杨氏不等式消去与命题 B.8 自由补偿直和分解定理）**
设 $X = P \oplus F$ 为有限维实向量空间（ $P$ 为主扰动块， $F$ 为自由参数块）， $\mathcal{T}$ 为任意有限有根树。对每个节点 $\xi \in \mathcal{T}$ ，给定正权重向量 $w_{\xi,i} > 0$ 、枢轴坐标子集 $U_\xi$ 、枢轴系数 $p_{\xi,j}$ 、行界 $m_{\xi,i} > 0$ 、可舍弃列矩阵 $Y_\xi'$ 、约束列矩阵 $Y_\xi$ 、对称矩阵 $H_\xi, K_\xi, N_\xi, V_\xi$ 及逐项非负误差矩阵 $H_\xi', K_\xi'$ ，满足论文第 62 页公式 (B.39)–(B.40)：

$$
H_\xi[x] \le N_\xi[x] + \sum_{\xi' \in \operatorname{child}(\xi)} V_{\xi'}[x] + H_\xi'[|x|], \qquad V_\xi[x] \le K_\xi[x] - \sum_{j \notin U_\xi} m_{\xi,j} x_j^2 + K_\xi'[|x|], \tag{5.1}
$$

$$
R_\xi := H_\xi - \operatorname{diag}_{U_\xi}(p_\xi) - Y_\xi' (Y_\xi')^T + Y_\xi Y_\xi^T - K_\xi, \qquad \sum_j \bigl(|R_{\xi,ij}| + H_{\xi,ij}' + K_{\xi,ij}'\bigr)\frac{w_{\xi,i}}{w_{\xi,j}} \le m_{\xi,i}, \qquad \bar{p}_{\xi,j} \le p_{\xi,j} - m_{\xi,j}. \tag{5.2}
$$

则：
1. **单节点加权杨氏（Young）下界**：由 $2|x_i x_j| \le \frac{w_{\xi,i}}{w_{\xi,j}}x_i^2 + \frac{w_{\xi,j}}{w_{\xi,i}}x_j^2$ 及矩阵对称性，必有 $-R_\xi[x] + (H_\xi' + K_\xi')[|x|] \le \sum_i m_{\xi,i} x_i^2$ ，从而

$$
N_\xi[x] + \sum_{\xi' \in \operatorname{child}(\xi)} V_{\xi'}[x] - V_\xi[x] \ge \sum_{j \in U_\xi} \bar{p}_{\xi,j} x_j^2 - |Y_\xi^T x|^2. \tag{5.3}
$$

2. **全树求和传递相消与受限严格正定**：对有限树 $\mathcal{T}$ 全部节点求和，每个非根节点 $\xi$ 恰好作为某个父节点的子节点出现一次，故内部传递项 $V_\xi[x]$ 在左端一正一负精确对消；若根节点传递矩阵半正定 $V_{\mathrm{root}}[x] \ge 0$ ，且每个坐标 $j$ 在全树上的累积枢轴下界 $D_{jj} := \sum_{\xi : j \in U_\xi} \bar{p}_{\xi,j} > 0$ ，则总矩阵 $N := \sum_{\xi \in \mathcal{T}} N_\xi$ 满足

$$
N \succeq D - Y Y^T \qquad \bigl(Y := [Y_\xi]_{\xi \in \mathcal{T}}\bigr), \tag{5.4}
$$

   进而在约束核子空间 $S := \ker Y^T \subseteq X$ 上严格正定： $N[x] \ge (\min_j D_{jj})|x|^2 > 0$ （ $\forall\, x \in S \setminus \{0\}$ ）。
3. **自由块直和分解与唯一补偿公式**：若在自由子空间 $F = \{0\} \oplus F$ 上有 $N|_F \preceq 0$ （由论文第 64 页公式 (B.44) 取零扰动 $v=0$ 时右端为 $-|\zeta|^2/1000 \le 0$ 保证），且约束列总数满足 $\#\operatorname{cols}(Y) \le \dim F$ ，则必有 $S \cap F = \{0\}$ 及维数夹逼：

$$
\dim F \ge \#\operatorname{cols}(Y) \ge \operatorname{rank}(Y) = \operatorname{codim}(S) \ge \dim F \implies X = S \oplus F, \qquad \operatorname{rank}(Y) = \#\operatorname{cols}(Y) = \dim F. \tag{5.5}
$$

   将 $Y^T$ 按 $P \oplus F$ 分块写作 $Y^T = (Y_p^T,\ Y_f^T)$ ，则 $Y_f$ 必为可逆方阵，对任意主块状态 $x_p \in P$ ，存在唯一自由补偿 $x_f = -(Y_f^T)^{-1} Y_p^T x_p \in F$ 使得 $(x_p, x_f) \in S = \ker Y^T$ （若不要求唯一性，则存在补偿 $x_f$ 的充要条件是商核闭合条件 $\operatorname{im} Y_p^T \subseteq \operatorname{im} Y_f^T \iff \ker Y_f \subseteq \ker Y_p$ ）。

在此精确代数结构之上，我们澄清两个极易被粗糙直觉误用的判定界限，并给出**同域破缺的充要定理**：
- **定理 5.2（同域不可删观察行的核漏证人判据）**：在受限子空间 $\operatorname{im} J$ （ $J$ 为 $S = \ker Y^T$ 的满列秩基底矩阵）上，从观察矩阵 $H$ 中删去第 $i$ 行得到 $H_{-i}$ 后，目标线性读出 $B$ 发生核漏（即不再能由 $H_{-i}$ 唯一重构），**当且仅当存在同域核漏证人向量** $z$ 满足：

$$
H_{-i} J z = 0 \qquad \text{且} \qquad B J z \neq 0. \tag{5.6}
$$

  （注：若被删去的是线性冗余行，例如 $H = \begin{pmatrix} 1 & 1 \\ 2 & 2 \end{pmatrix}$ 、 $B = \begin{pmatrix} 1 & 1 \end{pmatrix}$ 删去第一行，则 $\ker(H_{-i}J) \subseteq \ker(BJ)$ 依然成立，不会发生核漏；因此绝不能笼统宣称“任删一行必核漏”，而必须按 (5.6) 构造同域非零核漏证人。）
- **定理 5.3（受限子空间上真实主元翻号的瑞利商阈值判据）**：设对称矩阵 $N = L D L^T$ 在受限子空间 $S = \operatorname{im} J$ 上的诱导二次型 $Q_S := J^T N J \succ 0$ 严格正定。若将 $D$ 的第 $j$ 个正主元 $d_j > 0$ 翻号为 $-d_j$ （即 $N' = N - 2d_j L e_j e_j^T L^T$ ），令受限投影向量为 $b := J^T L e_j$ ，定义无量纲瑞利（Rayleigh）商阈值：

$$
\tau := 2 d_j\, b^T Q_S^{-1} b \ge 0. \tag{5.7}
$$

  则翻号后的受限二次型 $Q_S' = J^T N' J = Q_S - 2d_j b b^T$ 满足三分律：
  1) 当 $\tau < 1$ 时（例如被翻号的主元方向与受限子空间 $S$ 正交或耦合极弱）， $Q_S' \succ 0$ 在 $S$ 上**依然严格正定**；
  2) 当 $\tau = 1$ 时， $Q_S' \succeq 0$ 退化为半正定且产生非零零空间方向 $z_0 = Q_S^{-1} b$ ；
  3) **当且仅当** $\tau > 1$ **时**， $Q_S'$ 在受限子空间 $S$ 上真正出现严格负方向，且显式负证人向量 $z_- := Q_S^{-1} b$ 给出严格负值：

$$
z_-^T Q_S' z_- = \bigl(b^T Q_S^{-1} b\bigr)(1 - \tau) < 0. \tag{5.8}
$$

定理 5.2 与定理 5.3 告诉我们：对于论文未公开的外部证书（SHA-256 前缀 3f7a335b）以及被省略的 (B.16)/B.1/B.4 耦合系数，任何有效的科学审计都必须落实到 (5.6) 的同域核漏证人与 (5.7)–(5.8) 的受限瑞利阈值 $\tau > 1$ 上。

---

## 第六章　第三重流体暗流本源：三维纳维－斯托克斯方程中“固定欧氏二次读口”的整体反号盲区、论文 (B.18) 的偶性边界，以及随流协变逆度规下的纯平方耗散真体

现在，我们回到第一作者最核心的理论洞察：**“过去数学家把大量真体与高阶语义漂移伪影给混淆了。”**
在三维不可压纳维－斯托克斯流体动力学中，这种“真体与伪影的混淆”究竟是如何发生的？为什么固定欧氏坐标系下的静态二次范数读口注定看不见流体演化的下一拍方向？而当我们在随流协变逆度规下还原流体真体时，非交换涡度拉伸项又是如何被精确配平为纯平方耗散的？

### 6.1 静态欧氏全谱二次读口的核漏：同能谱双初值 $\pm 17U$ 的 $4913$ 拟能导数撕裂

在经典调和分析与能量法中，研究者习惯于用速度场或涡度场在固定欧氏坐标系下的各阶索伯列夫（Sobolev）二次范数——甚至全部傅里叶模态上的逐模二次能谱矩阵——来刻画流体的“强度”：

$$
q_{\mathrm{static}}(u) := \Bigl(\bigl\{\hat{u}(k)\hat{u}(k)^*\bigr\}_{k \in \mathbb{Z}^3},\ \|u\|_{L^2}^2,\ \|\omega\|_{L^2}^2,\ \|\nabla\omega\|_{L^2}^2,\ \langle u, \omega\rangle\Bigr). \tag{6.1}
$$

这是一个典型的零阶静态投影读口。它在整体速度反号变换 $u \mapsto -u$ 下是完全偶对称（盲视）的： $q_{\mathrm{static}}(+u) = q_{\mathrm{static}}(-u)$ 。然而，三维纳维－斯托克斯方程的真体演化却包含三次非交换涡度拉伸项 $\langle \omega, (\omega \cdot \nabla)u\rangle$ ！

**定理 6.1（三维环面真实纳维－斯托克斯流在全谱静态二次读口下的同签名双模型撕裂定理）**
在体积归一化的三维周期环面 $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ 上，定义如下仅含八个非零傅里叶频率 $\pm e_1, \pm e_2, \pm e_3, \pm(e_1+e_2)$ 的光滑无散零均值速度场：

$$
U(x,y,z) := \bigl(\sin y + \sin z,\ \sin x,\ \sin x - \sin(x+y)\bigr). \tag{6.2}
$$

对任意实振幅 $a > 0$ ，考察一对正负孪生光滑无散初值 $u_0^\pm := \pm a U$ ，并设 $u^\pm(t,x)$ 为由其出发的真实局部光滑纳维－斯托克斯解（在 $s > 5/2$ 的索伯列夫球 $C([0,T], H^s(\mathbb{T}^3))$ 上由热半群杜哈梅尔 Duhamel 压缩映射与高阶自举保证共同局部光滑寿命 $T > 0$ 及 $t=0$ 处的时间可微性）。则：
1. **在全谱静态二次读口** $q_{\mathrm{static}}$ **下完全恒同**：在初始时刻 $t = 0$ ， $u_0^+$ 与 $u_0^-$ 的每一个傅里叶单模厄米矩阵 $\hat{u}_0^\pm(k)\hat{u}_0^\pm(k)^*$ 逐模相等，且动能 $E$ 、平方涡量（拟能） $Y = \langle |\omega|^2\rangle$ 、涡度梯度平方 $Z = \langle |\nabla\omega|^2\rangle$ 及螺旋度（Helicity） $H = \langle u, \omega\rangle$ 完全相同：

$$
E(u_0^\pm) = \frac{5}{2}a^2, \qquad Y(u_0^\pm) = 3a^2, \qquad Z(u_0^\pm) = 4a^2, \qquad H(u_0^\pm) = 0. \tag{6.3}
$$

2. **在真实纳维－斯托克斯演化算子下的瞬时撕裂**：在 $t = 0$ 处，真实旋度演化方程给出平方涡量时间导数

$$
Y_\pm'(0) = \left.\frac{d}{dt}\right|_{t=0} \langle |\omega^\pm(t)|^2\rangle = 2\langle \omega_0^\pm,\, (\omega_0^\pm \cdot \nabla)u_0^\pm\rangle - 2\nu\langle |\nabla\omega_0^\pm|^2\rangle = \pm\frac{1}{2}a^3 - 8\nu a^2. \tag{6.4}
$$

   特别地，取黏性系数 $\nu = 1$ 、振幅 $a = 17$ ，则正负孪生解在 $t = 0$ 处的平方涡量变化率一正（瞬时涡度拉伸主导增长）一负（瞬时协同黏性耗散衰减），其定量分离精确达到：

$$
Y_+'(0) = +\frac{289}{2}, \qquad Y_-'(0) = -\frac{9537}{2}, \qquad Y_+'(0) - Y_-'(0) = 17^3 = 4913 \neq 0! \tag{6.5}
$$

**证明**：直接求导得 $\operatorname{div} U = 0$ ，旋度 $\omega = \nabla \times U = (-\cos(x+y),\ \cos z - \cos x + \cos(x+y),\ \cos x - \cos y)$ ，速度梯度矩阵为

$$
L = \nabla U = \begin{pmatrix} 0 & \cos y & \cos z \\ \cos x & 0 & 0 \\ \cos x - \cos(x+y) & -\cos(x+y) & 0 \end{pmatrix}.
$$

由三角函数正交归一化均值 $\langle \cos^2 x\rangle = \frac{1}{2}$ 立得 (6.3)。对于三次涡度拉伸项 $\langle \omega^T L \omega\rangle$ ，展开后凡含独立因子 $\cos z$ 一次幂或非共振频率之和的项均值皆为零，唯一非零共振三波项来自 $\cos x \cos y \cos(x+y)$ ：

$$
\langle \omega^T L \omega\rangle = \bigl\langle \cos x \cos y (\cos x \cos y - \sin x \sin y)\bigr\rangle = \langle \cos^2 x\rangle\langle \cos^2 y\rangle = \frac{1}{2}\times\frac{1}{2} = \frac{1}{4}.
$$

故 $2\langle \omega_0^\pm, L_0^\pm \omega_0^\pm\rangle = \pm 2 a^3 \cdot \frac{1}{4} = \pm \frac{1}{2}a^3$ ，减去黏性耗散 $2\nu Z(u_0^\pm) = 8\nu a^2$ 即得 (6.4)；代入 $a=17, \nu=1$ 得 $\frac{4913}{2} - 2312 = \frac{289}{2}$ 与 $-\frac{4913}{2} - 2312 = -\frac{9537}{2}$ ，差值恰为 $4913$ 。证毕。

### 6.2 论文公式 (B.18) 线性化参考剖面二次型的偶性方法论边界

在 Alpöge 与 Buckmaster 的论文第 55 页公式 (B.18) 中，作者围绕一个固定的参考剖面 $W^r$ （其对称应变张量为 $S_r = \operatorname{sym}(\nabla W^r)$ ，参考涡度为 $\omega_r = \operatorname{curl} W^r$ ）写出了扰动场 $v$ （扰动涡度 $\omega_v = \operatorname{curl} v$ ）的涡度拉伸与对流耦合二次泛函：

$$
J_{W^r}(v) := -\omega_v \cdot S_r \omega_v + \bigl((v \cdot \nabla)\omega_r\bigr) \cdot \omega_v + \frac{1}{2}\sum_{k=1}^3 \nabla(\omega_r)_k \cdot (v \times \partial_k v). \tag{6.6}
$$

这里必须指出一条精确的方法论边界：
虽然 $J_{W^r}(v)$ 引入了固定参考剖面 $\omega_r$ 与扰动谐波之间的跨模态耦合（从而能够区分扰动场不同谐波分量之间的相对相位），但因为 $W^r$ 被固定为背景常数场，公式 (6.6) 中的**每一项都恰好包含两个关于扰动** $v$ **的一次线性因子**！因此，在扰动整体反号变换 $v \mapsto -v$ 之下，必有：

$$
J_{W^r}(-v) = J_{W^r}(v). \tag{6.7}
$$

也就是说，固定背景剖面下的线性化二次型 $J_{W^r}(v)$ 本身关于扰动 $v$ 仍然是严格偶对称的（这并不妨碍它在附录 B 中作为二次强制性下界的一部分，但意味着它只编码了相对于背景场 $W^r$ 的二阶微扰谱，而未直接编码扰动自身的三次自相互作用 $B(v,v)$ 的奇次符号）。论文中对非线性自相互作用 $B(v,v)$ 的控制，完全依赖于先由线性化二次强制性获得足够小范数的先验球，再通过第七节的压缩不动点将三次项压入二阶主部之下——这也再次说明了为什么第三章与第五章所审查的附录 B 二次强制性不等式 (B.20) 是整座大厦不容有失的唯一地基！

### 6.3 随流协变逆度规 $g = C^{-1}$ 下的纯平方耗散真体与全残差守恒方程

为什么在固定欧氏度规 $I$ 下看似不可驯服的三次非交换涡度拉伸项 $2\omega^T L \omega$ ，一旦回到随流演化的几何真体中，其内在结构就会豁然开朗？

因为在固定欧氏坐标系中观察流体，就像站在静止河岸上用固定的直角网格去量度一个正在旋转拉伸的漩涡——漩涡每拉伸一分，固定网格就记录下一笔“能量凭空生成”的伪影（即 $\omega^T L \omega$ ）。反之，如果我们让度量衡本身——即一个光滑对称正定协变度规张量 $C(t,x) = C(t,x)^T \succ 0$ 及其逆度规 $g(t,x) := C(t,x)^{-1}$ ——沿着同一个对流－扩散算子 $P_\nu = \partial_t + u \cdot \nabla - \nu \Delta$ 随流体微团同步演化，那么拉伸与度规形变就会在每一拍发生精确的代数对偶湮灭！

**定理 6.2（任意维随流协变逆度规演化的全残差恒等式与纯平方耗散闭合定律）**
设空间维数 $d \ge 2$ 、向量通道维数 $m \ge 1$ 任意有限，记抛物对流－扩散算子为 $P_\nu = D_t - \nu \Delta$ （其中 $D_t = \partial_t + u \cdot \nabla$ ， $\nu > 0$ ）。设 $C(t,x) \in \mathbb{R}^{m\times m}$ 为共同光滑区间上的对称正定矩阵场（ $C = C^T \succ 0$ ）， $g := C^{-1}$ 为其逆度规，定义协变拉回涡度向量 $z := g\omega = C^{-1}\omega$ 及随流协变拟能密度：

$$
\mathcal{E}(t,x) := \omega^T C^{-1} \omega = \omega^T g \omega = z^T C z. \tag{6.8}
$$

若涡度场 $\omega$ 与度规载体 $C$ 分别满足带一般生成元 $L, G$ 、一般扩散系数 $\nu, \kappa$ 及一般源残差 $r_\omega, R_C$ 的演化方程：

$$
P_\nu \omega = L\omega + r_\omega, \qquad (D_t - \kappa \Delta)C = G C + C G^T + R_C, \tag{6.9}
$$

则在完全保持非交换矩阵乘法次序的前提下，协变拟能密度 $\mathcal{E}$ 满足如下**零近似全残差演化恒等式**：

$$
P_\nu\bigl(\omega^T C^{-1} \omega\bigr) = -2\nu \sum_{i=1}^d (\partial_i z)^T C (\partial_i z) + 2 z^T r_\omega - z^T R_C z + z^T\bigl[(L - G)C + C(L - G)^T\bigr]z + (\nu - \kappa)z^T (\Delta C) z. \tag{6.10}
$$

特别地，当且仅当后四项合流残差消失——其统一充分条件为**同生成元（** $G = L$ **）、同扩散率（** $\kappa = \nu$ **）且无外源（** $r_\omega = 0, R_C = 0$ **）**（或者生成元失配满足 $C$ -反对称条件 $(L-G)C + C(L-G)^T = 0$ ，即 $L - G = K C^{-1}$ 且 $K^T = -K$ ）时，全部一阶涡度拉伸项被协变度规演化精确湮灭，化为**纯平方耗散定律**：

$$
P_\nu\bigl(\omega^T C^{-1} \omega\bigr) = -2\nu \sum_{i=1}^d \bigl(\partial_i(C^{-1}\omega)\bigr)^T C\,\bigl(\partial_i(C^{-1}\omega)\bigr) \le 0! \tag{6.11}
$$

**证明**：对恒等式 $C g = I$ 求导（严格保持非交换矩阵顺序），得一阶导数 $\partial_i g = -g(\partial_i C)g$ ， $D_t g = -g(D_t C)g$ ，以及二阶导数：

$$
\partial_{ii} g = 2 g(\partial_i C) g (\partial_i C) g - g(\partial_{ii} C)g \implies P_\nu g = -g(P_\nu C)g - 2\nu \sum_{i=1}^d g(\partial_i C)g(\partial_i C)g. \tag{6.12}
$$

或者等价地，直接将 $\omega = C z$ 代入 $\mathcal{E} = z^T C z$ ：
1. 对流导数： $D_t(z^T C z) = 2 z^T C D_t z + z^T(D_t C)z = 2 z^T\bigl(D_t(Cz) - (D_t C)z\bigr) + z^T(D_t C)z = 2 z^T D_t\omega - z^T(D_t C)z$ 。
2. 空间梯度与拉普拉斯算子：因 $\partial_i\omega = (\partial_i C)z + C(\partial_i z)$ ，有 $\partial_i(z^T C z) = 2 z^T \partial_i\omega - z^T(\partial_i C)z$ ；再对 $x_i$ 求导并对 $i=1,\dots,d$ 求和，所有形如 $2(\partial_i z)^T(\partial_i C)z$ 的一阶交叉导数项一正一负精确配对，留下纯二阶项：

$$
\Delta(z^T C z) = 2 z^T \Delta\omega - z^T (\Delta C) z + 2\sum_{i=1}^d (\partial_i z)^T C (\partial_i z). \tag{6.13}
$$

将对流导数减去 $\nu$ 倍 (6.13)，得到对一切光滑场普适的母恒等式：

$$
P_\nu(z^T C z) = 2 z^T (P_\nu \omega) - z^T (P_\nu C) z - 2\nu \sum_{i=1}^d (\partial_i z)^T C (\partial_i z). \tag{6.14}
$$

最后将 (6.9) 中的 $P_\nu\omega = L C z + r_\omega$ 与 $P_\nu C = (D_t - \kappa\Delta)C + (\kappa-\nu)\Delta C = G C + C G^T + R_C + (\kappa-\nu)\Delta C$ 代入 (6.14)，利用 $2 z^T L C z = z^T(L C + C L^T)z$ ，逐项整理立得全残差恒等式 (6.10) 与纯平方耗散定律 (6.11)。证毕。

### 6.4 协变载体正定性、欧氏回读谱桥税、全前缀重置守恒律与有限模观察尾项

定理 6.2 同时把三维纳维－斯托克斯方程的真体演化与外部低阶观测之间的**四笔必付账目**摆在了桌面上，任何一笔都不允许被掩盖或无证抹零：

1. **协变度规载体** $C(t,x)$ **的正定保持与欧氏回读谱条件数桥税**：
   在周期域 $\mathbb{T}^3$ 的任意共同光滑区间 $[0, T_0]$ 上，给定 $L = \nabla u$ 、初值 $C(0) = I$ ，线性抛物方程 $P_\nu C = L C + C L^T$ 存在唯一光滑对称解；且令 $s(t) := \sup_{x \in \mathbb{T}^3} \|\operatorname{sym} L(t,x)\|_{\mathrm{op}}$ ，由抛物极值原理（比较 $C(t,x) - m(t)I$ 与 $M(t)I - C(t,x)$ 的首次触零特征方向）， $C(t,x)$ 在 $[0, T_0]$ 上满足双边谱障碍：

$$
\exp\!\left(-2\int_0^t s(\tau)\,d\tau\right) I \preceq C(t,x) \preceq \exp\!\left(+2\int_0^t s(\tau)\,d\tau\right) I. \tag{6.15}
$$

   对 (6.11) 在无散周期域上积分，对流项与拉普拉斯项积分消失，协变总拟能 $h(t) := \frac{1}{2}\langle \omega^T C^{-1} \omega\rangle$ 单调纯耗散递减：

$$
h'(t) = -\nu \sum_{i=1}^d \bigl\langle (\partial_i z)^T C (\partial_i z)\bigr\rangle \le 0. \tag{6.16}
$$

   但当我们从协变拟能 $h(t)$ **回读**固定欧氏拟能 $\frac{1}{2}\langle |\omega|^2\rangle = \frac{1}{2}\langle |Cz|^2\rangle$ 时，必须支付最大特征值谱桥因子 $|\omega|^2 = |Cz|^2 \le \lambda_{\max}(C)\,z^T C z$ 。只要 $\lambda_{\max}(C)$ 的上界仍依赖 $\int_0^t \|\operatorname{sym}\nabla u\|_\infty\,d\tau$ ，就不能跳过这一端点度规增长预算而直接宣称无条件全局欧氏正则。
2. **度规重置税的全前缀守恒律**：
   若在演化中途时刻将变形后的度规 $C$ 重置回欧氏单位阵 $I$ （保持物理涡度 $\omega$ 不变），则协变拟能发生有限跳变（重置税）：

$$
s_{\mathrm{reset}} := \frac{1}{2}\bigl\langle \omega,\, (I - C^{-1})\omega\rangle \tag{6.17}
$$

   （当 $C = 2I$ 时 $s_{\mathrm{reset}} > 0$ ，当 $C = \frac{1}{2}I$ 时 $s_{\mathrm{reset}} < 0$ ）。记累计真实黏性耗散为 $d$ ，累计重置跳变和为 $S$ ，则在由“连续黏性耗散步 $(h, d, S) \mapsto (h-\delta, d+\delta, S)$ ”与“离散度规重置步 $(h, d, S) \mapsto (h+s_{\mathrm{reset}}, d, S+s_{\mathrm{reset}})$ ”组成的任意有限混合演化词的**每一个中间前缀**上，恒有严格守恒律：

$$
h + d - S = h_0. \tag{6.18}
$$

   任何企图在中途透支预算、仅靠终点修回的伪守恒，都会在中间前缀处被立刻证伪。
3. **二进级联有限模观察的真实跨界尾流** $\mathcal{B}_M$ **与带阻尼杨氏余项常数** $\frac{50653}{122472}$ ：
   在考察如模式 $\tilde{e}_n = (0, \cos(2^n x_1), -\sin(2^n x_1))$ 生成的自治二进级联壳系统

$$
z_n' = 16^n\bigl(64 z_{n-1}^2 - 16 z_n z_{n+1}\bigr) - \nu 4^n z_n \qquad (z_n = 8^n u_n,\ n \ge 0,\ z_{-1}=0) \tag{6.19}
$$

   时，若取带交叉项的有限前 $M$ 壳李雅普诺夫（Lyapunov）观察泛函

$$
F_M(t) := \frac{1}{2}\sum_{n=0}^M 16^{-n} z_n^2 + \frac{1}{64}\sum_{n=0}^M 16^{-n} z_n z_{n+1}, \tag{6.20}
$$

   对原无穷维光滑解直接求导，绝不能将截断边界外的真实尾模态 $z_{M+1}, z_{M+2}$ 假定为零！有限观察 $F_M'(t)$ 必然携带精确的跨界尾流项：

$$
\mathcal{B}_M = 64 z_M^2 z_{M+1} + \frac{17}{6}z_{M+1}^3 + \frac{4}{3}z_{M+2}^3 + \frac{5\nu}{64}4^{-(M+1)}z_{M+1}^2, \tag{6.21}
$$

   而在内部壳 $0 \le n \le M$ 上，利用精确平方和分解的带阻尼杨氏不等式

$$
\frac{64 A^3}{243} - A z^2 + \frac{3}{4}z^3 = \left(z - \frac{8A}{9}\right)^2\left(\frac{3}{4}z + \frac{A}{3}\right) \ge 0 \qquad (A, z \ge 0), \tag{6.22}
$$

   取 $A = \frac{37}{32}\nu 4^{-n}$ ，可将黏性负项与三次正项 $\frac{47}{4}z_n^3$ 配平，留下精确的立方耗散正余量与固定有理系数 $\frac{64}{243}\left(\frac{37}{32}\right)^3 = \frac{50653}{122472}$ 。唯有在共同光滑寿命区间 $[0, T] \subset [0, T_*)$ 上利用原解的高阶指数衰减证明 $\lim_{M \to \infty} \mathcal{B}_M = 0$ ，才能合法过渡到无穷维极限。

---

## 第七章　总结裁定表：同作者 79 页 NS 纸面证明的三重结构定性与“真体—伪影”判别总纲

综上所述，我们对与广义黎曼猜想宣称同作者（Levent Alpöge，与 Tristan Buckmaster 合著）于 2026 年 11 月 20 日放出的 79 页纳维－斯托克斯方程有限时爆破纸面证明原件，给出如下纯数学内部终审裁定：

| 审查层级 | 原论文具体位置与数学对象 | 核漏（ $\ker q \not\subseteq \ker f$ ）或结构缺陷的精确数学机制 | 全闭式定量证人 / 守恒公式 | 科学定性结论 |
|:---|:---|:---|:---|:---|
| **第一层：赤道平面** $y_3=0$ **奇异界面测度核漏** | 附录 B 第 53 页分侧样条权函数 $D, Z$ $\to$ 第 54 页 (B.16) $\to$ 第 55–56 页命题 B.1 不等式 (B.20) | 体积读口 $q_{\mathrm{bulk}}(D^2 W) = H_{\mathrm{bulk}}$ 抹去了集中在零体积平面 $y_3=0$ 上的奇异狄拉克面测度 $\Sigma_W = [\partial_z W]e_3\otimes e_3\,dS_{z=0} \in \ker q_{\mathrm{bulk}}$ ，但无散场两次分部积分泛函 $f_v$ 对该奇异测度给出严格正配对（ $\Sigma_W \notin \ker f_v$ ） | **反例族 A**（轴对称紧支无散场， $D_+ = \frac12 + \frac14\chi \mid \eta \mid$ ）： $E_{D_+}(v) \ge \frac{\pi}{65536}\frac{633509743}{432432000} > 0$ ，双权分离 $\ge 2\gamma_\varepsilon$ ；**反例族 B**（施瓦茨高斯 $\pm(2,1)$ 模态， $Z = cP \mid \eta \mid$ ）： $\Delta/c \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > 400 > 0$ | **删去跨平面法向导数接合前件的分侧** $C^2$ **弱合同版命题 B.1 / (B.20) 发生致命核漏，已被两族全闭式解析反例严格证伪** |
| **第二层：强接合修复的** $O(\delta^{-1})$ **薄层曲率税守恒律** | 跨赤道平面 $\mid \eta \mid \le \delta$ 的全局 $C^2(\mathbb{R}^3)$ 四次过渡样条 $s_\delta(\eta)$ 与体积海森罚项 $\int \Vert H_{D_\delta}\Vert _{\mathrm{op}} \mid \nabla v \mid ^2\,dy$ | 恢复全局 $C^2$ 跨面接合虽消除了奇异面测度，但曲率质量 $\int_{-\delta}^{\delta} s_\delta''(\eta)\,d\eta = 2$ 严格守恒，薄层内法向二阶导数以 $\max s_\delta'' = \frac{3}{2\delta}$ 尖峰化，绝不能以“薄层体积为 $O(\delta)$ ”为由在 $\delta\downarrow 0$ 时抹除 | $\partial_{zz}D_\delta(r,0) = \frac{3\chi}{8\delta r^2} + \frac{3\delta\chi'}{32r(1+r)^2}$ ；且 $\lim_{\delta\downarrow 0} \int_{ \mid \eta \mid <\delta} \Vert H_{D_\delta}\Vert _{\mathrm{op}}f\,dy = \int_{z=0} \frac{\chi}{2r}f\,dS > 0$ | **强接合前件不可无代价附加：任何合法的全局** $C^2$ **权函数都必须在体积海森范数项中真金白银地支付该赤道跨面曲率税** |
| **第三层：纸面证明的“悬空桥墩”与未公开外部证书** | 第 1、4、10、54–60、62–64、69–70 页：定理 1.1 $\Leftarrow$ 定理 7.1 $\Leftarrow$ 定理 B.14 $\Leftarrow$ 外部证书 $d \in \mathcal{D}_B$ | 纸面省略了 (B.16) 误差系数、B.1 与 B.4 的完整证明及第 70 页的 7 项附加条件；最左端存在性证人 $d \in \mathcal{D}_B$ 仅给出一串 SHA-256 哈希值（3f7a335b...），无任何数据字节，128 位区间算术验证程序亦未公开 | 树状分块矩阵受限正定与自由补偿直和 $X = S \oplus F$ 仅在满足同域逐删无核漏（ $\ker(H_{-i}J)\subseteq\ker(BJ)$ ）与受限瑞利阈值 $\tau = 2d_j b^T Q_S^{-1} b < 1$ 下成立 | **该 79 页 PDF 作为纸面证明是不完备、未闭合的（有条件推演纲领 + 未公开的外部黑箱证书摘要）** |
| **第四层：三维流体动力学的真体与伪影分界** | 一般三维不可压 NS 涡度方程 vs 固定欧氏能谱读口 $q_{\mathrm{static}}$ 及随流协变逆度规 $g = C^{-1}$ | 静态欧氏二次能谱读口对整体反号盲视（ $q_{\mathrm{static}}(+17U) = q_{\mathrm{static}}(-17U)$ ），漏掉三次涡度拉伸奇次符号；论文 (B.18) 虽引入固定参考剖面 $W^r$ ，但关于扰动 $v$ 仍为二次偶泛函 $J_{W^r}(-v) = J_{W^r}(v)$ | 静态同谱双初值 $\pm 17U$ 的真实 NS 拟能初导数撕裂 $Y_+'(0) - Y_-'(0) = 4913$ ；随流协变逆度规下涡度拉伸精确对偶湮灭为纯平方耗散 $P_\nu(\omega^T C^{-1}\omega) = -2\nu\sum_i (\partial_i z)^T C (\partial_i z) \le 0$ | **揭示了传统分析长期混淆“静态投影伪影”与“随流演化真体”的数学根源，并划定了欧氏回读谱桥税与前缀重置守恒的严格边界** |

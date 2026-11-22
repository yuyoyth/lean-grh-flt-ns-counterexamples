# 同作者纳维－斯托克斯方程 79 页纸面证明算子核分析：流体动力学真实演化结构与高阶投影伪影分离及跨面奇异测度反例专论

---

## 第一章　绪论：三维不可压流体动力学中的“真体”与“高阶语义漂移伪影”——为何静态商投影的核泄漏会制造虚假的闭合与虚假的奇点

在三维不可压纳维－斯托克斯（Navier–Stokes）方程长达一个世纪的现代分析史中，几乎所有关于“全局光滑性”与“有限时爆破”的重大争议，归根结底都源于同一个深层的方法论混淆：**分析学者往往把流体动力学算子在某一静态观测坐标系、分片逼近网格或粗粒化泛函读口下的“高阶语义漂移伪影”（High-Order Semantic-Drift Artifact），误当成了流体连续统在随流演化中的“动力学真体”（True Dynamical Continuation Body）。**

考虑三维空间 $\mathbb{R}^3$ 或三维周期环面 $\mathbb{T}^3$ 上的不可压纳维－斯托克斯方程组：

$$
\partial _ t u + (u \cdot \nabla) u + \nabla p = \nu \Delta u, \qquad \nabla \cdot u = 0,
$$

以及对其取旋度 $\omega = \nabla \times u$ 后得到的涡度输运－拉伸－耗散方程：

$$
\partial _ t \omega + (u \cdot \nabla) \omega - (\omega \cdot \nabla) u = \nu \Delta \omega.
$$

在真实的物理与几何演化中，流体状态是一个不可任意拆解的耦合整体：速度梯度张量 $L = \nabla u$ 既通过对流导数 $D _ t = \partial _ t + u \cdot \nabla$ 搬运涡度场，又通过非交换的涡度拉伸项 $(\omega \cdot \nabla)u = L\omega$ 改变涡管的主轴方向与局部强度；与此同时，黏性耗散算子 $\nu \Delta$ 与无散压力投影算子 $\mathbb{P} = I - \nabla \Delta^{-1} \operatorname{div}$ 在全空间或全频谱上保持瞬时耦合。这一完整的、携带全部边界面迹与非交换相位的流式演化算子，才是纳维－斯托克斯方程的**真体**。

然而，在传统的偏微分方程纸面推演与计算机辅助证明中，研究者为了将无穷维非线性演化纳入现成的巴拿赫空间范数或有限维矩阵不等式，总是先引入一个**静态读口投影**（商映射） $q : \mathcal{X} \to \mathcal{Y}$ 。例如：

**半空间体积投影**：在球坐标或柱坐标的分片半空间样条网格上，只提取权函数二阶导数在开区域内的勒贝格（Lebesgue）绝对连续体积密度 $H _ {\mathrm{bulk}}$ ，而因为分界平面 $\Sigma = \lbrace y _ 3 = 0\rbrace$ 的三维体积测度为零，便在读口 $q$ 中将集中在分界面上的奇异狄拉克（Dirac）面测度抹去；

**静态频谱投影**：在傅里叶（Fourier）频谱或李特伍德－佩利（Littlewood–Paley）二进壳分解中，只读取各频率壳上的二次能量模方 $\Vert \Delta _ j u\Vert _ {L^2}^2$ 或单模厄米（Hermitian）能谱张量 $\hat{u}(k)\hat{u}(k)^{\ast}$ ，而在读口 $q$ 中抹去跨频率三波共振的奇次相对相位；

**有限单元投影**：在有限谐波与有限空间单元的截断证书中，将无穷维扰动场投影为有限维节点向量 $q(v)$ ，而将高阶多谐波耦合与跨界迹拼接留给未显式写出的外部余项。

从纯粹数学的第一性原理审视，任何此类读口映射 $q : \mathcal{X} \to \mathcal{Y}$ 都定义了一个等价核（或零空间纤维）：

$$
\begin{aligned}
& \ker _ {\mathrm{rel}}(q) := \bigl\lbrace (X _ +, X _ -) \in \mathcal{X} \times \mathcal{X} : \cr
& \quad q(X _ +) = q(X _ -)\bigr\rbrace
\end{aligned}
$$

（在线性同域情形下即普通零空间 $\ker q = \lbrace X \in \mathcal{X} : q(X) = 0\rbrace$ ）。如果分析者试图仅凭读口输出 $q(X)$ 去控制、界定或唯一决定下游的物理泛函或下一拍演化算子 $f : \mathcal{X} \to \mathcal{Z}$ ，那么数学上得以成立的充要条件是**等价核包含条件**（零空间包含条件）：

$$
q(X _ +) = q(X _ -) \implies f(X _ +) = f(X _ -), \qquad \ker q \subseteq \ker f. \tag{1.3}
$$

在线性同域情形下，上式即零空间包含关系。

或者在单边强制性下界证明 $f(X) \ge g(q(X))$ 中，必须在同一定义域的全部合法状态纤维 $q^{-1}(y)$ 上满足一致下界：

$$
\inf _ {X \in \mathcal{X}, q(X)=y} f(X) \ge g(y).
$$

一旦在某个看似无害的坐标系转换、分部积分接缝或分片样条表示处，存在落在读口盲区内的非零结构分量 $\Sigma \in \ker q$ ，它在下游物理算子 $f$ 的作用下却产生严格非零的逃逸输出 $f(\Sigma) \neq 0$ （即 $\ker q \not\subseteq \ker f$ ，或在同一读口纤维 $q(X _ +) = q(X _ -)$ 内使目标泛函出现符号分化并违反所宣称的下界），我们就称该证明接缝发生了**算子核泄漏**（Kernel Leakage，简称核漏）。

核漏一旦发生，纸面推导中所观察到的“强制性闭合”或“误差受控”，就不再是流体方程本身的物理性质，而是读口投影 $q$ 截断真实演化自由度后产生的高阶语义漂移伪影。无论是借助纯静态欧氏索伯列夫（Sobolev）范数探讨全局正则性的尝试，还是借助分片数值样条与有限维矩阵证书论证自相似奇异性的尝试，若在某个算子接缝处将“投影后的局部闭合”等同于“原方程完整算子的闭合”，则该推导在发生核泄漏的接缝处便不再具备无条件数学证明的完备性。

本专论以与广义黎曼猜想（GRH）宣称同作者（Levent Alpöge）于 2026 年 11 月 20 日同时公开的 79 页纳维－斯托克斯方程有限时爆破纸面证明原件（Levent Alpöge 与 Tristan Buckmaster 合著，标题为 *Finite-time blow-up for the Navier–Stokes equations*，全文共 79 页，公开归档于作者代码仓库 paper 目录下的 finite-time-blow-up-navier-stokes.pdf，文件字节数 1,615,293，SHA-256 摘要为 4a01929b2f8a595637bbbe1dfef9724e5de768d31283d62415ce045e2ed69901）为唯一审查对象。我们完全撇开外部证明助手的形式化工程包装不谈，纯粹站在偏微分方程、分布理论、泛函分析与流体动力学内部，对该 79 页纸面证明进行逐节、逐公式的解剖，精确揭示其证明骨架、跨面奇异测度核漏接缝、两族全闭式解析反例、薄层修复的 $O(\delta^{-1})$ 曲率税守恒律，以及流体动力学中真体与伪影的根本分界。

---

## 第二章　同作者 79 页纳维－斯托克斯有限时爆破纸面证明的总体逻辑骨架与三层承重接缝

### 2.1 原件命题定位：不是全局光滑证明，而是基于计算机辅助证书的自相似旋转剖面有限时爆破宣称

首先需要向数学界澄清一个基本事实：Alpöge 与 Buckmaster 的这篇 79 页论文所宣称证明的，**不是**三维不可压纳维－斯托克斯方程的全局光滑存在性，而是恰恰相反的**有限时爆破**（Finite-time blow-up）。

具体而言，论文第一页至第三页的**定理 1.1**（Theorem 1.1）是一个明确的**有条件命题**（Conditional Theorem）：
在自相似重标度坐标

$$
y = \frac{x}{\sqrt{T-t}}, \qquad s = \log\frac{T}{T-t}
$$

之下，假设存在一个非零、光滑、关于自相似时间 $s$ 周期（周期为 $S > 0$ ）、满足 $\kappa$ -重离散旋转对称群 $\Gamma$ 等变性的自相似旋转速度－压力剖面 $(W, q)$ ，满足自相似纳维－斯托克斯方程（第 2 页公式 (1.2)）：

$$
\begin{aligned}
& \partial _ s W + \frac{1}{2}W + \frac{1}{2}(y \cdot \nabla)W + (W \cdot \nabla)W + \nabla q - \Delta W = 0, \cr
& \nabla \cdot W = 0,
\end{aligned}
$$

以及远场衰减与线性化单周期算子（Monodromy operator）谱分离假设（第 2 页公式 (1.3)）；那么，便可在全空间 $\mathbb{R}^3$ 上构造紧支集光滑无散初值 $u _ 0 \in C _ c^\infty(\mathbb{R}^3)$ ，并在三维环面 $\mathbb{T}^3$ 上构造光滑无散初值，使得对应的纳维－斯托克斯解在有限时刻 $T > 0$ 发生爆破，且速度梯度 $L^2$ 范数按精确自相似率发散：

$$
\Vert \nabla u(\cdot, t)\Vert _ {L^2} \sim (T-t)^{-1/4} \qquad (t \uparrow T),
$$

对应于平方涡量（拟能，Enstrophy）按 $\Vert \omega(\cdot, t)\Vert _ {L^2}^2 \sim (T-t)^{-1/2}$ 发散。

为了获得定理 1.1 前件所要求的这个非零自相似周期剖面 $(W, q)$ ，论文并没有给出任何纯解析构造，而是建立了一条横跨第七节（第 29–46 页）与附录 B（第 49–70 页）的**三级条件蕴涵链**：

$$
\begin{aligned}
& \exists d \in \mathcal{D} _ B, \mathsf{Valid} _ B(d) \Longrightarrow \exists c \in \mathcal{C} _ 7, \cr
& \mathsf{Cert} _ 7(c) \Longrightarrow \exists (W, q) \in \mathcal{P} _ {\mathrm{rot}} \cr
& \Longrightarrow \text{Blow-up on }\mathbb{R}^3, \mathbb{T}^3.
\end{aligned} \tag{2.1}
$$

**第一步（附录 B 证书到第七节证书）**：定理 B.14（第 69 页）将附录 B 的有效矩阵与单元证书归约为第七节所需的先验估计证书。

**第二步（证书到自相似旋转剖面）**：定理 7.1（第 38–39 页）由满足全部条件的证书构造剖面；式中 $\mathcal{P} _ {\mathrm{rot}}$ 表示满足定理 1.1 前件的自相似旋转剖面类。

**第三步（剖面到有限时爆破）**：定理 1.1（第 1 页）由该剖面推出全空间 $\mathbb{R}^3$ 与三维环面 $\mathbb{T}^3$ 上的有限时爆破。

### 2.2 逐节核对中确认成立的经典分析环节

在进入核心算子接缝分析之前，严谨的数学审查应当首先将论文中逻辑自洽的经典分析步骤与真正存在算子核偏差或待核验缺口的环节区分开来。经逐页核对 79 页原件，以下五个环节在各自声明的局部前件下是成立且规范的：

**自相似坐标变换**（第 2 页公式 (1.4)）：在任意 $t < T$ 的开区间上， $(x,t) \mapsto (y,s)$ 是光滑可逆微分同胚，只改变各阶范数的时空尺度因子，不抹除高频模态。

**无散空间上的模梯度商**（第 30 页第 7.1 节公式 (7.2) 与第 7.8 节公式 (7.33)）：论文在无散测试空间 $H$ 上定义模去梯度场的等价关系，这与勒雷（Leray）无散投影 $\mathbb{P}$ 完全同构；第 7.8 节伴随条件 (7.33) 对一切代表元成立，取 $v = 0$ 即迫使伴随测试场 $\psi$ 正交于梯度核，此处不存在“把有旋速度残差当梯度丢弃”的核漏。

**对称化双线性算子与有限余维里兹**（Riesz）投影（第 10 页公式 (2.3) 与第 18–21 页引理 4.4–4.6）：对称双线性算子 $K(\tau)(u,v) = -\frac{1}{2}e^{\tau\Delta}\mathbb{P}[(u\cdot\nabla)v + (v\cdot\nabla)u]$ 在对角线 $u=v$ 上精确还原原始非线性项 $(u\cdot\nabla)u$ ；第四节对单周期算子 $M$ 的不稳定子空间投影 $P _ u \chi _ n$ 采用向后收敛级数求解，而对稳定补空间 $(I - P _ u)\chi _ n$ 完整保留了向前递推，并未将稳定分量直接置零。

**局部紧性与强弱乘积收敛**（第 37–43 页命题 7.5 与命题 7.10）：从有限维伽辽金（Galerkin）近似过渡到极限解时，论文先由局部时空 $H^1$ 一致界利用奥班－利翁斯（Aubin–Lions）紧性引理提取局部 $L^2$ 强收敛 $v _ k \to v$ ，再与弱收敛梯度 $\nabla v _ k \rightharpoonup \nabla v$ 配对通过二次非线性项，并未犯“弱收敛直接乘弱收敛”的低级错误。

**有限维辅助外力的不动点消去**（第 43–44 页公式 (7.30)–(7.37)）：第七节先引入带有限维修正力 $\beta$ 的辅助方程，随后在拓扑度/不动点处利用 $\alpha' \in K$ 、 $\alpha = N(\alpha') \implies \alpha = \alpha'$ 及矩阵 $V$ 的可逆性推出总外力 $\beta^a + \beta = 0$ ，在局部不动点逻辑下消去外力项的步骤是自洽的。

### 2.3 纸面证明的三处核心结构接缝与算子核偏差

当上述外围分析框架被剥离之后，整篇 79 页论文将“无穷维三维流体扰动在近似自相似剖面 $W^r$ 附近具有严格正定强制性（Coercivity，即单周期谱被严格约束在假定不稳定模态之内）”这一最核心的动力学义务，全部压在了**附录 B（第 49–70 页）的加权乘子分部积分与有限树矩阵归约**上。正是在这一核心承重区，存在三处层层递进的数学结构问题：

**结构问题一（跨面奇异测度核漏）**： 在第 53 页定义权函数 $D, Z$ 的半空间分侧样条表示，并在第 55–56 页推导核心强制性乘子不等式命题 B.1 / 公式 (B.20) 时，如果仅依据各半空间 $y _ 3 > 0$ 与 $y _ 3 < 0$ 上的分侧 $C^2$ 样条正则性并直接用体积海森（Hessian）矩阵 $H _ {\mathrm{bulk}}$ 执行分部积分，而遗漏跨赤道平面 $\Sigma = \lbrace y _ 3 = 0\rbrace$ 的法向一阶导数接合前件 $[\partial _ {y _ 3} D] _ \Sigma = 0$ 与 $[\partial _ {y _ 3} Z] _ \Sigma = 0$ ，则分布海森算子 $D^2 W = H _ {\mathrm{bulk}} dy + [\partial _ {y _ 3} W] e _ 3\otimes e _ 3 dS _ \Sigma$ 中的奇异狄拉克界面测度被体积读口 $q _ {\mathrm{bulk}}$ 直接抹零（ $\Sigma _ W \in \ker q _ {\mathrm{bulk}}$ ），却在无散场分部积分泛函 $f _ v$ 中产生严格为正的界面贡献（ $\Sigma _ W \notin \ker f _ v$ ），从而直接违反命题 B.1 的核心不等式 (B.20)。

**结构问题二（强接合薄层曲率守恒）**： 即便通过在赤道平面 $|y _ 3| \le \delta\rho$ 两侧插入光滑过渡样条 $s _ \delta(\eta)$ 恢复全局 $C^2(\mathbb{R}^3)$ 跨面接合，奇异面测度虽转化为体积海森密度，但过渡薄层内的法向二阶导数必以 $\max s _ \delta'' = \frac{3}{2\delta}$ 的量级增长；当薄层宽度 $\delta \downarrow 0$ 时，体积海森算子范数在薄层上的积分**并不趋于零**，而是严格收敛回原来的奇异界面积分。这意味着曲率质量具有严格的测度守恒性，不能仅以“薄层体积为 $O(\delta)$ ”为由在积分估计中略去。

**结构问题三（未闭合归约与外部证书）**： 在 79 页 PDF 原件中，直接承担非交换涡度拉伸与多谐波耦合吸收的命题 B.1（第 55–56 页）、公式 (B.16) 的五类误差系数（第 54 页）、命题 B.4（第 59–60 页）以及定理 B.14 之后的附加实例条件（第 70 页）全部省略了纸面证明或省略了显式系数，作者在正文中明言将它们外置给外部代码；而整条蕴涵链最左端的存在性基石——那个据称满足全部条件的数值证书 $d \in \mathcal{D} _ B$ ，在整篇论文（第 1、4、70 页）和公开仓库中根本没有提供任何数据字节，仅印了一串 64 位十六进制 SHA-256 摘要（3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5），且验证该证书的 128 位区间算术程序同样未公开且游离于形式核之外。

下面我们用纯闭式数学推导，逐一对这三重结构进行彻底解剖。

---

## 第三章　第一重核心核漏实证：附录 B（第 53–56 页）半空间分侧样条权函数与命题 B.1 强制性乘子不等式（B.20）在赤道平面 $y _ 3 = 0$ 上的奇异界面测度逃逸

### 3.1 命题 B.1 与核心不等式 (B.20) 的分部积分接缝

在论文附录 B（第 49–56 页）中，作者旨在对满足离散旋转－反射对称群 $\Gamma$ （由绕 $y _ 3$ 轴旋转 $\pi/\kappa$ 并平移半周期的生成元 $(R _ {\pi/\kappa}, 1/2)$ ，以及反射矩阵 $R _ {\ast} = \operatorname{diag}(1, -1, -1)$ 生成）的无散扰动场 $v \in \mathcal{D} _ S^\Gamma$ 建立加权强制性下界。

记自相似空间坐标为 $y = (y _ 1, y _ 2, y _ 3) \in \mathbb{R}^3$ ，球半径 $\rho = |y| = \sqrt{y _ 1^2 + y _ 2^2 + y _ 3^2}$ ，柱半径 $r = \sqrt{y _ 1^2 + y _ 2^2}$ ，竖直坐标 $z = y _ 3$ ，以及论文第 53 页引入的紧致化径向坐标与球面余纬参数：

$$
\sigma = \frac{\rho}{1+\rho} \in [0, 1), \qquad \eta = \frac{z}{\rho} \in [-1, 1].
$$

在第 53 页中，权函数 $D(y)$ 与 $Z(y)$ 被表示为分居上、下半空间 $z > 0$ 与 $z < 0$ 的 $(\sigma, \eta)$ 分片多项式样条。为了推导第 55–56 页命题 B.1 的主不等式 (B.20)，作者需要将含权函数的二阶与一阶二次型（见第 54 页公式 (B.16) 中的 $I _ 2, I _ 2', I _ 1', I _ 1, I _ 0$ ）与无散场的旋度平方项进行分部积分换位。

这一换位的核心数学恒等式如下：对任意光滑无散向量场 $u$ （即 $\nabla \cdot u = \sum _ {i=1}^3 \partial _ i u _ i = 0$ ），由三维列维－奇维塔（Levi-Civita）张量收缩恒等式，点态成立：

$$
\begin{aligned}
& |\nabla u|^2 - |\operatorname{curl} u|^2 \cr
& = \sum _ {i,j=1}^3 (\partial _ i u _ j)^2 \cr
& - \sum _ {i,j=1}^3 \bigl((\partial _ i u _ j)^2 - \partial _ i u _ j \partial _ j u _ i\bigr) \cr
& = \sum _ {i,j=1}^3 \partial _ i u _ j \partial _ j u _ i.
\end{aligned}
$$

当我们将上式乘以标量权函数 $W(y)$ 并在全空间 $\mathbb{R}^3$ 上积分时，必须对下标 $i$ 和 $j$ 执行**两次分部积分**（利用无散条件 $\sum _ {i=1}^3 \partial _ i u _ i = 0$ 与 $\sum _ {j=1}^3 \partial _ j u _ j = 0$ ）：

#### 定理 3.1（分侧二阶可微权函数的分布海森分解与奇异界面测度定理）

设权函数 $W : \mathbb{R}^3 \to \mathbb{R}$ 在全空间 $\mathbb{R}^3$ 上连续，在开上半空间 $\mathbb{R} _ +^3 = \lbrace z > 0\rbrace$ 与开下半空间 $\mathbb{R} _ -^3 = \lbrace z < 0\rbrace$ 上分别属于 $C^2$ 直至赤道分界面 $\Sigma = \lbrace z = 0\rbrace$ ，其开区域二阶经典导数矩阵 $H _ W(y) = (\partial _ {i}\partial _ {j} W(y)) _ {1\le i,j\le 3}$ 局部可积，且在分界面 $\Sigma$ 上具有有限的上下侧法向一阶导数迹。记跨平面 $\Sigma$ 的法向导数跳跃为

$$
\begin{aligned}
& [\partial _ z W] (y _ 1, y _ 2) := \lim _ {z \downarrow 0} \partial _ z W(y _ 1, y _ 2, z) \cr
& - \lim _ {z \uparrow 0} \partial _ z W(y _ 1, y _ 2, z).
\end{aligned}
$$

则 $W$ 在 $\mathbb{R}^3$ 上的二阶分布导数（分布海森张量测度 $D^2 W$ ）具有如下精确的勒贝格－拉东－尼科迪姆（Lebesgue–Radon–Nikodym）分解：

$$
D^2 W = H _ W(y) dy + [\partial _ z W] (y _ 1, y _ 2) e _ 3 \otimes e _ 3 dS _ \Sigma, \tag{3.1}
$$

其中 $dS _ \Sigma = dy _ 1 dy _ 2$ 为赤道平面 $\Sigma = \lbrace z=0\rbrace$ 上的二维面积测度。进而，对任意紧支集 $C^2$ 无散向量场（或速降施瓦茨无散向量场） $u$ ，恒有精确恒等式：

$$
\begin{aligned}
& \int _ {\mathbb{R}^3} W(y)\bigl(|\nabla u|^2 - |\operatorname{curl} u|^2\bigr) dy = \langle D^2 W, u \otimes u \rangle \cr
& = \int _ {\mathbb{R}^3} u(y)^T H _ W(y) u(y) dy \cr
& + \int _ {z=0} [\partial _ z W] (y _ 1, y _ 2) u _ 3(y _ 1, y _ 2, 0)^2 dS _ \Sigma.
\end{aligned} \tag{3.2}
$$

**证明**：将全空间积分拆分为上半空间 $\mathbb{R} _ +^3$ 与下半空间 $\mathbb{R} _ -^3$ 之和。在每个半空间内，因 $W$ 直至边界 $\Sigma$ 均为 $C^2$ 且 $\nabla \cdot u = 0$ ，第一次分部积分利用

$$
\begin{aligned}
& \partial _ i(u _ j \partial _ j u _ i) = \partial _ i u _ j \partial _ j u _ i + u _ j \partial _ j(\nabla \cdot u) \cr
& = \partial _ i u _ j \partial _ j u _ i,
\end{aligned}
$$

给出：

$$
\begin{aligned}
& \int _ {\mathbb{R} _ \pm^3} W \sum _ {i,j=1}^3 \partial _ i u _ j \partial _ j u _ i dy \cr
& = -\int _ {\mathbb{R} _ \pm^3} \sum _ {i,j=1}^3 (\partial _ i W) u _ j \partial _ j u _ i dy \cr
& \mp \int _ {z=0} W(y _ 1, y _ 2, 0^\pm) \sum _ {j=1}^3 u _ j \partial _ j u _ 3 dS _ \Sigma.
\end{aligned}
$$

由于 $W$ 跨平面 $z=0$ 连续，即 $W(y _ 1, y _ 2, 0^+) = W(y _ 1, y _ 2, 0^-)$ ，上下两侧的第一次边界积分符号相反、数值相等，故精确相消。接着对右端体积项关于下标 $j$ 执行第二次分部积分（再次利用 $\sum _ {j=1}^3 \partial _ j u _ j = 0$ ）：

$$
\begin{aligned}
& -\int _ {\mathbb{R} _ \pm^3} \sum _ {i,j=1}^3 (\partial _ i W) u _ j \partial _ j u _ i dy \cr
& = \int _ {\mathbb{R} _ \pm^3} \sum _ {i,j=1}^3 (\partial _ j \partial _ i W) u _ i u _ j dy \cr
& \pm \int _ {z=0} \sum _ {i=1}^3 (\partial _ i W)(y _ 1, y _ 2, 0^\pm) u _ i u _ 3 dS _ \Sigma.
\end{aligned}
$$

对于切向导数 $i \in \lbrace 1, 2\rbrace$ ，因 $W$ 在 $z=0$ 上连续，切向导数由同一平面迹 $W| _ {\Sigma}$ 求导所得，故 $\partial _ 1 W(y _ 1, y _ 2, 0^+) = \partial _ 1 W(y _ 1, y _ 2, 0^-)$ 且 $\partial _ 2 W(y _ 1, y _ 2, 0^+) = \partial _ 2 W(y _ 1, y _ 2, 0^-)$ ，上下两侧的 $i=1,2$ 边界项再次精确相消。唯独法向分量 $i = 3$ （即 $\partial _ z W$ ），当上下半空间相加时，留下一项不可相消的面测度积分：

$$
\begin{aligned}
& \int _ {z=0} \bigl(\partial _ z W(y _ 1, y _ 2, 0^+) - \partial _ z W(y _ 1, y _ 2, 0^-)\bigr) \cr
& \quad u _ 3(y _ 1, y _ 2, 0)^2 dS _ \Sigma \cr
& = \int _ {z=0} [\partial _ z W] u _ 3^2 dS _ \Sigma.
\end{aligned}
$$

这便严格证明了分布分解 (3.1) 与配对恒等式 (3.2)。证毕。

### 3.2 商映射 $q _ {\mathrm{bulk}}$ 的核漏机制

现在审视论文第 54 页公式 (B.16) 与第 55–56 页命题 B.1 公式 (B.20)。
在公式 (B.16) 中，作者定义五类二次型系数：

$$
\begin{aligned}
& I _ 2 = D - \frac{3}{50}, \qquad I _ 2' = 1 - D, \qquad I _ 1' = \frac{1}{4} - Z, \cr
& I _ 1 = Z - \Vert H _ D\Vert _ {\mathrm{op}} - \frac{3w}{50}, \qquad I _ 0 = -\Vert H _ Z\Vert _ {\mathrm{op}},
\end{aligned} \tag{3.3}
$$

其中 $\Vert H _ D\Vert _ {\mathrm{op}}$ 与 $\Vert H _ Z\Vert _ {\mathrm{op}}$ 仅在开区域 $z \neq 0$ 上读取经典逐点海森矩阵的算子范数， 旨在用于控制体积积分 $\sum _ {k=1}^3 \int (\partial _ k v)^T H _ D (\partial _ k v) dy$ 与 $\int v^T H _ Z v dy$ 。

用商映射语言表述：

**（1）静态体积读口**： $q _ {\mathrm{bulk}}(D^2 W) := H _ W$ 只读取分布海森测度 $D^2 W$ 的勒贝格绝对连续密度 $H _ W$ ，将一切集中在零体积面 $\Sigma = \lbrace z=0\rbrace$ 上的奇异面测度 $\Sigma _ W = [\partial _ z W] e _ 3\otimes e _ 3 dS _ \Sigma$ 映射为零：

$$
\Sigma _ W \in \ker q _ {\mathrm{bulk}}.
$$

**（2）实际分部积分泛函**： $f _ u(D^2 W) := \langle D^2 W, u \otimes u \rangle$ 则同时读取体积密度与界面奇异测度。

当我们将定理 3.1 分别应用于二阶导数层（取 $W = D$ ， $u = \partial _ k v$ 并对 $k=1,2,3$ 求和）与一阶导数层（取 $W = Z$ ， $u = v$ ）时，命题 B.1 不等式 (B.20) 的“右端减左端”差值泛函 $E _ D(v)$ 与 $E _ Z(v)$ （命题 B.1 要求 $\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} \le 0$ ）精确展开为：

$$
\begin{aligned}
& E _ D(v) = \sum _ {k=1}^3 \int _ {\mathbb{R}^3} (\partial _ k v)^T H _ D (\partial _ k v) dy \cr
& - \int _ {\mathbb{R}^3} \Vert H _ D\Vert _ {\mathrm{op}} |\nabla v|^2 dy \cr
& + \int _ {z=0} [\partial _ z D] |\nabla v _ 3|^2 dS _ \Sigma,
\end{aligned} \tag{3.4}
$$

$$
\begin{aligned}
& E _ Z(v) = \int _ {\mathbb{R}^3} v^T H _ Z v dy - \int _ {\mathbb{R}^3} \Vert H _ Z\Vert _ {\mathrm{op}} |v|^2 dy \cr
& + \int _ {z=0} [\partial _ z Z] v _ 3^2 dS _ \Sigma.
\end{aligned} \tag{3.5}
$$

请看公式 (3.4) 与 (3.5) 的右侧：前两项之和

$$
\sum _ k \int (\partial _ k v)^T H _ D (\partial _ k v) dy - \int \Vert H _ D\Vert _ {\mathrm{op}}|\nabla v|^2 dy
$$

永远小于或等于零（这正是作者设计 $I _ 1 = -\Vert H _ D\Vert _ {\mathrm{op}} - \cdots$ 与 $I _ 0 = -\Vert H _ Z\Vert _ {\mathrm{op}}$ 的原因）。然而，第三项——来自 $\ker q _ {\mathrm{bulk}}$ 的奇异界面积分 $\int _ {z=0} [\partial _ z D]|\nabla v _ 3|^2 dS _ \Sigma$ 与 $\int _ {z=0} [\partial _ z Z]v _ 3^2 dS _ \Sigma$ ——并未被体积海森范数项 $-\Vert H _ D\Vert _ {\mathrm{op}}$ 或 $-\Vert H _ Z\Vert _ {\mathrm{op}}$ 所控制。

更微妙的是：也许有人会问，论文中的扰动场 $v$ 受对称群 $\Gamma$ 中的反射算子 $R _ {\ast} = \operatorname{diag}(1, -1, -1)$ 约束，对于轴对称零谐波场， $R _ {\ast}$ 对称性岂不是迫使竖直速度分量 $v _ 3$ 关于 $z$ 为奇函数，从而在赤道平面 $z = 0$ 上恒有 $v _ 3(y _ 1, y _ 2, 0) = 0$ 吗？
原因在于：对 $D$ 权项而言，出现在界面积分 (3.4) 中的不是 $v _ 3$ 本身，而是 $|\nabla v _ 3|^2 = |\partial _ 1 v _ 3|^2 + |\partial _ 2 v _ 3|^2 + |\partial _ z v _ 3|^2$ 。尽管奇对称迫使 $v _ 3| _ {z=0} = 0$ 且切向导数 $\partial _ 1 v _ 3| _ {z=0} = \partial _ 2 v _ 3| _ {z=0} = 0$ ，但奇函数关于 $z$ 的一阶法向导数 $\partial _ z v _ 3$ 是关于 $z$ 的偶函数，在赤道平面 $z = 0$ 上可以严格非零。而对 $Z$ 权项而言，在非零谐波模态 $\pm(2,1)$ 下， $R _ {\ast}$ 对称由角度相位的奇偶性配平，竖直速度 $v _ 3$ 本身在赤道平面 $z = 0$ 上即严格非零。

下面我们给出两族不依赖任何数值近似、完全由纯闭式有理系数与高斯矩构成的精确解析反例，直接证伪未施加跨面一阶法向导数接合条件的命题 B.1 / 不等式 (B.20)。

---

### 3.3 全闭式反例族 A：轴对称紧支无散扰动在 $D$ 权接缝上的严格正破坏裕量与双模型分离

取论文附录 B 第 50–55 页的合法基准参数：时间周期 $S = 1$ ，旋转重数 $\kappa = 3$ ，对称群 $\Gamma = \langle (R _ {\pi/3}, 1/2), (R _ {\ast}, 0) \rangle$ ，参考剖面 $W^r = 0$ ，权重 $Z = 0$ ，离散索引集 $P _ \lambda = P _ \mu = \varnothing$ ，自由维数 $n = N = 0$ ， $K = \mathbb{R}^0$ ，辅助场列表为空， $c _ \mu = 1/2$ ， $n _ \lambda = n _ {\nabla\lambda} = n _ \mu = 0$ 。对时间不变的紧支无散场 $v$ ，算子作用简化为：

$$
\begin{aligned}
& F = T _ 1 v = \frac{1}{2}v + \frac{1}{2}(y \cdot \nabla)v - \Delta v, \qquad M v = -\Delta v, \qquad J = 0, \cr
& \Vert v\Vert _ \mu = 0, \qquad c _ M^2 = \frac{50}{3}, \qquad w _ {\ast} = \frac{39}{50}.
\end{aligned}
$$

此时由无散场帕塞瓦尔（Parseval）恒等式 $\langle T _ 1 v, -\Delta v\rangle = \Vert \Delta v\Vert _ {L^2}^2 + \frac{1}{4}\Vert \nabla v\Vert _ {L^2}^2$ ，不等式 (B.20) 中的辅助常数 $w$ 与 $3/50$ 完全相消， $\mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}}$ 精确等于公式 (3.4) 的 $E _ D(v)$ 。

**分侧二阶可微双权函数的构造**： 令五次埃尔米特（Hermite）平滑阶跃多项式为 $h(t) = 6t^5 - 15t^4 + 10t^3$ （满足 $h(0)=h'(0)=h''(0)=0$ ， $h(1)=1$ ， $h'(1)=h''(1)=0$ ，且在 $[0,1]$ 上 $h'(t) = 30t^2(1-t)^2 \ge 0$ ）。定义径向截断函数：

$$
\chi(\sigma) = \begin{cases}
0, & 0 \le \sigma \le \dfrac{1}{4}, \cr
h(12\sigma - 3), & \dfrac{1}{4} < \sigma < \dfrac{1}{3}, \cr
1, & \dfrac{1}{3} \le \sigma < 1,
\end{cases}
$$

并定义一对分侧 $C^2$ 多项式样条权函数：

$$
\begin{aligned}
& D _ \pm(y) := \frac{1}{2} \pm \frac{1}{4}\chi(\sigma) |\eta| \cr
& = \frac{1}{2} \pm \frac{1}{4}\chi\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho}, \qquad D _ \pm(0) = \frac{1}{2}.
\end{aligned} \tag{3.6}
$$

显然， $D _ +$ 与 $D _ -$ 在原点邻域 $\rho \le 1/3$ 内恒等于常数 $1/2$ ，在上下半空间各自属于 $C^2$ 分片多项式，全域满足 $\frac{1}{4} \le D _ \pm \le \frac{3}{4}$ （故 $I _ 2' = 1 - D _ \pm \ge \frac{1}{4} > 0$ ），轴对称且关于 $z$ 偶对称。在 $\rho \ge \frac{1}{2}$ （即 $\sigma \ge \frac{1}{3}$ ）的区域内， $\chi(\sigma) = 1$ ， $D _ +(y) = \frac{1}{2} + \frac{|z|}{4\rho}$ ，故跨赤道平面 $z=0$ 的法向一阶导数跳跃为：

$$
\begin{aligned}
& [\partial _ z D _ +] (r) = \frac{1}{2r}, \qquad [\partial _ z D _ -] (r) = -\frac{1}{2r} \cr
& \left(r \ge \frac{1}{2}\right).
\end{aligned} \tag{3.7}
$$

**紧支集二阶可微轴对称无散扰动场的构造**： 取紧支集偶多项式母函数 $a(t) := (1 - t^2) _ +^4 \in C _ c^3(\mathbb{R})$ （支集为 $[-1, 1]$ ， $a(0)=1$ ），对 $0 < \varepsilon \le \frac{1}{4}$ ，定义轴对称流函数 $\psi _ \varepsilon$ 与无散速度场 $v _ \varepsilon$ （柱坐标分量 $(v _ r, v _ \varphi, v _ 3)$ ）：

$$
\begin{aligned}
& \psi _ \varepsilon(r, z) := \varepsilon z a\left(\frac{r-1}{\varepsilon}\right) a\left(\frac{z}{\varepsilon}\right), \cr
& v _ r = -\frac{1}{r}\partial _ z \psi _ \varepsilon, \qquad v _ \varphi = 0, \cr
& v _ 3 = \frac{1}{r}\partial _ r \psi _ \varepsilon.
\end{aligned} \tag{3.8}
$$

记局部标度变量 $s = \frac{r-1}{\varepsilon} \in [-1,1]$ ， $t = \frac{z}{\varepsilon} \in [-1,1]$ ，则

$$
\begin{aligned}
& v _ r(r,z) = -\frac{\varepsilon}{r}a(s)\bigl(a(t) + t a'(t)\bigr), \cr
& v _ 3(r,z) = \frac{\varepsilon}{r}t a'(s)a(t).
\end{aligned} \tag{3.9}
$$

直接核验可知：

**（1）严格无散与紧支正则性**：

$$
\begin{aligned}
& \operatorname{div} v _ \varepsilon = \frac{1}{r}\partial _ r(r v _ r) + \partial _ z v _ 3 \cr
& = -\frac{1}{r}\partial _ r\partial _ z \psi _ \varepsilon + \frac{1}{r}\partial _ z\partial _ r \psi _ \varepsilon \cr
& \equiv 0;
\end{aligned}
$$

支集位于环形管道 $\lbrace |r-1| \le \varepsilon, |z| \le \varepsilon\rbrace$ ，远离对称轴 $r=0$ 与原点（在支集上 $\rho \ge r \ge 1 - \varepsilon \ge \frac{3}{4} > \frac{1}{2}$ ，故 $\chi(\sigma) \equiv 1$ ）；且 $a \in C _ c^3 \implies v _ \varepsilon \in C _ c^2(\mathbb{R}^3)$ 。

**（2）严格满足离散旋转与反射对称性**： $v _ \varepsilon$ 轴对称且时间不变， $v _ r$ 关于 $z$ 为偶函数， $v _ 3$ 关于 $z$ 为奇函数，故在 $R _ {\ast} = \operatorname{diag}(1, -1, -1)$ 反射下严格不变，属于合法空间 $\mathcal{D} _ S^\Gamma$ 。

**（3）赤道平面法向导数非零逃逸**： 在平面 $z = 0$ （即 $t = 0$ ）上，虽然 $v _ 3(r,0) = 0$ 且 $\partial _ r v _ 3(r,0) = 0$ ，但因为 $a(0) = 1$ ，法向导数为

$$
\partial _ z v _ 3(r, 0) = \frac{a'(s)}{r} \neq 0.
$$

#### 定理 3.2（反例族 A 的精确有理正残差下界与简化读口双模型分离定理）

在上述合法弱合同数据与扰动场 $v _ \varepsilon$ （取 $a(t) = (1-t^2) _ +^4$ ， $\varepsilon = 2^{-16} = \frac{1}{65536}$ ）下，命题 B.1 的核心不等式 (B.20)（原命题要求 $E _ D(v) := \mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} \le 0$ ）在权函数 $D _ +$ 下被严格违反，其精确闭式有理正下界为：

$$
E _ {D _ +}(v _ \varepsilon) \ge \gamma _ \varepsilon := \frac{\pi}{65536}\cdot\frac{633509743}{432432000} > 0. \tag{3.10}
$$

同时，在读取“体积海森算子范数场 $\Vert H _ D\Vert _ {\mathrm{op}}$ 、赤道平面权值 $D| _ {z=0}$ 、共同上下界 $[1/4, 3/4]$ 及全部基准结构参数”的简化读口 $q _ {\mathrm{red}}$ 下，双权函数 $(D _ +, D _ -)$ 完全同值（ $q _ {\mathrm{red}}(D _ +) = q _ {\mathrm{red}}(D _ -)$ ），但它们在 (B.20) 中的泛函输出却呈现一正一负的严格对称分离：

$$
\begin{aligned}
& E _ {D _ +}(v _ \varepsilon) \ge +\gamma _ \varepsilon > 0, \cr
& E _ {D _ -}(v _ \varepsilon) \le -\gamma _ \varepsilon < 0, \cr
& E _ {D _ +}(v _ \varepsilon) - E _ {D _ -}(v _ \varepsilon) \ge \frac{\pi}{32768}\cdot\frac{633509743}{432432000} > 0.
\end{aligned} \tag{3.11}
$$

**证明**：
**第一步**：精确计算界面奇异积分 $T _ \varepsilon$ 。在支集 $r \in [1-\varepsilon, 1+\varepsilon] \subset [3/4, 5/4]$ 上， $[\partial _ z D _ +] = \frac{1}{2r}$ ， $|\nabla v _ 3(r,0)|^2 = |\partial _ z v _ 3(r,0)|^2 = \frac{a'(s)^2}{r^2}$ ，面积元 $dS = 2\pi r dr = 2\pi \varepsilon (1 + \varepsilon s) ds$ 。由于 $1 + \varepsilon s \le \frac{5}{4}$ ，有 $(1 + \varepsilon s)^{-1} \ge \frac{4}{5}$ ，故

$$
\begin{aligned}
& T _ \varepsilon = \int _ {z=0} \frac{|\nabla v _ 3|^2}{2r} dS \cr
& = \pi \varepsilon \int _ {-1}^1 \frac{a'(s)^2}{1 + \varepsilon s} ds \cr
& \ge \pi \varepsilon \int _ {-1}^1 \frac{a'(s)^2}{(1 + \varepsilon s)^2} ds \ge \frac{16\pi}{25}\varepsilon A,
\end{aligned}
$$

其中一维有理矩 $A$ 为（利用 $a'(s) = -8s(1-s^2)^3$ ）：

$$
\begin{aligned}
& A = \int _ {-1}^1 a'(s)^2 ds = 64 \int _ {-1}^1 s^2(1-s^2)^6 ds \cr
& = 128 \sum _ {j=0}^6 \frac{(-1)^j \binom{6}{j}}{2j+3} = \frac{131072}{45045}.
\end{aligned} \tag{3.12}
$$

**第二步**：精确控制开区域体积海森算子范数 $\Vert H _ {D _ +}\Vert _ {\mathrm{op}}$ 。在支集 $\rho \ge \frac{3}{4}$ 上， $D _ + = \frac{1}{2} + \frac{|z|}{4\rho}$ 。直接对 $\frac{z}{\rho}$ 求二阶笛卡尔导数：

$$
\begin{aligned}
& \nabla^2\left(\frac{z}{\rho}\right) = -\frac{e _ 3 \otimes y + y \otimes e _ 3 + z I _ 3}{\rho^3} \cr
& + \frac{3z y \otimes y}{\rho^5},
\end{aligned}
$$

故在支集上

$$
\begin{aligned}
& \Vert H _ {D _ +}\Vert _ {\mathrm{op}} = \frac{1}{4}\left\Vert \nabla^2\frac{|z|}{\rho}\right\Vert _ {\mathrm{op}} \cr
& \le \frac{3}{2\rho^2} \le \frac{3}{2(3/4)^2} = \frac{8}{3} < 3 =: M.
\end{aligned}
$$

**第三步**：精确控制速度梯度平方 $|\nabla v _ \varepsilon|^2$ 与体积损失。在 $[-1,1]$ 上， $|a(t)| \le 1$ ； $a'(t)^2 = 64 t^2(1-t^2)^6$ 在 $t^2 = 1/7$ 处达到极大值 $\frac{64 \times 6^6}{7^7} = \frac{2985984}{823543} < 4$ ，故 $|a'(t)| \le 2$ ； $a''(t) = -8(1-t^2)^2(1-7t^2)$ 在 $t=0$ 处绝对值为 $8$ 、在 $t^2 = 3/7$ 处绝对值为 $\frac{256}{49} < 8$ ，故 $|a''(t)| \le 8$ 。代入轴对称柱坐标梯度五分量：

$$
\begin{aligned}
& |\nabla v _ \varepsilon|^2 = |\partial _ r v _ r|^2 + |\partial _ z v _ r|^2 + \left|\frac{v _ r}{r}\right|^2 \cr
& + |\partial _ r v _ 3|^2 + |\partial _ z v _ 3|^2,
\end{aligned}
$$

在 $r \ge \frac{3}{4}$ 、 $\varepsilon \le \frac{1}{4}$ 下，五项的一致上界依次为 $|\partial _ r v _ r| \le \frac{28}{3}$ 、 $|\partial _ z v _ r| \le 16$ 、 $|v _ r/r| \le \frac{4}{3}$ 、 $|\partial _ r v _ 3| \le \frac{104}{9}$ 、 $|\partial _ z v _ 3| \le 8$ ，平方求和得精确有理常数：

$$
\begin{aligned}
& |\nabla v _ \varepsilon|^2 \le K := \left(\frac{28}{3}\right)^2 + 16^2 + \left(\frac{4}{3}\right)^2 \cr
& + \left(\frac{104}{9}\right)^2 + 8^2 = \frac{43936}{81}.
\end{aligned} \tag{3.13}
$$

支集环形管道的体积为

$$
\begin{aligned}
& \operatorname{Vol}(\operatorname{supp} v _ \varepsilon) \cr
& = \int _ {- \varepsilon}^{\varepsilon} dz \int _ {1-\varepsilon}^{1+\varepsilon} 2\pi r dr = 8\pi \varepsilon^2.
\end{aligned}
$$

在公式 (3.4) 中，前两项体积积分的绝对值之和至多为

$$
\begin{aligned}
& 2 \int \Vert H _ {D _ +}\Vert _ {\mathrm{op}}|\nabla v _ \varepsilon|^2 dy \le 2 M K \cdot 8\pi \varepsilon^2 \cr
& = 16\pi M K \varepsilon^2.
\end{aligned}
$$

因此：

$$
\begin{aligned}
& E _ {D _ +}(v _ \varepsilon) \ge T _ \varepsilon - 16\pi M K \varepsilon^2 \cr
& \ge \pi \varepsilon\left(\frac{16}{25}A - 16 M K \varepsilon\right).
\end{aligned} \tag{3.14}
$$

将 $A = \frac{131072}{45045}$ 、 $M = 3$ 、 $K = \frac{43936}{81}$ 与 $\varepsilon = \frac{1}{65536}$ 代入括号内，执行精确有理数通分：

$$
\begin{aligned}
& \frac{16}{25}\cdot\frac{131072}{45045} - 16\times 3\times \frac{43936}{81}\times \frac{1}{65536} \cr
& = \frac{2097152}{1126125} - \frac{1373}{3456} = \frac{633509743}{432432000} > 0,
\end{aligned}
$$

这便立得不等式 (3.10)。
最后，由于 $H _ {D _ -} = -H _ {D _ +}$ 且 $[\partial _ z D _ -] = -[\partial _ z D _ +]$ ，记权函数非常数部分 $\pm\frac{1}{4}\chi|\eta|$ 的完整分布配对线性项为 $\pm J _ v$ ，共同体积算子范数罚项为 $C _ v = \int \Vert H _ {D _ +}\Vert _ {\mathrm{op}}|\nabla v _ \varepsilon|^2 dy \ge 0$ ，则 $E _ {D _ +}(v _ \varepsilon) = J _ v - C _ v \ge \gamma _ \varepsilon$ 从而给出 $J _ v \ge C _ v + \gamma _ \varepsilon$ ，从而 $E _ {D _ -}(v _ \varepsilon) = -J _ v - C _ v \le -2C _ v - \gamma _ \varepsilon \le -\gamma _ \varepsilon < 0$ ，证得双模型分离 (3.11)。（注：若将 $a(t)$ 替换为 $C _ c^\infty$ 光滑隆起函数 $a _ \infty(t) = \exp(1 - (1-t^2)^{-1})\mathbf{1} _ {|t|<1}$ 并取 $\varepsilon = 10^{-15}$ ，同样有 $E _ {D _ +}(v _ \varepsilon) \ge \frac{4\pi}{9}\times 10^{-15} > 0$ ，说明反例与紧支扰动是否达到 $C^\infty$ 无关。）证毕。

---

### 3.4 全闭式反例族 B：施瓦茨高斯无散 $\pm(2,1)$ 模态扰动在 $Z$ 权接缝上的严格破坏下界（ $> 400c$ ）

为了证明奇异界面测度核漏不仅发生在二阶权 $D$ 与零谐波轴对称场上，而且同样发生在一阶权 $Z$ 与非零角度谐波场上，我们给出第二族完全独立的解析反例。

保持第 3.3 节的基准空数据（ $S=1, \kappa=3, W^r=0, D=0, P _ \lambda=P _ \mu=\varnothing, n=N=0$ ），取复多项式实部与虚部

$$
C _ 6(x,y) + i S _ 6(x,y) := (x + i y)^6,
$$

以及各向异性三维高斯包络函数

$$
g(x,y,z) := \exp\left(-\frac{x^2 + y^2}{2} - 6z^2\right).
$$

定义三维施瓦茨（Schwartz）向量场 $v = (v _ 1, v _ 2, v _ 3)$ ：

$$
v(x,y,z) := g(x,y,z) \bigl(-2 z y C _ 6(x,y), 2 z x C _ 6(x,y), -S _ 6(x,y)\bigr). \tag{3.15}
$$

同时，取分侧 $C^2$ 样条权函数

$$
Z(y) := c P(\sigma) |\eta| = c P\left(\frac{\rho}{1+\rho}\right)\frac{|z|}{\rho} \qquad (c > 0), \tag{3.16}
$$

其中径向截断函数 $P(\sigma)$ 在 $[0, \frac{1}{20}]$ 上恒为 $0$ ，在 $[\frac{1}{20}, \frac{1}{10}]$ 上为 $h(20\sigma - 1)$ ，在 $[\frac{1}{10}, 1)$ 上恒为 $1$ 。

#### 定理 3.3（反例族 B 的高斯无散对称资格与严格正残差下界定理）

向量场 (3.15) 严格属于无散施瓦茨空间 $\mathcal{S}(\mathbb{R}^3) \cap \mathcal{D} _ S^\Gamma$ ，在论文第 50 页公式 (B.2) 的基谐波展开 $E _ \iota = \exp(i[2\pi(2\iota _ 2 - \iota _ 1)\theta + \kappa\iota _ 1\varphi])$ （ $\kappa=3$ ，时间不变 $\theta$ 无依赖即 $2\iota _ 2 = \iota _ 1$ ，角度频率 $\kappa\iota _ 1 = \pm 6 \implies \iota _ 1 = \pm 2, \iota _ 2 = \pm 1$ ）下精确对应于谐波模态 $\iota = \pm(2,1)$ 。其梯度与向量拉普拉斯算子的精确 $L^2$ 高斯矩及不等式 (B.20) 左端精确值为：

$$
\begin{aligned}
& \Vert \nabla v\Vert _ {L^2(\mathbb{R}^3)}^2 = 14880 \frac{\pi^{3/2}}{2\sqrt{3}}, \cr
& \Vert \Delta v\Vert _ {L^2(\mathbb{R}^3)}^2 = 431280 \frac{\pi^{3/2}}{2\sqrt{3}},
\end{aligned} \tag{3.17}
$$

$$
\begin{aligned}
& \mathrm{LHS} _ {\mathrm{B.20}} = \frac{47}{50}\Vert \Delta v\Vert _ {L^2}^2 \cr
& + \frac{127}{625}\Vert \nabla v\Vert _ {L^2}^2 = \frac{51053352}{125} \frac{\pi^{3/2}}{2\sqrt{3}} \cr
& = \frac{8508892}{125}\sqrt{3}\pi^{3/2}.
\end{aligned} \tag{3.18}
$$

而在分侧 $C^2$ 权函数 $Z = c P(\sigma)|\eta|$ （ $c > 0$ ）下，不等式 (B.20) 的右端减左端差值 $\Delta := \mathrm{RHS} _ {\mathrm{B.20}} - \mathrm{LHS} _ {\mathrm{B.20}} = E _ Z(v)$ 满足不依赖任何数值积分的纯闭式解析下界：

$$
\begin{aligned}
& \frac{\Delta}{c} \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} \cr
& > \frac{26311}{64} > 400 > 0.
\end{aligned} \tag{3.19}
$$

**证明**：
**第一步**：验证精确无散性与 $\Gamma$ 对称性。因为 $C _ 6 + i S _ 6 = (x+iy)^6$ 是全纯多项式，由柯西－黎曼（Cauchy–Riemann）方程及欧拉齐次定理， $x\partial _ x C _ 6 + y\partial _ y C _ 6 = 6 C _ 6$ ， $x\partial _ y C _ 6 - y\partial _ x C _ 6 = -6 S _ 6$ 。直接计算水平散度与竖直散度：

$$
\begin{aligned}
& \partial _ x v _ 1 + \partial _ y v _ 2 \cr
& = 2z g\bigl[(-y\partial _ x C _ 6 + x\partial _ y C _ 6) + (-xy + xy)C _ 6\bigr] = -12 z g S _ 6,
\end{aligned}
$$

$$
\partial _ z v _ 3 = -\partial _ z(g S _ 6) = +12 z g S _ 6,
$$

故 $\operatorname{div} v = -12 z g S _ 6 + 12 z g S _ 6 \equiv 0$ 。在柱坐标 $(r, \varphi, z)$ 下， $v _ r = 0$ ， $v _ \varphi = 2 z r^7 g \cos(6\varphi)$ ， $v _ 3 = -r^6 g \sin(6\varphi)$ 。在反射 $R _ {\ast} : (x, y, z) \mapsto (x, -y, -z)$ （即 $\varphi \mapsto -\varphi, z \mapsto -z$ ）下， $C _ 6 = r^6\cos(6\varphi)$ 不变， $S _ 6 = r^6\sin(6\varphi)$ 变号， $z$ 变号，故 $(v _ 1, v _ 2, v _ 3)(R _ {\ast} y) = (v _ 1, -v _ 2, -v _ 3)(y) = R _ {\ast} v(y)$ ，且绕 $z$ 轴旋转 $\pi/3$ （ $\varphi \mapsto \varphi + \pi/3$ ）使 $6\varphi \mapsto 6\varphi + 2\pi$ 严格不变，故 $v \in \mathcal{D} _ S^\Gamma$ 。

**第二步**：计算赤道界面奇异积分的正贡献。跨平面 $z=0$ 的法向导数跳跃为 $[\partial _ z Z] (r) = \frac{2c P(r/(1+r))}{r}$ 。在赤道平面 $z=0$ 上， $v _ 3(r,\varphi,0) = -r^6 e^{-r^2/2}\sin(6\varphi)$ （严格非零）。不做原点小邻域截止时的完整高斯界面积分为（利用 $\int _ 0^{2\pi} \sin^2(6\varphi) d\varphi = \pi$ 及伽马积分 $\int _ 0^\infty r^{12} e^{-r^2} dr = \frac{11!!}{2^{7}}\sqrt{\pi} = \frac{10395}{128}\sqrt{\pi}$ ）：

$$
\begin{aligned}
& A _ 0 = \int _ {z=0} \frac{2c}{r} v _ 3^2 dS = 2\pi c \int _ 0^\infty r^{12} e^{-r^2} dr \cr
& = \frac{10395}{64}\pi^{3/2}c.
\end{aligned} \tag{3.20}
$$

由于 $p(\rho) := P(\rho/(1+\rho))$ 在 $\rho \ge \frac{1}{9}$ （即 $\sigma \ge \frac{1}{10}$ ）上恒等于 $1$ ，原点截止损失至多为 $2\pi c \int _ 0^{1/9} r^{12} dr = \frac{2\pi c}{13\cdot 9^{13}}$ 。

**第三步**：精确计算外部开区域 $\rho \ge \frac{1}{9}$ 与过渡球壳 $\frac{1}{19} \le \rho \le \frac{1}{9}$ 上的体积海森损失。
在外部区域 $\rho \ge \frac{1}{9}$ 上， $Z(y) = c\frac{|z|}{\rho}$ 。在球坐标正交标架 $(e _ \rho, e _ \theta, e _ \varphi)$ 下，记 $t = \frac{|z|}{\rho} \in [0,1]$ ，矩阵 $\rho^2 H _ {|z|/\rho}$ 的精确形式为：

$$
\rho^2 H _ {|z|/\rho} = \begin{pmatrix}
0 & -\sqrt{1-t^2} & 0 \cr
-\sqrt{1-t^2} & -t & 0 \cr
0 & 0 & -t
\end{pmatrix},
$$

其三个本征值为 $\frac{-t \pm \sqrt{4-3t^2}}{2}$ 与 $-t$ ；最大本征值绝对值 $\frac{t + \sqrt{4-3t^2}}{2}$ 在 $t = \frac{1}{\sqrt{3}}$ 处达到全域最大值 $\frac{2}{\sqrt{3}}$ 。因此：

$$
\Vert H _ Z(y)\Vert _ {\mathrm{op}} \le \frac{2c}{\sqrt{3}\rho^2} \qquad \left(\rho \ge \frac{1}{9}\right). \tag{3.21}
$$

利用 $\rho^2 \ge r^2$ ，计算加权高斯体积积分 $J := \int _ {\mathbb{R}^3} \frac{|v|^2}{\rho^2} dy$ ：

$$
\begin{aligned}
& J \le \pi \int _ {-\infty}^\infty dz \int _ 0^\infty e^{-r^2 - 12z^2}\bigl(4z^2 r^{13} + r^{11}\bigr) dr \cr
& = \pi \left(4\cdot\frac{\sqrt{\pi}}{24\sqrt{12}}\cdot\frac{6!}{2} + \frac{\sqrt{\pi}}{\sqrt{12}}\cdot\frac{5!}{2}\right) \cr
& = \frac{60}{\sqrt{3}}\pi^{3/2}.
\end{aligned}
$$

在公式 (3.5) 中，

$$
\begin{aligned}
& \int v^T H _ Z v dy - \int \Vert H _ Z\Vert _ {\mathrm{op}}|v|^2 dy \cr
& \ge -2\int \Vert H _ Z\Vert _ {\mathrm{op}}|v|^2 dy,
\end{aligned}
$$

故外部区域两项体积损失总和不超过 $2 \cdot \frac{2c}{\sqrt{3}} J = 80\pi^{3/2}c$ 。
在微小过渡球壳 $\frac{1}{19} \le \rho \le \frac{1}{9}$ 上，由 $|P'(\sigma)| \le \frac{75}{2}$ 、 $|P''(\sigma)| \le 6000$ 及乘积求导链式法则得 $\Vert H _ Z\Vert _ {\mathrm{op}} < 9000c$ ，而球壳上 $|v|^2 \le 2\rho^{12}$ ，积分 $\int _ {\rho \le 1/9} |v|^2 dy \le \frac{8\pi}{15\cdot 9^{15}}$ ，故两项过渡区体积损失总和不超过 $\frac{9600\pi c}{9^{15}}$ 。
将界面主项 $\frac{10395}{64}\pi^{3/2}c$ 减去外部体积最大损失 $80\pi^{3/2}c = \frac{5120}{64}\pi^{3/2}c$ ，恰好余下 $\frac{10395 - 5120}{64}\pi^{3/2}c = \frac{5275}{64}\pi^{3/2}c$ 。再扣除两项极小有理指数尾项，利用 $\pi > 3 \implies \pi^{3/2} > 5$ ，即得 $\frac{\Delta}{c} > \frac{26375 - 64}{64} = \frac{26311}{64} > 400$ 。证毕。

---

## 第四章　强接合修复下的 $O(\delta^{-1})$ 薄层曲率税守恒律，以及纸面文本与代码强前件之间的语义裂缝

### 4.1 为什么奇异界面测度不能靠“微小圆角磨平”无代价消除？

面对第三章的两族严格反例，一个最自然的修补冲动是：“既然分侧样条在赤道平面 $z = 0$ （即 $\eta = 0$ ）处的尖角 $|\eta|$ 产生了法向导数跳跃 $[\partial _ z W] \neq 0$ ，那么我们只需在赤道平面两侧宽度为 $2\delta$ （ $0 < \delta \le 1$ ）的极薄夹层 $|\eta| \le \delta$ 内，把尖角 $|\eta|$ 磨平为一个二阶连续可微的偶多项式样条 $s _ \delta(\eta)$ ，不就能让跨面跳跃 $[\partial _ z W] _ \Sigma = 0$ 彻底消失，从而恢复 $E _ {D _ \delta}(v) \le 0$ 了吗？”

这一追问触及了连续统偏微分方程中“分布奇异性”与“光滑曲率税”之间最深刻的守恒律。让我们写出唯一满足端点二阶射流（2-jet）匹配条件的极小四次偶多项式过渡样条：

$$
\begin{aligned}
& s _ \delta(\eta) := \begin{cases}
\dfrac{3\delta}{8} + \dfrac{3\eta^2}{4\delta} - \dfrac{\eta^4}{8\delta^3}, & |\eta| \le \delta, \cr
|\eta|, & |\eta| \ge \delta,
\end{cases}
\cr
& D _ \delta(y) := \frac{1}{2} + \frac{1}{4}\chi(\sigma) s _ \delta(\eta).
\end{aligned}
\tag{4.1}
$$

在 $|\eta| < \delta$ 内部，求一阶与二阶导数：

$$
\begin{aligned}
& s _ \delta'(\eta) = \frac{3\eta}{2\delta} - \frac{\eta^3}{2\delta^3}, \cr
& s _ \delta''(\eta) = \frac{3}{2\delta}\left(1 - \frac{\eta^2}{\delta^2}\right).
\end{aligned} \tag{4.2}
$$

在接缝端点 $\eta = \pm \delta$ 处， $s _ \delta(\pm\delta) = \delta$ ， $s _ \delta'(\pm\delta) = \pm 1$ ， $s _ \delta''(\pm\delta) = 0$ ，故 $s _ \delta \in C^2([-1,1])$ ，从而 $D _ \delta \in C^2(\mathbb{R}^3)$ 是全局二阶连续可微的强合同权函数。此时，跨面法向导数跳跃 $[\partial _ z D _ \delta] _ \Sigma = 0$ ，定理 3.1 中的奇异面测度项确实恒等于零，公式 (3.4) 给出的 $E _ {D _ \delta}(v) \le 0$ 重新成立。

**然而，原本集中在赤道平面上的奇异曲率去哪儿了？**
它以总曲率质量严格守恒的方式，等量转化为薄层 $|\eta| \le \delta$ 内部量级达 $O(\delta^{-1})$ 的**体积海森曲率密度**。

#### 定理 4.1（强接合薄层过渡的曲率峰值与奇异界面质量守恒极限律）

对于全局 $C^2(\mathbb{R}^3)$ 强接合权函数族 $D _ \delta = \frac{1}{2} + \frac{1}{4}\chi(\sigma)s _ \delta(\eta)$ （ $0 < \delta \le 1$ ）：

**（1）点态曲率峰值反比发散**： 样条二阶导数在 $\eta = 0$ 处达到峰值 $\max _ {|\eta|\le\delta} s _ \delta''(\eta) = \frac{3}{2\delta}$ （归一化界面核 $\frac{1}{2}s _ \delta''$ 的峰值为 $\frac{3}{4\delta}$ ），其总曲率质量对一切 $\delta \in (0,1]$ 恒为守恒常数：

$$
\begin{aligned}
& \int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2, \cr
& \int _ {-\delta}^{\delta} \frac{1}{2}s _ \delta''(\eta) d\eta = 1.
\end{aligned} \tag{4.3}
$$

在赤道平面 $z = 0$ （ $r > 0$ ）上， $D _ \delta$ 的竖直二阶笛卡尔偏导数精确等于：

$$
\begin{aligned}
& \partial _ {zz} D _ \delta(r, 0) = \frac{3 \chi\left(\frac{r}{1+r}\right)}{8 \delta r^2} \cr
& + \frac{3 \delta \chi'\left(\frac{r}{1+r}\right)}{32 r(1+r)^2}.
\end{aligned} \tag{4.4}
$$

**（2）薄层体积海森罚项的非零极限**： 对任意紧支集连续非负测试场 $f \in C _ c(\mathbb{R}^3)$ （例如 $f = |\nabla v|^2$ ），当薄层厚度 $\delta \downarrow 0$ 时，尽管薄层 $\lbrace |\eta| < \delta\rbrace$ 的三维体积以 $O(\delta)$ 趋于零，但体积海森算子范数 $\Vert H _ {D _ \delta}\Vert _ {\mathrm{op}}$ 在薄层上的体积积分**绝不趋于零**，而是严格收敛到未磨平前奇异界面测度的配对积分：

$$
\begin{aligned}
& \lim _ {\delta \downarrow 0} \int _ {|\eta| < \delta} \Vert H _ {D _ \delta}(y)\Vert _ {\mathrm{op}} f(y) dy \cr
& = \int _ {z=0} \frac{\chi\left(\frac{r}{1+r}\right)}{2r} f(y _ 1, y _ 2, 0) dS _ \Sigma > 0.
\end{aligned} \tag{4.5}
$$

**证明**：公式 (4.3) 由直接积分

$$
\int _ {-\delta}^{\delta} \frac{3}{2\delta}(1-\eta^2/\delta^2) d\eta = \frac{3}{2\delta}\cdot\frac{4\delta}{3} = 2
$$

得到。在 $z=0$ 处，由 $\eta = z/\rho$ 与 $\sigma = \rho/(1+\rho)$ ，有 $\partial _ z \eta = \frac{1}{r}$ 、 $\partial _ {zz}\eta = 0$ 、 $\partial _ z \sigma = 0$ 、 $\partial _ {zz}\sigma = \frac{1}{r(1+r)^2}$ ，代入复合求导链式法则及 $s _ \delta(0) = \frac{3\delta}{8}$ 、 $s _ \delta'(0) = 0$ 、 $s _ \delta''(0) = \frac{3}{2\delta}$ ，即得 (4.4)。
对于极限 (4.5)，在远离原点的支集上（ $\chi$ 在 $\rho \le 1/3$ 内恒为零，故无原点奇性），将 $H _ {D _ \delta}$ 分解为主部秩一张量与有界余项： $H _ {D _ \delta} = A _ \delta + R _ \delta$ ，其中

$$
A _ \delta(y) = \frac{1}{4}\chi(\sigma)s _ \delta''(\eta) \nabla\eta \otimes \nabla\eta \succeq 0,
$$

而 $R _ \delta$ 仅含 $s _ \delta(\eta) = O(\delta)$ 、 $s _ \delta'(\eta) = O(1)$ 及光滑坐标导数，故 $\Vert R _ \delta\Vert _ {\mathrm{op}}$ 关于 $\delta \in (0,1]$ 一致有界。因薄层 $|\eta| < \delta$ 在紧集上的体积为 $O(\delta)$ ，余项贡献 $\int _ {|\eta|<\delta} \Vert R _ \delta\Vert _ {\mathrm{op}} f dy = O(\delta) \to 0$ 。对主部 $\Vert A _ \delta\Vert _ {\mathrm{op}} = \frac{1}{4}\chi(\sigma)s _ \delta''(\eta)|\nabla\eta|^2$ ，固定柱坐标 $(r, \varphi)$ ，以 $z = \frac{r\eta}{\sqrt{1-\eta^2}}$ 换元，则 $|\nabla\eta|^2 = \frac{1-\eta^2}{\rho^2} = \frac{(1-\eta^2)^2}{r^2}$ ， $dz = \frac{r}{(1-\eta^2)^{3/2}} d\eta$ ，从而薄层竖直积分为

$$
\begin{aligned}
& \int _ {|z| < r\delta/\sqrt{1-\delta^2}} \Vert A _ \delta\Vert _ {\mathrm{op}} f dz \cr
& = \int _ {-\delta}^{\delta} \frac{\chi(\sigma)}{4r} s _ \delta''(\eta)\sqrt{1-\eta^2} f d\eta \cr
& = \int _ {-1}^{1} \frac{\chi}{4r}\cdot\frac{3}{2}(1-t^2)\sqrt{1-\delta^2 t^2} \cr
& \quad f(y _ 1,y _ 2,\tfrac{r\delta t}{\sqrt{1-\delta^2 t^2}}) dt.
\end{aligned}
$$

由勒贝格控制收敛定理及 $\int _ {-1}^1 \frac{3}{2}(1-t^2) dt = 2$ ，令 $\delta \downarrow 0$ 并对 $r dr d\varphi = dS _ \Sigma$ 积分，立得 (4.5)。证毕。

### 4.2 纸面弱合同与代码强合同的分型定界

定理 3.2、定理 3.3 与定理 4.1 共同揭示了一条铁律：在命题 B.1 的加权乘子不等式 (B.20) 中，跨赤道平面 $y _ 3 = 0$ 的法向接合条件与薄层体积海森罚项是生死攸关的承重结构。

**纸面措辞**：在论文第 53 页的文字叙述中，作者一方面将权函数写成了上下半空间的分侧样条公式，另一方面又笼统地使用了“定义在 $\mathbb{R}^3$ 上”和“属于 $C^2$ 类”的字眼。

**分侧无接合弱合同**：如果读者或验证者按照第 53 页的分侧样条公式，仅检验上下半空间各自的分片多项式 $C^2$ 正则性而删去跨 $y _ 3=0$ 平面的法向导数接合前件（即**分侧无接合弱合同**），那么命题 B.1 的主不等式 (B.20) **已被上述反例族 A（公式 (3.10)）与反例族 B（公式 (3.19)）从数学上彻底证伪**（这也正是作者公开仓库第 2 号与第 3 号问题单中被外部研究者独立捕捉到的接缝漏洞，而我们在此给出了不依赖任何浮点积分的全闭式解析证明）。

**全局强接合合同**：反之，如果按照全空间 $C^2(\mathbb{R}^3)$ 强合同解读（作者在公开仓库的伴随说明文件 CellLayerChallenge 与 ExtendedCoerciveChallenge 中，确实对权函数显式加上了带 $(-1)^o$ 奇偶符号的跨平面二阶接合条件与全空间二阶连续可微条件，从而在定义域入口处排除了未接合的 $D _ \pm$ 与 $Z$ ），那么反例族 A 与 B 因不满足跨面一阶接合（在支集上 $\frac{1}{4} \neq -\frac{1}{4}$ 且 $cP \neq -cP$ ）而被挡在强合同定义域之外；但此时，任何满足强合同的真实权函数证书都必须在 $I _ 1 = Z - \Vert H _ D\Vert _ {\mathrm{op}} - \frac{3w}{50}$ 与 $I _ 0 = -\Vert H _ Z\Vert _ {\mathrm{op}}$ 中显式承担定理 4.1 所揭示的跨平面二阶曲率代价。至于作者引用的外部数值证书是否在不损失强制性裕量的前提下承担了这一曲率项，则引出了第五章的第二重核心审查。

---

## 第五章　第二重结构审查：纸面证明的未闭合归约环节——被省略的 (B.16)/B.1/B.4 耦合系数、未公开的外部数值证书与树状舒尔主元刚性判据

### 5.1 为什么说该 79 页 PDF 本身不是一份自足闭合的纸面证明？

即使我们给予作者最强的全局 $C^2(\mathbb{R}^3)$ 跨面接合解读，将 79 页 PDF 作为一份**数学纸面证明**来衡量，它依然存在四座在纸面上完全悬空的“无桥墩跨梁”：

| 纸面位置 | 承重内容 | 原件状态 | 闭合影响 |
|:---|:---|:---|:---|
| 第 1、4、70 页 | 附录 B 数值证书 | 仅 SHA-256 前缀 3f7a335b... | 存在性前件未能独立核验 |
| 第 4、10 页 | 128 位区间算术验证 | 证书数据与输出未公开 | 外部核验链未闭合 |
| 第 54–56 页 | (B.16) 与命题 B.1 | 误差系数及完整证明省略 | 标量不等式无法由 PDF 重建 |
| 第 59–60、70 页 | 命题 B.4 与附加条件 | 证明及七项条件未展开 | 证书归约合同未闭合 |

**（1）最上游存在性证人未公开（第 1、4、70 页）**：满足附录 B 全部不等式与接合条件的有限维数值证书实例 $d \in \mathcal{D} _ B$ 在论文与公开仓库中均未提供任何数据字节，全文仅印出一串 64 位十六进制 SHA-256 哈希值 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5，致使蕴涵链最左端的存在性前件 $\exists d \in \mathcal{D} _ B \mathsf{Valid} _ B(d)$ 在纸面上无法独立核验。

**（2）128 位区间算术校验器与输出未公开（第 4、10 页第 1.5 节）**：对于数值证书的 128 位区间算术（Arb / FLINT）矩阵与样条不等式验证，作者明确指出该区间算术计算位于形式化内核之外，且公开仓库中未提供该证书数据与验证输出，外部数值验证环节保持悬空。

**（3）公式 (B.16) 误差系数与命题 B.1 完整证明省略（第 54–56 页）**：第 54 页公式 (B.16) 省略了五类二次型系数中显式的高阶误差吸收系数，而第 55–56 页命题 B.1 仅给出从分侧样条到全局乘子下界 (B.20) 的分部积分概要并声明完整证明移交外部代码，使纸面读者无法仅凭 PDF 原件重建完整的标量系数不等式。

**（4）命题 B.4 证明与第 70 页七项附加条件未展开（第 59–60、70 页）**：从任意无散扰动到有限空间单元未知量的归约、压力规范、跨单元迹拼接、无穷谐波尾界 (B.32)–(B.34) 在第 59–60 页省略了命题 B.4 的纸面证明，且第 70 页在定理 B.14 证明末尾直接罗列了单元压力归一化、局部到全局未知量映射、 $W^r$ 遗漏谐波耦合、 $y _ 3=0$ 附近矩形单元与 $\iota\mapsto -\iota$ 对称等 7 项未在纸面写出的附加条件，故蕴涵箭头 $\mathsf{Valid} _ B(d) \implies \mathsf{Cert} _ 7(\Phi(d))$ 在纸面上尚未构成闭合、可枚举的公理合同。

在严格的数学规范下，**一份哈希摘要不是一个数学对象，一段“详见外部代码”的声明也不是一段纸面证明**。因此，该 79 页 PDF 实质上是一份“关于定理 1.1、定理 7.1 及附录 B 树状矩阵归约框架的条件纲领与扩展摘要”，而非自足完备的纳维－斯托克斯有限时爆破纸面证明。

### 5.2 引理 B.7 树状二次型递推与命题 B.8 自由块补偿的完整数学重建及同域破缺判据

尽管外部大矩阵证书未公开，但附录 B 第 62–64 页的**引理 B.7**（树状分块二次型正定传递）与**命题 B.8**（自由块非正性与受限严格正定推出唯一自由补偿）构成了整套有限维证书的代数心脏。我们在此给出其完整的闭式数学证明，并确立检验任何此类矩阵证书是否发生核漏或正定崩溃的**两条精确充要判据**。

#### 定理 5.1（引理 B.7 有限树加权杨氏消去与命题 B.8 自由补偿直和分解定理）

设 $X = P \oplus F$ 为有限维实向量空间（ $P$ 为主扰动块， $F$ 为自由参数块）， $\mathcal{T}$ 为任意有限有根树。对每个节点 $\xi \in \mathcal{T}$ ，给定正权重向量 $w _ {\xi,i} > 0$ 、枢轴坐标子集 $U _ \xi$ 、枢轴系数 $p _ {\xi,j}$ 、行界 $m _ {\xi,i} > 0$ 、可舍弃列矩阵 $Y _ \xi'$ 、约束列矩阵 $Y _ \xi$ 、对称矩阵 $H _ \xi, K _ \xi, N _ \xi, V _ \xi$ 及逐项非负误差矩阵 $H _ \xi', K _ \xi'$ ，满足论文第 62 页公式 (B.39)–(B.40)：

$$
\begin{aligned}
& H _ \xi[x] \le N _ \xi[x] + \sum _ {\xi' \in \operatorname{child}(\xi)} V _ {\xi'}[x] + H _ \xi'[|x|], \cr
& V _ \xi[x] \le K _ \xi[x] - \sum _ {j \notin U _ \xi} m _ {\xi,j} x _ j^2 + K _ \xi'[|x|],
\end{aligned} \tag{5.1}
$$

$$
\begin{aligned}
& R _ \xi := H _ \xi - \operatorname{diag} _ {U _ \xi}(p _ \xi) - Y _ \xi' (Y _ \xi')^T + Y _ \xi Y _ \xi^T - K _ \xi, \cr
& \sum _ j \bigl(|R _ {\xi,ij}| + H _ {\xi,ij}' + K _ {\xi,ij}'\bigr)\frac{w _ {\xi,i}}{w _ {\xi,j}} \le m _ {\xi,i}, \cr
& \bar{p} _ {\xi,j} \le p _ {\xi,j} - m _ {\xi,j}.
\end{aligned} \tag{5.2}
$$

则：

**（1）单节点加权杨氏下界**： 由 $2|x _ i x _ j| \le \frac{w _ {\xi,i}}{w _ {\xi,j}}x _ i^2 + \frac{w _ {\xi,j}}{w _ {\xi,i}}x _ j^2$ 及矩阵对称性，必有 $-R _ \xi[x] + (H _ \xi' + K _ \xi')[|x|] \le \sum _ i m _ {\xi,i} x _ i^2$ ，从而

$$
\begin{aligned}
& N _ \xi[x] + \sum _ {\xi' \in \operatorname{child}(\xi)} V _ {\xi'}[x] - V _ \xi[x] \cr
& \ge \sum _ {j \in U _ \xi} \bar{p} _ {\xi,j} x _ j^2 - |Y _ \xi^T x|^2.
\end{aligned} \tag{5.3}
$$

**（2）全树求和与受限严格正定**： 对有限树 $\mathcal{T}$ 全部节点求和，每个非根节点 $\xi$ 恰好作为某个父节点的子节点出现一次，故内部传递项 $V _ \xi[x]$ 在左端一正一负精确对消；若根节点传递矩阵半正定 $V _ {\mathrm{root}}[x] \ge 0$ ，且每个坐标 $j$ 在全树上的累积枢轴下界 $D _ {jj} := \sum _ {\xi : j \in U _ \xi} \bar{p} _ {\xi,j} > 0$ ，则总矩阵 $N := \sum _ {\xi \in \mathcal{T}} N _ \xi$ 满足

$$
N \succeq D - Y Y^T \qquad \bigl(Y := [Y _ \xi] _ {\xi \in \mathcal{T}}\bigr), \tag{5.4}
$$

进而在约束核子空间 $S := \ker Y^T \subseteq X$ 上严格正定： $N[x] \ge (\min _ j D _ {jj})|x|^2 > 0$ （ $\forall x \in S \setminus \lbrace 0\rbrace$ ）。

**（3）自由块直和分解与唯一补偿**： 若在自由子空间 $F = \lbrace 0\rbrace \oplus F$ 上有 $N| _ F \preceq 0$ （由论文第 64 页公式 (B.44) 取零扰动 $v=0$ 时右端为 $-|\zeta|^2/1000 \le 0$ 保证），且约束列总数满足 $\operatorname{ncols}(Y) \le \dim F$ ，则必有 $S \cap F = \lbrace 0\rbrace$ 及维数夹逼：

$$
\begin{aligned}
& \dim F \ge \operatorname{ncols}(Y) \ge \operatorname{rank}(Y) = \operatorname{codim}(S) \ge \dim F \cr
& \implies X = S \oplus F, \qquad \operatorname{rank}(Y) = \operatorname{ncols}(Y) = \dim F.
\end{aligned} \tag{5.5}
$$

将 $Y^T$ 按 $P \oplus F$ 分块写作 $Y^T = (Y _ p^T, Y _ f^T)$ ，则 $Y _ f$ 必为可逆方阵，对任意主块状态 $x _ p \in P$ ，存在唯一自由补偿 $x _ f = -(Y _ f^T)^{-1} Y _ p^T x _ p \in F$ 使得 $(x _ p, x _ f) \in S = \ker Y^T$ （若不要求唯一性，则存在补偿 $x _ f$ 的充要条件是零空间包含条件 $\operatorname{im} Y _ p^T \subseteq \operatorname{im} Y _ f^T \iff \ker Y _ f \subseteq \ker Y _ p$ ）。

在此精确代数结构之上，我们澄清两个极易被粗糙直觉误用的判定界限，并给出**同域破缺的充要定理**：

#### 定理 5.2（同域不可删观察行的核漏证人判据）

在受限子空间 $\operatorname{im} J$ （ $J$ 为 $S = \ker Y^T$ 的满列秩基底矩阵）上，从观察矩阵 $H$ 中删去第 $i$ 行得到 $H _ {-i}$ 后，目标线性读出 $B$ 发生核漏（即不再能由 $H _ {-i}$ 唯一重构），**当且仅当存在同域核漏证人向量** $z$ 满足：

$$
H _ {-i} J z = 0, \qquad B J z \neq 0. \tag{5.6}
$$

（注：若被删去的是线性冗余行，例如 $H = \bigl[(1, 1); (2, 2)\bigr]$ 、 $B = (1, 1)$ 删去第一行，则 $\ker(H _ {-i}J) \subseteq \ker(BJ)$ 依然成立，不会发生核漏；因此绝不能笼统宣称“任删一行必核漏”，而必须按 (5.6) 构造同域非零核漏证人。）

#### 定理 5.3（受限子空间上真实主元翻号的瑞利商阈值判据）

设对称矩阵 $N = L D L^T$ 在受限子空间 $S = \operatorname{im} J$ 上的诱导二次型 $Q _ S := J^T N J \succ 0$ 严格正定。若将 $D$ 的第 $j$ 个正主元 $d _ j > 0$ 翻号为 $-d _ j$ （即 $N' = N - 2d _ j L e _ j e _ j^T L^T$ ），令受限投影向量为 $b := J^T L e _ j$ ，定义无量纲瑞利（Rayleigh）商阈值：

$$
\tau := 2 d _ j b^T Q _ S^{-1} b \ge 0. \tag{5.7}
$$

则翻号后的受限二次型 $Q _ S' = J^T N' J = Q _ S - 2d _ j b b^T$ 满足三分律：

**情形一（亚阈值受扰）**： 当 $\tau < 1$ 时（例如被翻号的主元方向与受限子空间 $S$ 正交或耦合极弱）， $Q _ S' \succ 0$ 在 $S$ 上依然严格正定

**情形二（临界退化）**： 当 $\tau = 1$ 时， $Q _ S' \succeq 0$ 退化为半正定且产生非零零空间方向 $z _ 0 = Q _ S^{-1} b$

**情形三（超阈值翻号）**： 当且仅当 $\tau > 1$ 时， $Q _ S'$ 在受限子空间 $S$ 上真正出现严格负方向，且显式负证人向量 $z _ - := Q _ S^{-1} b$ 给出严格负值

$$
z _ -^T Q _ S' z _ - = \bigl(b^T Q _ S^{-1} b\bigr)(1 - \tau) < 0. \tag{5.8}
$$

定理 5.2 与定理 5.3 告诉我们：对于论文未公开的外部证书（SHA-256 前缀 3f7a335b）以及被省略的 (B.16)/B.1/B.4 耦合系数，任何有效的科学审计都必须落实到 (5.6) 的同域核漏证人与 (5.7)–(5.8) 的受限瑞利阈值 $\tau > 1$ 上。

### 5.3 静态分片乘子框架下的补充材料不变性定理：为何解封 SHA-256 证书或追加外围证明材料无法消除算子层偏差

针对该 79 页论文最上游的存在性证人 $d \in \mathcal{D} _ B$ （第 1、4、38–39、70 页）未公开任何具体数值或数据文件、仅印有一串 64 位十六进制 SHA-256 哈希码 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 这一事实，一个自然需要探讨的数学问题是：“这一缺口是否仅源于作者尚未公布那份数值证书文件，或尚未补充关于赤道薄层磨平与网格细分的辅助说明？如果后续将 SHA-256 哈希对应的原始数据文件解封公开，或在代码仓库中追加更多辅助引理，证明能否在不改变现有框架的前提下得以闭合？”

我们在此基于算子分解与分布微积分的严格恒等式，证明一条**静态分片乘子框架下的补充材料不变性定理**（补证三难定理）：**在保持论文现有静态分片乘子框架不变的前提下，无论后续解封 SHA-256 证书原文件、附加赤道薄层磨平修正，还是追加外围辅助引理与校验代码，均无法在同一扰动定义域上消除上述分部积分算子偏差。**

#### 定理 5.4（静态分片乘子框架下解封哈希证书、薄层磨平与扩充引理的三难结构定理）

在论文附录 B（第 50–70 页）连接有限维证书空间 $\mathcal{D} _ B$ 与无穷维无散场全空间 $\mathcal{D} _ S^\Gamma$ 的归约架构中，任何试图仅通过“追加补充证明材料”来弥合命题 B.1 / 核心不等式 (B.20) 的路径，在数学上均受制于以下三个互斥且穷尽的结构性分支之一：

**分支一（解封哈希原文件或追加有限维样条系数表）**： 在全篇证明架构中，64 位哈希值 3f7a335b84b6c7631742cacc5343dfcd11cf72f5221ff79b2b9268790b4b22c5 所指向的证人 $d \in \mathcal{D} _ B$ ，其唯一数学身份是一张有限维分片多项式样条与矩阵系数表（给出近似自相似背景场 $W^r$ 与乘子权函数 $D, Z$ 在上下半空间网格单元上的多项式系数）。从这张有限维系数表 $d \in \mathcal{D} _ B$ 跨向无穷维无散扰动全空间 $\mathcal{D} _ S^\Gamma$ 的强制性结论（命题 2.3、命题 4.1 与定理 7.1），唯一分析桥梁是附录 B 第 55–56 页的命题 B.1 / 核心不等式 (B.20)。

核漏 $\ker q _ {\mathrm{bulk}} \not\subseteq \ker f _ v$ 发生在**连接有限维样条与无穷维无散流体的分布微分算子恒等式层**（定理 3.1： $D^2 W = H _ W dy + [\partial _ z W] _ \Sigma(e _ 3 \otimes e _ 3) dS _ \Sigma$ ），而绝非“证书文件里少了几个数值没印出来”。

无论哈希原文件 $d \in \mathcal{D} _ B$ 内部装的是什么样条系数值：只要其分侧样条权函数 $W \in \lbrace D, Z\rbrace$ 在赤道平面 $\Sigma = \lbrace y _ 3 = 0\rbrace$ 的任意非空开环域上具有非零单侧法向恢复斜率（即 $[\partial _ z W] _ \Sigma > 0$ ），将该开环域代入定理 3.2 的紧支轴对称无散场 $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ （或定理 3.3 的施瓦茨无散场），不等式 (B.20) 即被严格为正的界面积分项所违反（反例族 A 给出 $E _ {D _ +}(v _ \varepsilon) \ge \frac{\pi}{65536}\frac{633509743}{432432000} > 0$ ，反例族 B 给出 $\Delta/c > \frac{26311}{64} > 400 > 0$ ）。公开有理数系数表本身并不能改变 $\mathbb{R}^3$ 上的分布海森分部积分恒等式。

**分支二（附加赤道薄层二阶可微磨平修正或网格加密说明）**： 若作者追加一份补充修正说明，声称在赤道薄层 $|z| \le \delta$ （或 $|\eta| \le \delta$ ，其中 $\delta = \lambda\varepsilon$ ， $0 < \lambda \le \frac{1}{4}$ ）内将分侧尖角 $|z|$ 替换为满足二阶射流匹配的偶对称 $C^2$ 四次磨平样条 $s _ \delta(z) = \frac{3\delta}{8} + \frac{3z^2}{4\delta} - \frac{z^4}{8\delta^3}$ （使得跨面跳跃 $[\partial _ z D _ \delta] _ \Sigma = 0$ ，奇异面测度彻底归零）：

**（2a）原体积海森上界下的纯体积积分等量重现**： 考察定理 3.2 中**完全相同**的紧支无散反例场 $v _ \varepsilon \in \mathcal{D} _ S^\Gamma$ （ $\varepsilon = 2^{-16} = \frac{1}{65536}$ ）。由 (3.9)，在薄层 $|z| \le \delta$ 内，竖直速度的法向导数为 $\partial _ z v _ 3(r,z) = \frac{a'(s)}{r} b(t)$ （其中 $t = \frac{z}{\varepsilon}$ ， $b(t) := \frac{d}{dt}[t(1-t^2)^4] = (1-t^2)^3(1-9t^2) = 1 - 12t^2 + 30t^4 - 28t^6 + 9t^8$ ）。利用完全平方分解恒等式：

$$
\begin{aligned}
& b(t) - (1 - 12t^2) = t^4\bigl(30 - 28t^2 + 9t^4\bigr) \cr
& = t^4\left[9\left(t^2 - \frac{14}{9}\right)^2 + \frac{74}{9}\right] \ge 0 \qquad (\forall t \in \mathbb{R}),
\end{aligned} \tag{5.9}
$$

可知对一切 $|t| \le \lambda \le \frac{1}{4}$ ，恒有 $b(t) \ge 1 - 12t^2 > 0$ 及 $b(t)^2 \ge (1-12t^2)^2 \ge 1 - 24t^2$ 。将磨平权函数 $D _ \delta$ 代入**纯体积海森积分**

$$
\sum _ {k=1}^3 \int _ {\mathbb{R}^3} (\partial _ k v _ \varepsilon)^T H _ {D _ \delta}(\partial _ k v _ \varepsilon) dy,
$$

薄层 $|z| \le \delta = \lambda\varepsilon$ 内的竖直曲率核 $\frac{1}{2}s _ \delta''(z) = \frac{3}{4\delta}(1 - (z/\delta)^2)$ 对 $b(z/\varepsilon)^2$ 的一维转移因子为：

$$
\begin{aligned}
& I _ {\mathrm{collar}}(\lambda) := \int _ {-1}^{1} \frac{3}{4}(1 - \tau^2) b(\lambda\tau)^2 d\tau \cr
& \ge \int _ {-1}^{1} \frac{3}{4}(1 - \tau^2)(1 - 24\lambda^2\tau^2) d\tau = 1 - \frac{24}{5}\lambda^2.
\end{aligned} \tag{5.10}
$$

特别地，取薄层比例 $\lambda = \frac{\delta}{\varepsilon} = \frac{1}{8}$ （即 $\delta = 2^{-19} = \frac{1}{524288}$ ），多项式精确有理积分与闭式下界给出：

$$
\begin{aligned}
& I _ {\mathrm{collar}}\left(\frac{1}{8}\right) = \frac{2787617180779875667}{3000241776758882304} \cr
& > 1 - \frac{24}{5}\left(\frac{1}{8}\right)^2 = \frac{37}{40} = 0.925 > 0.
\end{aligned} \tag{5.11}
$$

因此，即便在 $C^2$ 强接合磨平后的**纯体积海森读口**下，同一无散场 $v _ \varepsilon$ 对原证书体积界 $M = 3$ 的不等式 (B.20) 依然产生精确可算的严格正残差：

$$
\begin{aligned}
& \frac{E _ {D _ \delta}^{\mathrm{cert}}(v _ \varepsilon)}{\pi\varepsilon} \cr
& \ge \frac{16}{25} I _ {\mathrm{collar}}\left(\frac{1}{8}\right)A - 16 M K \varepsilon \cr
& = \frac{2147573301937507667}{1611064563204096000} > \frac{16}{25}\cdot\frac{37}{40}A - 16 M K \varepsilon \cr
& = \frac{2865558827}{2162160000} > \frac{13}{10} > 0.
\end{aligned} \tag{5.12}
$$

**（2b）薄层曲率峰值并入体积梯度系数时的负值退化**： 若作者试图把薄层内的 $O(\delta^{-1})$ 曲率尖峰强行装入公式 (B.16) 的逐点体积系数 $I _ 1(y) = Z(y) - \Vert H _ {D _ \delta}(y)\Vert _ {\mathrm{op}} - \frac{3w}{50}$ ：

由公式 (B.16) 的另一正定约束 $I _ 1'(y) = \frac{1}{4} - Z(y) \ge 0$ 可知全域必有 $Z(y) \le \frac{1}{4}$ （且 $w \ge 0$ ）。而在赤道环点 $(r, z) = (1, 0)$ （此处 $\chi(1/2) = 1, \chi'(1/2) = 0$ ），由定理 4.1 公式 (4.4)，在 $\delta = 2^{-19}$ 时薄层海森算子范数达到 $\Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} \ge \frac{3}{8\delta} = 196608$ ，从而使梯度二次型系数 $I _ 1(1,0)$ 退化为大幅负值：

$$
\begin{aligned}
& I _ 1(1,0) = Z(1,0) - \Vert H _ {D _ \delta}(1,0)\Vert _ {\mathrm{op}} - \frac{3w}{50} \cr
& \le \frac{1}{4} - \frac{3}{8\delta} = \frac{1}{4} - 196608 = -\frac{786431}{4} < 0.
\end{aligned} \tag{5.13}
$$

**（2c）宏观宽薄层或抹平赤道法向恢复斜率时的谱失控**： 若作者取宏观宽薄层 $\delta = O(1)$ 或干脆令赤道单侧法向斜率 $c = \partial _ \eta W(\sigma, 0^+) \to 0$ 以逃避 $-\frac{3}{8\delta}$ 海森罚项：

则在整个赤道扇区 $|z| \le \delta r$ 内法向恢复权重被抹平，线性化算子 $\mathcal{L} _ {W^r}$ 在赤道平面 $y _ 3 = 0$ 附近丧失法向阻尼控制，主强制性不等式在赤道扇区直接失守。

**分支三（扩充外围辅助引理或缩减扰动空间）**： 在一阶逻辑与算子分解中，显式反例对理论扩充具有绝对持久性（Persistence of Counterexamples under Theory Extension）：只要核心桥接命题 B.1 的全称结论

$$
\forall v \in \mathcal{D} _ S^\Gamma, \mathrm{RHS} _ {\mathrm{B.20}}(v) \le \mathrm{LHS} _ {\mathrm{B.20}}(v)
$$

已被合法定义域内的显式闭式证人 $v _ {\ast} \in \mathcal{D} _ S^\Gamma$ 证伪，那么在不推翻该命题本身的静态乘子底座之前，无论往外部仓库里再追加多少万行辅助引理、多少个区间算术校验脚本或多少页参数表，只要主定理链仍需调用命题 B.1 去控制 $\mathcal{D} _ S^\Gamma$ ，同一个闭式反例 $v _ {\ast}$ 就依然使该桥接命题为假。反之，若为了排除反例 $v _ {\ast}$ 而对扰动空间 $\mathcal{D} _ S^\Gamma$ 额外施加赤道零法向导数或零迹限制，则论文第七节（第 70 页）的非线性涡度拉伸自举闭合条件（该条件要求线性化预解式对非线性项 $B(v,v)$ 产生的任意 $\Gamma$ -对称无散残差均具有强制性控制）将不再满足。

**证明**：分支一由定理 3.1、定理 3.2 与定理 3.3 直接给出；分支二中，完全平方分解 (5.9) 由展开 $9(u - 14/9)^2 + 74/9 = 9u^2 - 28u + 30$ （ $u = t^2$ ）核验，代入一维核积分 $\int _ {-1}^1 \frac{3}{4}(1-\tau^2) d\tau = 1$ 与 $\int _ {-1}^1 \frac{3}{4}(1-\tau^2)\tau^2 d\tau = \frac{1}{5}$ 得 (5.10)–(5.12)，再结合定理 4.1 的 (4.4) 与 $Z \le 1/4$ 得 (5.13)；分支三由全称量词被单点反例证伪的单调持久性及第七节非线性不动点算子的值域闭合要求直接导出。证毕。

---

## 第六章　深层流体动力学结构：三维纳维－斯托克斯方程中“固定欧氏二次读口”的整体反号盲区、论文 (B.18) 的偶性边界，以及随流协变逆度规下的纯平方耗散形式

现在，我们回到第一章提出的核心结构问题：**在三维不可压流体动力学分析中，如何严格区分流体的真实几何演化结构与固定坐标系投影所产生的高阶语义漂移伪影。**
在三维不可压纳维－斯托克斯流体动力学中，这种“真体与伪影的混淆”究竟是如何发生的？为什么固定欧氏坐标系下的静态二次范数读口注定看不见流体演化的下一拍方向？而当我们在随流协变逆度规下还原流体真体时，非交换涡度拉伸项又是如何被精确配平为纯平方耗散的？

### 6.1 静态欧氏全谱二次读口的核漏：同能谱双初值 $\pm 17U$ 的 $4913$ 拟能导数分歧

在经典调和分析与能量法中，研究者习惯于用速度场或涡度场在固定欧氏坐标系下的各阶索伯列夫（Sobolev）二次范数——甚至全部傅里叶模态上的逐模二次能谱矩阵——来刻画流体的“强度”：

$$
\begin{aligned}
& q _ {\mathrm{static}}(u) := \Bigl(\bigl\lbrace \hat{u}(k)\hat{u}(k)^{\ast}\bigr\rbrace _ {k \in \mathbb{Z}^3}, \cr
& \quad \Vert u\Vert _ {L^2}^2, \Vert \omega\Vert _ {L^2}^2, \Vert \nabla\omega\Vert _ {L^2}^2, \langle u, \omega\rangle\Bigr).
\end{aligned} \tag{6.1}
$$

这是一个典型的零阶静态投影读口。它在整体速度反号变换 $u \mapsto -u$ 下是完全偶对称（盲视）的： $q _ {\mathrm{static}}(+u) = q _ {\mathrm{static}}(-u)$ 。然而，三维纳维－斯托克斯方程的旋度演化却包含三次非交换涡度拉伸项 $\langle \omega, (\omega \cdot \nabla)u\rangle$ 。

#### 定理 6.1（三维环面真实纳维－斯托克斯流在全谱静态二次读口下的同谱双初值分歧定理）

在体积归一化的三维周期环面 $\mathbb{T}^3 = (\mathbb{R}/2\pi\mathbb{Z})^3$ 上，定义如下仅含八个非零傅里叶频率 $\pm e _ 1, \pm e _ 2, \pm e _ 3, \pm(e _ 1+e _ 2)$ 的光滑无散零均值速度场：

$$
U(x,y,z) := \bigl(\sin y + \sin z, \sin x, \sin x - \sin(x+y)\bigr). \tag{6.2}
$$

对任意实振幅 $a > 0$ ，考察一对正负孪生光滑无散初值 $u _ 0^\pm := \pm a U$ ，并设 $u^\pm(t,x)$ 为由其出发的真实局部光滑纳维－斯托克斯解（在 $s > 5/2$ 的索伯列夫球 $C([0,T], H^s(\mathbb{T}^3))$ 上由热半群杜哈梅尔压缩映射与高阶自举保证共同局部光滑寿命 $T > 0$ 及 $t=0$ 处的时间可微性）。则：

**（1）全谱静态二次读口下的恒同性**： 在初始时刻 $t = 0$ ， $u _ 0^+$ 与 $u _ 0^-$ 的每一个傅里叶单模厄米矩阵 $\hat{u} _ 0^\pm(k)\hat{u} _ 0^\pm(k)^{\ast}$ 逐模相等，且动能 $E$ 、平方涡量（拟能） $Y = \langle |\omega|^2\rangle$ 、涡度梯度平方 $Z = \langle |\nabla\omega|^2\rangle$ 及螺旋度（Helicity） $H = \langle u, \omega\rangle$ 完全相同：

$$
E(u _ 0^\pm) = \frac{5}{2}a^2, \qquad Y(u _ 0^\pm) = 3a^2, \qquad Z(u _ 0^\pm) = 4a^2, \qquad H(u _ 0^\pm) = 0. \tag{6.3}
$$

**（2）真实演化算子下的瞬时导数分歧**： 在 $t = 0$ 处，真实旋度演化方程给出平方涡量时间导数

$$
\begin{aligned}
& Y _ \pm'(0) = \left.\frac{d}{dt}\right| _ {t=0} \langle |\omega^\pm(t)|^2\rangle \cr
& = 2\langle \omega _ 0^\pm, (\omega _ 0^\pm \cdot \nabla)u _ 0^\pm\rangle - 2\nu\langle |\nabla\omega _ 0^\pm|^2\rangle \cr
& = \pm\frac{1}{2}a^3 - 8\nu a^2.
\end{aligned} \tag{6.4}
$$

特别地，取黏性系数 $\nu = 1$ 、振幅 $a = 17$ ，则正负孪生解在 $t = 0$ 处的平方涡量变化率一正（瞬时涡度拉伸主导增长）一负（瞬时协同黏性耗散衰减），其定量分离精确达到：

$$
Y _ +'(0) = +\frac{289}{2}, \qquad Y _ -'(0) = -\frac{9537}{2}, \qquad Y _ +'(0) - Y _ -'(0) = 17^3 = 4913 \neq 0. \tag{6.5}
$$

**证明**：直接求导得 $\operatorname{div} U = 0$ ，旋度 $\omega = \nabla \times U = (-\cos(x+y), \cos z - \cos x + \cos(x+y), \cos x - \cos y)$ ，速度梯度矩阵为

$$
L = \nabla U = \begin{pmatrix}
0 & \cos y & \cos z \cr
\cos x & 0 & 0 \cr
\cos x - \cos(x+y) & -\cos(x+y) & 0
\end{pmatrix}.
$$

由三角函数正交归一化均值 $\langle \cos^2 x\rangle = \frac{1}{2}$ 立得 (6.3)。对于三次涡度拉伸项 $\langle \omega^T L \omega\rangle$ ，展开后凡含独立因子 $\cos z$ 一次幂或非共振频率之和的项均值皆为零，唯一非零共振三波项来自 $\cos x \cos y \cos(x+y)$ ：

$$
\begin{aligned}
& \langle \omega^T L \omega\rangle = \bigl\langle \cos x \cos y (\cos x \cos y - \sin x \sin y)\bigr\rangle \cr
& = \langle \cos^2 x\rangle\langle \cos^2 y\rangle = \frac{1}{2}\times\frac{1}{2} = \frac{1}{4}.
\end{aligned}
$$

故 $2\langle \omega _ 0^\pm, L _ 0^\pm \omega _ 0^\pm\rangle = \pm 2 a^3 \cdot \frac{1}{4} = \pm \frac{1}{2}a^3$ ，减去黏性耗散 $2\nu Z(u _ 0^\pm) = 8\nu a^2$ 即得 (6.4)；代入 $a=17, \nu=1$ 得 $\frac{4913}{2} - 2312 = \frac{289}{2}$ 与 $-\frac{4913}{2} - 2312 = -\frac{9537}{2}$ ，差值恰为 $4913$ 。证毕。

### 6.2 论文公式 (B.18) 线性化参考剖面二次型的偶性方法论边界

在 Alpöge 与 Buckmaster 的论文第 55 页公式 (B.18) 中，作者围绕一个固定的参考剖面 $W^r$ （其对称应变张量为 $S _ r = \operatorname{sym}(\nabla W^r)$ ，参考涡度为 $\omega _ r = \operatorname{curl} W^r$ ）写出了扰动场 $v$ （扰动涡度 $\omega _ v = \operatorname{curl} v$ ）的涡度拉伸与对流耦合二次泛函：

$$
\begin{aligned}
& J _ {W^r}(v) := -\omega _ v \cdot S _ r \omega _ v + \bigl((v \cdot \nabla)\omega _ r\bigr) \cdot \omega _ v \cr
& + \frac{1}{2}\sum _ {k=1}^3 \nabla(\omega _ r) _ k \cdot (v \times \partial _ k v).
\end{aligned} \tag{6.6}
$$

这里必须指出一条精确的方法论边界：
虽然 $J _ {W^r}(v)$ 引入了固定参考剖面 $\omega _ r$ 与扰动谐波之间的跨模态耦合（从而能够区分扰动场不同谐波分量之间的相对相位），但因为 $W^r$ 被固定为背景常数场，公式 (6.6) 中的每一项都恰好包含两个关于扰动 $v$ 的一次线性因子。因此，在扰动整体反号变换 $v \mapsto -v$ 之下，必有：

$$
J _ {W^r}(-v) = J _ {W^r}(v). \tag{6.7}
$$

也就是说，固定背景剖面下的线性化二次型 $J _ {W^r}(v)$ 本身关于扰动 $v$ 仍然是严格偶对称的（这并不妨碍它在附录 B 中作为二次强制性下界的一部分，但意味着它只编码了相对于背景场 $W^r$ 的二阶微扰谱，而未直接编码扰动自身的三次自相互作用 $B(v,v)$ 的奇次符号）。论文中对非线性自相互作用 $B(v,v)$ 的控制，完全依赖于先由线性化二次强制性获得足够小范数的先验球，再通过第七节的压缩不动点将三次项压入二阶主部之下——这也再次说明了第三章与第五章所分析的附录 B 二次强制性不等式 (B.20) 在全篇证明架构中的基础性地位。

### 6.3 随流协变逆度规 $g = C^{-1}$ 下的纯平方耗散真体与全残差守恒方程

为什么在固定欧氏度规 $I$ 下看似不可驯服的三次非交换涡度拉伸项 $2\omega^T L \omega$ ，一旦回到随流演化的几何真体中，其内在结构就会豁然开朗？

因为在固定欧氏坐标系中观察流体，就像站在静止河岸上用固定的直角网格去量度一个正在旋转拉伸的漩涡——漩涡每拉伸一分，固定网格就记录下一笔“能量凭空生成”的伪影（即 $\omega^T L \omega$ ）。反之，如果我们让度量衡本身——即一个光滑对称正定协变度规张量 $C(t,x) = C(t,x)^T \succ 0$ 及其逆度规 $g(t,x) := C(t,x)^{-1}$ ——沿着同一个对流－扩散算子 $P _ \nu = \partial _ t + u \cdot \nabla - \nu \Delta$ 随流体微团同步演化，那么涡度拉伸与度规形变就会在演化过程中实现精确的代数对偶相消。

#### 定理 6.2（任意维随流协变逆度规演化的全残差恒等式与纯平方耗散闭合定律）

设空间维数 $d \ge 2$ 、向量通道维数 $m \ge 1$ 任意有限，记抛物对流－扩散算子为 $P _ \nu = D _ t - \nu \Delta$ （其中 $D _ t = \partial _ t + u \cdot \nabla$ ， $\nu > 0$ ）。设 $C(t,x) \in \mathbb{R}^{m\times m}$ 为共同光滑区间上的对称正定矩阵场（ $C = C^T \succ 0$ ）， $g := C^{-1}$ 为其逆度规，定义协变拉回涡度向量 $z := g\omega = C^{-1}\omega$ 及随流协变拟能密度：

$$
\mathcal{E}(t,x) := \omega^T C^{-1} \omega = \omega^T g \omega = z^T C z. \tag{6.8}
$$

若涡度场 $\omega$ 与度规载体 $C$ 分别满足带一般生成元 $L, G$ 、一般扩散系数 $\nu, \kappa$ 及一般源残差 $r _ \omega, R _ C$ 的演化方程：

$$
P _ \nu \omega = L\omega + r _ \omega, \qquad (D _ t - \kappa \Delta)C = G C + C G^T + R _ C, \tag{6.9}
$$

则在完全保持非交换矩阵乘法次序的前提下，协变拟能密度 $\mathcal{E}$ 满足如下**零近似全残差演化恒等式**：

$$
\begin{aligned}
& P _ \nu\bigl(\omega^T C^{-1} \omega\bigr) \cr
& = -2\nu \sum _ {i=1}^d (\partial _ i z)^T C (\partial _ i z) + 2 z^T r _ \omega - z^T R _ C z \cr
& + z^T\bigl[(L - G)C + C(L - G)^T\bigr]z + (\nu - \kappa)z^T (\Delta C) z.
\end{aligned} \tag{6.10}
$$

特别地，当且仅当后四项合流残差消失——其统一充分条件为同生成元（ $G = L$ ）、同扩散率（ $\kappa = \nu$ ）且无外源（ $r _ \omega = 0, R _ C = 0$ ）（或者生成元失配满足 $C$ -反对称条件 $(L-G)C + C(L-G)^T = 0$ ，即 $L - G = K C^{-1}$ 且 $K^T = -K$ ）时，全部一阶涡度拉伸项被协变度规演化精确湮灭，化为纯平方耗散定律：

$$
\begin{aligned}
& P _ \nu\bigl(\omega^T C^{-1} \omega\bigr) \cr
& = -2\nu \sum _ {i=1}^d \bigl(\partial _ i(C^{-1}\omega)\bigr)^T C \bigl(\partial _ i(C^{-1}\omega)\bigr) \le 0.
\end{aligned} \tag{6.11}
$$

**证明**：对恒等式 $C g = I$ 求导（严格保持非交换矩阵顺序），得一阶导数 $\partial _ i g = -g(\partial _ i C)g$ ， $D _ t g = -g(D _ t C)g$ ，以及二阶导数：

$$
\begin{aligned}
& \partial _ {ii} g = 2 g(\partial _ i C) g (\partial _ i C) g - g(\partial _ {ii} C)g \implies P _ \nu g \cr
& = -g(P _ \nu C)g - 2\nu \sum _ {i=1}^d g(\partial _ i C)g(\partial _ i C)g.
\end{aligned} \tag{6.12}
$$

或者等价地，直接将 $\omega = C z$ 代入 $\mathcal{E} = z^T C z$ ：

**（1）对流导数**：

$$
\begin{aligned}
& D _ t(z^T C z) = 2 z^T C D _ t z + z^T(D _ t C)z = 2 z^T\bigl(D _ t(Cz) - (D _ t C)z\bigr) + z^T(D _ t C)z \cr
& = 2 z^T D _ t\omega - z^T(D _ t C)z.
\end{aligned}
$$

**（2）空间梯度与拉普拉斯算子**： 因 $\partial _ i\omega = (\partial _ i C)z + C(\partial _ i z)$ ，有 $\partial _ i(z^T C z) = 2 z^T \partial _ i\omega - z^T(\partial _ i C)z$ ；再对 $x _ i$ 求导并对 $i=1,\dots,d$ 求和，所有形如 $2(\partial _ i z)^T(\partial _ i C)z$ 的一阶交叉导数项一正一负精确配对，留下纯二阶项：

$$
\Delta(z^T C z) = 2 z^T \Delta\omega - z^T (\Delta C) z + 2\sum _ {i=1}^d (\partial _ i z)^T C (\partial _ i z). \tag{6.13}
$$

将对流导数减去 $\nu$ 倍 (6.13)，得到对一切光滑场普适的母恒等式：

$$
\begin{aligned}
& P _ \nu(z^T C z) = 2 z^T (P _ \nu \omega) - z^T (P _ \nu C) z \cr
& - 2\nu \sum _ {i=1}^d (\partial _ i z)^T C (\partial _ i z).
\end{aligned} \tag{6.14}
$$

最后将 (6.9) 中的 $P _ \nu\omega = L C z + r _ \omega$ 与 $P _ \nu C = (D _ t - \kappa\Delta)C + (\kappa-\nu)\Delta C = G C + C G^T + R _ C + (\kappa-\nu)\Delta C$ 代入 (6.14)，利用 $2 z^T L C z = z^T(L C + C L^T)z$ ，逐项整理立得全残差恒等式 (6.10) 与纯平方耗散定律 (6.11)。证毕。

### 6.4 协变载体正定性、欧氏回读谱桥税、全前缀重置守恒律与有限模观察尾项

定理 6.2 同时把三维纳维－斯托克斯方程的真体演化与外部低阶观测之间的**四笔必付账目**摆在了桌面上，任何一笔都不允许被掩盖或无证抹零：

**（1）协变度规正定保持与欧氏回读谱条件数**： 在周期域 $\mathbb{T}^3$ 的任意共同光滑区间 $[0, T _ 0]$ 上，给定 $L = \nabla u$ 、初值 $C(0) = I$ ，线性抛物方程 $P _ \nu C = L C + C L^T$ 存在唯一光滑对称解；且令 $s(t) := \sup _ {x \in \mathbb{T}^3} \Vert \operatorname{sym} L(t,x)\Vert _ {\mathrm{op}}$ ，由抛物极值原理（比较 $C(t,x) - m(t)I$ 与 $M(t)I - C(t,x)$ 的首次触零特征方向）， $C(t,x)$ 在 $[0, T _ 0]$ 上满足双边谱障碍：

$$
\exp\left(-2\int _ 0^t s(\tau) d\tau\right) I \preceq C(t,x) \preceq \exp\left(+2\int _ 0^t s(\tau) d\tau\right) I. \tag{6.15}
$$

对 (6.11) 在无散周期域上积分，对流项与拉普拉斯项积分消失，协变总拟能 $h(t) := \frac{1}{2}\langle \omega^T C^{-1} \omega\rangle$ 单调纯耗散递减：

$$
h'(t) = -\nu \sum _ {i=1}^d \bigl\langle (\partial _ i z)^T C (\partial _ i z)\bigr\rangle \le 0. \tag{6.16}
$$

但当我们从协变拟能 $h(t)$ **回读**固定欧氏拟能 $\frac{1}{2}\langle |\omega|^2\rangle = \frac{1}{2}\langle |Cz|^2\rangle$ 时，必须支付最大特征值谱桥因子 $|\omega|^2 = |Cz|^2 \le \lambda _ {\max}(C) z^T C z$ 。只要 $\lambda _ {\max}(C)$ 的上界仍依赖 $\int _ 0^t \Vert \operatorname{sym}\nabla u\Vert _ \infty d\tau$ ，就不能跳过这一端点度规增长预算而直接宣称无条件全局欧氏正则。

**（2）度规重置税的全前缀守恒律**： 若在演化中途时刻将变形后的度规 $C$ 重置回欧氏单位阵 $I$ （保持物理涡度 $\omega$ 不变），则协变拟能发生有限跳变（重置税）：

$$
s _ {\mathrm{reset}} := \frac{1}{2}\bigl\langle \omega, (I - C^{-1})\omega\rangle \tag{6.17}
$$

（当 $C = 2I$ 时 $s _ {\mathrm{reset}} > 0$ ，当 $C = \frac{1}{2}I$ 时 $s _ {\mathrm{reset}} < 0$ ）。记累计真实黏性耗散为 $d$ ，累计重置跳变和为 $S$ ，则在由“连续黏性耗散步 $(h, d, S) \mapsto (h-\delta, d+\delta, S)$ ”与“离散度规重置步 $(h, d, S) \mapsto (h+s _ {\mathrm{reset}}, d, S+s _ {\mathrm{reset}})$ ”组成的任意有限混合演化词的**每一个中间前缀**上，恒有严格守恒律：

$$
h + d - S = h _ 0. \tag{6.18}
$$

任何企图在中途透支预算、仅靠终点修回的伪守恒，都会在中间前缀处被立刻证伪。

**（3）有限模观察的跨界尾流与带阻尼杨氏余项**： 在考察如模式 $\tilde{e} _ n = (0, \cos(2^n x _ 1), -\sin(2^n x _ 1))$ 生成的自治二进级联壳系统

$$
\begin{aligned}
& z _ n' = 16^n\bigl(64 z _ {n-1}^2 - 16 z _ n z _ {n+1}\bigr) - \nu 4^n z _ n \cr
& (z _ n = 8^n u _ n, n \ge 0, z _ {-1}=0)
\end{aligned} \tag{6.19}
$$

时，若取带交叉项的有限前 $M$ 壳李雅普诺夫（Lyapunov）观察泛函

$$
F _ M(t) := \frac{1}{2}\sum _ {n=0}^M 16^{-n} z _ n^2 + \frac{1}{64}\sum _ {n=0}^M 16^{-n} z _ n z _ {n+1}, \tag{6.20}
$$

对原无穷维光滑解直接求导时，不能将截断边界外的真实尾模态 $z _ {M+1}, z _ {M+2}$ 预设为零。有限观察 $F _ M'(t)$ 必然携带精确的跨界尾流项：

$$
\begin{aligned}
& \mathcal{B} _ M = 64 z _ M^2 z _ {M+1} + \frac{17}{6}z _ {M+1}^3 + \frac{4}{3}z _ {M+2}^3 \cr
& + \frac{5\nu}{64}4^{-(M+1)}z _ {M+1}^2,
\end{aligned} \tag{6.21}
$$

而在内部壳 $0 \le n \le M$ 上，利用精确平方和分解的带阻尼杨氏不等式

$$
\begin{aligned}
& \frac{64 A^3}{243} - A z^2 + \frac{3}{4}z^3 = \left(z - \frac{8A}{9}\right)^2\left(\frac{3}{4}z + \frac{A}{3}\right) \cr
& \ge 0 \qquad (A, z \ge 0),
\end{aligned} \tag{6.22}
$$

取 $A = \frac{37}{32}\nu 4^{-n}$ ，可将黏性负项与三次正项 $\frac{47}{4}z _ n^3$ 配平，留下精确的立方耗散正余量与固定有理系数 $\frac{64}{243}\left(\frac{37}{32}\right)^3 = \frac{50653}{122472}$ 。唯有在共同光滑寿命区间 $[0, T] \subset [0, T _ {\ast})$ 上利用原解的高阶指数衰减证明 $\lim _ {M \to \infty} \mathcal{B} _ M = 0$ ，才能合法过渡到无穷维极限。

---

## 第七章　总结裁定表：同作者 79 页 NS 纸面证明的三重结构定性与“真体—伪影”判别总纲

综上所述，我们对与广义黎曼猜想宣称同作者（Levent Alpöge，与 Tristan Buckmaster 合著）于 2026 年 11 月 20 日放出的 79 页纳维－斯托克斯方程有限时爆破纸面证明原件，给出如下纯数学内部终审裁定：

| 审查层级 | 论文位置与对象 | 结构机制 | 定量证据 | 科学定性 |
|:---|:---|:---|:---|:---|
| 一：奇异界面测度 | 第 53–56 页，命题 B.1 | 体积读口遗漏界面配对 | 定理 3.2，式 (3.10)–(3.11)；定理 3.3 | 无跨面接合前件的版本被反例证伪 |
| 二：薄层曲率守恒 | 强接合四次过渡样条 | 面测度转移为体积曲率 | 定理 4.1，式 (4.3)–(4.5) | 强接合必须计入完整曲率代价 |
| 三：未闭合归约 | 附录 B 与外部证书 | 解封、磨平与扩充引理的三难 | 定理 5.4，式 (5.11)–(5.13) | 现有静态分片乘子架构仍受约束 |
| 四：流体演化读口 | 静态能谱与协变逆度规 | 反号盲区与纯平方耗散 | 定理 6.1–6.2 | 须保留欧氏回读与重置代价 |

**（一）第一层（跨赤道平面奇异界面测度遗漏）**：在附录 B 第 53 页分侧样条权函数 $D, Z$ 到第 54 页 (B.16) 及第 55–56 页命题 B.1 不等式 (B.20) 的分部积分推导中，体积读口 $q _ {\mathrm{bulk}}(D^2 W) = H _ {\mathrm{bulk}}$ 抹去了集中在零体积平面 $y _ 3=0$ 上的奇异狄拉克面测度 $\Sigma _ W = [\partial _ z W]e _ 3\otimes e _ 3 dS _ {z=0} \in \ker q _ {\mathrm{bulk}}$ ，但无散场两次分部积分泛函 $f _ v$ 对该奇异测度给出严格正配对（ $\Sigma _ W \notin \ker f _ v$ ）。反例族 A（轴对称紧支无散场， $D _ + = \frac12 + \frac14\chi \lvert \eta \rvert$ ）给出精确有理破坏裕量 $E _ {D _ +}(v) \ge \frac{\pi}{65536}\frac{633509743}{432432000} > 0$ 与双权分离 $\ge 2\gamma _ \varepsilon$ ；反例族 B（施瓦茨高斯 $\pm(2,1)$ 模态， $Z = cP \lvert \eta \rvert$ ）给出解析下界 $\Delta/c \ge \frac{5275}{64}\pi^{3/2} - \frac{2\pi}{13\cdot 9^{13}} - \frac{9600\pi}{9^{15}} > 400 > 0$ ，从而严格证伪了未施加跨平面法向导数接合前件的分侧 $C^2$ 版本命题 B.1 / (B.20)。

**（二）第二层（强接合修复下的薄层曲率守恒律）**：跨赤道平面 $\lvert \eta \rvert \le \delta$ 的全局 $C^2(\mathbb{R}^3)$ 四次过渡样条 $s _ \delta(\eta)$ 虽消除了奇异面测度，但法向总曲率质量 $\int _ {-\delta}^{\delta} s _ \delta''(\eta) d\eta = 2$ 严格守恒，薄层内法向二阶导数以 $O(\delta^{-1})$ 峰值 $\max s _ \delta'' = \frac{3}{2\delta}$ 及 $\partial _ {zz}D _ \delta(r,0) = \frac{3\chi}{8\delta r^2} + \frac{3\delta\chi'}{32r(1+r)^2}$ 高度集中，并在 $\delta\downarrow 0$ 时满足：

$$
\begin{aligned}
& \lim _ {\delta\downarrow 0} \int _ { \lvert \eta \rvert <\delta} \Vert H _ {D _ \delta}\Vert _ {\mathrm{op}}f dy \cr
& = \int _ {z=0} \frac{\chi}{2r}f dS > 0.
\end{aligned}
$$

这表明强接合前件不可无代价附加：任何满足全局 $C^2$ 正则性的权函数都必须在体积海森范数项中显式承担该赤道跨面曲率代价。

**（三）第三层（纸面未闭合归约缺口、未公开外部证书与补充材料静态不变性定理）**：论文第 1、4、10、38–39、54–60、62–64、69–70 页的顶层蕴涵链（定理 1.1 $\Leftarrow$ 定理 7.1 $\Leftarrow$ 定理 B.14 $\Leftarrow$ 外部证书 $d \in \mathcal{D} _ B$ ，SHA-256 前缀 3f7a335b...）在纸面省略了 (B.16) 误差系数、命题 B.1 与 B.4 的完整证明及第 70 页的 7 项附加条件。定理 5.4（补证三难定理）进一步证明：该偏差发生在分布算子恒等式层，解封 SHA-256 系数表不能改写 $D^2 W$ ；在薄层比例 $\lambda = \frac{\delta}{\varepsilon} = \frac{1}{8}$ （ $\delta = 2^{-19}$ ）下附加薄层 $C^2$ 磨平会以转移因子 $I _ {\mathrm{collar}}(\frac{1}{8}) = \frac{2787617180779875667}{3000241776758882304} > \frac{37}{40}$ 在同一无散场 $v _ \varepsilon$ 上维持纯体积正残差 $\ge \frac{\pi}{65536}\frac{2147573301937507667}{1611064563204096000} > 0$ ，或将一阶梯度系数推至 $I _ 1(1,0) \le -\frac{786431}{4} < 0$ ；而在已存同域反例底座上扩充外围引理亦无法消除该算子层偏差。

**（四）第四层（三维流体动力学的演化真体与静态投影伪影分界）**：对比三维不可压纳维－斯托克斯涡度演化与固定欧氏能谱读口 $q _ {\mathrm{static}}$ 及随流协变逆度规 $g = C^{-1}$ ，静态欧氏二次能谱读口对整体反号盲视（ $q _ {\mathrm{static}}(+17U) = q _ {\mathrm{static}}(-17U)$ ），丢失了三次涡度拉伸的奇次符号，且论文公式 (B.18) 关于扰动 $v$ 同样为二次偶泛函 $J _ {W^r}(-v) = J _ {W^r}(v)$ 。静态同谱双初值 $\pm 17U$ 的真实拟能初导数分歧达 $Y _ +'(0) - Y _ -'(0) = 4913$ ，而随流协变逆度规 $g = C^{-1}$ 将非交换涡度拉伸精确抵消为纯平方耗散 $P _ \nu(\omega^T C^{-1}\omega) = -2\nu\sum _ i (\partial _ i z)^T C (\partial _ i z) \le 0$ ，划定了欧氏回读谱条件数桥与前缀重置成本守恒的严格边界。

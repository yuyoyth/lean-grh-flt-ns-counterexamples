# 重开 A：缺少跨面接合的 B.20 严格反例与修复

独立理性席 A 的新报告，由父席整理落盘；线索来自 [issue 3](https://github.com/tristanbuckmaster/navier-stokes/issues/3)。下述符号、界面符号、前件及常数经独立复推。**结论限于分侧 C² 而没有跨面接合的弱合同；不反驳全空间 C² 的强合同或 NS 主结论。**

## 1. 实际 B.1 简化数据

取ρ=|y|、r=√(y1²+y2²)、z=y3、σ=ρ/(1+ρ)、η=z/ρ。周期S=1，κ=3，Γ由(Rπ/3,1/2)、(R*,0)生成，R*=diag(1,-1,-1)。取Wr=0、Pλ=Pμ=空、Z=0，全部谐波同类。取n=0、K为R⁰单点、Wa=Fa=0、强迫/约束/测试场列表为空、N=0、径向相位0、长度1。零场是B.6的空有限和；这些只满足B.1的数据形式，不满足整个§7证书非零性要求。

取cμ=1/2、nλ=n∇λ=nμ=0；参考场界为0。B.19、频率、输运及辅助条件均空置。对时间不变的紧支无散v令

$$
F=T_1v=\tfrac12v+\tfrac12(y\cdot\nabla)v-\Delta v.
$$

于是Mv=-Δv，J=0，‖v‖μ=0，cM²=50/3；乘子范数结论仅为‖Δv‖H≤‖v‖w。

设HD为平面外经典Hessian。p.54的系数为

$$
I_2=D-3/50,\ I'_2=1-D,\ I'_1=1/4,
\ I_1=-\|H_D\|_{op}-3w/50,\ I_0=0.
$$

记E_D(v)=B.20右侧−左侧。利用无散积分恒等式及
⟨T1v,-Δv⟩=‖Δv‖²+‖∇v‖²/4，得到

$$
\boxed{E_D(v)=\int D(|\nabla^2v|^2-|\nabla\operatorname{curl}v|^2)
-\int\|H_D\|_{op}|\nabla v|^2.}\tag{A1}
$$

w与3/50完全相消。

## 2. 全局分侧权及真实界面项

令h(t)=6t⁵−15t⁴+10t³，χ(σ)在σ≤1/4为0，在[1/4,1/3]为h(12σ−3)，在σ≥1/3为1。端点一、二阶导数为0，故χ是C²分片多项式且0≤χ≤1。取

$$
D_+=\tfrac12+\tfrac14\chi(\sigma)|\eta|,\qquad D_+(0)=1/2.\tag{A2}
$$

它在每个半空间图中为C²分片多项式，原点附近常数，轴对称、关于z偶对称，1/2≤D+≤3/4，故I'2≥1/4。体积导数有界且有相应远场衰减。但D+不跨平面C¹。

在ρ≥1/2处，χ=1，D+=1/2+|z|/(4ρ)，上侧减下侧的法向导数跳跃为

$$
[\partial_zD_+]=1/(2r).\tag{A3}
$$

对紧支无散u，两次分部积分给

$$
\int D(|\nabla u|^2-|\operatorname{curl}u|^2)
=\langle D^2D,u\otimes u\rangle.
$$

这里D²D表示分布Hessian；若D连续、分侧C²，则

$$
D^2D=H_D\,dy+[\partial_zD]e_3\otimes e_3\,dS_{z=0}.
$$

对每个Cartesian导数u=∂kv应用此式，得到

$$
\boxed{E_D(v)=\sum_k\int(\partial_kv)^TH_D(\partial_kv)
-\int\|H_D\|_{op}|\nabla v|^2
+\int_{z=0}[\partial_zD]|\nabla v_3|^2dS.}\tag{A4}
$$

最后一项为奇异测度贡献，不能以平面体积测度为零为由去掉。

## 3. 明确的真实无散扰动

取偶函数a，支撑[-1,1]，a(0)=1；令

$$
\psi_\varepsilon=\varepsilon z\,a((r-1)/\varepsilon)a(z/\varepsilon),
\quad v_r=-r^{-1}\partial_z\psi_\varepsilon,
\quad v_\varphi=0,\quad v_3=r^{-1}\partial_r\psi_\varepsilon.\tag{A5}
$$

写s=(r−1)/ε、t=z/ε，则

$$
v_r=-\varepsilon r^{-1}a(s)(a(t)+ta'(t)),\quad
v_3=\varepsilon r^{-1}t a'(s)a(t).
$$

ε≤1/4时支撑远离轴及原点；r⁻¹∂r(rvr)+∂zv3=0。vr为z偶函数，v3为奇函数，故轴对称和R*对称成立，时间不变使Γ不变，只有零谐波。在平面v3=∂rv3=0，但∂zv3=a'(s)/r。因此

$$
T_\varepsilon=\int_{z=0}\frac{|\nabla v_3|^2}{2r}dS
=\pi\varepsilon\int_{-1}^1\frac{a'(s)^2}{(1+\varepsilon s)^2}ds
\ge\frac{16\pi}{25}\varepsilon A,
\quad A=\int_{-1}^1a'^2.\tag{A6}
$$

对称性仅令v3在平面为零，不令其法向导数为零。

支撑上ρ≥3/4，直接求导

$$
\nabla^2(z/\rho)=-(e_3\otimes y+y\otimes e_3+zI)/\rho^3
+3z\,y\otimes y/\rho^5
$$

给‖HD‖op≤3/(2ρ²)≤8/3<3，可取M=3。若|∇v|²≤K，支撑体积为8πε²，由A4

$$
E_{D_+}(v)\ge\pi\varepsilon[(16/25)A-16MK\varepsilon].\tag{A7}
$$

## 4. 全显式有理裕量

取a(t)=(1−t²)⁴_+，则a∈C³、v∈C²_c，足够进入DS：v∈X、Δv∈H、T1v∈H。各积分有限。

|a|≤1、|a'|≤2、|a''|≤8。第一导数界可化为16·6⁶≤7⁷；第二导数为−8(1−t²)²(1−7t²)，其最大绝对值不超过8。轴对称梯度五项

$$
|\nabla v|^2=|\partial_rv_r|^2+|\partial_zv_r|^2+|v_r/r|^2+
|\partial_rv_3|^2+|\partial_zv_3|^2
$$

的绝对值界依次为28/3、16、4/3、104/9、8，故

$$
K=43936/81,\qquad
A=128\sum_{j=0}^6\frac{(-1)^j\binom6j}{2j+3}=131072/45045.
$$

取ε=1/65536，精确得

$$
(16/25)A-16MK\varepsilon=633509743/432432000>0,
$$

$$
\boxed{E_{D_+}(v)\ge\frac\pi{65536}\frac{633509743}{432432000}>0.}\tag{A8}
$$

这严格违反B.20要求的右−左≤0。即使用a(0)=1、a(±1)=0及Cauchy–Schwarz给A≥2，也得到正裕量76267/86400。

父席另以精确多项式运算重算了A、K、裕量，见 `../stage1/reopened_seam/EXACT_MOMENTS.json`。原生HODV的七项算术诊断见同目录；不把这些有限算术返回值冒充整个解析证明。

## 5. 全 C∞ 版本与强合同正控

可取a∞(t)=exp(1−1/(1−t²))于|t|<1，外为0。它为偶C∞ bump且a∞(0)=1。令q=(1−t²)^−1≥1，有|a'|≤2q²e^(1−q)≤4，|a''|≤(4q⁴+8q³+2q²)e^(1−q)≤186，可统一取𝓜=200。

ε≤1/2时可取|∇v|²≤148𝓜⁴、‖HD‖≤6；A∞≥2。因此

$$
E_{D_+}(v)\ge\pi\varepsilon[8/9-14208\mathcal M^4\varepsilon].
$$

ε=10^-15时31968·200⁴<10¹⁵，故E≥(4π/9)10^-15>0。反例并非扰动正则性不足造成。

强合同正控：对0<δ≤1，以偶C²样条

$$
s_\delta(\eta)=
\begin{cases}3\delta/8+3\eta^2/(4\delta)-\eta^4/(8\delta^3),&|\eta|\le\delta,\\
|\eta|,&|\eta|\ge\delta
\end{cases}
$$

替代|η|，令Dδ=1/2+χsδ/4。接合一、二阶导数均匹配，1/2≤Dδ≤3/4，完整Hessian没有平面测度。A4的体积估计即给E_Dδ(v)≤0。δ趋零时薄层Hessian为O(δ^-1)，其积分成本不能凭层宽趋零删除。

## 6. 双权重与归属限制

取D±=1/2±χ|η|/4。二者均满足分侧弱合同，共同满足1/4≤D≤3/4、D|plane=1/2，且‖HD+‖op=‖HD−‖op。固定v及其余数据，简化读口qred=(体积Hessian范数场、平面D值、共同粗界、固定结构数据)对两者相同。

令Jv=∫χ|η|/4 (|∇²v|²−|∇curlv|²)、Cv=∫‖HD+‖op|∇v|²，则

$$
E_{D_+}=J_v-C_v\ge\gamma_\varepsilon>0,
\quad E_{D_-}=-J_v-C_v\le-\gamma_\varepsilon,
\quad E_{D_+}-E_{D_-}\ge2\gamma_\varepsilon,
$$

其中γε为A8右端。**这是真双权重，但qred弱于完整B.16输入；完整输入还包含D本身，而D+≠D−。不能宣称已满足用户要求的完整论文读口同值。**

若只投影Hessian测度的绝对连续部分，Hbulk dy与Hbulk dy+Σ确有同投影异配对；但只有后者是同一D的真实分布Hessian，不能把前者冒充也满足导数相容性。

## 7. 纸面与强前件的分型

逐半空间样条各自C²不蕴含跨平面接合，删除接合要求的弱化版本因此失败。但原PDF同时写函数定义于R³、分侧表示及“class C²”，不能据分侧表示断言它必然只要求分侧正则性，也不能断言全局C²必然是未落文的额外前件。按全局D∈C²(R³)理解时，本反例被排除。体积Hessian计算与全分布Hessian配对必须使用同一套正则性前件。

固定提交的CellLayerChallenge.lean第2372–2378行要求按(-1)^o拼接；第2505/2509行对D/Z为二阶接合。ExtendedCoerciveChallenge.lean第322–323行明确全空间ContDiff R 2。本例上下半图都是1/2+χt/4，o=1要求χ/4=−χ/4，在支撑处χ=1时失败。

所以已证的是纸面弱合同失效及接合前件承重。未证的是完整形式化命题、B.14全部条件、实际数值证书或NS主结论失效。52+声明、18+对负控与完整同域双模型的原目标不能由此自动勾销。

反驳B.1只需其全部相关前件，不必先完成B.4/B.14证明；这些后续命题不能被用来额外抬高B.1反例的资格。

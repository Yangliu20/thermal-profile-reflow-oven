***
  本组使用的编程软件如下：
    MATLAB R2018b
    COMSOL Multiphysics 5.4
    COMSOL Multiphysics 5.4 with MATLAB

***
  解题主程序分别是：
    问题1：Main_code_Question_1.m
    问题2：Main_code_Question_2.m
    问题3：Main_code_Question_3.m
    问题4：Main_code_Question_4.m

  如需复现本组所有结果，打开相应的.m文件并直接运行即可。
  **特别注意！！！
  在执行 Main_code_Question_1.m、Main_code_Question_2.m 和 comparison.m 之前，请检查电脑中是否安装COMSOL，并检查COMSOL是否与MATLAB联调；如果无法联调或者无法安装COMSOL，本组提供了事先计算好的COMSOL结果，存放在 environment_temp_Q1.csv、environment_temp_Q2.csv 和 environment_temp_Q0.csv文件中。请在.m文件中依照注释的指示读取csv文件，即可正常运行代码。**


***
  本文件夹中的文件列表：
	
	*主程序*	

	Main_code_Question_1.m	问题1解题程序
	Main_code_Question_2.m	问题2解题程序
	Main_code_Question_3.m	问题3解题程序
	Main_code_Question_4.m	问题4解题程序
	comparison.m		复现题目提供的实验数据，并比较COMSOL模拟环境温度
				与简化版环境温度对炉温曲线的影响
	

	*数据文件*
	
	environment_temp_Q1.csv	问题1 COMSOL模拟数据
	environment_temp_Q2.csv	问题2 COMSOL模拟数据
	environment_temp_Q0.csv	comparison.m文件所使用的COMSOL模拟数据
	result_raw.csv		问题1的输出结果（每隔0.5s的温度数据）
	appendix.csv		题目提供的附件
	
	
	*求解偏微分方程的相关函数*

	pdefun.m			微分方程
	bcfun.m			边界条件
	icfun.m			初始条件
	

	*计算制程界限指标的函数*

	get_peak_temp.m		峰值温度
	get_slope_ends.m		温度变化的最大和最小斜率
	get_time_above_217.m	温度大于217度的时间
	get_time_bt_150_190_up.m	温度上升过程中在170度到190度之间的时间
	
	
	*遗传算法相关函数*

	GeneticAlgorithm_Q3.m	问题三的遗传算法主函数
	GeneticAlgorithm_Q4.m	问题四的遗传算法主函数
	initialize.m		初始化
	fitness_Area_min.m		计算适应度，优化目标为面积最小
	fitness_Area_min_Symmetry.m	计算适应度，优化目标为面积最小且对称
	rank.m			依照适应度排序
	selection.m		轮盘赌选择操作
	crossover.m		交叉
	mutation.m		变异
	plotGA.m			迭代过程作图
	
	
	*生成回焊炉内中心线环境温度的相关函数*

	environmentModel.m		联调COMSOL模拟炉内温度场
	回焊炉内环境温度模拟.mph		COMSOL模拟程序，与上一程序功能相同
	env_temp_generator_simplified.m	阶梯式生成简化版的中心线环境温度
	env_temp_generator_simplified_MA.m	去棱角化生成平滑简化版的中心线环境温度

	
	*其他*

	movingAve.m		计算移动平均值








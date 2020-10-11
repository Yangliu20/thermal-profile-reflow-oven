% COMSOL多物理场模拟回焊炉内中心线的环境温度
% 由COMSOL Multiphysics 5.4 直接导出
% T15 第一至第五个小温区的温度
% T6 第六个小温区的温度
% T7 第七个小温区的温度
% T89 第八和第九个小温区的温度
% filename 存储中心线环境温度的文件名
% 默认第十和第十一个小温区为25degC

% 使用流体传热、流体力学模块
% 多物理场耦合
% 获得热传导和热对流偏微分方程的稳态解
% 输出回焊炉内温度场（不包含焊接区域的影响）
% 输出几何网格
% 输出温度场图
% 输出中心线环境温度 csv文件



function out = environmentModel(T15, T6, T7, T89, filename)
%
% environmentModel.m
%
% Model exported on Sep 12 2020, 10:37 by COMSOL 5.4.0.225.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

% model.modelPath(['C:\Betty\' native2unicode(hex2dec({'59' '27'}), 'unicode')  native2unicode(hex2dec({'56' 'db'}), 'unicode')  native2unicode(hex2dec({'4e' '0a'}), 'unicode') '\' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') '\' native2unicode(hex2dec({'5e' 'fa'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') '\Q2']);
% 
% model.label([native2unicode(hex2dec({'70' '89'}), 'unicode')  native2unicode(hex2dec({'6e' '29'}), 'unicode')  native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '_v4_Q2.mph']);

model.param.set('gap', '20');
model.param.set('T15', int2str(T15));
model.param.set('T6', int2str(T6));
model.param.set('T7', int2str(T7));
model.param.set('T89', int2str(T89));
model.param.set('T1011', '25');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit('cm');
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('pos', [0 0]);
model.component('comp1').geom('geom1').feature('r1').set('size', {'435.5' 'gap'});
model.component('comp1').geom('geom1').create('pt1', 'Point');
model.component('comp1').geom('geom1').feature('pt1').set('p', {'25' 'gap'});
model.component('comp1').geom('geom1').create('pt3', 'Point');
model.component('comp1').geom('geom1').feature('pt3').set('p', {'25+35.5' 'gap'});
model.component('comp1').geom('geom1').create('pt2', 'Point');
model.component('comp1').geom('geom1').feature('pt2').set('p', {'25+30.5' 'gap'});
model.component('comp1').geom('geom1').create('pt4', 'Point');
model.component('comp1').geom('geom1').feature('pt4').set('p', {'25' 'gap'});
model.component('comp1').geom('geom1').create('pt5', 'Point');
model.component('comp1').geom('geom1').feature('pt5').set('p', {'25+35.5' 'gap'});
model.component('comp1').geom('geom1').create('pt6', 'Point');
model.component('comp1').geom('geom1').feature('pt6').set('p', {'25+35.5*2' 'gap'});
model.component('comp1').geom('geom1').create('pt7', 'Point');
model.component('comp1').geom('geom1').feature('pt7').set('p', {'25+35.5*3' 'gap'});
model.component('comp1').geom('geom1').create('pt8', 'Point');
model.component('comp1').geom('geom1').feature('pt8').set('p', {'25+35.5*4' 'gap'});
model.component('comp1').geom('geom1').create('pt9', 'Point');
model.component('comp1').geom('geom1').feature('pt9').set('p', {'25+35.5*5' 'gap'});
model.component('comp1').geom('geom1').create('pt10', 'Point');
model.component('comp1').geom('geom1').feature('pt10').set('p', {'25+35.5*6' 'gap'});
model.component('comp1').geom('geom1').create('pt11', 'Point');
model.component('comp1').geom('geom1').feature('pt11').set('p', {'25+35.5*7' 'gap'});
model.component('comp1').geom('geom1').create('pt12', 'Point');
model.component('comp1').geom('geom1').feature('pt12').set('p', {'25+35.5*8' 'gap'});
model.component('comp1').geom('geom1').create('pt13', 'Point');
model.component('comp1').geom('geom1').feature('pt13').set('p', {'25+35.5*9' 'gap'});
model.component('comp1').geom('geom1').create('pt14', 'Point');
model.component('comp1').geom('geom1').feature('pt14').set('p', {'25+35.5*10' 'gap'});
model.component('comp1').geom('geom1').create('pt16', 'Point');
model.component('comp1').geom('geom1').feature('pt16').set('p', {'25+35.5+30.5' 'gap'});
model.component('comp1').geom('geom1').create('pt17', 'Point');
model.component('comp1').geom('geom1').feature('pt17').set('p', {'25+30.5+35.5*2' 'gap'});
model.component('comp1').geom('geom1').create('pt18', 'Point');
model.component('comp1').geom('geom1').feature('pt18').set('p', {'25+30.5+35.5*3' 'gap'});
model.component('comp1').geom('geom1').create('pt19', 'Point');
model.component('comp1').geom('geom1').feature('pt19').set('p', {'25+30.5+35.5*4' 'gap'});
model.component('comp1').geom('geom1').create('pt20', 'Point');
model.component('comp1').geom('geom1').feature('pt20').set('p', {'25+30.5+35.5*5' 'gap'});
model.component('comp1').geom('geom1').create('pt21', 'Point');
model.component('comp1').geom('geom1').feature('pt21').set('p', {'25+30.5+35.5*6' 'gap'});
model.component('comp1').geom('geom1').create('pt22', 'Point');
model.component('comp1').geom('geom1').feature('pt22').set('p', {'25+30.5+35.5*7' 'gap'});
model.component('comp1').geom('geom1').create('pt23', 'Point');
model.component('comp1').geom('geom1').feature('pt23').set('p', {'25+30.5+35.5*8' 'gap'});
model.component('comp1').geom('geom1').create('pt24', 'Point');
model.component('comp1').geom('geom1').feature('pt24').set('p', {'25+30.5+35.5*9' 'gap'});
model.component('comp1').geom('geom1').create('pt25', 'Point');
model.component('comp1').geom('geom1').feature('pt25').set('p', {'25+30.5+35.5*10' 'gap'});
model.component('comp1').geom('geom1').create('pt26', 'Point');
model.component('comp1').geom('geom1').feature('pt26').set('p', [25 0]);
model.component('comp1').geom('geom1').create('pt27', 'Point');
model.component('comp1').geom('geom1').feature('pt27').set('p', {'25+35.5' '0'});
model.component('comp1').geom('geom1').create('pt28', 'Point');
model.component('comp1').geom('geom1').feature('pt28').set('p', {'25+30.5' '0'});
model.component('comp1').geom('geom1').create('pt29', 'Point');
model.component('comp1').geom('geom1').feature('pt29').set('p', [25 0]);
model.component('comp1').geom('geom1').create('pt30', 'Point');
model.component('comp1').geom('geom1').feature('pt30').set('p', {'25+35.5' '0'});
model.component('comp1').geom('geom1').create('pt31', 'Point');
model.component('comp1').geom('geom1').feature('pt31').set('p', {'25+35.5*2' '0'});
model.component('comp1').geom('geom1').create('pt32', 'Point');
model.component('comp1').geom('geom1').feature('pt32').set('p', {'25+35.5*3' '0'});
model.component('comp1').geom('geom1').create('pt33', 'Point');
model.component('comp1').geom('geom1').feature('pt33').set('p', {'25+35.5*4' '0'});
model.component('comp1').geom('geom1').create('pt34', 'Point');
model.component('comp1').geom('geom1').feature('pt34').set('p', {'25+35.5*5' '0'});
model.component('comp1').geom('geom1').create('pt35', 'Point');
model.component('comp1').geom('geom1').feature('pt35').set('p', {'25+35.5*6' '0'});
model.component('comp1').geom('geom1').create('pt36', 'Point');
model.component('comp1').geom('geom1').feature('pt36').set('p', {'25+35.5*7' '0'});
model.component('comp1').geom('geom1').create('pt37', 'Point');
model.component('comp1').geom('geom1').feature('pt37').set('p', {'25+35.5*8' '0'});
model.component('comp1').geom('geom1').create('pt38', 'Point');
model.component('comp1').geom('geom1').feature('pt38').set('p', {'25+35.5*9' '0'});
model.component('comp1').geom('geom1').create('pt39', 'Point');
model.component('comp1').geom('geom1').feature('pt39').set('p', {'25+35.5*10' '0'});
model.component('comp1').geom('geom1').create('pt40', 'Point');
model.component('comp1').geom('geom1').feature('pt40').set('p', {'25+35.5+30.5' '0'});
model.component('comp1').geom('geom1').create('pt41', 'Point');
model.component('comp1').geom('geom1').feature('pt41').set('p', {'25+30.5+35.5*2' '0'});
model.component('comp1').geom('geom1').create('pt42', 'Point');
model.component('comp1').geom('geom1').feature('pt42').set('p', {'25+30.5+35.5*3' '0'});
model.component('comp1').geom('geom1').create('pt43', 'Point');
model.component('comp1').geom('geom1').feature('pt43').set('p', {'25+30.5+35.5*4' '0'});
model.component('comp1').geom('geom1').create('pt44', 'Point');
model.component('comp1').geom('geom1').feature('pt44').set('p', {'25+30.5+35.5*5' '0'});
model.component('comp1').geom('geom1').create('pt45', 'Point');
model.component('comp1').geom('geom1').feature('pt45').set('p', {'25+30.5+35.5*6' '0'});
model.component('comp1').geom('geom1').create('pt46', 'Point');
model.component('comp1').geom('geom1').feature('pt46').set('p', {'25+30.5+35.5*7' '0'});
model.component('comp1').geom('geom1').create('pt47', 'Point');
model.component('comp1').geom('geom1').feature('pt47').set('p', {'25+30.5+35.5*8' '0'});
model.component('comp1').geom('geom1').create('pt48', 'Point');
model.component('comp1').geom('geom1').feature('pt48').set('p', {'25+30.5+35.5*9' '0'});
model.component('comp1').geom('geom1').create('pt49', 'Point');
model.component('comp1').geom('geom1').feature('pt49').set('p', {'25+30.5+35.5*10' '0'});
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').active(false);
model.component('comp1').geom('geom1').feature('r2').set('pos', [340 0]);
model.component('comp1').geom('geom1').feature('r2').set('size', {'0.1' 'gap'});
model.component('comp1').geom('geom1').create('pt50', 'Point');
model.component('comp1').geom('geom1').feature('pt50').active(false);
model.component('comp1').geom('geom1').feature('pt50').set('p', {'25+35.5*2+30.5/2' '0'});
model.component('comp1').geom('geom1').create('pt51', 'Point');
model.component('comp1').geom('geom1').feature('pt51').active(false);
model.component('comp1').geom('geom1').feature('pt51').set('p', {'25+35.5*5+30.5/2' '0'});
model.component('comp1').geom('geom1').create('pt52', 'Point');
model.component('comp1').geom('geom1').feature('pt52').active(false);
model.component('comp1').geom('geom1').feature('pt52').set('p', {'25+35.5*6+30.5/2' '0'});
model.component('comp1').geom('geom1').create('pt53', 'Point');
model.component('comp1').geom('geom1').feature('pt53').active(false);
model.component('comp1').geom('geom1').feature('pt53').set('p', {'25+35.5*7+30.5' '0'});
model.component('comp1').geom('geom1').run;

model.variable.create('var1');

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('rho', 'Analytic');
model.component('comp1').material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func.create('cs', 'Analytic');
model.component('comp1').material('mat1').propertyGroup('def').func.create('an1', 'Analytic');
model.component('comp1').material('mat1').propertyGroup('def').func.create('an2', 'Analytic');
model.component('comp1').material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat1').propertyGroup.create('NonlinearModel', 'Nonlinear model');

model.component('comp1').physics.create('ht', 'HeatTransferInFluids', 'geom1');
model.component('comp1').physics('ht').create('temp14', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp14').selection.set([2 3 46 47]);
model.component('comp1').physics('ht').create('temp1', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp1').selection.set([4 5 8 9 12 13 16 17 20 21]);
model.component('comp1').physics('ht').create('temp2', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp2').selection.set([24 25]);
model.component('comp1').physics('ht').create('temp3', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp3').selection.set([28 29]);
model.component('comp1').physics('ht').create('temp4', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp4').selection.set([32 33 36 37]);
model.component('comp1').physics('ht').create('temp5', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp5').selection.set([40 41 44 45]);
model.component('comp1').physics('ht').create('temp6', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp6').selection.set([1 48]);
model.component('comp1').physics('ht').create('temp7', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp7').selection.set([6 7 10 11 14 15 18 19]);
model.component('comp1').physics('ht').create('temp8', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp8').selection.set([22 23]);
model.component('comp1').physics('ht').create('temp9', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp9').selection.set([26 27]);
model.component('comp1').physics('ht').create('temp10', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp10').selection.set([30 31]);
model.component('comp1').physics('ht').create('temp11', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp11').selection.set([34 35]);
model.component('comp1').physics('ht').create('temp12', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp12').selection.set([38 39]);
model.component('comp1').physics('ht').create('temp13', 'TemperatureBoundary', 1);
model.component('comp1').physics('ht').feature('temp13').selection.set([42 43]);
model.component('comp1').physics('ht').create('ofl1', 'ConvectiveOutflow', 1);
model.component('comp1').physics('ht').feature('ofl1').selection.set([1 48]);
model.component('comp1').physics('ht').create('hf1', 'HeatFluxBoundary', 1);
model.component('comp1').physics('ht').feature('hf1').selection.set([1 48]);
model.component('comp1').physics.create('spf', 'LaminarFlow', 'geom1');
model.component('comp1').physics('spf').create('open1', 'OpenBoundary', 1);
model.component('comp1').physics('spf').feature('open1').selection.set([1 48]);

model.component('comp1').multiphysics.create('fc1', 'FlowCoupling', -1);
model.component('comp1').multiphysics.create('tc1', 'TemperatureCoupling', -1);

model.component('comp1').mesh('mesh1').create('ftri1', 'FreeTri');
model.component('comp1').mesh('mesh1').create('map1', 'Map');

model.component('comp1').view('view1').axis.set('xmin', -10.88751220703125);
model.component('comp1').view('view1').axis.set('xmax', 446.38751220703125);
model.component('comp1').view('view1').axis.set('ymin', -127.52265930175781);
model.component('comp1').view('view1').axis.set('ymax', 147.5226593017578);

model.component('comp1').material('mat1').label('Air');
model.component('comp1').material('mat1').set('family', 'air');
model.component('comp1').material('mat1').propertyGroup('def').label('Basic');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').label('Piecewise');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('eta').set('fununit', 'Pa*s');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').label('Piecewise 2');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('Cp').set('fununit', 'J/(kg*K)');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').label('Analytic');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('expr', 'pA*0.02897/R_const[K*mol/J]/T');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/R_const/T,pA)'; 'T' 'd(pA*0.02897/R_const/T,T)'});
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('argunit', 'Pa,K');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('fununit', 'kg/m^3');
model.component('comp1').material('mat1').propertyGroup('def').func('rho').set('plotargs', {'pA' '0' '1'; 'T' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').func('k').label('Piecewise 3');
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('arg', 'T');
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').label('Analytic 2');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*R_const[K*mol/J]/0.02897*T)');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('args', {'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('dermethod', 'manual');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('fununit', 'm/s');
model.component('comp1').material('mat1').propertyGroup('def').func('cs').set('plotargs', {'T' '273.15' '373.15'});
model.component('comp1').material('mat1').propertyGroup('def').func('an1').label('Analytic 1');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('funcname', 'alpha_p');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('expr', '-1/rho(pA,T)*d(rho(pA,T),T)');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('args', {'pA' 'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('argunit', 'Pa,K');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('fununit', '1/K');
model.component('comp1').material('mat1').propertyGroup('def').func('an1').set('plotargs', {'pA' '101325' '101325'; 'T' '273.15' '373.15'});
model.component('comp1').material('mat1').propertyGroup('def').func('an2').label('Analytic 2a');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('funcname', 'muB');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('expr', '0.6*eta(T)');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('args', {'T'});
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('argunit', 'K');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('fununit', 'Pa*s');
model.component('comp1').material('mat1').propertyGroup('def').func('an2').set('plotargs', {'T' '200' '1600'});
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', '');
model.component('comp1').material('mat1').propertyGroup('def').set('molarmass', '');
model.component('comp1').material('mat1').propertyGroup('def').set('bulkviscosity', '');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)' '0' '0' '0' 'alpha_p(pA,T)'});
model.component('comp1').material('mat1').propertyGroup('def').set('molarmass', '0.02897');
model.component('comp1').material('mat1').propertyGroup('def').set('bulkviscosity', 'muB(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('ratioofspecificheat', '1.4');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'0[S/m]' '0' '0' '0' '0[S/m]' '0' '0' '0' '0[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', 'Cp(T)');
model.component('comp1').material('mat1').propertyGroup('def').set('density', 'rho(pA,T)');
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat1').propertyGroup('def').set('soundspeed', 'cs(T)');
model.component('comp1').material('mat1').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('def').addInput('pressure');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').label('Refractive index');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('n', '');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('ki', '');
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('n', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat1').propertyGroup('RefractiveIndex').set('ki', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat1').propertyGroup('NonlinearModel').label('Nonlinear model');
model.component('comp1').material('mat1').propertyGroup('NonlinearModel').set('BA', '(def.gamma+1)/2');
model.component('comp1').material('mat1').materialType('nonSolid');

model.component('comp1').physics('ht').feature('temp14').set('T0', '25[degC]');
model.component('comp1').physics('ht').feature('temp1').set('T0', 'T15[degC]');
model.component('comp1').physics('ht').feature('temp2').set('T0', 'T6[degC]');
model.component('comp1').physics('ht').feature('temp3').set('T0', 'T7[degC]');
model.component('comp1').physics('ht').feature('temp4').set('T0', 'T89[degC]');
model.component('comp1').physics('ht').feature('temp5').set('T0', 'T1011[degC]');
model.component('comp1').physics('ht').feature('temp6').set('T0', '25[degC]');
model.component('comp1').physics('ht').feature('temp6').active(false);
model.component('comp1').physics('ht').feature('temp7').set('T0', 'T15[degC]');
model.component('comp1').physics('ht').feature('temp8').set('T0', '((T15+T6)/2)[degC]');
model.component('comp1').physics('ht').feature('temp9').set('T0', '((T6+T7)/2)[degC]');
model.component('comp1').physics('ht').feature('temp10').set('T0', '((T7+T89)/2)[degC]');
model.component('comp1').physics('ht').feature('temp11').set('T0', 'T89[degC]');
model.component('comp1').physics('ht').feature('temp12').set('T0', '200[degC]');
model.component('comp1').physics('ht').feature('temp13').set('T0', 'T1011[degC]');
model.component('comp1').physics('ht').feature('hf1').set('HeatFluxType', 'ConvectiveHeatFlux');
model.component('comp1').physics('ht').feature('hf1').set('h', 25);
model.component('comp1').physics('ht').feature('hf1').set('materialType', 'from_mat');
model.component('comp1').physics('ht').feature('hf1').active(false);
model.component('comp1').physics('spf').feature('open1').set('BoundaryCondition', 'NoViscousStress');

model.component('comp1').multiphysics('fc1').active(false);

model.component('comp1').mesh('mesh1').feature('size').set('hauto', 1);
model.component('comp1').mesh('mesh1').feature('map1').active(false);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').physics('spf').feature('fp1').set('minput_temperature_src', 'root.comp1.T');

model.study.create('std1');
model.study('std1').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('so1', 'SOR');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.dataset.create('cln1', 'CutLine2D');
model.result.create('pg2', 'PlotGroup2D');
model.result.create('pg3', 'PlotGroup1D');
model.result('pg2').create('surf1', 'Surface');
model.result('pg3').create('lngr1', 'LineGraph');
model.result.export.create('data1', 'Data');
model.result.export.create('data2', 'Data');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('initstep', 0.01);
model.sol('sol1').feature('s1').feature('fc1').set('minstep', 1.0E-6);
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 100);
model.sol('sol1').feature('s1').feature('fc1').set('termonres', false);
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').set('pivotperturb', 1.0E-13);
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (ht)']);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('usesmooth', false);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('so1').set('relax', 0.9);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (ht)']);
model.sol('sol1').feature('s1').feature('i2').set('rhob', 20);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').runAll;

figure(10);
mphmesh(model);
model.result.dataset('dset1').set('frametype', 'material');
model.result.dataset('cln1').set('genpoints', {'0' 'gap/2'; '435.5' 'gap/2'});
model.result('pg2').label([native2unicode(hex2dec({'4f' '5c'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode') ' (ht)']);
model.result('pg2').feature('surf1').set('unit', 'degC');
model.result('pg2').feature('surf1').set('resolution', 'normal').run;
figure(11);
mphplot(model, 'pg2');
model.result('pg3').set('xlabel', [native2unicode(hex2dec({'5f' '27'}), 'unicode')  native2unicode(hex2dec({'95' '7f'}), 'unicode') ' (cm)']);
model.result('pg3').set('ylabel', [native2unicode(hex2dec({'6e' '29'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ' (degC)']);
model.result('pg3').set('xlabelactive', false);
model.result('pg3').set('ylabelactive', false);
model.result('pg3').feature('lngr1').set('data', 'cln1');
model.result('pg3').feature('lngr1').set('unit', 'degC');
model.result('pg3').feature('lngr1').set('linewidth', 3);
model.result('pg3').feature('lngr1').set('resolution', 'normal').run;
figure(12);
mphplot(model, 'pg3');
% model.result.export('data1').set('unit', {'degC'});
% model.result.export('data1').set('filename', ['C:\Betty\' native2unicode(hex2dec({'59' '27'}), 'unicode')  native2unicode(hex2dec({'56' 'db'}), 'unicode')  native2unicode(hex2dec({'4e' '0a'}), 'unicode') '\' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') '\' native2unicode(hex2dec({'5e' 'fa'}), 'unicode')  native2unicode(hex2dec({'6a' '21'}), 'unicode') '\environment_temp_v3_centerline.csv']);
model.result.export('data2').set('data', 'cln1');
model.result.export('data2').set('filename', filename).run;
% model.result.export('data2').set('alwaysask', true);

out = model;

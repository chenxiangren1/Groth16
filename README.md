# Groth16
  Partial hardware implementation of Groth16 algorithm.<br>
## 一、算法介绍<br>
  实现zk-snark协议中所用到的Groth16算法，对Groth16算法中用到的基于BLS12-381椭圆曲线的optimal ate pairing和有限域上的多项式乘法进行硬件实现。其中optimal ate pairing包括Miller loop算法
和final exponentiation算法两个部分，pairing设计的关键在于对有限域上的381位模乘进行加速。而多项式乘法利用了数论变换NTT，对NTT的实现包括蝶形单元的设计、地址产生方案的设计等等，NTT设计的性能瓶颈也在于有限域上的256位的模乘。NTT和pairing中有很大的并行性可以挖掘，因此也比较适合在FPGA上实现。
## 二、实现进度安排<br>
  目前已经理解了Groth16算法，以及其中所用的optimal ate pairing和基于NTT的多项式乘法。后续的时间节点安排：<br>
  （1）2月5日—2月10日：调研各种模乘算法，找出或者改进出适合用于381位和256位模乘的算法，尽量挖掘其并行性，充分利用FPGA上的资源。目前备选的算法有基于RNS的蒙哥马利模乘算法和基于查找表的算法；<br>
  （2）2月11日—2月21日：划分optimal ate pairing的各个模块和端口信号，用Python进行系统建模，基于开发板进行仿真和调试；<br>
  （3）2月22日—2月26日：进一步验证和提升性能。<br>
## 三、实现结果
  由于时间有限，完成了多项式乘法的FPGA实现，后期继续完善pairing实现。<br>
  i7-6700HQ @2.6GHZ CPU运行 bellman库计算多项式乘法1024个点所需时间：22.7141 ms<br>
  FPGA上计算1024个点的多项式乘法需要的cycle数为2714个，频率可达40MHZ，所需时间为0.06785ms，速度提升了334.7倍。

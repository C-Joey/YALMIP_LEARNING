# -*- coding: utf-8 -*-
"""
Created on Tue Sep  3 18:30:08 2019

@author: joey-chen
"""

import numpy as np
import matplotlib.pyplot as plt
import pdb

"旅行商问题 ( TSP , Traveling Salesman Problem )"
coordinates = np.array([[66.83,25.36], [61.95,26.34], [40,44.39], [24.39,14.63], [17.07,22.93], [22.93,76.1 ],
                        [51.71,94.14], [87.32,65.36], [68.78,52.19], [84.88,36.09], [50,30 ],[40,20 ],[25,26]])

test_coor = np.array([[0,0], [50,40], [70,40],[64,100]])
#得到距离矩阵的函数
def getdistmat(coordinates):
    num = coordinates.shape[0] #52个坐标点
    distmat = np.zeros((num,num)) #52X52距离矩阵
    for i in range(num):
        for j in range(i,num):
            distmat[i][j] = distmat[j][i]=np.linalg.norm((coordinates[i]-coordinates[j]), ord=2) # 求2范数，即距离
    # print('距离矩阵', distmat)
    return distmat  # 对称距离矩阵

distmat = getdistmat(test_coor)
np.savetxt('data.txt',distmat,fmt='%s',newline='\n')
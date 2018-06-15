import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

import os

print(os.getcwd())

univ_data=pd.read_csv("Universities.csv")

univ_data.columns

X=univ_data.iloc[:,[1,5]].values

from sklearn.cluster import KMeans

km=KMeans(n_clusters=4,init='k-means++',max_iter=300,n_init=10,random_state=0)

y_km=km.fit_predict(X)

type(y_km)
len(y_km)
X[y_km==0,0]
plt.scatter(X[y_km==0,0],X[y_km==0,1],c='red',label='Cluster1')
plt.scatter(X[y_km==1,0],X[y_km==1,1],c='blue',label='Cluster2')
plt.scatter(X[y_km==2,0],X[y_km==2,1],c='green',label='Cluster3')
plt.scatter(X[y_km==3,0],X[y_km==3,1],c='cyan',label='Cluster4')
plt.scatter(km.cluster_centers_[:,0],km.cluster_centers_[:,1],s=300,c='yellow'
            ,label='Centroids')
plt.title("Clusters of Universities")
plt.legend()
plt.show()


km=KMeans(n_clusters=5,init='k-means++',max_iter=300,n_init=10,random_state=0)

y_km=km.fit_predict(X)

type(y_km)
len(y_km)
X[y_km==0,0]
plt.scatter(X[y_km==0,0],X[y_km==0,1],c='red',label='Cluster1')
plt.scatter(X[y_km==1,0],X[y_km==1,1],c='blue',label='Cluster2')
plt.scatter(X[y_km==2,0],X[y_km==2,1],c='green',label='Cluster3')
plt.scatter(X[y_km==3,0],X[y_km==3,1],c='cyan',label='Cluster4')
plt.scatter(X[y_km==3,0],X[y_km==3,1],c='magenta',label='Cluster5')
plt.scatter(km.cluster_centers_[:,0],km.cluster_centers_[:,1],s=300,c='yellow'
            ,label='Centroids')
plt.title("Clusters of Universities")
plt.legend()
plt.show()


km=KMeans(n_clusters=4,init='k-means++',max_iter=300,n_init=10,random_state=0)

y_km=km.fit_predict(X)

type(y_km)
len(y_km)
X[y_km==0,0]
plt.scatter(X[y_km==0,0],X[y_km==0,1],c='red',label='Target First')
plt.scatter(X[y_km==1,0],X[y_km==1,1],c='blue',label='Standard Scores')
plt.scatter(X[y_km==2,0],X[y_km==2,1],c='green',label='Careful High Expenses')
plt.scatter(X[y_km==3,0],X[y_km==3,1],c='cyan',label='TargetNext')
#plt.scatter(X[y_km==3,0],X[y_km==3,1],c='magenta',label='Cluster5')
plt.scatter(km.cluster_centers_[:,0],km.cluster_centers_[:,1],s=300,c='yellow'
            ,label='Centroids')
plt.title("Clusters of Universities")
plt.legend()
plt.show()

dir(km)
s1_grps=pd.Series(km.labels_)
s2_univs=univ_data.iloc[:,0]
rslt=pd.concat([s1_grps,s2_univs],axis=1)

km.cluster_centers_

df=pd.DataFrame(km.cluster_centers_)

df.columns=('SAT Scores','Expenses')

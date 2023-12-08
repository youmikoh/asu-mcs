import numpy as np
import random

data = np.load('AllSamples.npy')

def initial_point_idx2(id,k, N):
    random.seed((id+k))     
    return random.randint(0,N-1)

def initial_S2(id):
    print("Strategy 2: k and initial points")
    i = int(id)%150 
    random.seed(i+800)
    k1 = 4
    k2 = 6
    init_idx2 = initial_point_idx2(i, k1,data.shape[0])
    init_s1 = data[init_idx2,:]
    init_idx2 = initial_point_idx2(i, k2,data.shape[0])
    init_s2 = data[init_idx2,:]
    return k1, init_s1, k2, init_s2
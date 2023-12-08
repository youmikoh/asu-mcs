import numpy as np 
import random
import pdb
import sys
import time
import os

def init_subset(id):
    from mnist import train_images, train_labels, test_images, test_labels
    #S = int(id) % 1000
    S = int(id) % 210
    
    ### Create a subset of MNIST dataset with only 4 classes
    num_classes = 4
    sub_idx = np.sort(np.random.RandomState(seed=S).permutation(10)[:4])
    train_sub_size = 500
    test_sub_size = 100
    train_images = train_images() #[60000, 28, 28]
    train_labels = train_labels()
    test_images = test_images()
    test_labels = test_labels()

    ### Preprocessing the data
    print('Preparing data......')
    train_images -= int(np.mean(train_images))
    train_images = train_images // int(np.std(train_images))
    test_images -= int(np.mean(test_images))
    test_images = test_images // int(np.std(test_images))
    
    #pdb.set_trace()
    training_data = train_images.reshape(60000, 1, 28, 28)
    testing_data = test_images.reshape(10000, 1, 28, 28)
    ### Generate the New subset of training and testing samples
    sub_training_images, sub_training_labels = subset_extraction(S, sub_idx, train_sub_size, training_data, train_labels, num_classes,train=True)
    sub_testing_images, sub_testing_labels = subset_extraction(S, sub_idx, test_sub_size, testing_data, test_labels, num_classes,train=False)
    return sub_training_images, sub_training_labels, sub_testing_images, sub_testing_labels
    
### Function of creating the subset of MNIST dataset
def subset_extraction(S, idx, sub_size, images, labels, num_classes, train=True):
    temp_img = []
    temp_labels = []
    for i in range(num_classes):
        ind = labels == idx[i]
        A = images[ind,:,:,:]
        A = A[:sub_size,:,:,:]
        temp_img.append(A)
        label_list = [i] * A.shape[0]
        temp_labels += label_list

    sub_images = np.vstack(temp_img)
    sub_labels = np.asarray(temp_labels)
    # shuffle the subset samples
    shuffle_idx = np.random.RandomState(seed=S).permutation(sub_images.shape[0])
    final_images = sub_images[shuffle_idx,:,:]
    final_labels = sub_labels[shuffle_idx]
    final_labels = np.eye(num_classes)[final_labels]
    return final_images, final_labels

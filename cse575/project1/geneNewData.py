import scipy.io
import numpy as np
import math


def geneData(id):
    numOfStudent = 300
    index = int(id) % numOfStudent
    Numpyfile0 = scipy.io.loadmat('data/train_0_img.mat')
    Numpyfile1 = scipy.io.loadmat('data/train_1_img.mat')
    train01 = Numpyfile0.get('target_img')
    train02 = Numpyfile1.get('target_img')
    train01 = np.transpose(train01, axes=[2, 0, 1])
    train02 = np.transpose(train02, axes=[2, 0, 1])
    np.random.seed(index)
    np.random.shuffle(train01)
    np.random.seed(index)
    np.random.shuffle(train02)
    newarr0 = train01[:5000]
    newarr1 = train02[:5000]
    filepath = 'stu_train' + id
    scipy.io.savemat('digit0_' + filepath, {'target_img': newarr0})
    scipy.io.savemat('digit1_' + filepath, {'target_img': newarr1})

    Numpyfile2 = scipy.io.loadmat('data/test_0_img.mat')
    Numpyfile3 = scipy.io.loadmat('data/test_1_img.mat')
    test01 = Numpyfile2.get('target_img')
    test02 = Numpyfile3.get('target_img')
    test01 = np.transpose(test01, axes=[2, 0, 1])
    test02 = np.transpose(test02, axes=[2, 0, 1])
    filepath = 'testset'
    scipy.io.savemat('digit0_' + filepath, {'target_img': test01})
    scipy.io.savemat('digit1_' + filepath, {'target_img': test02})


def main():
    geneData('0900')


if __name__ == '__main__':
    main()
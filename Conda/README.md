# Anaconda

## 指令
* 檢視已下載之 package
```
conda list
```

## 問題
* 已經安裝套件在conda環境，jupyter notebook 仍沒吃到
`答: 需先安裝 jupyter notebook`

1. 創建 conda 環境
```
conda create -n asdfasdf python=3.7
```
</br>
2. 啟動環境
```
conda activate asdfasdf
```
</br>
3. 安裝 pytorch
* [官網安裝連結](https://pytorch.org/)
```
conda install pytorch torchvision -c pytorch
```
</br>
4. 確認已下載套件

```
conda list
```
</br>
5. 啟動jupyter
``` 
jupyter notebook
```
</br>

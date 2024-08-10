# Unity

## Scene
### 異步載入
* 他不會100%將效能都花費在載入場景中，藉此來顯示loading畫面
* 可以當成物件，會回傳現在的載入進度，以0~0.9分類

```
SceneManager.LoadSceneAsync()
```

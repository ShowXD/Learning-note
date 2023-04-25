# Vector Semantics and Embeddings

## Word
### lemma
`ex:` sing sang song 在字典不同，但對機器的意義相同

#### synonyms
`不同格式應有不同的時機應用`

#### similarity

#### word relatednes
`在某些場景下，意義上有所關聯`

* hospitals
  - surgeon, scalpel, nurse, anesthetic, hospital
* restaurants
  - waiter, menu, plate, food, menu, ched
* houses
  - door, roof, kitchen, family, bed

#### antonymy
`反義詞`

* dark/light
* short/long
* fast/slow

#### superordinate/
`以更為明確的定義來命名`
1. superordinate
  - funiture
2. basic
  - chair
3. subordinate
  - office chair

superordinate|vechicle|fruit|furniture
---|---|---|---
subordinate|car|mango|chair

#### connotation(sentiment)
`內涵, Osgood et al. (1957)`

* valence(情感)
  - unhappy, happy  
* arousal(情緒)
  - excited, calm
* dominance()
  - controlling, awed

## embeddings
### Tf-idf
* tf: term frequency  
$$tf_{t,d} = \begin{cases} 1 + log_{10}count(t,d) \\ 0 \end{cases}$$
* idf: inverse doument frequency  
$$idf_t = log_{10}(\frac{N}{df_t})$$

* Sparse vectors

### Word2vec
* Dense vectors

### dot product(內積)

$$\vert v \vert = \sqrt{\sum_{i=1}^N v_{i}^2}$$

# 其他
## dataset
* SimLex-999 dataset
  * 拿來做模型的validation

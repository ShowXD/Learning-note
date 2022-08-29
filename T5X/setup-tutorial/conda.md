# Conda install T5X

1. Download T5X project from Github
2. Create Conda env with python 3.9
3. Run setup.py
4. 

## Run setup.py
```
python setup.py install
```

### Problem
* cp950
```
Traceback (most recent call last):
  File "D:\Saves\Pycharm\GitHub\t5x-research\setup.py", line 28, in <module>
    _LONG_DESCRIPTION = fp.read()
UnicodeDecodeError: 'cp950' codec can't decode byte 0xe2 in position 11893: illegal multibyte sequence
```
- solution-change system language
1. Open "Setting"
2. Choose "Time and Language"
3. Choose "Date、time and region format settings"
4. Choose "Other date, time and region settings"
5. Choose "Region"
6. Choose "System Management"
7. Click "Change system locale settings"
8. Select "English(USA)"
9. Restart Computer



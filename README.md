# Decisions

Clean arch setup + mock data + live data + device preview

## Installation

Use Android Studio and flutter stable branch 

```bash
git clone https://github.com/Roopeshlr/decisions.git
```

## Usage

1 .Run below command in parent directory so that it runs flutter super get in all packages


```python

sh flutter_super_get.sh
```
2 . Keep enableMock = true for mock data else keep it to false


```python
enableMock = true
```

3 . The Complete setup is built on clean architecture by uncle bob 


```python
https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
```

4. Configuration Details


```python
Point your  main.dart of "main" module 
```


## Code Structure

The Code consists of 2 modules

Main and Core

1. Core consists of only base classes for architecture use and will not be changed frequenty

2. Main Module consists of  Data,Remote_api,Entites,Usecases,view,widget

3. All the folder in ui consist of view and widget which can be used to load the state of pages 


 




 

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


 


## Demo Video


```python
https://drive.google.com/file/d/1lwevRbN5Oh9zE0xMgfHjPTiwD5XFWwfy/view?usp=sharing
```

## Apk Links 

Release Build :  [MockData](https://drive.google.com/file/d/1GkS_JZvqEnxYKe1xzO7astn9EonMpA0G/view?usp=sharing) || [Release Build](https://drive.google.com/file/d/1FFzyCtZtECvCYMXmDYwUJ2JL6eIJHBnY/view?usp=sharing)

Device Preview Build :  [Release Build](https://drive.google.com/file/d/1qlBXnYznyDiVkzKSfjTIuZSDrJyuNxVO/view?usp=sharing)  (Note: Use only if you want to see Device Preview)



 

# Thymeleaf

Java-based templating library, primarily as a replacement for JSPs.

* <https://www.thymeleaf.org>

## Decoupled logic

* <https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#decoupled-template-logic>
* [IDEA-186913](https://youtrack.jetbrains.com/issue/IDEA-186913)

```xml
<?xml version="1.0"?>
<thlogic xmlns:th="http://www.thymeleaf.org">

    <!--/*@thymesVar id="mymodels" type="java.util.List<mypackage.MyModel>"*/-->
    <attr sel="#modeltable" th:fragment="myfragment(models)" th:remove="tag">
        <!--/*@thymesVar id="mymodel" type="mypackage.MyModel"*/-->
        <attr sel="/tr[0]" th:each="mymodel : ${models}">
            <attr sel="td.username" th:text="${mymodel.username}" />
```

## IntelliJ support

Can use `@thymesVar` comments before use to define the type of a variable (if it is not autodetected properly), but seems _very_ flaky and may lose the mapping.  Restarting and/or invalidating the IntelliJ cache seems to help.

* Issues: [IDEA-132738](https://youtrack.jetbrains.com/issue/IDEA-132738)

```xml
<!--/*@thymesVar id="mymodels" type="java.util.List<mypackage.MyModel>"*/-->
<attr sel="#modeltable" th:fragment="myfragment(models)" th:remove="tag">
    <!--/*@thymesVar id="mymodel" type="mypackage.MyModel"*/-->
    <attr sel="/tr[0]" th:each="mymodel : ${models}">
```
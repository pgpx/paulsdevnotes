# Java [Thymeleaf](http://www.thymeleaf.org/)

* User Guide - [3.0](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html)

## Template syntax

### Markup stype ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#a-multi-language-welcome))

Either declare an XML namespace and then use `th:text` attributes in markup (for example)

    ```html
    <!DOCTYPE html>
    <html xmlns:th="http://www.thymeleaf.org">
    ```

or use `data-th-` attributes (such as `data-th-text`) if you want the templates to be valid HTML5.

### Expressions ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#standard-expression-syntax))

* Message/resource bundle lookup (locale-specific): `#{home.welcome}`
* Variable (model, getter-based): `${model.property}`
* Selection variable expressions: `*{...}` - uses a selected object, e.g. inside `th:object`:

    ```html
    <div th:object="${session.user}">
      <p>Name: <span th:text="*{firstName}">Sebastian</span>.</p>
    </div>
    ```

* Link URL expressions: `@{...}` - URL escaping and prefixing of context path:

    ```html
    <a href="details.html" 
       th:href="@{user/{user}/details(user=${o.user},orderId=${o.id},price=${o.price})}">view</a>
    ```
    
    * If the path starts with a `/` then the context path will be added.
    
* Fragment expressions: `~{templatename::selector(parameter1=val1,parameter2=val2)}` - include a fragment with `th:insert` or `th:replace`

    ```html
    <div th:insert="~{commons :: main}">...</div>
    ```
    
    * Template name is optional (to use a fragment from the same template): `~{::selector}` or `~{this::selector}`
    * Selector is optional, to include the complete template: `~{templatename}`
    * Selector can be a markup selector (so doesn't need a `th:fragment`), e.g. `~{footer :: #copy-section}`

* Literal substitutions (to avoid having to concatenate strings) - surround with `|`

    ```html
    <span th:text="|Welcome to our application, ${user.name}!|">
    ```

Inside an expression, operators and values can be used:

* Strings are `'single quoted'`
* String concatenation with `+`
* Boolean operators: `gt`, `lt`, `ge`, `le`, `not`/`!`, `eq`/`==`, `neq`/`ne`/`!=`
* Ternary expressions: _expr_ `?` _expr_ `:` _expr_ (else part is optional)

    ```html
    <tr th:class="${row.even}? 'even' : 'odd'">
    ```

* Default expressions (Elvis operator): `?:`

    ```html
    <span th:text="*{age}?: '(no age specified)'">27</span>
    ```

* No-operation token `_` - do nothing, e.g. use prototyping text from the template:

    ```html
    <span th:text="${user.name} ?: 'no user authenticated'">...</span>
    ```

* Data conversion/formatting: `${{...}}` (double curly braces)
* Pre-processing: `__${...}__` - executed first, so can modify the expression that it is nested within.
    
* ... more

### Markup

* Externalise text and provide a default:

    ```html
    <p th:text="#{home.welcome}">Welcome to our grocery store!</p>
    ```
    
    * Substitute text with a leading `|`:
    
        ```html
        <span th:text="|Welcome to our application, ${user.name}!|">
        ```

* Unescaped text with `utext`:

    ```html
    <p th:utext="#{home.welcome}">Welcome to our grocery store!</p>
    ```

* Set attribute values with `th:attr="attr-name=value,..."`: ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#setting-the-value-of-any-attribute))

    ```html
    <input type="submit" value="Subscribe!" th:attr="value=#{subscribe.submit}"/>
    ```

* Set specific attribute values (most HTML5 attributes are defined) with `th:attr-name="value"` ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#setting-value-to-specific-attributes))

    ```html
    <input type="submit" value="Subscribe!" th:value="#{subscribe.submit}"/>
    ```
    
    * `th:alt-title` sets both `alt` and `title`
    * `th:lang-xmllang` sets both `lang` and `xmllang`

* Append and prepend attribute values with `th:attrappend` and `th:attrprepend`

    ```html
    <input type="button" value="Do it!" class="btn" th:attrappend="class=${' ' + cssStyle}" />
    ```

    * `th:classappend` and `th:styleappend` are concise variants for `class` and `style`.

* Boolean attributes (where a value is not normally explicitly specified) will only be output if the boolean expression is true: ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#fixed-value-boolean-attributes))

    ```html
    <input type="checkbox" name="active" th:checked="${user.active}" />
    ```

### Iteration ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#iteration))

* `th:each="{iter variable},{status variable} : {expression}"`

    ```html
    <tr th:each="prod,iterStat : ${prods}" th:class="${iterStat.odd}? 'odd'">
    ```
    
    * Optional Status variable has: `index` (starting from 0), `count` (starting from 1), `size`, `current`, `even`, `odd`, `first` (is first?), `last` (is last?)
        

### Conditionals ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#conditional-evaluation))

* `if` - show the tag and its contents if the `if` expression is true:

    ```html
    <div th:if="${prodStat.count} gt 1">
    ```

    * `unless` - inverse of `if`.

* `th:switch` and `th:case` - select first matching case:

    ```html
    <div th:switch="${user.role}">
      <p th:case="#{roles.manager}">User is a manager</p>
      <p th:case="*">Default</p>
    </div>
    ```
    
### Templates ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#template-layout))

* Define a fragment: `th:fragment="name (parameter1,parameter2)"`

    ```html
    <div th:fragment="copy">...</div>
    ```

* `th:insert` (within), `th:include` (inserts body of fragment) or `th:replace` (replaces host element) a fragment:

    ```html
     <div th:insert="~{templateFilename :: fragmentName}"></div>
    ```
    * Don't need surrounding `~{...}` for `th:insert`, `th:include`, and `th:replace` (because they must be fragment expressions).

* `th:assert="expr"` - assertions within templates, raises an exception if false.
* Empty fragment `~{}` - outputs no markup, e.g. during conditional insertion of a fragment:

    ```html
    <div th:insert="${user.isAdmin()} ? ~{common :: adminhead} : ~{}">...</div>
    ```

* Leave markup unchanged (don't apply template) if passing `_` to `th:insert`:

    ```html
    <div th:insert="${user.isAdmin()} ? ~{common :: adminhead} : _">
        Welcome [[${user.name}]]
    </div>
    ```

* Remove elements using `th:remove="value"`, where value can be:
    * `all` - remove containing tag and children.
    * `body` - keep containing tag but remove its children.
    * `tag` - remove containing tag and keep its children.
    * `all-but-first` - keep containing tag and remove all but the first child (e.g. if prototyping lists)
    * `none` - do nothing (returned by expressions)

    ```html
    <a href="/something" th:remove="${condition}? tag : none">Link text not to be removed</a>
    <!-- null is a synonym to none, so equivalent to -->
    <a href="/something" th:remove="${condition}? tag">Link text not to be removed</a>
    ```

### Comments ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#comments-and-blocks))

* XML comments are output: `<!-- comment -->`
* Thymeleaf comments are removed: `<!--/* comment */-->`
    * Actually removes everything between the `/*` and `*/`, e.g. `<!--/*--> comment <!--*/-->`
    * Or uncomments prototype-only comment block: `<!--/*/ markup /*/-->`
    
### Synthetic Blocks ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#synthetic-thblock-tag))

* `th:block` is a container that can be used to hold Thymeleaf commands (e.g. `th:each`) but will not be output.

### Inline expressions ([ref](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#expression-inlining))

* `[[...]]` - outputs value in-line, doesn't need to be part of an element.

    ```html
    <p>Hello, [[${session.user.name}]]!</p
    ```
    
    * Doesn't look as nice when previewing the template (because there is no default textX).
    
* `[(...)]` - unescaped in-line.
* JavaScript inlining enabled with `th:inline="javascript"`:

    ```html
    <script th:inline="javascript">
        ...
        var username = [[${session.user.name}]];
        ...
    </script>
    ```
    
    * `[[...]]` will JavaScript-escape and enclose within double-quotes `"`.
    * If embedded within comments `/*[[...]]*/` then everything after the comments until the next `;` will be ignored, which allows default values to be specified:
        * `var username = /*[[${session.user.name}]]*/ "Default Name";`
    * `[(...)]` will output the raw value without quotes.
    * Can also output strings, numberrs, booleans, arrays, collections, maps, beans (getters and setters).
* CSS inlining with `th:inline="css"` - similar to JS.
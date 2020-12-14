# Git Configuration

* Can switch configuration depending upon the path ([SO](https://stackoverflow.com/a/43884702/125246)):

    ```
    [includeIf "gitdir:~/company_a/"]
      path = .gitconfig-company_a
    [includeIf "gitdir:~/company_b/"]
      path = .gitconfig-company_b
    ```
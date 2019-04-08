# Bash Pipes

* [GNU Redirections](https://www.gnu.org/software/bash/manual/html_node/Redirections.html)

* Pipe stderr to stdout and hide stdout (keeping just stderr) ([SO](https://stackoverflow.com/questions/2342826/how-to-pipe-stderr-and-not-stdout)):

    ```bash
    command 2>&1 >/dev/null | grep 'something'
    ```
    
    * `2>&1` - pipe stderr to stdout
    * `>/dev/null` - hide stdout (but will still show stderr) 
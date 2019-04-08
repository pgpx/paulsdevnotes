# Bash Iteration

* [while loop](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_09_02.html)

Loop over a range of numbers:

* For known limits ([SO](https://stackoverflow.com/q/169511/125246))

    ```bash
    for i in {1..5}; do echo $i; done
    ```

* For variable limits:
    * Using bash for loops ([SO](https://stackoverflow.com/a/171041/125246)) (Don't need `$` in an expression):
    
    ```bash
    END=5
    for ((i=1;i<=END;i++)); do
        echo $i
    done
    ```

    * Simple solution using `seq` ([SO](https://stackoverflow.com/a/169517/125246):
    ```bash
    for i in $(seq 1 $END); do echo $i; done
    ```
    
    * POSIX style ([SO](https://stackoverflow.com/a/31365662/125246)):
    ```bash
    i=2
    end=5
    while [ $i -le $end ]; do
        echo $i
        i=$(($i+1))
    done
    ```

    * Can't just use `for i in {1..${END}}` because ([SO](https://stackoverflow.com/a/5723526/125246))
        > Brace expansion is performed before any other expansions, and any characters special to other expansions are preserved in the result. It is strictly textual. Bash does not apply any syntactic interpretation to the context of the expansion or the text between the braces
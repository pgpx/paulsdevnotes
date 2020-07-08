# Python Filesystem

* <https://docs.python.org/3/library/filesys.html>
* [pathlib](https://docs.python.org/3/library/pathlib.html) - Object-oriented filesystem paths
* [os.path](https://docs.python.org/3/library/os.path.html) - Common pathname manipulations

## Directories

* Safely create a directory ([SO](https://stackoverflow.com/a/273227/125246))

    ```python
    from pathlib import Path
    Path("/my/directory").mkdir(parents=True, exist_ok=True)
    ```
    Creates parent directories if necessary, and doesn't fail if it already exists.
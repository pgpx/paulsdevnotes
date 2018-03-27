# Python Multithreading

* <https://docs.python.org/2/library/multiprocessing.html#module-multiprocessing.pool>
* [SO](https://stackoverflow.com/a/28463266/125246)
* <http://chriskiehl.com/article/parallelism-in-one-line/>
* <http://www.laurentluce.com/posts/python-threads-synchronization-locks-rlocks-semaphores-conditions-events-and-queues/>

```python
from multiprocessing import Pool
if __name__ == '__main__':
    pool = Pool(5)
    # Call function in parallel, but keep output order unchanged
    for values in pool.imap(my_func, filedesc, 100):
        process_values(values)
```
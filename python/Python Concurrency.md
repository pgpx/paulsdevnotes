# Python Concurrency

* Docs: [Concurrent Execution](https://docs.python.org/3/library/concurrency.html)
  * [multiprocessing](https://docs.python.org/3/library/multiprocessing.html) - Process-based parallelism

Articles:

* [Multiprocessing vs. Threading in Python: What Every Data Scientist Needs to Know](https://blog.floydhub.com/multiprocessing-vs-threading-in-python-what-every-data-scientist-needs-to-know/)
* [SO](https://stackoverflow.com/a/28463266/125246)
* <http://chriskiehl.com/article/parallelism-in-one-line/>
* <http://www.laurentluce.com/posts/python-threads-synchronization-locks-rlocks-semaphores-conditions-events-and-queues/>

* <https://docs.python.org/3/library/multiprocessing.shared_memory.html?
* <https://wiki.python.org/moin/ParallelProcessing>

Libraries:

* [Futureproof](https://github.com/yeraydiazdiaz/futureproof#readme) - Bulletproof concurrent.futures

```python
from multiprocessing import Pool
if __name__ == '__main__':
    pool = Pool(5)
    # Call function in parallel, but keep output order unchanged
    for values in pool.imap(my_func, filedesc, 100):
        process_values(values)
```
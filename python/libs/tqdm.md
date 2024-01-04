# tqdm

Python progress bar.

* [GitHub](https://github.com/tqdm/tqdm)


Use `pool.imap` or `pool.imap_unordered` with multiprocessing ([SO](https://stackoverflow.com/a/45276885/125246)):

```python
import multiprocessing
from tqdm.notebook import tqdm

with multiprocessing.Pool(pool_size) as pool:
    print(list(tqdm(pool.imap_unordered(call_city, cities), total=len(cities))))
```

Use `tqdm.notebook.tqdm` with Jupyter Notebooks ([Ref](https://github.com/tqdm/tqdm#ipython-jupyter-integration), [SO](https://stackoverflow.com/a/42218684/125246)) 
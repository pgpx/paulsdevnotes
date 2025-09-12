# Python Conda

* [Switching between environments](https://www.anaconda.com/docs/getting-started/working-with-conda/environments#switching-between-environments)

```bash
conda info --envs
conda activate <ENV_NAME>
conda deactivate # Go back to the previous environment
conda remove --name <ENV_NAME> --all
```

## environment.yml

* [Creating an environment from an environment.yml file](https://www.anaconda.com/docs/getting-started/working-with-conda/packages/pip-install#creating-an-environment-from-an-environment-yml-file)

```yaml
name: myenv # This will become the name of your environment
dependencies: # The list of packages to include in your environment
    - python=3.12 # You can specify versions
    - bokeh>=2.4.2
    - flask
    - pip # Install pip in your environment
    - pip: # Include pip dependencies last
        - Flask-Testing
```

```bash
conda env create --file environment.yml
conda env update --file environment.yml --prune
```

Create from an existing environment:

```bash
conda env export -n <ENV_NAME> --from-history > environment.yml
```

* [Locking a project](https://www.anaconda.com/docs/getting-started/working-with-conda/environments#locking-an-environment)

```bash
conda activate <ENV>
conda install conda-project
conda-project init # If no pre-existing environment.yml
conda-project lock # Creates a conda-lock.default.yml
```
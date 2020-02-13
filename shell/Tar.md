# Tar

* `tar` files can contain Linux octal permissions, unlike `zip` files ([SO](http://stackoverflow.com/a/10739353/125246))
* `--to-command` ([ref](https://www.gnu.org/software/tar/manual/html_node/Writing-to-an-External-Program.html)
runs a command for each file, setting the variable `$TAR_FILENAME` and piping the file contents to `STDIN`:

    ```shell script
    # Though this is much slower than aws s3 sync!
    gtar xvf mytar.tar --to-command 'aws s3 cp - "s3://mybucket/$TAR_FILENAME"'
    ```
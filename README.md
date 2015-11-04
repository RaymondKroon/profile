
* Create a directory for holding database, since
* you cannot create a database in your system paths
```mkdir ~/.gtags```

* Create symbolic links to your external libraries
```ln -s /usr/include usr-include```
```ln -s /usr/local/include/ usr-local-include```

* Generate GNU Global database
```gtags -c```

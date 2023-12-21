Create a list of files we have available
```bash
find . -type f -ls > files.out
```

grep for a single file type - $ = end of line
```bash
grep -i evtx$ files.out    
```



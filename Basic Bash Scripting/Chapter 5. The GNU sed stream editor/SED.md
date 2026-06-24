The sed command (short for stream editor) in Linux is a non-interactive command-line utility used to parse and transform text line-by-line. It is primarily utilized for finding, replacing, inserting, and deleting text within files or pipeline streams without having to open the file in a manual text editor.

Basic Syntax
sed [options] 'command' filename

Options
-i : Edits the file in-place (overwrites the original file).
-n : Suppresses automatic printing of lines (useful when you only want to print specific matches).
-e : Allows you to execute multiple editing commands in a single run.
-E or -r : Enables extended regular expressions (POSIX standard).


## Installation

By default, `sed` (Stream Editor) is a core utility included in virtually all Unix-like operating systems. However, if it is missing or you need to reinstall it, use your system's package manager:

* **Ubuntu/Debian:** `sudo apt-get install sed`
* **CentOS/RHEL/Fedora:** `sudo dnf install sed`
* **Arch Linux:** `sudo pacman -S sed`
* **macOS:** `brew install gnu-sed` (installs GNU sed as `gsed`)

---

## man sed

### Name

```
sed - stream editor for filtering and transforming text

```

### Synopsis

```
sed [OPTION]... {script-only-if-no-other-script} [input-file]...

```

### Description

```
sed is a stream editor. A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline). While in some ways similar to an editor which permits scripted edits (such as ed), sed works by making only one pass over the input(s), and is consequently more efficient. But it is sed's ability to filter text in a pipeline which particularly distinguishes it from other types of editors.

-n, --quiet, --silent
    suppress automatic printing of pattern space. Typically used in conjunction with the 'p' command to print only specific lines.
    
    Example: Print only the 2nd line of a file.
    `sed -n '2p' file.txt`
    Another Quick Example: Printing a Range
    You can also use this combo to print a specific section of a file, like lines 5 through 10:

    ```Bash
    sed -n '5,10p' file.txt

    ```

    sed treats multiple input files as one long stream. The following example prints the first line of the first file (one.txt) and the last line of the last file (three.txt). Use -s to reverse this behavior.

    sed -n  '1p ; $p' one.txt two.txt three.txt

-e script, --expression=script
    add the script to the commands to be executed. Useful for combining multiple editing commands.
    
    Example: Replace "apple" with "orange" AND replace "banana" with "grape" in one run.
    `sed -e 's/apple/orange/g' -e 's/banana/grape/g' file.txt`

-f script-file, --file=script-file
    add the contents of script-file to the commands to be executed.
    
    Example: Run text modifications defined inside a file named commands.sed.
    `sed -f commands.sed file.txt`

-i[SUFFIX], --in-place[=SUFFIX]
    edit files in place (makes a backup copy if a SUFFIX extension is supplied).
    
    Example 1 (No backup): Replace "old" with "new" directly inside the file.
    `sed -i 's/old/new/g' file.txt`
    
    Example 2 (With backup): Edit the file directly, but save the original as file.txt.bak.
    `sed -i.bak 's/old/new/g' file.txt`

-r, -E, --regexp-extended
    use extended regular expressions (ERE) in the script rather than basic regular expressions (BRE). Allows using characters like `|`, `+`, and `?` without escaping them.
    
    Example: Remove all lines that contain either "cat" or "dog".
    `sed -E '/cat|dog/d' file.txt`

-s, --separate
    consider files as separate rather than as a single continuous long stream (resets line numbers for each file).
    
    Example: Print the 1st line of multiple individual files separately.
    `sed -s -n '1p' file1.txt file2.txt`

```


So, what actually *is* standard input?

### The 3 Standard Streams

In Linux and Unix-like operating systems, the moment any command or program starts, the system automatically opens **three data channels** (called streams) for it. Think of them as plumbing pipes for text:

* **`stdin` (Standard Input):** The "intake" pipe. By default, this pipe is connected to your **keyboard**. Whatever you type goes into the program.
* **`stdout` (Standard Output):** The "success" pipe. By default, this is connected to your **screen**. This is where the program sends its normal results.
* **`stderr` (Standard Error):** The "trouble" pipe. Also connected to your screen by default, but it's kept separate so error messages don't mix with your clean data.

---

### Seeing `stdin` in Action with `sed`

Because `stdin` defaults to your keyboard, you can actually run `sed` without a file and type directly into it.

If you type this into your terminal and hit Enter:

```bash
sed 's/hello/world/g'

```

The terminal will look like it's frozen. It’s not frozen—`sed` is just patiently staring at the `stdin` pipe waiting for data.

1. Type: `hello there` and press Enter.
2. `sed` reads that from `stdin`, processes it, and shoots `world there` back out to your screen (`stdout`).
3. It will keep doing this line-by-line until you press **`Ctrl + D`**, which sends the "End of File" (EOF) signal, telling `sed` that the `stdin` pipe is empty and it can stop.

### Redirecting the Pipes

The real power comes when you unhook these pipes from your keyboard/screen and hook them up to other things using **Pipes (`|`)** or **Redirection (`<`, `>`)**:

* **Using a pipe (`|`):** Connects the `stdout` of one command directly into the `stdin` of another.
```bash
cat input.txt | sed 's/hello/world/g'

```


* **Using the `<` operator:** Manually reroutes a file's contents into a command's `stdin`.
```bash
sed 's/hello/world/g' < input.txt

```
```bash
sed 's/hello/world/g' < input.txt > output.txt
```
this commands routes the input content towards sed command and save the final result in outpput commands

Another examples:-

the **`w`** and **`s///w`** tools. In simple terms, these are `sed`'s built-in **"Save As"** buttons.

Instead of changing the original file (like `-i` does) or saving *everything* to a new file (like `>` does), `w` allows you to pick out specific lines and save **only those lines** into a separate file.

Here is how they work with easy examples:

---

### Example 1: The `s///w` flag (Save only what you changed)

Imagine you have a shopping list called `grocery.txt`:

```text
apple
buy milk
banana
buy bread

```

You want to change the word `buy` to `purchased`, but you **only** want to save the lines you actually changed into a new file called `receipt.txt`.

You can do this:

```bash
sed -n 's/buy/purchased/w receipt.txt' grocery.txt

```

*(Note: The `-n` tells sed to stay quiet and not print anything to the screen).*

**The Result:**

* Your original `grocery.txt` is **not** changed.
* A brand new file called `receipt.txt` is created, and it contains **only** the lines that were successfully changed:
```text
purchased milk
purchased bread

```



---

### Example 2: The `w` command (The "Extractor")

You can also use `w` by itself without changing any text. This is useful for searching a massive file and extracting specific lines into a new file.

Imagine you have a huge server log file called `server.log`:

```text
10:00 AM - All systems good
10:01 AM - WARNING: Low memory
10:02 AM - All systems good
10:03 AM - ERROR: Database crashed

```

You want to scan this file, find any line that contains the word `ERROR`, and save just those errors into a file called `alerts.txt`.

You run this command:

```bash
sed -n '/ERROR/w alerts.txt' server.log

```

**The Result:**

* `sed` scans the log file.
* It extracts only the error lines and saves them into `alerts.txt`:
```text
10:03 AM - ERROR: Database crashed

```



### Summary of the difference:

* **`>`** saves **everything** to a new file.
* **`-i`** overwrites the **original** file.
* **`w`** filters out and saves **only specific lines** to a new file.



---
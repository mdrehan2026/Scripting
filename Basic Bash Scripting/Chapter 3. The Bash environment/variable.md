This guide breaks down how Bash (the Linux command line) uses **variables**. Think of a variable as a labeled storage box. You put a piece of data inside it, and whenever you call the label, Bash reads what's inside.

Here is the entire guide rewritten in plain, simple English.

---

## 1. Types of Variables

By convention, variable names are usually written in **UPPERCASE**. Bash divides variables into two main categories based on where they can be used:

### Global Variables (Environment Variables)

* **What they are:** These are available everywhere—in your current terminal session and in any programs or scripts (sub-shells) you open from it.
* **How to see them:** Type `printenv` or `env` in your terminal. You will see a long list of system settings, like `HOME=/home/username` or `USER=franky`.

### Local Variables

* **What they are:** These are only available in the exact terminal window or script where they were created. Programs opened from that window won't see them.
* **How to see them:** Type `set`. This shows all local variables, global variables, and custom functions.

> **Aside:** Variables can also be categorized by what they hold: text (**Strings**), numbers (**Integers**), data lists (**Arrays**), or unchangeable values (**Constants**).

---

## 2.1 Rules for Creating Variables

To create a variable, type its name, an equal sign (`=`), and the value.

* **Rule 1: NO SPACES around the `=` sign.**
* `MYVAR="value"` $\rightarrow$ **Correct**
* `MYVAR = "value"` $\rightarrow$ **Error!** (Bash thinks `MYVAR` is a command).


* **Rule 2: Naming restrictions.** * They are case-sensitive (`MYVAR` is different from `myvar`).
* They can use letters, numbers, and underscores, but they **cannot start with a number** (e.g., `1number=1` will cause an error).


* **Rule 3: Use quotes.** It is best practice to wrap your text in double quotes (`"text"`) to avoid errors if the text contains spaces.

**Example:**

```bash
first_name="Franky"
echo $first_name   # The '$' tells Bash to read the variable. Outputs: Franky

```

---

## 2.2 To remove a variable in Bash, you use the built-in unset command.

Here is exactly how it works:

Bash
 1. Create the variable
MYVAR="Hello World"

 2. Check that it exists
echo $MYVAR
Outputs: Hello World

#3. Remove the variable
unset MYVAR

4. Check again
echo $MYVAR
Outputs nothing (it's completely gone!)


## 3. Sharing Variables (Exporting)

If you create a normal local variable in your terminal, then start a new script, that script won't see your variable. To pass it down to "child" processes, you must **export** it.

* **How to do it in one step:** `export MYVAR="value"`
* **Important Note:** Changes only flow *downwards*. A child process can change an inherited variable, but when that child process closes, the parent's original value remains unchanged.

---

## 4. Reserved Variables

Bash has built-in, pre-made variables that control how your system behaves. You should avoid renaming these.

* **`PATH`**: A list of folders where Bash looks for programs when you type a command.
* **`HOME`**: Your user's personal home folder.
* **`PWD`**: The folder you are currently looking at right now (Print Working Directory).
* **`RANDOM`**: Gives you a random number every time you look at it.
* **`SECONDS`**: Counts how many seconds the current terminal session has been open.

---

## 5. Special Parameters (Shortcuts)

Bash uses specific symbols as automatic, read-only shortcuts. You cannot change their values manually.

* **`$0`**: The name of the script running.
* **`$1`, `$2`, `$3`...**: The "arguments" or extra words you typed after the script name when running it.
* **`$#`**: The total number of arguments given to the script.
* **`$?`**: The exit status of the last command. `0` means success; anything else (like `1`) means an error occurred.
* **`$$`**: The Process ID (system ID number) of the current terminal.
* **`$!`**: The Process ID of the last command you sent to run in the background.

---

## 6. Recycling Scripts Using Variables

The guide concludes with a great rule of thumb for coding: **Don't hardcode specific names.**

If you write a script to back up a folder named `/home/franky` and explicitly type `/home/franky` ten times throughout the code, nobody else can use that script without rewriting all ten lines.

Instead, define a variable at the very top:

```bash
USER_FOLDER="/home/franky"

```

And use `$USER_FOLDER` throughout the script. If a user named Carol wants to use it, she only has to change **one line** at the very top to `USER_FOLDER="/home/carol"`. This makes your code highly reusable and less prone to typos.

Do you have a specific script you're trying to build or a variable error you are hitting right now?
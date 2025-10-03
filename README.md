# Bubble Sort in 8086 Assembly Language 🧑‍💻

This is a simple 8086 Assembly language program that sorts a predefined array of single-digit numbers in ascending order using the **Bubble Sort** algorithm. After sorting, it prints the result to the console.

The code is written for a DOS environment and uses DOS interrupts for console input/output.

![Assembly Badge](https://img.shields.io/badge/Language-8086_Assembly-lightgrey?style=for-the-badge&logo=assembler-language)
![DOS Badge](https://img.shields.io/badge/Environment-DOS-blue?style=for-the-badge)

---

## 📋 Features

-   **Bubble Sort Implementation**: A classic sorting algorithm implemented from scratch in assembly.
-   **Array Manipulation**: Demonstrates basic memory and array access using indexing (`SI` register).
-   **DOS Interrupts**: Utilizes `INT 21h` for printing strings and characters to the standard output.
-   **Data Segmentation**: Properly separates data (`MYDATA`) and code (`MYCODE`) segments.

---

## ⚙️ How It Works

The program's logic is divided into three main parts:

1.  **Initialization**: The `DS` (Data Segment) register is initialized to point to the `MYDATA` segment, which allows the program to access the `ARRAY`, `LEN`, and `MSG1` variables.

2.  **Sorting (Bubble Sort)**:
    -   The program uses two nested loops to implement the Bubble Sort algorithm.
    -   The **outer loop** (`OUTER_LOOP`) controls the number of passes through the array.
    -   The **inner loop** (`INNER_LOOP`) iterates through the array, comparing adjacent elements.
    -   During each comparison (`CMP AL, BL`), if an element is greater than the one next to it, the two elements are swapped.
    -   This process continues until the entire array is sorted in ascending order.

3.  **Printing the Output**:
    -   First, it prints the message "Sorted array: " using `INT 21h` function `09h`.
    -   Then, it loops through the sorted `ARRAY`.
    -   Each numeric element is converted to its ASCII character equivalent by adding `30h` (the ASCII value for '0').
    -   Each character is then printed to the console one by one using `INT 21h` function `02h`.
    -   Finally, it prints a newline character and terminates the program.

---

## 🚀 Getting Started

To run this code, you will need an 8086 assembler (like MASM or TASM) and a DOS emulator (like DOSBox).

### Prerequisites

-   An x86 assembler such as **MASM** (Microsoft Macro Assembler) or **TASM** (Turbo Assembler).
-   A DOS environment or emulator like [**DOSBox**](https://www.dosbox.com/).

### How to Assemble and Run

1.  Save the code in a file named `SORT.ASM`.
2.  Start your DOS emulator (e.g., DOSBox) and mount the directory where you saved the file.

3.  **Using MASM:**
    ```dos
    ; Assemble the code
    masm SORT.ASM;

    ; Link the object file to create an executable
    link SORT.OBJ;

    ; Run the executable
    SORT.EXE
    ```

4.  **Using TASM:**
    ```dos
    ; Assemble the code
    tasm SORT.ASM

    ; Link the object file to create an executable
    tlink SORT.OBJ

    ; Run the executable
    SORT.EXE
    ```

---

## ✅ Expected Output

When you run the program, the console will display the sorted array as follows:
import sys

if __name__ == "__main__":

    filename = sys.argv[1]
    lines = []
    with open(filename) as f:
        lines = f.readlines()

    count = 1
    buf=""
    filestr=""
    for line in lines:
        
        line = line.rstrip()

        if "===" not in line:
            buf += line + "\n"
        else:
            filename=str(count)+".vxt"
            filestr+= filename + " "
            with open(filename, "w") as f:
                f.write(buf)
            count += 1

            buf=""

    filename=str(count)+".vxt"
    with open(filename, "w") as f:
        f.write(buf)

    filestr += filename

    print filestr

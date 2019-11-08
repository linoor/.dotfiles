import re
import sys

if __name__ == "__main__":
    print("{")
    lines = [l for l in sys.stdin]

    output = ""
    for line in lines:
        m = re.search("\"(\w+)\"", line)
        match = m.group(1)
        output += '"{match}": "lorem ipsum {match}",\n'.format(match=match)

    output = output[:-2] # remove the last comma
    print(output)
    print("}")

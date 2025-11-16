import random
import string
import subprocess

new_id = f".{''.join(random.choice(string.ascii_letters) for _ in range(4))}-{''.join(random.choice(string.digits) for _ in range(4))}".lower()

subprocess.run(["xsel", "--input", "--clipboard"], input=new_id.encode("utf-8"), check=True)
print(f"Copied ID: {new_id} to clipboard.")
import os
import pyperclip

vcard_template = "BEGIN:VCARD\nVERSION:3.0\nFN:{}\nTEL:{}\nEND:VCARD"
output_dir = os.path.join(os.path.dirname(__file__), "ScriptContacts")

def run_contacter():
    clipboard = pyperclip.paste()
    lines = [l.split("@") for l in clipboard.splitlines()]
    with open(os.path.join(output_dir, f"CONTACT-GROUPCHAT.vcf"), "w+") as cf:
        for contact in lines:
            cf.write(vcard_template.format(contact[1].strip(), contact[0].strip()) + "\n")

if __name__ == "__main__":
    run_contacter()

## Quicktext: Text from CLI 📨

- `text.py`: Silly tool to send a quick text from CLI
- `export.applescript`: Generate group chat member list

And, a quick shell script recipe for generating a `.vcf` contact dump:

```bash
osascript "export.applescript" "$@"
failed=$?
if [[ failed -eq 0 ]]
then
	/some/version/with/dependencies/of/python3 contacter.py;
	open ScriptContacts;
fi
```
import json, jsonschema, sys

schema = {
    "type": "object",
    "properties": {"name": {"type": "string"}, "port": {"type": "number"}},
    "required": ["name", "port"]
}

config = json.load(open(sys.argv[1]))

try:
    jsonschema.validate(config, schema)
    print("VALID CONFIG ✓")
except Exception as e:
    print("INVALID CONFIG ✗:", e)
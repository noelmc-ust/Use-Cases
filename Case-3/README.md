
# Automated Config Validator 

##  Scenario
It is very important to check the configuration files because at many times the root cause of issues can be pointed out from these files .

##  Approach
Use **JSON Schema** with the `jsonschema` library to validate a JSON config file against a schema. If the config matches the schema → print **VALID**. Otherwise, print a helpful error and exit non‑zero.

##  How It Works (Code Explained)
```python
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
```
- `schema`: Defines the required structure of the config (`name` must be a string, `port` a number).
- `json.load(...)`: Loads the JSON config file passed as the first CLI argument.
- `jsonschema.validate(...)`: Validates config against the schema.
- Any validation failure is caught and printed clearly.

## ▶️ Usage
```bash
pip install jsonschema
python validator.py config.json
```

### Example `config.json`
```json
{
  "name": "payments-service",
  "port": 8080
}
```

### Expected Output
```
VALID CONFIG ✓
```

### Failure Example
```json
{
  "name": 123,
  "port": "eighty"
}
```
Output:
```
INVALID CONFIG ✗: 'name' is not of type 'string'
```


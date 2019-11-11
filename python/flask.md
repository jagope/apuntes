```python
from flask import Flask

app = Flask(__main__)

@app.route('/')
def <function>():
  ...

@app.route('/<url>/')
def <function>():
  ...

if __name__ = "__main__":
  app.run(debug=True)
```

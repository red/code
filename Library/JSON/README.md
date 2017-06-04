# JSON

`JSON.red` provides [JSON](http://www.json.org) encoder and decoder.

## Usage

* Encoding

```
>> json/encode [1 2 3]
== "[1,2,3]"
>> json/encode #(key: value another-key: 23)
== {{"key":"value","another-key":23}}
```

* Decoding

```
>> json/decode "[1,2,3]"
== [1 2 3]
>> json/decode {{"key":"value","another-key":23}}
== #(
    key: "value"
    another-key: 23
)
```

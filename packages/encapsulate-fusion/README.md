# Encapsulate-fusion

> [!WARNING]
> This package is not yet released

## Installing

Add the following to your wally manifest (`wally.toml`):

```toml
[dependencies]
EncapsulateFusion = "sebastian2852/encapsulate-fusion@VERSION"
```

---

## 📚 API reference

### `useCapsule<T>(scope, capsule: Capsule<T>)`

Use this hook at the top-level of a component to read the state of the `capsule`.

#### Code Example

```lua
local capsule = Encapsulate.createCapsule(5)

local function MyAwesomeComponent()
    local number = useCapsule(capsule)
    ...
end
```

#### Paramaters

- `scope`: The scope to create the `Value` object in
- `capsule`: The capsule to listen to state changes from

#### Returns

A `Value` representing the capsule's state.
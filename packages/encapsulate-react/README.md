# 📦⚛️ Encapsulate-React

## Installing

Add the following to your wally manifest (`wally.toml`):

```toml
[dependencies]
EncapsulateReact = "sebastian2852/encapsulate-react@VERSION"
```

---

## 📚 API reference

### `useCapsule<T>(capsule: Capsule<T>)`

Use this hook at the top-level of a component to read the state of the `capsule`, this will also re-render the component every time the capsule changes it's state.


#### Code Example

```lua
local capsule = createCapsule(5)

local function MyAwesomeComponent()
    local number = useCapsule(capsule)
    ...
end
```

#### Paramaters

- `capsule`: The capsule to listen to state changes from

#### Returns

The current state of the capsule.
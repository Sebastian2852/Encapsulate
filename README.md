<div align="center">
    <h1>Encapsulate</h1>
    <p>Simple state managment</p>
</div>
 
## ✨ Features

Encapsulate aims to be a simple lightweight state managment solution for Roblox inspired by [charm](https://github.com/littensy/charm). Here are the key selling points of encapsulate:

- Reactive state updates
- Minimal API
- Lightweight

---

## 📦 Installing

### Roblox Studio

Install the corresponding `.rbxm` file from the [latest release](https://github.com/Sebastian2852/Encapsulate/releases/latest) and drag and drop it into Roblox Studio.

### Wally

Add the following to your wally manifest (`wally.toml`):
```toml
[dependencies]
Encapsulate = "sebastian2852/encapsulate@VERSION"
```

---

## 📚 Reference

### `createCapsule<T>(initialState: T)`

Create a capsule which is just a container for some state.

#### Code Example

```lua
local numberCapsule = createCapsule(15)
local nameCapsule = createCapsule("John")
```

#### Paramaters

- `initialState`: The starting state of the capsule

#### Returns

Returns a capsule. This is simply a function which does the follwing:

- Calling with no paramaters returns the current state
- Calling with a new value updates the state
- Calling with a lamda calls that lamda to update the state

```lua
local numberCapsule = createCapsule(15)

numberCapsule(10) -- Update the state to 10 directly

numberCapsule(function(state)
    return state * 2
end) -- Set the state to double what it is currently

print(numberCapsule()) -- Read the current value
```

### `onCapsuleChanged<T>(capsule: Capsule<T>, callback: (prev: T, new: T) -> nil)`

Listens to when the `capsule` updates it's and call the `callback`.

#### Code Example

```lua
local capsule = Encapsulate.createCapsule(5)
local disconnect = Encapsulate.onCapsuleChanged(capsule, function(prev, new)
    print(`{prev} -> {new}`)
end)

capsule(10) -- prints "5 -> 10"

disconnect()
```

#### Paramaters

- `capsule`: The capsule to listen to state changes from
- `callback`: The function to call when state changes

#### Returns

A function which stops it from listening to state changes from the `capsule`.

---

## 📦⚛️ Encapsulate-React

### Installing

Add the following to your wally manifest (`wally.toml`):

```toml
[dependencies]
EncapsulateReact = "sebastian2852/encapsulate-react@VERSION"
```

---

### `useCapsule<T>(capsule: Capsule<T>)`

Use this hook at the top-level of a component to read the state of the `capsule`, this will also re-render the component every time the capsule changes it's state.


#### Code Example

```lua
local capsule = Encapsulate.createCapsule(5)

local function MyAwesomeComponent()
    local number = useCapsule(capsule)
    ...
end
```

#### Paramaters

- `capsule`: The capsule to listen to state changes from

#### Returns

The current state of the capsule.